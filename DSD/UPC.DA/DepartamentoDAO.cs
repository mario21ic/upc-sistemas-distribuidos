using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UPC.BE;


namespace UPC.DA
{
    public class DepartamentoDAO
    {
        private string CadenaConexion = "Data Source=(local);INitial Catalog=BDAsesorias;INtegrated Security=SSPI;";

        public List<Departamento> Listar()
        {
            List<Departamento> listado = new List<Departamento>();
            Departamento encontrado = null;
            string sentencia = "SELECT * FROM Departamento";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        while (resultado.Read())
                        {
                            encontrado = new Departamento()
                            {
                                Id = (int)resultado["departamento_id"],
                                Modelo = (string)resultado["modelo"],
                                Piso = (int)resultado["piso"],
                                Dormitorios = (int)resultado["dormitorios"],
                                Banos = (int)resultado["banos"],
                                Metros = (int)resultado["metros"],
                                Precio = (int)resultado["precio"]
                            };
                            listado.Add(encontrado);
                        }
                    }
                }
            }
            return listado;
        }

        public Departamento Obtener(int codigo)
        {
            Departamento depa = null;
            string sentencia = "SELECT * FROM Departamento WHERE departamento_id=@cod";
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
                            depa = new Departamento()
                            {
                                Id = (int)resultado["departamento_id"],
                                Modelo = (string)resultado["modelo"],
                                Piso = (int)resultado["piso"],
                                Dormitorios = (int)resultado["dormitorios"],
                                Banos = (int)resultado["banos"],
                                Metros = (int)resultado["metros"],
                                Precio = (int)resultado["precio"]
                            };
                        }
                    }
                }
            }
            return depa;
        }

        public bool DesactivarDepartamento(int codigo)
        {
            string sentencia = "UPDATE Departamento SET activo=0 WHERE departamento_id=@cod";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@cod", codigo));
                    comando.ExecuteNonQuery();
                }
            }
            return true;
        }
    }
}