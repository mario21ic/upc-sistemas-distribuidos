using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.Web;

namespace UPC.BE
{
    //[DataContract]
    public class SolicitudCita
    {
        //[DataMember]
        public int DepartamentoId { get; set; }

        //[DataMember(IsRequired = false)]
        public string Mensaje { get; set; }

        //[DataMember(IsRequired = false)]
        public DateTime CreatedAt { get; set; }

        //[DataMember]
        //public Cliente cliente { get; set; }
        //[DataMember]
        public string Nombres { get; set; }

        //[DataMember]
        public string Apellidos { get; set; }

        //[DataMember]
        public string Email { get; set; }

        //[DataMember]
        public string Telefono { get; set; }

        //[DataMember]
        public string Dni { get; set; }
    }
}
