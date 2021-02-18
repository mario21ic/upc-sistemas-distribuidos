using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UPC.BE;

namespace UPC.DAO
{
    public class ProyectoDAO
    {

        private string CadenaConexion = "Data Source=(local);INitial Catalog=BDAsesorias;INtegrated Security=SSPI;";

        public List<Proyecto> Listar()
        {
            List<Proyecto> listado = new List<Proyecto>();
            Proyecto encontrado = null;
            string sentencia = "SELECT * FROM Proyecto";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        while (resultado.Read())
                        {
                            encontrado = new Proyecto()
                            {
                                Id = (int)resultado["proyecto_id"],
                                Nombre = (string)resultado["nombre"],
                                Estado = (string)resultado["estado"]
                            };
                            listado.Add(encontrado);
                        }
                    }
                }
            }
            return listado;
        }

        public Proyecto Obtener(int codigo)
        {
            Proyecto depa = null;
            string sentencia = "SELECT * FROM Proyecto WHERE proyecto_id=@cod";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@cod", codigo));
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        if (resultado.Read())
                        {
                            depa = new Proyecto()
                            {
                                Id = (int)resultado["proyecto_id"],
                                Nombre = (string)resultado["nombre"],
                                Estado = (string)resultado["estado"]
                            };
                        }
                    }
                }
            }
            return depa;
        }
    }
}