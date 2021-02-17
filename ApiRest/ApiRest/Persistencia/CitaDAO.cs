using ApiRest.Dominio;
using Newtonsoft.Json;
using RabbitMQ.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace ApiRest.Persistencia
{
    public class CitaDAO
    {
        public bool Crear(Cita citaACrear)
        {
            citaACrear.CreatedAt = DateTime.Now;
            string jsonString = JsonConvert.SerializeObject(citaACrear);
            var factory = new ConnectionFactory() { HostName = "localhost" };
            using (var connection = factory.CreateConnection())
            using (var channel = connection.CreateModel())
            {
                channel.QueueDeclare(queue: "Citas",
                                     durable: false, exclusive: false,
                                     autoDelete: false, arguments: null);
                //var body = Encoding.UTF8.GetBytes("Cita a registrar "  + citaACrear.Nombres);
                var body = Encoding.UTF8.GetBytes(jsonString);
                channel.BasicPublish(exchange: "", routingKey: "Citas",
                                     basicProperties: null, body: body);
            }

            return true;
        }
    }
}