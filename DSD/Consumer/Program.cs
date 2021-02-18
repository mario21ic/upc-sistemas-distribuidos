using Newtonsoft.Json.Linq;
using RabbitMQ.Client;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
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
                HttpWebRequest request = WebRequest.Create("http://localhost:59577/GestionSolicitudCitaService.svc/ProcesarSolicitudCitas") as HttpWebRequest;
                //request.Method = "POST";
                //request.ContentType = "application/x-www-form-urlencoded";
                request.Method = "GET";

                //Console.WriteLine("Inicia Response");
                System.Diagnostics.Debug.WriteLine("Inicia Response");
                // Response
                HttpWebResponse response = request.GetResponse() as HttpWebResponse;
                string resp = "";
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                {
                    resp = reader.ReadToEnd();
                    //Console.WriteLine("Response:");
                }
                System.Diagnostics.Debug.WriteLine("Response:");
                System.Diagnostics.Debug.WriteLine(resp);
                System.Diagnostics.Debug.WriteLine(resp.GetType());

                JObject responseObj = JObject.Parse(resp);
                /**
                 * {
                        "ClienteId": 25,
                        "CreatedAt": "/Date(1613686489000-0800)/",
                        "DepartamentoId": 6
                    }
                 * */

                // get JSON result objects into a list
                JObject rss = JObject.Parse(resp);
                //temp = float.Parse((string)rss["main"]["temp"]);
                //System.Diagnostics.Debug.WriteLine(temp);
                Console.WriteLine("ClienteId: " + rss["ClienteId"]);
                Console.WriteLine("CreatedAt: " + rss["CreatedAt"]);
                Console.WriteLine("DepartamentoId: " + rss["DepartamentoId"]);


                System.Threading.Thread.Sleep(1200); // 20 segundos *60
            }
        }
    }
}
