using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;


namespace WCFServices.Dominio
{
    [DataContract]
    public class Cliente
    {

        [DataMember(IsRequired = false)]
        public int Id { get; set; }

        [DataMember]
        public string Nombres { get; set; }

        [DataMember]
        public string Apellidos { get; set; }

        [DataMember]
        public string Email { get; set; }

        [DataMember]
        public string Telefono { get; set; }

        [DataMember]
        public string Dni { get; set; }

        [DataMember(IsRequired = false)]
        public bool Activo { get; set; }
    }
}