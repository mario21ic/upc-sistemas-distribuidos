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
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Departamentos" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Departamentos.svc or Departamentos.svc.cs at the Solution Explorer and start debugging.
    public class Departamentos : IDepartamentos
    {
        private DepartamentoDAO departamentoDAO = new DepartamentoDAO();

        public List<Departamento> Listar()
        {
            return departamentoDAO.Listar();
        }

        public Departamento Obtener(string codigo)
        {
            return departamentoDAO.Obtener(int.Parse(codigo));
        }
    }
}
