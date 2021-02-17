using RabbitMQ.Client;
using System;
using System.Text;

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
                using (var channel = connection.CreateModel()) {
                    BasicGetResult consumer = channel.BasicGet("Notifications", true);
                    if (consumer != null) {

                        string resultado = Encoding.UTF8.GetString(consumer.Body.ToArray());
                        Console.WriteLine("Message: " + resultado);

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
