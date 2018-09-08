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
    
    public partial class SPE_OBTIENE_SOLICITUDES_Result
    {
        public int ID_SOLICITUD { get; set; }
        public Nullable<int> ID_CANDIDATO { get; set; }
        public Nullable<int> ID_EMPLEADO { get; set; }
        public Nullable<int> ID_REQUISICION { get; set; }
        public string K_SOLICITUD_CL_SOLICITUD { get; set; }
        public string K_SOLICITUD_CL_ACCESO_EVALUACION { get; set; }
        public string K_SOLICITUD_DS_COMPETENCIAS_ADICIONALES { get; set; }
        public Nullable<System.DateTime> K_SOLICITUD_FE_SOLICITUD { get; set; }
        public string K_SOLICITUD_CL_SOLICITUD_ESTATUS { get; set; }
        public Nullable<System.DateTime> M_FE_MODIFICA { get; set; }
        public string CL_USUARIO_MODIFICA { get; set; }
        public string C_CANDIDATO_NB_CANDIDATO { get; set; }
        public string C_CANDIDATO_NB_APELLIDO_PATERNO { get; set; }
        public string C_CANDIDATO_NB_APELLIDO_MATERNO { get; set; }
        public string C_CANDIDATO_NB_EMPLEADO_COMPLETO { get; set; }
        public string C_CANDIDATO_CL_GENERO { get; set; }
        public string C_CANDIDATO_CL_RFC { get; set; }
        public string C_CANDIDATO_CL_CURP { get; set; }
        public string C_CANDIDATO_CL_ESTADO_CIVIL { get; set; }
        public string C_CANDIDATO_NB_CONYUGUE { get; set; }
        public string C_CANDIDATO_CL_NSS { get; set; }
        public string C_CANDIDATO_CL_TIPO_SANGUINEO { get; set; }
        public string C_CANDIDATO_NB_PAIS { get; set; }
        public string C_CANDIDATO_NB_ESTADO { get; set; }
        public string C_CANDIDATO_NB_MUNICIPIO { get; set; }
        public string C_CANDIDATO_NB_COLONIA { get; set; }
        public string C_CANDIDATO_NB_CALLE { get; set; }
        public string C_CANDIDATO_NO_INTERIOR { get; set; }
        public string C_CANDIDATO_NO_EXTERIOR { get; set; }
        public string C_CANDIDATO_CL_CODIGO_POSTAL { get; set; }
        public string C_CANDIDATO_CL_CORREO_ELECTRONICO { get; set; }
        public Nullable<System.DateTime> C_CANDIDATO_FE_NACIMIENTO { get; set; }
        public string C_CANDIDATO_DS_LUGAR_NACIMIENTO { get; set; }
        public Nullable<decimal> C_CANDIDATO_MN_SUELDO { get; set; }
        public string C_CANDIDATO_CL_NACIONALIDAD { get; set; }
        public string C_CANDIDATO_DS_NACIONALIDAD { get; set; }
        public string C_CANDIDATO_NB_LICENCIA { get; set; }
        public string C_CANDIDATO_DS_VEHICULO { get; set; }
        public string C_CANDIDATO_CL_CARTILLA_MILITAR { get; set; }
        public string C_CANDIDATO_CL_CEDULA_PROFESIONAL { get; set; }
        public string C_CANDIDATO_XML_TELEFONOS { get; set; }
        public string C_CANDIDATO_XML_INGRESOS { get; set; }
        public string C_CANDIDATO_XML_EGRESOS { get; set; }
        public string C_CANDIDATO_XML_PATRIMONIO { get; set; }
        public string C_CANDIDATO_DS_DISPONIBILIDAD { get; set; }
        public string C_CANDIDATO_CL_DISPONIBILIDAD_VIAJE { get; set; }
        public string C_CANDIDATO_XML_PERFIL_RED_SOCIAL { get; set; }
        public string C_CANDIDATO_DS_COMENTARIO { get; set; }
        public Nullable<bool> C_CANDIDATO_FG_ACTIVO { get; set; }
        public string C_CANDIDATO_NB_ACTIVO { get; set; }
        public string M_EMPLEADO_CL_EMPLEADO { get; set; }
        public string M_EMPLEADO_NB_EMPLEADO_COMPLETO { get; set; }
        public string M_EMPLEADO_NB_EMPLEADO { get; set; }
        public string M_EMPLEADO_NB_APELLIDO_PATERNO { get; set; }
        public string M_EMPLEADO_NB_APELLIDO_MATERNO { get; set; }
        public string M_EMPLEADO_CL_ESTADO_EMPLEADO { get; set; }
        public string M_EMPLEADO_CL_GENERO { get; set; }
        public string M_EMPLEADO_CL_ESTADO_CIVIL { get; set; }
        public string M_EMPLEADO_NB_CONYUGUE { get; set; }
        public string M_EMPLEADO_CL_RFC { get; set; }
        public string M_EMPLEADO_CL_CURP { get; set; }
        public string M_EMPLEADO_CL_NSS { get; set; }
        public string M_EMPLEADO_CL_TIPO_SANGUINEO { get; set; }
        public string M_EMPLEADO_CL_NACIONALIDAD { get; set; }
        public string M_EMPLEADO_NB_PAIS { get; set; }
        public string M_EMPLEADO_NB_ESTADO { get; set; }
        public string M_EMPLEADO_NB_MUNICIPIO { get; set; }
        public string M_EMPLEADO_NB_COLONIA { get; set; }
        public string M_EMPLEADO_NB_CALLE { get; set; }
        public string M_EMPLEADO_NO_INTERIOR { get; set; }
        public string M_EMPLEADO_NO_EXTERIOR { get; set; }
        public string M_EMPLEADO_CL_CODIGO_POSTAL { get; set; }
        public string M_EMPLEADO_XML_TELEFONOS { get; set; }
        public string M_EMPLEADO_CL_CORREO_ELECTRONICO { get; set; }
        public Nullable<bool> M_EMPLEADO_FG_ACTIVO { get; set; }
        public string M_EMPLEADO_NB_ACTIVO { get; set; }
        public Nullable<System.DateTime> M_EMPLEADO_FE_NACIMIENTO { get; set; }
        public string M_EMPLEADO_DS_LUGAR_NACIMIENTO { get; set; }
        public Nullable<System.DateTime> M_EMPLEADO_FE_ALTA { get; set; }
        public Nullable<System.DateTime> M_EMPLEADO_FE_BAJA { get; set; }
        public Nullable<decimal> M_EMPLEADO_MN_SUELDO { get; set; }
        public Nullable<decimal> M_EMPLEADO_MN_SUELDO_VARIABLE { get; set; }
        public string M_EMPLEADO_DS_SUELDO_COMPOSICION { get; set; }
        public string M_EMPLEADO_XML_CAMPOS_ADICIONALES { get; set; }
        public Nullable<bool> M_PUESTO_FG_ACTIVO { get; set; }
        public string NB_ACTIVO { get; set; }
        public Nullable<System.DateTime> M_PUESTO_FE_INACTIVO { get; set; }
        public string M_PUESTO_CL_PUESTO { get; set; }
        public string M_PUESTO_NB_PUESTO { get; set; }
        public Nullable<int> ID_DEPARTAMENTO { get; set; }
        public string M_PUESTO_XML_CAMPOS_ADICIONALES { get; set; }
        public Nullable<int> ID_BITACORA { get; set; }
        public Nullable<byte> M_PUESTO_NO_EDAD_MINIMA { get; set; }
        public Nullable<byte> M_PUESTO_NO_EDAD_MAXIMA { get; set; }
        public string M_PUESTO_CL_GENERO { get; set; }
        public string M_PUESTO_CL_ESTADO_CIVIL { get; set; }
        public string M_PUESTO_XML_REQUERIMIENTOS { get; set; }
        public string M_PUESTO_XML_OBSERVACIONES { get; set; }
        public string M_PUESTO_XML_RESPONSABILIDAD { get; set; }
        public string M_PUESTO_XML_AUTORIDAD { get; set; }
        public string M_PUESTO_XML_CURSOS_ADICIONALES { get; set; }
        public string M_PUESTO_XML_MENTOR { get; set; }
        public string M_PUESTO_CL_TIPO_PUESTO { get; set; }
        public Nullable<System.Guid> ID_CENTRO_ADMINISTRATIVO { get; set; }
        public Nullable<System.Guid> ID_CENTRO_OPERATIVO { get; set; }
        public Nullable<int> ID_PAQUETE_PRESTACIONES { get; set; }
        public string M_DEPARTAMENTO_NO_REQUISICION { get; set; }
        public Nullable<System.DateTime> M_DEPARTAMENTO_FE_SOLICITUD { get; set; }
        public string M_DEPARTAMENTO_CL_ESTADO { get; set; }
        public string M_DEPARTAMENTO_CL_CAUSA { get; set; }
        public string M_DEPARTAMENTO_DS_CAUSA { get; set; }
        public Nullable<int> ID_SOLICITANTE { get; set; }
        public Nullable<int> ID_AUTORIZA { get; set; }
        public Nullable<int> ID_EMPRESA_REQUISICION { get; set; }
        public string C_EMPRESA_CL_EMPRESA { get; set; }
        public string C_EMPRESA_NB_EMPRESA { get; set; }
        public string C_EMPRESA_NB_RAZON_SOCIAL { get; set; }
        public Nullable<bool> M_DEPARTAMENTO_FG_ACTIVO { get; set; }
        public string M_DEPARTAMENTO_NB_ACTIVO { get; set; }
        public Nullable<System.DateTime> M_DEPARTAMENTO_FE_INACTIVO { get; set; }
        public string M_DEPARTAMENTO_CL_DEPARTAMENTO { get; set; }
        public string M_DEPARTAMENTO_NB_DEPARTAMENTO { get; set; }
        public string M_DEPARTAMENTO_XML_CAMPOS_ADICIONALES { get; set; }
        public Nullable<int> ID_BATERIA { get; set; }
        public Nullable<System.Guid> CL_TOKEN { get; set; }
        public Nullable<int> ID_EMPRESA { get; set; }
        public string CL_EMPRESA { get; set; }
        public string NB_EMPRESA { get; set; }
    }
}
