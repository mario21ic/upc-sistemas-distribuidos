using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UPC.BE;

namespace UPC.DA
{
    public class CitaDAO
    {

        private string CadenaConexion = "Data Source=(local);INitial Catalog=BDAsesorias;INtegrated Security=SSPI;";

        public bool Crear(Cita citaACrear)
        {
            string sentencia = "INSERT INTO Cita (cliente_id, departamento_id, mensaje, estado, created_at) VALUES (@cliente_id, @departamento_id, @mensaje, @estado, @created_at)";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@cliente_id", citaACrear.ClienteId));
                    comando.Parameters.Add(new SqlParameter("@departamento_id", citaACrear.DepartamentoId));
                    comando.Parameters.Add(new SqlParameter("@mensaje", citaACrear.Mensaje));
                    comando.Parameters.Add(new SqlParameter("@estado", citaACrear.Estado));
                    comando.Parameters.Add(new SqlParameter("@created_at", citaACrear.CreatedAt));
                    comando.ExecuteNonQuery();
                }
            }

            return true;
        }

        public List<Cita> Listar()
        {
            List<Cita> lista = new List<Cita>();
            Cita encontrado = null;
            string sentencia = "SELECT * FROM Cita";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        while (resultado.Read())
                        {
                            encontrado = new Cita()
                            {
                                Id = (int)resultado["cita_id"],
                                ClienteId = (int)resultado["cliente_id"],
                                DepartamentoId = (int)resultado["departamento_id"],
                                Mensaje  = (string)resultado["mensaje"],
                                //FechaCita = DateTime.Parse((string)resultado["fecha_cita"]),
                                Estado = (string)resultado["estado"],
                                CreatedAt = DateTime.Parse((string)resultado["created_at"])
                            };
                            lista.Add(encontrado);
                        }
                    }
                }
            }
            return lista;
        }

    }
}
