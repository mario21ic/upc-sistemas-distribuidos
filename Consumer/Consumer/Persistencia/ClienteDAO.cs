using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Consumer.Dominio;

namespace Consumer.Persistencia
{
    public class ClienteDAO
    {

        private string CadenaConexion = "Data Source=(local);INitial Catalog=BDAsesorias;INtegrated Security=SSPI;";

        public Cliente Crear(Cliente clienteACrear)
        {
            Cliente clienteCreado = null;
            string sentencia = "INSERT INTO Cliente  (nombres, apellidos, dni, email, telefono, activo) VALUES (@nombres, @apellidos, @dni, @email, @telefono, @activo)";
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
                    comando.ExecuteNonQuery();
                }
            }
            clienteCreado = ObtenerPorDni(clienteACrear.Dni);
            return clienteCreado;
        }

    }
}
