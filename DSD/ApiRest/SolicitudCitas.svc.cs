using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using UPC.BE;
using UPC.DA;

namespace ApiRest
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Citas" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Citas.svc or Citas.svc.cs at the Solution Explorer and start debugging.
    public class SolicitudCitas : ISolicitudCitas
    {

        private SolicitudCitaDAO SolicitudCitaDAO = new SolicitudCitaDAO();

        public bool Crear(SolicitudCita citaACrear)
        {
            return SolicitudCitaDAO.Crear(citaACrear);
        }
    }
}
