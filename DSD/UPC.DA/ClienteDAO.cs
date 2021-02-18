using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UPC.BE;

namespace UPC.DA
{
    public class ClienteDAO
    {

        private string CadenaConexion = "Data Source=(local);INitial Catalog=BDAsesorias;INtegrated Security=SSPI;";

        public Cliente Crear(Cliente clienteACrear)
        {
            Cliente clienteCreado = null;
            string sentencia = "INSERT INTO Cliente  (nombres, apellidos, dni, email, telefono, activo, created_at, reniec_validacion, infocorp_creditos_actuales, infocorp_creditos_pasados, infocorp_status) VALUES (@nombres, @apellidos, @dni, @email, @telefono, @activo, @created_at, @reniec_validacion, @infocorp_creditos_actuales, @infocorp_creditos_pasados, @infocorp_status)";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@nombres", clienteACrear.Nombres));
                    comando.Parameters.Add(new SqlParameter("@apellidos", clienteACrear.Apellidos));
                    comando.Parameters.Add(new SqlParameter("@dni", clienteACrear.Dni));
                    comando.Parameters.Add(new SqlParameter("@email", clienteACrear.Email));
                    comando.Parameters.Add(new SqlParameter("@telefono", clienteACrear.Telefono));
                    comando.Parameters.Add(new SqlParameter("@activo", true));
                    comando.Parameters.Add(new SqlParameter("@created_at", clienteACrear.CreatedAt));
                    // Extras 
                    comando.Parameters.Add(new SqlParameter("@reniec_validacion", clienteACrear.ReniecValidacion));
                    comando.Parameters.Add(new SqlParameter("@infocorp_creditos_actuales", clienteACrear.InfocorpCreditosActuales));
                    comando.Parameters.Add(new SqlParameter("@infocorp_creditos_pasados", clienteACrear.InfocorpCreditosPasados));
                    comando.Parameters.Add(new SqlParameter("@infocorp_status", clienteACrear.InfocorpStatus));
                    comando.ExecuteNonQuery();
                }
            }
            clienteCreado = ObtenerPorDni(clienteACrear.Dni);
            return clienteCreado;
        }

        public Cliente ObtenerPorDni(string dni)
        {
            Cliente clienteEncontrado = null;
            string sentencia = "SELECT * FROM Cliente WHERE dni=@dni";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@dni", dni));
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        if (resultado.Read())
                        {
                            clienteEncontrado = new Cliente()
                            {
                                Id = (int)resultado["cliente_id"],
                                Nombres = (string)resultado["nombres"],
                                Apellidos = (string)resultado["apellidos"],
                                Dni = (string)resultado["dni"],
                                Email = (string)resultado["email"],
                                Telefono = (string)resultado["telefono"],
                                Activo = (bool)resultado["activo"]
                            };
                        }
                    }
                }
            }
            return clienteEncontrado;
        }

    }
}
