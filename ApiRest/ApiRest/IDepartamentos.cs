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
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IDepartamentos" in both code and config file together.
    [ServiceContract]
    public interface IDepartamentos
    {
        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Departamentos", ResponseFormat = WebMessageFormat.Json)]
        List<Departamento> Listar();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Departamentos/{codigo}", ResponseFormat = WebMessageFormat.Json)]
        Departamento Obtener(string codigo);
    }
}
