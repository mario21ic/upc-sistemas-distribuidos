using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using WCFServices;

namespace WCFInfocorp
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "InfocorpService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select InfocorpService.svc or InfocorpService.svc.cs at the Solution Explorer and start debugging.
    public class InfocorpService : IInfocorpService
    {
        public InfocorpData HistorialFinanciero(string dni)
        {
            InfocorpData data = new InfocorpData();
            
            Random _random = new Random();
            string[] arrayStatus = new string[] { "rojo", "amarillo", "verde"};
            
            data.CreditosActuales = 0;
            data.CreditosPasados = 2;
            data.Status = arrayStatus[_random.Next(0, 3)];

            return data;
        }
    }
}
