using System;
using System.Collections.Generic;
using System.Text;

namespace Consumer.Dominio
{
    class Cita
    {
        public int DepartamentoId { get; set; }
        public int ClienteId { get; set; }

        public string Mensaje { get; set; }

        public DateTime CreatedAt { get; set; }

        public string Estado { get; set; }
        
    }
}
