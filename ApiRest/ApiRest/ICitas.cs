using ApiRest.Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace ApiRest
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ICitas" in both code and config file together.
    [ServiceContract]
    public interface ICitas
    {
        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "Citas", ResponseFormat = WebMessageFormat.Json)]
        bool Crear(Cita citaACrear);
    }
}
