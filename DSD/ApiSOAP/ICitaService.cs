using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using UPC.BE;

namespace ApiSOAP
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ICitaService" in both code and config file together.
    [ServiceContract]
    public interface ICitaService
    {
        [OperationContract]
        bool RegistrarCita(Cita citaACrear);

        [OperationContract]
        //[WebInvoke(Method = "GET", UriTemplate = "Citas", ResponseFormat = WebMessageFormat.Json)]
        List<Cita> ListarCitas();

        [OperationContract]
        //[WebInvoke(Method = "PUT", UriTemplate = "Citas", ResponseFormat = WebMessageFormat.Json)]
        bool AtenderCita(Cita citaAModificar);
    }
}
