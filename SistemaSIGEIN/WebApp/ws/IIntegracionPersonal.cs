﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WebApp.ws
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IIntegracionPersonal" in both code and config file together.
    [ServiceContract]
    public interface IIntegracionPersonal
    {
        //Borrar DoWork
        [OperationContract]
        void DoWork();
    }
}
