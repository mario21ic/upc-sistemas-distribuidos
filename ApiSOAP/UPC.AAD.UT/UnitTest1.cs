using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Linq;
using WCFServices.Dominio;
using WCFServices.Persistencia;

namespace UPC.AAD.UT
{
    [TestClass]
    public class UnitTest1
    {
        AlumnoDAO objAlumnoDAO;

        public UnitTest1()
        {
            objAlumnoDAO = new AlumnoDAO();
        }

        [TestMethod]
        public void TestListado()
        {
            var todos = objAlumnoDAO.Listar();
            Assert.AreEqual(todos.Count(), 3);
        }

        [TestMethod]
        public void TestObtener()
        {
            Alumno alumnoObtenido = objAlumnoDAO.Obtener(2);
            Assert.AreEqual(alumnoObtenido.Codigo, 2);
            Assert.AreEqual(alumnoObtenido.Nombre, "Mario Inga");
            Assert.AreEqual(alumnoObtenido.Estado, "Registrado");
        }

        [TestMethod]
        public void TestActualizar()
        {
            Alumno alumnoAModificar = objAlumnoDAO.Obtener(3);
            alumnoAModificar.Estado = "Pendiente";
            objAlumnoDAO.Modificar(alumnoAModificar);

            Alumno alumnoModificado = objAlumnoDAO.Obtener(3);
            Assert.AreEqual(alumnoModificado.Estado, "Pendiente");
        }
    }
}
