using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WCFServices
{
    [DataContract]
    public class InfocorpData
    {
        [DataMember]
        public string Status { get; set;  }
        [DataMember]
        public int CreditosActuales { get; set; }
        [DataMember]
        public int CreditosPasados { get; set; }
    }
}