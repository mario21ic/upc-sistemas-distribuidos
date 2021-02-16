using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WCFServices.Dominio;

namespace WCFServices.Persistencia
{
    public class ClienteDAO
    {

        private string CadenaConexion = "Data Source=(local);INitial Catalog=BDAsesorias;INtegrated Security=SSPI;";

        public Cliente Modificar(Cliente clienteAModificar)
        {
            Cliente clienteModificado = null;
            string sentencia = "UPDATE Cliente  SET nombres=@nombres, apellidos=@apellidos, dni=@dni, email=@email, telefono=@telefono WHERE cliente_id=@cod";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@cod", clienteAModificar.Id));
                    comando.Parameters.Add(new SqlParameter("@nombres", clienteAModificar.Nombres));
                    comando.Parameters.Add(new SqlParameter("@apellidos", clienteAModificar.Apellidos));
                    comando.Parameters.Add(new SqlParameter("@dni", clienteAModificar.Dni));
                    comando.Parameters.Add(new SqlParameter("@email", clienteAModificar.Email));
                    comando.Parameters.Add(new SqlParameter("@telefono", clienteAModificar.Telefono));
                    comando.ExecuteNonQuery();
                }
            }
            clienteModificado = Obtener(clienteAModificar.Id);
            return clienteModificado;
        }

        public void Eliminar(int codigo)
        {
            string sentencia = "DELETE FROM Cliente WHERE cliente_id=@cod";
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

        public Cliente Obtener(int codigo)
        {
            Cliente clienteEncontrado = null;
            string sentencia = "SELECT * FROM Cliente WHERE cliente_id=@cod";
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


        // 4. Implementa una operación más para poder Buscar
        //    Se busca Cliente por DNI
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

        public List<Cliente> Listar()
        {
            List<Cliente> clientesEncontrados = new List<Cliente>();
            Cliente clienteEncontrado = null;
            string sentencia = "SELECT * FROM Cliente";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sentencia, conexion))
                {
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        while (resultado.Read())
                        {
                            clienteEncontrado = new Cliente()
                            {
                                Id = (int)resultado["cliente_id"],
                                Nombres = (string)resultado["nombres"],
                                Apellidos = (string)resultado["apellidos"],
                                Dni = (string)resultado["dni"],
                                Email = (string)resultado["email"],
                                Telefono = (string)resultado["telefono"],
                                Activo = true
                            };
                            clientesEncontrados.Add(clienteEncontrado);
                        }
                    }
                }
            }
            return clientesEncontrados;
        }

    }
}