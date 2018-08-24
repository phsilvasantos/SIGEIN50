﻿-- =============================================
-- Proyecto: Sistema SIGEIN 5.0
-- Copyright (c) - Acrux - 2015
-- Author: Margarita Salcedo
-- CREATE date: 27/10/2015
-- Description: Obtiene los datos de la tabla C_CATALOGO_LISTA 
-- =============================================
CREATE PROCEDURE [ADM].[SPE_OBTIENE_C_CATALOGO_LISTA] 
	@PIN_ID_CATALOGO_LISTA AS int = NULL
	, @PIN_NB_CATALOGO_LISTA AS nvarchar(100) = NULL
	, @PIN_DS_CATALOGO_LISTA AS nvarchar(1000) = NULL
	, @PIN_ID_CATALOGO_TIPO AS int = NULL
	
AS   
	--SE DEVUELVE LOS REGISTROS EN BASE A LOS PARAMETROS INSERTADOS
	SELECT 
		[ID_CATALOGO_LISTA]
		, [NB_CATALOGO_LISTA]
		, [DS_CATALOGO_LISTA]
		, CC.ID_CATALOGO_TIPO
		, CT.NB_CATALOGO_TIPO
		, [FG_SISTEMA]
	FROM ADM.C_CATALOGO_LISTA CC
	JOIN ADM.S_CATALOGO_TIPO CT ON CC.ID_CATALOGO_TIPO = CT.ID_CATALOGO_TIPO
	WHERE (@PIN_ID_CATALOGO_LISTA IS NULL OR (@PIN_ID_CATALOGO_LISTA IS NOT NULL AND [ID_CATALOGO_LISTA] = @PIN_ID_CATALOGO_LISTA))
			 AND (@PIN_NB_CATALOGO_LISTA IS NULL OR (@PIN_NB_CATALOGO_LISTA IS NOT NULL AND [NB_CATALOGO_LISTA] = @PIN_NB_CATALOGO_LISTA))
			 AND (@PIN_DS_CATALOGO_LISTA IS NULL OR (@PIN_DS_CATALOGO_LISTA IS NOT NULL AND [DS_CATALOGO_LISTA] = @PIN_DS_CATALOGO_LISTA))
			 AND (@PIN_ID_CATALOGO_TIPO IS NULL OR (@PIN_ID_CATALOGO_TIPO IS NOT NULL AND CC.ID_CATALOGO_TIPO = @PIN_ID_CATALOGO_TIPO))
			
