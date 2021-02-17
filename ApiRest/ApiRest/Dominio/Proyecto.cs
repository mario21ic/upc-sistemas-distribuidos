using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace ApiRest.Dominio
{
    [DataContract]
    public class Proyecto
    {
        [DataMember(IsRequired = false)]
        public int Id { get; set; }

        [DataMember]
        public string Nombre { get; set; }

        [DataMember]
        public string Estado { get; set; }
    }
}