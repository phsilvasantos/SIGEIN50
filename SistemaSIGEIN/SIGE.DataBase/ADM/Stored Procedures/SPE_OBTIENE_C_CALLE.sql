﻿-- =============================================
-- Proyecto: Sigein 5.0
-- Copyright (c) - Acrux - 2015
-- Author: Margarita Salcedo
-- CREATE date: 14/09/2015
-- Description: Obtiene los C_CALLE 
-- =============================================
CREATE PROCEDURE ADM.SPE_OBTIENE_C_CALLE 
	        @PIN_ID_CALLE AS int = NULL,
        @PIN_CL_PAIS AS nvarchar(10) = NULL,
        @PIN_CL_ESTADO AS nvarchar(10) = NULL,
        @PIN_CL_MUNICIPIO AS nvarchar(10) = NULL,
        @PIN_CL_COLONIA AS nvarchar(10) = NULL,
        @PIN_CL_CALLE AS nvarchar(10) = NULL,
        @PIN_NB_CALLE AS nvarchar(100) = NULL

AS   
	SELECT 
			[ID_CALLE],
		[CL_PAIS],
		[CL_ESTADO],
		[CL_MUNICIPIO],
		[CL_COLONIA],
		[CL_CALLE],
		[NB_CALLE]
		,'' as DS_FILTRO
	FROM ADM.C_CALLE
	WHERE (@PIN_ID_CALLE IS NULL OR (@PIN_ID_CALLE IS NOT NULL AND [ID_CALLE] = @PIN_ID_CALLE)) AND 
		(@PIN_CL_PAIS IS NULL OR (@PIN_CL_PAIS IS NOT NULL AND [CL_PAIS] = @PIN_CL_PAIS)) AND 
		(@PIN_CL_ESTADO IS NULL OR (@PIN_CL_ESTADO IS NOT NULL AND [CL_ESTADO] = @PIN_CL_ESTADO)) AND 
		(@PIN_CL_MUNICIPIO IS NULL OR (@PIN_CL_MUNICIPIO IS NOT NULL AND [CL_MUNICIPIO] = @PIN_CL_MUNICIPIO)) AND 
		(@PIN_CL_COLONIA IS NULL OR (@PIN_CL_COLONIA IS NOT NULL AND [CL_COLONIA] = @PIN_CL_COLONIA)) AND 
		(@PIN_CL_CALLE IS NULL OR (@PIN_CL_CALLE IS NOT NULL AND [CL_CALLE] = @PIN_CL_CALLE)) AND 
		(@PIN_NB_CALLE IS NULL OR (@PIN_NB_CALLE IS NOT NULL AND [NB_CALLE] = @PIN_NB_CALLE)) 

