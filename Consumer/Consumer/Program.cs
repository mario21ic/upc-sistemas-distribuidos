﻿using RabbitMQ.Client;
using System;
using System.Text;

namespace Consumer
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Iniciando Consumer");
            var factory = new ConnectionFactory() { HostName = "localhost" };

            while (true)
            {
                Console.WriteLine("Leyendo mensajes!");
                using (var connection = factory.CreateConnection())
                using (var channel = connection.CreateModel()) {
                    BasicGetResult consumer = channel.BasicGet("notificaciones", true);
                    if (consumer != null) {
                        string resultado = Encoding.UTF8.GetString(consumer.Body.ToArray());
                        Console.WriteLine("Mensaje: " + resultado);
                        //System.Diagnostics.Debug.WriteLine("Mensaje: " + resultado);
                    }
                }

                System.Threading.Thread.Sleep(1200); // 20 segundos *60
            }
            
        }
    }
}
