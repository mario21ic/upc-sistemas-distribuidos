using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WCFServices.Dominio
{
    [DataContract]
    public class Alumno
    {
        [DataMember]
        public int Codigo { get; set; }

        [DataMember]
        public string Nombre { get; set; }
        
        [DataMember(IsRequired =false)]
        public string Estado { get; set; }
    }
}