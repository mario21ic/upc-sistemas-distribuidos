﻿using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RabbitMQ.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using UPC.BE;
using UPC.DA;

namespace ApiRest
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "GestionSolicitudCitaService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select GestionSolicitudCitaService.svc or GestionSolicitudCitaService.svc.cs at the Solution Explorer and start debugging.
    public class GestionSolicitudCitaService : IGestionSolicitudCitaService
    {
        readonly string colaServer = "localhost";
        readonly string colaName = "SolicitudCita";

        public bool RegistrarSolicitudCita(SolicitudCita citaACrear)
        {
            WebOperationContext.Current.OutgoingResponse.Headers.Add("Access-Control-Allow-Origin", "*");
            WebOperationContext.Current.OutgoingResponse.Headers.Add("Access-Control-Allow-Methods", "POST,GET,HEAD,PUT,DELETE,OPTIONS");
            
            citaACrear.CreatedAt = DateTime.Now;

            // Escribir en Colas
            string jsonString = JsonConvert.SerializeObject(citaACrear);

            var factory = new ConnectionFactory() { HostName = colaServer };
            using (var connection = factory.CreateConnection())
            using (var channel = connection.CreateModel())
            {
                channel.QueueDeclare(queue: colaName,
                                     durable: false, exclusive: false,
                                     autoDelete: false, arguments: null);

                //var body = Encoding.UTF8.GetBytes("Mensaje a registrar "  + mensaje);
                var body = Encoding.UTF8.GetBytes(jsonString);
                channel.BasicPublish(exchange: "", routingKey: colaName,
                                     basicProperties: null, body: body);
            }

            // Llamar a Email Service
            SRNotificacion.NotificacionServiceClient notiClient = new SRNotificacion.NotificacionServiceClient();
            notiClient.EnviarEmail(citaACrear.Email, "Su solicitud de cita para el demartamento fue creado, pronto un asesor de ventas se pondra en contacto con Ud");

            return true;
        }

        //public List<SolicitudCitaProcesada> ProcesarSolicitudCita()
        public SolicitudCitaProcesada ProcesarSolicitudCita()
        {
            var factory = new ConnectionFactory() { HostName = colaServer };

            Console.WriteLine("Reading Messages!");
            //List<SolicitudCitaProcesada> listado = new List<SolicitudCitaProcesada>();
            SolicitudCitaProcesada procesado = new SolicitudCitaProcesada();

            using (var connection = factory.CreateConnection())
            using (var channel = connection.CreateModel())
            {
                BasicGetResult consumer = channel.BasicGet(colaName, true);
                if (consumer != null)
                {

                    string mensaje = Encoding.UTF8.GetString(consumer.Body.ToArray());
                    Console.WriteLine("Mensaje: " + mensaje);
                    // {"DepartamentoId":6,"Mensaje":"Hello moto","CreatedAt":"2021-02-16T21:44:07.8143416-08:00",
                    // "Nombres":"Hector","Apellidos":"Saira","Email":"hector@upc.edu.pe","Telefono":"966209622","Dni":"44489714"}
                    JObject rss = JObject.Parse(mensaje);


                    // Crear un cliente temporal
                    Cliente cliente = new Cliente();
                    cliente.Nombres = (string)rss["Nombres"];
                    cliente.Apellidos = (string)rss["Apellidos"];
                    cliente.Email = (string)rss["Email"];
                    cliente.Telefono = (string)rss["Telefono"];
                    cliente.Dni = (string)rss["Dni"];
                    cliente.CreatedAt = DateTime.Now;

                    // Nos conectamos al SOAP IntegracionService
                    cliente.ReniecValidacion = false;
                    SRIntegracion.IntegracionServiceClient integracionClient = new SRIntegracion.IntegracionServiceClient();
                    // Validar si dni es valido ante Reniec
                    if (integracionClient.ReniectExisteDNI(cliente.Dni))
                    {
                        cliente.ReniecValidacion = true;
                    }

                    // Retornar historial crediticio desde Infocorp
                    InfocorpData infodata = integracionClient.InfocorpHistorial(cliente.Dni);
                    cliente.InfocorpCreditosPasados = infodata.CreditosPasados;
                    cliente.InfocorpCreditosActuales = infodata.CreditosActuales;
                    cliente.InfocorpStatus = infodata.Status;
                    // Grabando
                    ClienteDAO clienteDAO = new ClienteDAO();
                    Cliente nuevoCliente = clienteDAO.Crear(cliente);
                    Console.WriteLine(nuevoCliente.Id);

                    int m_departamentoId = (int)rss["DepartamentoId"];
                    string m_mensaje = (string)rss["Mensaje"];
                    string m_createdat = (string)rss["CreatedAt"];
                    Cita citaACrear = new Cita();
                    citaACrear.DepartamentoId = m_departamentoId;
                    citaACrear.ClienteId = nuevoCliente.Id;
                    citaACrear.Mensaje = m_mensaje;
                    citaACrear.Estado = "Pendiente";
                    citaACrear.CreatedAt = DateTime.Parse(m_createdat);
                    // Grabando
                    CitaDAO citaDAO = new CitaDAO();
                    citaDAO.Crear(citaACrear);

                    // SolicitudProcesada

                    procesado.ClienteId = nuevoCliente.Id;
                    procesado.DepartamentoId = citaACrear.DepartamentoId;
                    procesado.CreatedAt = citaACrear.CreatedAt;
                    //listado.Add(procesado);

                    //Console.WriteLine("Message: " + mensaje);
                    //string resultado = Encoding.UTF8.GetString(consumer.Body.ToArray());
                    //Console.WriteLine("Message: " + resultado);
                    //System.Diagnostics.Debug.WriteLine("Mensaje: " + resultado);
                }
            }

            return procesado;
        }
    }
}
