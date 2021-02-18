using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UPC.BE
{
    public class SolicitudCitaProcesada
    {
        public int DepartamentoId { get; set; }

        public int ClienteId { get; set; }

        //[DataMember(IsRequired = false)]
        public DateTime CreatedAt { get; set; }

        
    }
}
