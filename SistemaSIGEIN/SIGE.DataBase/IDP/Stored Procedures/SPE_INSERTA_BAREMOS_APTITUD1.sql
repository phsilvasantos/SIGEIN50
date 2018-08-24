﻿-- =============================================
-- Proyecto: Sistema SIGEIN 5.0
-- Copyright (c) - Acrux - 2015
-- Author: Gabriel Vázquez
-- CREATE date: 10/02/2016
-- Description: inserción de variables de baremos de prueba APTITUD MENTAL 1
-- =============================================
CREATE PROCEDURE [IDP].[SPE_INSERTA_BAREMOS_APTITUD1]
	 @PIN_ID_BATERIA AS INT
	,@PIN_CL_USUARIO_APP AS NVARCHAR(50)
	,@PIN_NB_PROGRAMA AS NVARCHAR(50)

AS
BEGIN  
	--SE DECLARA E INICIALIZA LA VARIABLE QUE NOS INDICARA SI GENERAMOS LA TRANSACCION EN ESTE SP
	DECLARE @V_EXIST_TRAN BIT = 0,
			@V_FE_SISTEMA AS DATETIME = GETDATE()

	DECLARE @V_ID_CUESTIONARIO AS INT,
			@V_NO_BAREMOS_CI AS INT,
			@V_NO_BAREMOS_APRENDIZAJE AS INT

		
	SELECT @V_ID_CUESTIONARIO = ID_CUESTIONARIO_BAREMOS
	FROM IDP.K_BATERIA_PRUEBA
	WHERE ID_BATERIA = @PIN_ID_BATERIA

	;WITH T_VARIABLES AS (

		SELECT 'APTITUD1_REP_0001' AS CL_VARIABLE_REPORTE, 1 AS NO_FILA UNION ALL
		SELECT 'APTITUD1_REP_0002' AS CL_VARIABLE_REPORTE, 2 AS NO_FILA UNION ALL
		SELECT 'APTITUD1_REP_0003' AS CL_VARIABLE_REPORTE, 3 AS NO_FILA UNION ALL
		SELECT 'APTITUD1_REP_0004' AS CL_VARIABLE_REPORTE, 4 AS NO_FILA UNION ALL
		SELECT 'APTITUD1_REP_0005' AS CL_VARIABLE_REPORTE, 5 AS NO_FILA UNION ALL
		SELECT 'APTITUD1_REP_0006' AS CL_VARIABLE_REPORTE, 6 AS NO_FILA UNION ALL
		SELECT 'APTITUD1_REP_0007' AS CL_VARIABLE_REPORTE, 7 AS NO_FILA UNION ALL
		SELECT 'APTITUD1_REP_0008' AS CL_VARIABLE_REPORTE, 8 AS NO_FILA UNION ALL
		SELECT 'APTITUD1_REP_0009' AS CL_VARIABLE_REPORTE, 9 AS NO_FILA UNION ALL
		SELECT 'APTITUD1_REP_0010' AS CL_VARIABLE_REPORTE, 10 AS NO_FILA

	),T_RESULTADOS AS (

		SELECT TV.CL_VARIABLE_REPORTE, TV.NO_FILA, KR.NO_VALOR
		FROM T_VARIABLES TV
			INNER JOIN IDP.C_VARIABLE CV ON TV.CL_VARIABLE_REPORTE = CV.CL_VARIABLE
			INNER JOIN IDP.K_RESULTADO KR ON CV.ID_VARIABLE = KR.ID_VARIABLE
			INNER JOIN ADM.K_CUESTIONARIO KC ON KR.ID_CUESTIONARIO = KC.ID_CUESTIONARIO
			INNER JOIN IDP.K_PRUEBA KP ON KC.ID_CUESTIONARIO = KP.ID_CUESTIONARIO
		WHERE KP.ID_BATERIA = @PIN_ID_BATERIA
				
	), T_BAREMOS AS (

		SELECT 'AT-CULTURA GENERAL'					 AS CL_VARIABLE_BAREMOS, 1 AS NO_FILA UNION ALL
		SELECT 'AT-CAPACIDAD DE JUICIO'				 AS CL_VARIABLE_BAREMOS, 2 AS NO_FILA UNION ALL
		SELECT 'AT-CAPACIDAD DE ANÁLISIS Y SÍNTESIS' AS CL_VARIABLE_BAREMOS, 3 AS NO_FILA UNION ALL
		SELECT 'AT-CAPACIDAD DE ABSTRACCIÓN'		 AS CL_VARIABLE_BAREMOS, 4 AS NO_FILA UNION ALL
		SELECT 'AT-CAPACIDAD DE RAZONAMIENTO'		 AS CL_VARIABLE_BAREMOS, 5 AS NO_FILA UNION ALL
		SELECT 'AT-SENTIDO COMÚN'					 AS CL_VARIABLE_BAREMOS, 6 AS NO_FILA UNION ALL
		SELECT 'AT-PENSAMIENTO ORGANIZADO'			 AS CL_VARIABLE_BAREMOS, 7 AS NO_FILA UNION ALL
		SELECT 'AT-CAPACIDAD DE PLANEACIÓN'			 AS CL_VARIABLE_BAREMOS, 8 AS NO_FILA UNION ALL
		SELECT 'AT-CAPACIDAD DE DISCRIMINACIÓN'		 AS CL_VARIABLE_BAREMOS, 9 AS NO_FILA UNION ALL
		SELECT 'AT-CAPACIDAD DE DEDUCCIÓN'			 AS CL_VARIABLE_BAREMOS, 10 AS NO_FILA 
	)
		INSERT INTO [IDP].[K_RESULTADO]([CL_TIPO_RESULTADO],[ID_VARIABLE],[NO_VALOR],[ID_CUESTIONARIO],[FE_CREACION],[CL_USUARIO_APP_CREA],[NB_PROGRAMA_CREA])
		SELECT 4 AS CL_TIPO_RESULTADO, CV.ID_VARIABLE,[IDP].[F_OBTIENE_VALORES_BAREMOS](8, TR.NO_VALOR, 'PORCENTAJE'), @V_ID_CUESTIONARIO, @V_FE_SISTEMA, @PIN_CL_USUARIO_APP, @PIN_NB_PROGRAMA
		FROM T_RESULTADOS TR
			INNER JOIN T_BAREMOS TB ON TR.NO_FILA  = TB.NO_FILA
			INNER JOIN IDP.C_VARIABLE CV ON TB.CL_VARIABLE_BAREMOS = CV.CL_VARIABLE

		SELECT @V_NO_BAREMOS_CI = [IDP].[F_OBTIENE_VALORES_BAREMOS](8, KR.NO_VALOR, 'APTITUD1_REP_TOTAL')
		FROM IDP.C_VARIABLE CV 
			INNER JOIN IDP.K_RESULTADO KR ON CV.ID_VARIABLE = KR.ID_VARIABLE
			INNER JOIN ADM.K_CUESTIONARIO KC ON KR.ID_CUESTIONARIO = KC.ID_CUESTIONARIO
			INNER JOIN IDP.K_PRUEBA KP ON KC.ID_CUESTIONARIO = KP.ID_CUESTIONARIO
		WHERE KP.ID_BATERIA = @PIN_ID_BATERIA AND CV.CL_VARIABLE = 'APTITUD1_REP_TOTAL'

		SELECT @V_NO_BAREMOS_APRENDIZAJE = [IDP].[F_OBTIENE_VALORES_BAREMOS](8, KR.NO_VALOR, 'APTITUD1_REP_CI')
		FROM IDP.C_VARIABLE CV 
			INNER JOIN IDP.K_RESULTADO KR ON CV.ID_VARIABLE = KR.ID_VARIABLE
			INNER JOIN ADM.K_CUESTIONARIO KC ON KR.ID_CUESTIONARIO = KC.ID_CUESTIONARIO
			INNER JOIN IDP.K_PRUEBA KP ON KC.ID_CUESTIONARIO = KP.ID_CUESTIONARIO
		WHERE KP.ID_BATERIA = @PIN_ID_BATERIA AND CV.CL_VARIABLE = 'APTITUD1_REP_CI'

		IF @V_NO_BAREMOS_CI IS NOT NULL BEGIN
			INSERT INTO [IDP].[K_RESULTADO]([CL_TIPO_RESULTADO],[ID_VARIABLE],[NO_VALOR],[ID_CUESTIONARIO],[FE_CREACION],[CL_USUARIO_APP_CREA],[NB_PROGRAMA_CREA])
			SELECT CL_TIPO_VARIABLE, ID_VARIABLE, @V_NO_BAREMOS_CI, @V_ID_CUESTIONARIO, @V_FE_SISTEMA, @PIN_CL_USUARIO_APP,  @PIN_NB_PROGRAMA
			FROM IDP.C_VARIABLE
			WHERE CL_VARIABLE = 'AT-INTELIGENCIA'
		END

		IF @V_NO_BAREMOS_APRENDIZAJE IS NOT NULL BEGIN
			INSERT INTO [IDP].[K_RESULTADO]([CL_TIPO_RESULTADO],[ID_VARIABLE],[NO_VALOR],[ID_CUESTIONARIO],[FE_CREACION],[CL_USUARIO_APP_CREA],[NB_PROGRAMA_CREA])
			SELECT CL_TIPO_VARIABLE, ID_VARIABLE, @V_NO_BAREMOS_APRENDIZAJE, @V_ID_CUESTIONARIO, @V_FE_SISTEMA, @PIN_CL_USUARIO_APP,  @PIN_NB_PROGRAMA
			FROM IDP.C_VARIABLE
			WHERE CL_VARIABLE = 'AT-APRENDIZAJE'
		END

		

END


