using System;
using System.Collections.Generic;
using System.Text;

namespace Consumer.Dominio
{
    class Cliente
    {
        public string Nombres { get; set; }

        public string Apellidos { get; set; }

        public string Dni { get; set; }

        public string Email { get; set; }

        public string Telefono { get; set; }

        public DateTime CreatedAt { get; set; }

        public bool Activo { get; set; }

        public bool ReniecValidacion { get; set; }
        public int InfocorpCreditosActuales { get; set; }
        public int InfocorpCreditosPasados { get; set; }
        public string InfocorpStatus { get; set; }
    }
}
