﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace ApiSOAP
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "INotificacionService" in both code and config file together.
    [ServiceContract]
    public interface INotificacionService
    {
        [OperationContract]
        void EnviarEmail(string email, string mensaje);
    }
}
