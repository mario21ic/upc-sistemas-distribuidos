using Newtonsoft.Json;
using RabbitMQ.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using UPC.BE;

namespace UPC.DA
{
    public class SolicitudCitaDAO
    {
        public bool Crear(SolicitudCita citaACrear)
        {
            citaACrear.CreatedAt = DateTime.Now;
            string jsonString = JsonConvert.SerializeObject(citaACrear);
            var factory = new ConnectionFactory() { HostName = "localhost" };
            using (var connection = factory.CreateConnection())
            using (var channel = connection.CreateModel())
            {
                channel.QueueDeclare(queue: "SolicitudCitas",
                                     durable: false, exclusive: false,
                                     autoDelete: false, arguments: null);
                //var body = Encoding.UTF8.GetBytes("Cita a registrar "  + citaACrear.Nombres);
                var body = Encoding.UTF8.GetBytes(jsonString);
                channel.BasicPublish(exchange: "", routingKey: "SolicitudCitas",
                                     basicProperties: null, body: body);
            }

            return true;
        }
    }
}