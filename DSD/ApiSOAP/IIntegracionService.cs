using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using UPC.BE;

namespace ApiSOAP
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IIntegracionService" in both code and config file together.
    [ServiceContract]
    public interface IIntegracionService
    {
        [OperationContract]
        bool ReniectExisteDNI(string dni);

        [OperationContract]
        InfocorpData InfocorpHistorial(string dni);
    }
}
