﻿
-- =============================================
-- Proyecto: Sistema SIGEIN 5.0
-- Copyright (c) - Acrux - 2015
-- Author: Juan De Dios Pérez Pedroza
-- CREATE date: 21/09/2015
-- Description: Obtiene los datos de la tabla C_CUESTIONARIO 
-- =============================================
CREATE PROCEDURE [IDP].[SPE_OBTIENE_C_CUESTIONARIO] 
	  @PIN_ID_CUESTIONARIO AS int = NULL
	, @PIN_CL_CUESTIONARIO AS nvarchar(10) = NULL
	, @PIN_NB_CUESTIONARIO AS nvarchar(100) = NULL

AS   
	--SE DEVUELVE LOS REGISTROS EN BASE A LOS PARAMETROS INSERTADOS
	SELECT 
		[ID_CUESTIONARIO]
		, [CL_CUESTIONARIO]
		, [NB_CUESTIONARIO]
	FROM IDP.C_CUESTIONARIO
	WHERE (@PIN_ID_CUESTIONARIO IS NULL OR (@PIN_ID_CUESTIONARIO IS NOT NULL AND [ID_CUESTIONARIO] = @PIN_ID_CUESTIONARIO))
			 AND (@PIN_CL_CUESTIONARIO IS NULL OR (@PIN_CL_CUESTIONARIO IS NOT NULL AND [CL_CUESTIONARIO] = @PIN_CL_CUESTIONARIO))
			 AND (@PIN_NB_CUESTIONARIO IS NULL OR (@PIN_NB_CUESTIONARIO IS NOT NULL AND [NB_CUESTIONARIO] = @PIN_NB_CUESTIONARIO))
			
