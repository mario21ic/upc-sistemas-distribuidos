using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace ApiRest.Dominio
{
    [DataContract]
    public class Departamento
    {
        [DataMember(IsRequired = false)]
        public int Id { get; set; }

        [DataMember]
        public string Modelo { get; set; }
        [DataMember]
        public int Piso { get; set; }

        [DataMember]
        public int Dormitorios { get; set; }

        [DataMember]
        public int Banos { get; set; }

        [DataMember]
        public int Metros { get; set; }

        [DataMember]
        public int Precio { get; set; }

        [DataMember(IsRequired = false)]
        public bool Separado { get; set; }

    }
}