using System;
using System.Collections.Generic;
using System.Text;

namespace UPC.BE
{
    //[DataContract]
    public class Cita
    {
        //[DataMember(IsRequired = false)]
        public int Id { get; set; }

        public int DepartamentoId { get; set; }
        public int ClienteId { get; set; }

        public string Mensaje { get; set; }
        
        //[DataMember(IsRequired = false)]
        public DateTime FechaCita { get; set; }

        //[DataMember(IsRequired = false)]
        public DateTime CreatedAt { get; set; }

        public string Estado { get; set; }
        
    }
}
