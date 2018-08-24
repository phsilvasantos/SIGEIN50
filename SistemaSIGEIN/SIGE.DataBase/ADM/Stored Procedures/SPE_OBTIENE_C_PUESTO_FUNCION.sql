﻿-- =============================================
-- Proyecto: Sistema SIGEIN 5.0
-- Copyright (c) - Acrux - 2015
-- Author: Abraham Ramirez
-- CREATE date: 21/09/2015
-- Description: Obtiene los datos de la tabla C_PUESTO_FUNCION 
-- =============================================
CREATE PROCEDURE ADM.SPE_OBTIENE_C_PUESTO_FUNCION 
	@PIN_ID_PUESTO_FUNCION AS int = NULL
	, @PIN_CL_PUESTO_FUNCION AS nvarchar(20) = NULL
	, @PIN_NB_PUESTO_FUNCION AS nvarchar(100) = NULL
	, @PIN_DS_PUESTO_FUNCION AS nvarchar(500) = NULL
	, @PIN_ID_PUESTO AS int = NULL
	
AS   
	--SE DEVUELVE LOS REGISTROS EN BASE A LOS PARAMETROS INSERTADOS
	SELECT 
		[ID_PUESTO_FUNCION]
		, [CL_PUESTO_FUNCION]
		, [NB_PUESTO_FUNCION]
		, [DS_PUESTO_FUNCION]
		, [ID_PUESTO]
		,'' as DS_FILTRO
	FROM ADM.C_PUESTO_FUNCION
	WHERE (@PIN_ID_PUESTO_FUNCION IS NULL OR (@PIN_ID_PUESTO_FUNCION IS NOT NULL AND [ID_PUESTO_FUNCION] = @PIN_ID_PUESTO_FUNCION))
			 AND (@PIN_CL_PUESTO_FUNCION IS NULL OR (@PIN_CL_PUESTO_FUNCION IS NOT NULL AND [CL_PUESTO_FUNCION] = @PIN_CL_PUESTO_FUNCION))
			 AND (@PIN_NB_PUESTO_FUNCION IS NULL OR (@PIN_NB_PUESTO_FUNCION IS NOT NULL AND [NB_PUESTO_FUNCION] = @PIN_NB_PUESTO_FUNCION))
			 AND (@PIN_DS_PUESTO_FUNCION IS NULL OR (@PIN_DS_PUESTO_FUNCION IS NOT NULL AND [DS_PUESTO_FUNCION] = @PIN_DS_PUESTO_FUNCION))
			 AND (@PIN_ID_PUESTO IS NULL OR (@PIN_ID_PUESTO IS NOT NULL AND [ID_PUESTO] = @PIN_ID_PUESTO))
			
