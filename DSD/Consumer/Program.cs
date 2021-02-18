using Newtonsoft.Json.Linq;
using RabbitMQ.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UPC.BE;
using UPC.DA;

namespace Consumer
{
    class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("Starting Consumer");
            var factory = new ConnectionFactory() { HostName = "localhost" };

            while (true)
            {
                Console.WriteLine("Reading Messages!");
                using (var connection = factory.CreateConnection())
                using (var channel = connection.CreateModel())
                {
                    BasicGetResult consumer = channel.BasicGet("SolicitudCitas", true);
                    if (consumer != null)
                    {

                        string mensaje = Encoding.UTF8.GetString(consumer.Body.ToArray());
                        Console.WriteLine("Mensaje: " + mensaje);
                        // {"DepartamentoId":6,"Mensaje":"Hello moto","CreatedAt":"2021-02-16T21:44:07.8143416-08:00",
                        // "Nombres":"Hector","Apellidos":"Saira","Email":"hector@upc.edu.pe","Telefono":"966209622","Dni":"44489714"}
                        JObject rss = JObject.Parse(mensaje);

                        Cliente cliente = new Cliente();
                        cliente.Nombres = (string)rss["Nombres"];
                        cliente.Apellidos = (string)rss["Apellidos"];
                        cliente.Email = (string)rss["Email"];
                        cliente.Telefono = (string)rss["Telefono"];
                        cliente.Dni = (string)rss["Dni"];
                        cliente.CreatedAt = DateTime.Now;
                        // Llamar a Reniec
                        // Llamar a Infocorp
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
                        CitaDAO citaDAO = new CitaDAO();
                        citaDAO.Crear(citaACrear);

                        //Console.WriteLine("Message: " + mensaje);
                        //string resultado = Encoding.UTF8.GetString(consumer.Body.ToArray());
                        //Console.WriteLine("Message: " + resultado);
                        //System.Diagnostics.Debug.WriteLine("Mensaje: " + resultado);
                    }
                }

                System.Threading.Thread.Sleep(1200); // 20 segundos *60
            }
        }
    }
}
