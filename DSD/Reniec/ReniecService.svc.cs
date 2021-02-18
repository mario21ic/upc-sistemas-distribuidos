using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace Reniec
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ReniecService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ReniecService.svc or ReniecService.svc.cs at the Solution Explorer and start debugging.
    public class ReniecService : IReniecService
    {
        public ReniecPersona GetReniecPersona(string dni)
        {
            ReniecPersona persona = new ReniecPersona();
            persona.Apellidos = "Perez";
            persona.Nombres = "Juan";
            persona.Dni = dni;
            persona.LugarNacimiento = "Huancayo";
            persona.FechaNacimiento = "11-01-1986";

            return persona;
        }

        public bool ValidarDni(string dni)
        {
            if (dni == null || dni.Length != 8)
            {
                return false;
            }

            return true;
            //Random _random = new Random();
            //bool[] arrayStatus = new bool[] { true, false };
            //return arrayStatus[_random.Next(0, 1)];
        }
    }
}
