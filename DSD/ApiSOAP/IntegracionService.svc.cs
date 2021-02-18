using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using UPC.BE;

namespace ApiSOAP
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "IntegracionService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select IntegracionService.svc or IntegracionService.svc.cs at the Solution Explorer and start debugging.
    public class IntegracionService : IIntegracionService
    {
        public bool ReniectExisteDNI(string dni)
        {
            // TODO: Aqui debe llamar al SOAP service de Reniec para validar si DNI existe
            if (dni == null || dni.Length != 8)
            {
                return false;
            }

            return true;
        }

        public InfocorpData InfocorpHistorial(string dni)
        {
            // TODO: Aqui debe llamar al SOAP Service de Infocorp para retornar la data
            InfocorpData data = new InfocorpData();

            Random _random = new Random();
            string[] arrayStatus = new string[] { "rojo", "amarillo", "verde" };

            data.CreditosActuales = 0;
            data.CreditosPasados = 2;
            data.Status = arrayStatus[_random.Next(0, 3)];

            return data;
        }
    }
}
