using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using WCFServices.Dominio;
using WCFServices.Persistencia;
using WCFServices.Errores;
using System.Net;

namespace ApiRest
{
	// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Clientes" in code, svc and config file together.
	// NOTE: In order to launch WCF Test Client for testing this service, please select Clientes.svc or Clientes.svc.cs at the Solution Explorer and start debugging.
	public class Clientes : IClientes
	{
        private ClienteDAO clienteDAO = new ClienteDAO();

        public Cliente CrearCliente(Cliente clienteACrear)
        {
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
            return clienteDAO.Crear(clienteACrear);
        }

        public List<Cliente> ListarClientes()
        {
            return clienteDAO.Listar();
        }

        public Cliente ObtenerCliente(string codigo)
        {
            return clienteDAO.Obtener(int.Parse(codigo));
        }

        // 4. Implementa una operación más para poder Buscar
        //    Se busca Cliente por DNI
        public Cliente ObtenerClientePorDni(string dni)
        {
            return clienteDAO.ObtenerPorDni(dni);
        }

        public Cliente ModificarCliente(Cliente clienteAModificar)
        {
            return clienteDAO.Modificar(clienteAModificar);
        }

        public void EliminarCliente(string codigo)
        {
            Cliente clienteExistente = clienteDAO.Obtener(int.Parse(codigo));
            // 6. Implementa el lanzamiento de una excepción más en cualquiera de las operaciones del servicio
            //    Valida que exista el usuario y luego valida que no este Activo
            if (clienteExistente != null)
            {
                if (clienteExistente.Activo)
                {
                    throw new WebFaultException<EliminarException>(new EliminarException()
                    {
                        Descripcion = "No puede eliminar un Cliente activo"
                    }, HttpStatusCode.Conflict);
                }

                clienteDAO.Eliminar(int.Parse(codigo));
            }


        }
    }
}
