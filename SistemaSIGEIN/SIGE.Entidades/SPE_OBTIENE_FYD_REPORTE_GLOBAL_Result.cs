//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SIGE.Entidades
{
    using System;
    
    public partial class SPE_OBTIENE_FYD_REPORTE_GLOBAL_Result
    {
        public int ID_EMPLEADO { get; set; }
        public int ID_EVALUADO { get; set; }
        public string CL_EVALUADO { get; set; }
        public string NB_EVALUADO { get; set; }
        public int ID_PUESTO { get; set; }
        public int ID_PUESTO_PERIODO { get; set; }
        public string NB_PUESTO { get; set; }
        public string CL_PUESTO { get; set; }
        public decimal PR_CUMPLIMIENTO { get; set; }
        public string CL_COLOR_CUMPLIMIENTO { get; set; }
        public byte[] FI_FOTOGRAFIA { get; set; }
        public Nullable<int> NUM_PERIODOS { get; set; }
    }
}
