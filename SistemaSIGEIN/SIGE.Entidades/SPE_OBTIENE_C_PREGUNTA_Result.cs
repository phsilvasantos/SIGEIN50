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
    
    public partial class SPE_OBTIENE_C_PREGUNTA_Result
    {
        public int ID_PREGUNTA { get; set; }
        public string CL_PREGUNTA { get; set; }
        public string NB_PREGUNTA { get; set; }
        public string DS_PREGUNTA { get; set; }
        public string CL_TIPO_PREGUNTA { get; set; }
        public decimal NO_VALOR { get; set; }
        public bool FG_REQUERIDO { get; set; }
        public bool FG_ACTIVO { get; set; }
        public Nullable<int> ID_COMPETENCIA { get; set; }
        public Nullable<int> ID_BITACORA { get; set; }
        public string DS_FILTRO { get; set; }
    }
}
