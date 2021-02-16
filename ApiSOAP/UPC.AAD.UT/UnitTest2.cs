using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Linq;
using WCFServices;
using WCFServices.Dominio;
using WCFServices.Errores;
using WCFServices.Persistencia;

namespace UPC.AAD.UT
{
    [TestClass]
    public class UnitTest2
    {
        ClienteDAO objClienteDAO;

        public UnitTest2()
        {
            objClienteDAO = new ClienteDAO();
        }

        [TestMethod]
        public void TestListado()
        {
            var todos = objClienteDAO.Listar();
            Assert.AreEqual(todos.Count(), 7);
        }

        // 5. Implementa la prueba unitaria para esta operación extra Buscar.
        //    Se busca por DNI
        [TestMethod]
        public void TestObtenerPorDni()
        {
            Cliente alumnoObtenido = objClienteDAO.ObtenerPorDni("44489174");
            Assert.AreEqual(alumnoObtenido.Nombres, "Mario");
            Assert.AreEqual(alumnoObtenido.Apellidos, "Inga");
            Assert.AreEqual(alumnoObtenido.Email, "mario21ic@gmail.com");
        }

        // 7. Implementa la prueba unitaria para esta segunda excepción 
        [TestMethod]
        [ExpectedException(typeof(EliminarException))]
        public void TestException()
        {
            Clientes objClientes = new Clientes();
            //objClientes.EliminarCliente('8');
            //Assert.ThrowsException<EliminarException>(() => objClientes.EliminarCliente("8"));
        }
    }
}
