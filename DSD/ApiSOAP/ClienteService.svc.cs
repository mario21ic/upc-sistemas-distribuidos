using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using UPC.BE;
using UPC.DA;

namespace ApiSOAP
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ClienteService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ClienteService.svc or ClienteService.svc.cs at the Solution Explorer and start debugging.
    public class ClienteService : IClienteService
    {
        private ClienteDAO clienteDAO = new ClienteDAO();

        public Cliente RegistrarCliente(Cliente clienteACrear)
        {
            /*
            Cliente clienteExistente = clienteDAO.ObtenerPorDni(clienteACrear.Dni);
            Console.WriteLine("clienteExistente: ");
            Console.WriteLine(clienteExistente);
            if (clienteExistente != null)
            {
                throw new WebFaultException<DuplicadoException>(new DuplicadoException()
                {
                    Codigo = 102,
                    Descripcion = "El Dni ya se encuentra registrado"
                }, HttpStatusCode.Conflict);
            }
            */
            return clienteDAO.Crear(clienteACrear);
        }

        public Cliente ObtenerClientePorDni(string dni)
        {
            return clienteDAO.ObtenerPorDni(dni);
        }

        
    }
}
