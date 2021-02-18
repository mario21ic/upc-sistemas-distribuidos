using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.Serialization;

namespace UPC.BE
{
    //[DataContract]
    public class Cliente
    {
        //[DataMember(IsRequired = false)]
        public int Id { get; set; }

        public string Nombres { get; set; }

        public string Apellidos { get; set; }

        public string Dni { get; set; }

        public string Email { get; set; }

        public string Telefono { get; set; }

        //[DataMember(IsRequired = false)]
        public DateTime CreatedAt { get; set; }

        //[DataMember(IsRequired = false)]
        public bool Activo { get; set; }


        //[DataMember(IsRequired = false)]
        public bool ReniecValidacion { get; set; }
        //[DataMember(IsRequired = false)]
        public int InfocorpCreditosActuales { get; set; }
        //[DataMember(IsRequired = false)]
        public int InfocorpCreditosPasados { get; set; }
        //[DataMember(IsRequired = false)]
        public string InfocorpStatus { get; set; }
    }
}
