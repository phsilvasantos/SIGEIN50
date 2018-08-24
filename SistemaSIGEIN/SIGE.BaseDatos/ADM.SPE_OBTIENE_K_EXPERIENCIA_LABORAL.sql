USE [SistemaSigein]
GO
/****** Object:  StoredProcedure [ADM].[SPE_OBTIENE_K_EXPERIENCIA_LABORAL]    Script Date: 14/11/2015 01:31:17 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Proyecto: Sistema SIGEIN 5.0
-- Copyright (c) - Acrux - 2015
-- Author: Margarita Salcedo
-- CREATE date: 13/11/2015
-- Description: Obtiene los datos de la tabla K_EXPERIENCIA_LABORAL 
-- =============================================
ALTER PROCEDURE [ADM].[SPE_OBTIENE_K_EXPERIENCIA_LABORAL] 
	@PIN_ID_EXPERIENCIA_LABORAL AS int = NULL
	, @PIN_ID_CANDIDATO AS int = NULL
	, @PIN_ID_EMPLEADO AS int = NULL
	, @PIN_NB_EMPRESA AS nvarchar(100) = NULL
	, @PIN_DS_DOMICILIO AS nvarchar(500) = NULL
	, @PIN_NB_GIRO AS nvarchar(50) = NULL
	, @PIN_FE_INICIO AS date = NULL
	, @PIN_FE_FIN AS date = NULL
	, @PIN_NB_PUESTO AS nvarchar(100) = NULL
	, @PIN_NB_FUNCION AS nvarchar(100) = NULL
	, @PIN_DS_FUNCIONES AS nvarchar(1000) = NULL
	, @PIN_MN_PRIMER_SUELDO AS decimal(13,2) = NULL
	, @PIN_MN_ULTIMO_SUELDO AS decimal(13,2) = NULL
	, @PIN_CL_TIPO_CONTRATO AS nvarchar(20) = NULL
	, @PIN_CL_TIPO_CONTRATO_OTRO AS nvarchar(50) = NULL
	, @PIN_NO_TELEFONO_CONTACTO AS nvarchar(20) = NULL
	, @PIN_CL_CORREO_ELECTRONICO AS nvarchar(200) = NULL
	, @PIN_NB_CONTACTO AS nvarchar(100) = NULL
	, @PIN_NB_PUESTO_CONTACTO AS nvarchar(100) = NULL
	, @PIN_CL_INFORMACION_CONFIRMADA AS bit = NULL
	, @PIN_DS_COMENTARIOS AS nvarchar(1000) = NULL
	
AS   
	--SE DEVUELVE LOS REGISTROS EN BASE A LOS PARAMETROS INSERTADOS
	SELECT 
		[ID_EXPERIENCIA_LABORAL]
		, [ID_CANDIDATO]
		, [ID_EMPLEADO]
		, [NB_EMPRESA]
		, [DS_DOMICILIO]
		, [NB_GIRO]
		, [FE_INICIO]
		, [FE_FIN]
		, [NB_PUESTO]
		, [NB_FUNCION]
		, [DS_FUNCIONES]
		, [MN_PRIMER_SUELDO]
		, [MN_ULTIMO_SUELDO]
		, [CL_TIPO_CONTRATO]
		, [CL_TIPO_CONTRATO_OTRO]
		, [NO_TELEFONO_CONTACTO]
		, [CL_CORREO_ELECTRONICO]
		, [NB_CONTACTO]
		, [NB_PUESTO_CONTACTO]
		, [CL_INFORMACION_CONFIRMADA]
		, [DS_COMENTARIOS]
		
		,'' as DS_FILTRO
	FROM ADM.K_EXPERIENCIA_LABORAL
	WHERE (@PIN_ID_EXPERIENCIA_LABORAL IS NULL OR (@PIN_ID_EXPERIENCIA_LABORAL IS NOT NULL AND [ID_EXPERIENCIA_LABORAL] = @PIN_ID_EXPERIENCIA_LABORAL))
			 AND (@PIN_ID_CANDIDATO IS NULL OR (@PIN_ID_CANDIDATO IS NOT NULL AND [ID_CANDIDATO] = @PIN_ID_CANDIDATO))
			 AND (@PIN_ID_EMPLEADO IS NULL OR (@PIN_ID_EMPLEADO IS NOT NULL AND [ID_EMPLEADO] = @PIN_ID_EMPLEADO))
			 AND (@PIN_NB_EMPRESA IS NULL OR (@PIN_NB_EMPRESA IS NOT NULL AND [NB_EMPRESA] = @PIN_NB_EMPRESA))
			 AND (@PIN_DS_DOMICILIO IS NULL OR (@PIN_DS_DOMICILIO IS NOT NULL AND [DS_DOMICILIO] = @PIN_DS_DOMICILIO))
			 AND (@PIN_NB_GIRO IS NULL OR (@PIN_NB_GIRO IS NOT NULL AND [NB_GIRO] = @PIN_NB_GIRO))
			 AND (@PIN_FE_INICIO IS NULL OR (@PIN_FE_INICIO IS NOT NULL AND [FE_INICIO] = @PIN_FE_INICIO))
			 AND (@PIN_FE_FIN IS NULL OR (@PIN_FE_FIN IS NOT NULL AND [FE_FIN] = @PIN_FE_FIN))
			 AND (@PIN_NB_PUESTO IS NULL OR (@PIN_NB_PUESTO IS NOT NULL AND [NB_PUESTO] = @PIN_NB_PUESTO))
			 AND (@PIN_NB_FUNCION IS NULL OR (@PIN_NB_FUNCION IS NOT NULL AND [NB_FUNCION] = @PIN_NB_FUNCION))
			 AND (@PIN_DS_FUNCIONES IS NULL OR (@PIN_DS_FUNCIONES IS NOT NULL AND [DS_FUNCIONES] = @PIN_DS_FUNCIONES))
			 AND (@PIN_MN_PRIMER_SUELDO IS NULL OR (@PIN_MN_PRIMER_SUELDO IS NOT NULL AND [MN_PRIMER_SUELDO] = @PIN_MN_PRIMER_SUELDO))
			 AND (@PIN_MN_ULTIMO_SUELDO IS NULL OR (@PIN_MN_ULTIMO_SUELDO IS NOT NULL AND [MN_ULTIMO_SUELDO] = @PIN_MN_ULTIMO_SUELDO))
			 AND (@PIN_CL_TIPO_CONTRATO IS NULL OR (@PIN_CL_TIPO_CONTRATO IS NOT NULL AND [CL_TIPO_CONTRATO] = @PIN_CL_TIPO_CONTRATO))
			 AND (@PIN_CL_TIPO_CONTRATO_OTRO IS NULL OR (@PIN_CL_TIPO_CONTRATO_OTRO IS NOT NULL AND [CL_TIPO_CONTRATO_OTRO] = @PIN_CL_TIPO_CONTRATO_OTRO))
			 AND (@PIN_NO_TELEFONO_CONTACTO IS NULL OR (@PIN_NO_TELEFONO_CONTACTO IS NOT NULL AND [NO_TELEFONO_CONTACTO] = @PIN_NO_TELEFONO_CONTACTO))
			 AND (@PIN_CL_CORREO_ELECTRONICO IS NULL OR (@PIN_CL_CORREO_ELECTRONICO IS NOT NULL AND [CL_CORREO_ELECTRONICO] = @PIN_CL_CORREO_ELECTRONICO))
			 AND (@PIN_NB_CONTACTO IS NULL OR (@PIN_NB_CONTACTO IS NOT NULL AND [NB_CONTACTO] = @PIN_NB_CONTACTO))
			 AND (@PIN_NB_PUESTO_CONTACTO IS NULL OR (@PIN_NB_PUESTO_CONTACTO IS NOT NULL AND [NB_PUESTO_CONTACTO] = @PIN_NB_PUESTO_CONTACTO))
			 AND (@PIN_CL_INFORMACION_CONFIRMADA IS NULL OR (@PIN_CL_INFORMACION_CONFIRMADA IS NOT NULL AND [CL_INFORMACION_CONFIRMADA] = @PIN_CL_INFORMACION_CONFIRMADA))
			 AND (@PIN_DS_COMENTARIOS IS NULL OR (@PIN_DS_COMENTARIOS IS NOT NULL AND [DS_COMENTARIOS] = @PIN_DS_COMENTARIOS))
			
