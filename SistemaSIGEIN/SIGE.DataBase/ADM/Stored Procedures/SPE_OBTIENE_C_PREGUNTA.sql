﻿-- =============================================
-- Proyecto: Sistema SIGEIN 5.0
-- Copyright (c) - Acrux - 2015
-- Author: Margarita Salcedo
-- CREATE date: 21/09/2015
-- Description: Obtiene los datos de la tabla C_PREGUNTA 
-- =============================================
CREATE PROCEDURE ADM.SPE_OBTIENE_C_PREGUNTA 
	@PIN_ID_PREGUNTA AS int = NULL
	, @PIN_CL_PREGUNTA AS nvarchar(32) = NULL
	, @PIN_NB_PREGUNTA AS nvarchar(100) = NULL
	, @PIN_DS_PREGUNTA AS nvarchar(200) = NULL
	, @PIN_CL_TIPO_PREGUNTA AS nvarchar(10) = NULL
	, @PIN_NO_VALOR AS decimal(8,3) = NULL
	, @PIN_FG_REQUERIDO AS bit = NULL
	, @PIN_FG_ACTIVO AS bit = NULL
	, @PIN_ID_COMPETENCIA AS int = NULL
	, @PIN_ID_BITACORA AS int = NULL
	
AS   
	--SE DEVUELVE LOS REGISTROS EN BASE A LOS PARAMETROS INSERTADOS
	SELECT 
		[ID_PREGUNTA]
		, [CL_PREGUNTA]
		, [NB_PREGUNTA]
		, [DS_PREGUNTA]
		, [CL_TIPO_PREGUNTA]
		, [NO_VALOR]
		, [FG_REQUERIDO]
		, [FG_ACTIVO]
		, [ID_COMPETENCIA]
		, [ID_BITACORA]
		,'' as DS_FILTRO
	FROM ADM.C_PREGUNTA
	WHERE (@PIN_ID_PREGUNTA IS NULL OR (@PIN_ID_PREGUNTA IS NOT NULL AND [ID_PREGUNTA] = @PIN_ID_PREGUNTA))
			 AND (@PIN_CL_PREGUNTA IS NULL OR (@PIN_CL_PREGUNTA IS NOT NULL AND [CL_PREGUNTA] = @PIN_CL_PREGUNTA))
			 AND (@PIN_NB_PREGUNTA IS NULL OR (@PIN_NB_PREGUNTA IS NOT NULL AND [NB_PREGUNTA] = @PIN_NB_PREGUNTA))
			 AND (@PIN_DS_PREGUNTA IS NULL OR (@PIN_DS_PREGUNTA IS NOT NULL AND [DS_PREGUNTA] = @PIN_DS_PREGUNTA))
			 AND (@PIN_CL_TIPO_PREGUNTA IS NULL OR (@PIN_CL_TIPO_PREGUNTA IS NOT NULL AND [CL_TIPO_PREGUNTA] = @PIN_CL_TIPO_PREGUNTA))
			 AND (@PIN_NO_VALOR IS NULL OR (@PIN_NO_VALOR IS NOT NULL AND [NO_VALOR] = @PIN_NO_VALOR))
			 AND (@PIN_FG_REQUERIDO IS NULL OR (@PIN_FG_REQUERIDO IS NOT NULL AND [FG_REQUERIDO] = @PIN_FG_REQUERIDO))
			 AND (@PIN_FG_ACTIVO IS NULL OR (@PIN_FG_ACTIVO IS NOT NULL AND [FG_ACTIVO] = @PIN_FG_ACTIVO))
			 AND (@PIN_ID_COMPETENCIA IS NULL OR (@PIN_ID_COMPETENCIA IS NOT NULL AND [ID_COMPETENCIA] = @PIN_ID_COMPETENCIA))
			 AND (@PIN_ID_BITACORA IS NULL OR (@PIN_ID_BITACORA IS NOT NULL AND [ID_BITACORA] = @PIN_ID_BITACORA))
			
