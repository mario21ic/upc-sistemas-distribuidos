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
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IProyectos" in both code and config file together.
    [ServiceContract]
    public interface IProyectos
    {
        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Proyectos", ResponseFormat = WebMessageFormat.Json)]
        List<Proyecto> Listar();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Proyectos/{codigo}", ResponseFormat = WebMessageFormat.Json)]
        Proyecto Obtener(string codigo);
    }
}
