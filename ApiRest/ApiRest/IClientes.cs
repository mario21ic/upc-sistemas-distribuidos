using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using WCFServices.Dominio;

namespace ApiRest
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IClientes" in both code and config file together.
    [ServiceContract]
    public interface IClientes
    {

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Clientes", ResponseFormat = WebMessageFormat.Json)]
        List<Cliente> ListarClientes();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Clientes/{codigo}", ResponseFormat = WebMessageFormat.Json)]
        Cliente ObtenerCliente(string codigo);

        // 4. Implementa una operación más para poder Buscar
        //    Se busca Cliente por DNI
        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "ClientesPorDni/{dni}", ResponseFormat = WebMessageFormat.Json)]
        Cliente ObtenerClientePorDni(string dni);

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "Clientes", ResponseFormat = WebMessageFormat.Json)]
        Cliente CrearCliente(Cliente clienteACrear);

        [OperationContract]
        [WebInvoke(Method = "PUT", UriTemplate = "Clientes", ResponseFormat = WebMessageFormat.Json)]
        Cliente ModificarCliente(Cliente alumnoAModificar);

        [OperationContract]
        [WebInvoke(Method = "DELETE", UriTemplate = "Clientes/{codigo}", ResponseFormat = WebMessageFormat.Json)]
        void EliminarCliente(string codigo);
    }
}
