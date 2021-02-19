using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace ApiSOAP
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "NotificacionService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select NotificacionService.svc or NotificacionService.svc.cs at the Solution Explorer and start debugging.
    public class NotificacionService : INotificacionService
    {
        public void EnviarEmail(string email, string mensaje)
        {
        }
    }
}
