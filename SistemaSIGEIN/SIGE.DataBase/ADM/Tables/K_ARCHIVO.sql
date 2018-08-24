﻿CREATE TABLE [ADM].[K_ARCHIVO] (
    [ID_ARCHIVO]              UNIQUEIDENTIFIER NOT NULL,
    [NB_ARCHIVO]              NVARCHAR (512)   NOT NULL,
    [FI_ARCHIVO]              VARBINARY (MAX)  NOT NULL,
    [FE_CREACION]             DATETIME         NOT NULL,
    [FE_MODIFICACION]         DATETIME         NULL,
    [CL_USUARIO_APP_CREA]     NVARCHAR (50)    NOT NULL,
    [CL_USUARIO_APP_MODIFICA] NVARCHAR (50)    NULL,
    [NB_PROGRAMA_CREA]        NVARCHAR (50)    NOT NULL,
    [NB_PROGRAMA_MODIFICA]    NVARCHAR (50)    NULL,
    CONSTRAINT [PK_K_ARCHIVO] PRIMARY KEY CLUSTERED ([ID_ARCHIVO] ASC)
);

