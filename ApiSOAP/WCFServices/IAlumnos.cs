using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using WCFServices.Dominio;

namespace WCFServices
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IAlumnos" in both code and config file together.
    [ServiceContract]
    public interface IAlumnos
    {
        [OperationContract]
        [WebInvoke(Method ="POST", UriTemplate ="Alumnos", ResponseFormat =WebMessageFormat.Json)]
        Alumno CrearAlumno(Alumno alumnoACrear);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Alumnos/{codigo}", ResponseFormat = WebMessageFormat.Json)]
        Alumno ObtenerAlumno(string codigo);

        [OperationContract]
        [WebInvoke(Method = "PUT", UriTemplate = "Alumnos", ResponseFormat = WebMessageFormat.Json)]
        Alumno ModificarAlumno(Alumno alumnoAModificar);

        [OperationContract]
        [WebInvoke(Method = "DELETE", UriTemplate = "Alumnos/{codigo}", ResponseFormat = WebMessageFormat.Json)]
        void EliminarAlumno(string codigo);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Alumnos", ResponseFormat = WebMessageFormat.Json)]
        List<Alumno> ListarAlumnos();
    }
}
