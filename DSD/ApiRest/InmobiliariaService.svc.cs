using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using UPC.BE;
using UPC.DA;

namespace ApiRest
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "InmobiliariaService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select InmobiliariaService.svc or InmobiliariaService.svc.cs at the Solution Explorer and start debugging.
    public class InmobiliariaService : IInmobiliariaService
    {
        private DepartamentoDAO departamentoDAO = new DepartamentoDAO();
        private ProyectoDAO proyectoDAO = new ProyectoDAO();

        public List<Proyecto> ListProyectos()
        {
            return proyectoDAO.Listar();
        }

        public Proyecto GetProyecto(string codigo)
        {
            return proyectoDAO.Obtener(int.Parse(codigo));
        }

        public List<Departamento> ListDepartamentos()
        {
            return departamentoDAO.Listar();
        }

        public Departamento GetDepartamento(string codigo)
        {
            return departamentoDAO.Obtener(int.Parse(codigo));
        }


        public bool DesactivarDepartamento(string codigo)
        {
            return departamentoDAO.DesactivarDepartamento(int.Parse(codigo));
        }
    }
}
