﻿CREATE TABLE [ADM].[C_CANDIDATO] (
    [ID_CANDIDATO]                INT             IDENTITY (1, 1) NOT NULL,
    [NB_CANDIDATO]                NVARCHAR (100)  NULL,
    [NB_APELLIDO_PATERNO]         NVARCHAR (100)  NULL,
    [NB_APELLIDO_MATERNO]         NVARCHAR (100)  NULL,
    [CL_GENERO]                   NVARCHAR (1)    NULL,
    [CL_RFC]                      NVARCHAR (20)   NULL,
    [CL_CURP]                     NVARCHAR (20)   NULL,
    [CL_ESTADO_CIVIL]             NVARCHAR (20)   NULL,
    [NB_CONYUGUE]                 NVARCHAR (100)  NULL,
    [CL_NSS]                      NVARCHAR (20)   NULL,
    [CL_TIPO_SANGUINEO]           NVARCHAR (10)   NULL,
    [CL_PAIS]                     NVARCHAR (10)   NULL,
    [NB_PAIS]                     NVARCHAR (100)  NULL,
    [CL_ESTADO]                   NVARCHAR (10)   NULL,
    [NB_ESTADO]                   NVARCHAR (100)  NULL,
    [CL_MUNICIPIO]                NVARCHAR (10)   NULL,
    [NB_MUNICIPIO]                NVARCHAR (100)  NULL,
    [CL_COLONIA]                  NVARCHAR (30)   NULL,
    [NB_COLONIA]                  NVARCHAR (100)  NULL,
    [NB_CALLE]                    NVARCHAR (100)  NULL,
    [NO_INTERIOR]                 NVARCHAR (20)   NULL,
    [NO_EXTERIOR]                 NVARCHAR (20)   NULL,
    [CL_CODIGO_POSTAL]            NVARCHAR (10)   NULL,
    [CL_CORREO_ELECTRONICO]       NVARCHAR (200)  NULL,
    [FE_NACIMIENTO]               DATE            NULL,
    [DS_LUGAR_NACIMIENTO]         NVARCHAR (200)  NULL,
    [MN_SUELDO]                   DECIMAL (13, 2) CONSTRAINT [DF_C_CANDIDATO_MN_SUELDO] DEFAULT ((0)) NULL,
    [CL_NACIONALIDAD]             NVARCHAR (30)   NULL,
    [DS_NACIONALIDAD]             NVARCHAR (30)   NULL,
    [NB_LICENCIA]                 NVARCHAR (30)   NULL,
    [DS_VEHICULO]                 NVARCHAR (100)  NULL,
    [CL_CARTILLA_MILITAR]         NVARCHAR (30)   NULL,
    [CL_CEDULA_PROFESIONAL]       NVARCHAR (30)   NULL,
    [XML_TELEFONOS]               XML             NULL,
    [XML_INGRESOS]                XML             NULL,
    [XML_EGRESOS]                 XML             NULL,
    [XML_PATRIMONIO]              XML             NULL,
    [DS_DISPONIBILIDAD]           NVARCHAR (100)  NULL,
    [CL_DISPONIBILIDAD_VIAJE]     NVARCHAR (10)   NULL,
    [XML_PERFIL_RED_SOCIAL]       XML             NULL,
    [DS_COMENTARIO]               NVARCHAR (1000) NULL,
    [DS_COMPETENCIAS_ADICIONALES] NVARCHAR (1000) NULL,
    [FG_ACTIVO]                   BIT             NOT NULL,
    [FE_CREACION]                 DATETIME        NOT NULL,
    [FE_MODIFICACION]             DATETIME        NULL,
    [CL_USUARIO_APP_CREA]         NVARCHAR (50)   NOT NULL,
    [CL_USUARIO_APP_MODIFICA]     NVARCHAR (50)   NULL,
    [NB_PROGRAMA_CREA]            NVARCHAR (50)   NOT NULL,
    [NB_PROGRAMA_MODIFICA]        NVARCHAR (50)   NULL,
    CONSTRAINT [pk_Candidato] PRIMARY KEY CLUSTERED ([ID_CANDIDATO] ASC)
);

