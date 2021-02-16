using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using WCFServices.Dominio;
using WCFServices.Errores;
using WCFServices.Persistencia;

namespace WCFServices
{
    public class Alumnos : IAlumnos
    {
        private AlumnoDAO alumnoDAO = new AlumnoDAO();

        public Alumno CrearAlumno(Alumno alumnoACrear)
        {
            Alumno alumnoExistente = alumnoDAO.Obtener(alumnoACrear.Codigo);
            Console.WriteLine("alumnoExistente");
            Console.WriteLine(alumnoExistente);
            if (alumnoExistente!=null)
            {
                throw new WebFaultException<DuplicadoException>( new DuplicadoException() { 
                    Codigo = 102,
                    Descripcion = "Alumno duplicado"
                }, HttpStatusCode.Conflict);
            }
            return alumnoDAO.Crear(alumnoACrear);
        }

        public Alumno ObtenerAlumno(string codigo)
        {
            return alumnoDAO.Obtener(int.Parse(codigo));
        }

        public Alumno ModificarAlumno(Alumno alumnoAModificar)
        {
            return alumnoDAO.Modificar(alumnoAModificar);
        }

        public void EliminarAlumno(string codigo)
        {
            alumnoDAO.Eliminar(int.Parse(codigo));
        }

        public List<Alumno> ListarAlumnos()
        {
            return alumnoDAO.Listar();
        }

       

        
    }
}
