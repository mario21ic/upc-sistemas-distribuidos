using ApiRest.Dominio;
using ApiRest.Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace ApiRest
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Proyectos" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Proyectos.svc or Proyectos.svc.cs at the Solution Explorer and start debugging.
    public class Proyectos : IProyectos
    {
        private ProyectoDAO proyectoDAO = new ProyectoDAO();

        public List<Proyecto> Listar()
        {
            return proyectoDAO.Listar();
        }

        public Proyecto Obtener(string codigo)
        {
            return proyectoDAO.Obtener(int.Parse(codigo));
        }
    }
}
