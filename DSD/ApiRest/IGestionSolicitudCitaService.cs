using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using UPC.BE;

namespace ApiRest
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IGestionSlicitudCitaService" in both code and config file together.
    [ServiceContract]
    public interface IGestionSolicitudCitaService
    {
        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "SolicitudCitas", ResponseFormat = WebMessageFormat.Json)]
        bool RegistrarSolicitudCita(SolicitudCita citaACrear);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "SolicitudCitas", ResponseFormat = WebMessageFormat.Json)]
        bool ProcesarSolicitudCita();
    }
}
