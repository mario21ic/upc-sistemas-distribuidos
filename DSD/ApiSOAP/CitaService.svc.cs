using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using UPC.BE;
using UPC.DA;

namespace ApiSOAP
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "CitaService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select CitaService.svc or CitaService.svc.cs at the Solution Explorer and start debugging.
    public class CitaService : ICitaService
    {

        private CitaDAO citaDAO = new CitaDAO();

        public bool RegistrarCita(Cita citaACrear)
        {
            return citaDAO.Crear(citaACrear);
        }

        public List<Cita> ListarCitas()
        {
            return citaDAO.Listar();
        }

        public bool AtenderCita(Cita citaAModificar)
        {
            throw new NotImplementedException();
        }
    }
}
