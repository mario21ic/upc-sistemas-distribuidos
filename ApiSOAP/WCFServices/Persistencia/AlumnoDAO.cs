using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WCFServices.Dominio;

namespace WCFServices.Persistencia
{
    public class AlumnoDAO
    {
        private string CadenaConexion = "Data Source=(local);INitial Catalog=BDAsesorias;INtegrated Security=SSPI;";

        public Alumno Crear(Alumno alumnoACrear)
        {
            Alumno alumnoCreado = null;
            string sentencia = "INSERT INTO t_alumno VALUES (@cod, @nom, @est)";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@cod", alumnoACrear.Codigo));
                    comando.Parameters.Add(new SqlParameter("@nom", alumnoACrear.Nombre));
                    comando.Parameters.Add(new SqlParameter("@est", alumnoACrear.Estado));
                    comando.ExecuteNonQuery();
                }
            }
            alumnoCreado = Obtener(alumnoACrear.Codigo);
            return alumnoCreado;
        }

        public Alumno Obtener(int codigo)
        {
            Alumno alumnoEncontrado = null;
            string sentencia = "SELECT * FROM t_alumno WHERE nu_codigo=@cod";
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
                            alumnoEncontrado = new Alumno() {
                                Codigo = (int)resultado["nu_codigo"],
                                Nombre = (string)resultado["tx_nombre"],
                                Estado = (string)resultado["tx_estado"]
                            };
                        }
                    }
                }
            }
            return alumnoEncontrado;
        }

        public Alumno Modificar(Alumno alumnoAModificar)
        {
            Alumno alumnoModificado = null;
            string sentencia = "UPDATE t_alumno SET tx_nombre=@nom, tx_estado=@est WHERE nu_codigo=@cod";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@nom", alumnoAModificar.Nombre));
                    comando.Parameters.Add(new SqlParameter("@est", alumnoAModificar.Estado));
                    comando.Parameters.Add(new SqlParameter("@cod", alumnoAModificar.Codigo));
                    comando.ExecuteNonQuery();
                }
            }
            alumnoModificado = Obtener(alumnoAModificar.Codigo);
            return alumnoModificado;
        }

        public void Eliminar(int codigo)
        {
            string sentencia = "DELETE FROM t_alumno WHERE nu_codigo=@cod";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@cod", codigo));
                    comando.ExecuteNonQuery();
                }
            }
        }

        public List<Alumno> Listar()
        {
            List<Alumno> alumnosEncontrados = new List<Alumno>();
            Alumno alumnoEncontrado = null;
            string sentencia = "SELECT * FROM t_alumno";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        while (resultado.Read())
                        {
                            alumnoEncontrado = new Alumno()
                            {
                                Codigo = (int)resultado["nu_codigo"],
                                Nombre = (string)resultado["tx_nombre"],
                                Estado = (string)resultado["tx_estado"]
                            };
                            alumnosEncontrados.Add(alumnoEncontrado);
                        }
                    }
                }
            }
            return alumnosEncontrados;
        }

    }
}