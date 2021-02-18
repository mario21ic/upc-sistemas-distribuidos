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
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IGestionSolicitudCitaService" in both code and config file together.
    [ServiceContract]
    public interface IGestionSolicitudCitaService
    {
        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "SolicitudCitas", ResponseFormat = WebMessageFormat.Json)]
        //[WebInvoke(Method = "POST", UriTemplate = "SolicitudCitas", ResponseFormat = WebMessageFormat.Json, RequestFormat = (WebMessageFormat)WebMessageBodyStyle.WrappedRequest)]
        bool RegistrarSolicitudCita(SolicitudCita citaACrear);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "ProcesarSolicitudCitas", ResponseFormat = WebMessageFormat.Json)]
        //bool ProcesarSolicitudCita();
        //List<SolicitudCitaProcesada> ProcesarSolicitudCita();
        SolicitudCitaProcesada ProcesarSolicitudCita();

        /*
        [OperationContract]
        [WebInvoke(Method = "OPTIONS", UriTemplate = "*")]
        void GetOptions() { }
        */
    }
}
