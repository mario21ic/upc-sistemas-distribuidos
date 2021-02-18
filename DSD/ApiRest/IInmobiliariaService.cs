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
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IInmobiliariaService" in both code and config file together.
    [ServiceContract]
    public interface IInmobiliariaService
    {
        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Proyectos", ResponseFormat = WebMessageFormat.Json)]
        List<Proyecto> ListProyectos();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Proyectos/{codigo}", ResponseFormat = WebMessageFormat.Json)]
        Proyecto GetProyecto(string codigo);


        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Departamentos", ResponseFormat = WebMessageFormat.Json)]
        List<Departamento> ListDepartamentos();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Departamentos/{codigo}", ResponseFormat = WebMessageFormat.Json)]
        Departamento GetDepartamento(string codigo);

        [OperationContract]
        [WebInvoke(Method = "PUT", UriTemplate = "Departamentos/{codigo}", ResponseFormat = WebMessageFormat.Json)]
        bool DesactivarDepartamento(string codigo);






    }
}
