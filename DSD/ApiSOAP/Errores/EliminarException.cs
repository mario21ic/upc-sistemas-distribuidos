using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiSOAP.Errores
{
    [DataContract]
    public class EliminarException : Exception
    {
        [DataMember]
        public string Descripcion { get; set; }
    }
}