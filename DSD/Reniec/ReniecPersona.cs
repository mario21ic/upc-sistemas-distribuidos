using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Reniec
{
    [DataContract]
    public class ReniecPersona
    {
        [DataMember]
        public string Nombres { get; set;  }

        [DataMember]
        public string Apellidos { get; set; }

        [DataMember]
        public string LugarNacimiento { get; set; }

        [DataMember]
        public string FechaNacimiento { get; set; }
        [DataMember]
        public string Dni { get; set; }
    }
}