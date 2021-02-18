using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiSOAP.Errores
{
    [DataContract]
    public class DuplicadoException
    {
        [DataMember]
        public int Codigo { get; set; }

        [DataMember]
        public string Descripcion { get; set; }
    }
}