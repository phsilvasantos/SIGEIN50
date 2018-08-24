﻿CREATE TABLE [ADM].[C_AREA_INTERES] (
    [CL_AREA_INTERES]         NVARCHAR (20)  NOT NULL,
    [NB_AREA_INTERES]         NVARCHAR (200) NULL,
    [FG_ACTIVO]               BIT            NULL,
    [FE_CREACION]             DATETIME       NOT NULL,
    [FE_MODIFICACION]         DATETIME       NULL,
    [CL_USUARIO_APP_CREA]     NVARCHAR (50)  NOT NULL,
    [CL_USUARIO_APP_MODIFICA] NVARCHAR (50)  NULL,
    [NB_PROGRAMA_CREA]        NVARCHAR (50)  NOT NULL,
    [NB_PROGRAMA_MODIFICA]    NVARCHAR (50)  NULL,
    [ID_AREA_INTERES]         INT            IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_C_AREA_INTERES] PRIMARY KEY CLUSTERED ([ID_AREA_INTERES] ASC),
    CONSTRAINT [uc_CL_AREA_INTERES] UNIQUE NONCLUSTERED ([CL_AREA_INTERES] ASC),
    CONSTRAINT [uc_NB_AREA_INTERES] UNIQUE NONCLUSTERED ([NB_AREA_INTERES] ASC)
);

