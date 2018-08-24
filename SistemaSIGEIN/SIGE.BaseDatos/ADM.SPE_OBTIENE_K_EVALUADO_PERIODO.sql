-- =============================================
-- Proyecto: Sistema SIGEIN 5.0
-- Copyright (c) - Acrux - 2015
-- Author: Margarita Salcedo
-- CREATE date: 21/09/2015
-- Description: Obtiene los datos de la tabla K_EVALUADO_PERIODO 
-- =============================================
ALTER PROCEDURE ADM.SPE_OBTIENE_K_EVALUADO_PERIODO 
	  @PIN_ID_EVALUADOR_PERIODO AS int = NULL
	, @PIN_ID_PERIODO AS int = NULL
	, @PIN_ID_EMPLEADO AS int = NULL
	, @PIN_ID_PUESTO AS int = NULL
	, @PIN_FG_PUESTO_ACTUAL AS int = NULL
	, @PIN_NO_CONSUMO_SUP AS int = NULL
	, @PIN_MN_CUOTA_BASE AS decimal(13,2) = NULL
	, @PIN_MN_CUOTA_CONSUMO AS decimal(13,2) = NULL
	, @PIN_MN_CUOTA_ADICIONAL AS decimal(13,2) = NULL
	
AS   
	--SE DEVUELVE LOS REGISTROS EN BASE A LOS PARAMETROS INSERTADOS
	SELECT 
		[ID_EVALUADOR_PERIODO]
		, [ID_PERIODO]
		, [ID_EMPLEADO]
		, [ID_PUESTO]
		, [FG_PUESTO_ACTUAL]
		, [NO_CONSUMO_SUP]
		, [MN_CUOTA_BASE]
		, [MN_CUOTA_CONSUMO]
		, [MN_CUOTA_ADICIONAL]
		,'' as DS_FILTRO
		
	FROM ADM.K_EVALUADO_PERIODO
	WHERE (@PIN_ID_EVALUADOR_PERIODO IS NULL OR (@PIN_ID_EVALUADOR_PERIODO IS NOT NULL AND [ID_EVALUADOR_PERIODO] = @PIN_ID_EVALUADOR_PERIODO))
			 AND (@PIN_ID_PERIODO IS NULL OR (@PIN_ID_PERIODO IS NOT NULL AND [ID_PERIODO] = @PIN_ID_PERIODO))
			 AND (@PIN_ID_EMPLEADO IS NULL OR (@PIN_ID_EMPLEADO IS NOT NULL AND [ID_EMPLEADO] = @PIN_ID_EMPLEADO))
			 AND (@PIN_ID_PUESTO IS NULL OR (@PIN_ID_PUESTO IS NOT NULL AND [ID_PUESTO] = @PIN_ID_PUESTO))
			 AND (@PIN_FG_PUESTO_ACTUAL IS NULL OR (@PIN_FG_PUESTO_ACTUAL IS NOT NULL AND [FG_PUESTO_ACTUAL] = @PIN_FG_PUESTO_ACTUAL))
			 AND (@PIN_NO_CONSUMO_SUP IS NULL OR (@PIN_NO_CONSUMO_SUP IS NOT NULL AND [NO_CONSUMO_SUP] = @PIN_NO_CONSUMO_SUP))
			 AND (@PIN_MN_CUOTA_BASE IS NULL OR (@PIN_MN_CUOTA_BASE IS NOT NULL AND [MN_CUOTA_BASE] = @PIN_MN_CUOTA_BASE))
			 AND (@PIN_MN_CUOTA_CONSUMO IS NULL OR (@PIN_MN_CUOTA_CONSUMO IS NOT NULL AND [MN_CUOTA_CONSUMO] = @PIN_MN_CUOTA_CONSUMO))
			 AND (@PIN_MN_CUOTA_ADICIONAL IS NULL OR (@PIN_MN_CUOTA_ADICIONAL IS NOT NULL AND [MN_CUOTA_ADICIONAL] = @PIN_MN_CUOTA_ADICIONAL))
			
GO