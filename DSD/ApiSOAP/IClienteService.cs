using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using UPC.BE;

namespace ApiSOAP
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IClienteService" in both code and config file together.
    [ServiceContract]
    public interface IClienteService
    {
        [OperationContract]
        Cliente RegistrarCliente(Cliente clienteACrear);

        [OperationContract]
        //[WebInvoke(Method = "GET", UriTemplate = "ClientesPorDni/{dni}", ResponseFormat = WebMessageFormat.Json)]
        Cliente ObtenerClientePorDni(string dni);

    }
}
