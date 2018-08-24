-- =============================================
-- Proyecto: Sistema SIGEIN 5.0
-- Copyright (c) - Acrux - 2015
-- Author: Margarita Salcedo
-- CRETAE date: 21/09/2015
-- Description: Inserta un nuevo registro en la tabla C_PREGUNTA
-- =============================================
ALTER PROCEDURE [ADM].[SPE_INSERTA_ACTUALIZA_C_PREGUNTA] 
	      @XML_RESULTADO XML = '' OUT      --APLICA PARA REGRESAR UN NÚMERO 0 PARA ERROR Y 1 PARA CORRECTO
    	, @PIN_ID_PREGUNTA AS int
		, @PIN_CL_PREGUNTA AS nvarchar(32)
		, @PIN_NB_PREGUNTA AS nvarchar(100)
		, @PIN_DS_PREGUNTA AS nvarchar(200)
		, @PIN_CL_TIPO_PREGUNTA AS nvarchar(10)
		, @PIN_NO_VALOR AS decimal(8,3)
		, @PIN_FG_REQUERIDO AS bit
		, @PIN_FG_ACTIVO AS bit
		, @PIN_ID_COMPETENCIA AS int
		, @PIN_ID_BITACORA AS int
		, @PIN_CL_USUARIO_APP_CREA AS nvarchar(50)
		, @PIN_CL_USUARIO_APP_MODIFICA AS nvarchar(50)
		, @PIN_NB_PROGRAMA_CREA AS nvarchar(50)
		, @PIN_NB_PROGRAMA_MODIFICA AS nvarchar(50)
		, @PIN_TIPO_TRANSACCION CHAR(1)             --I=INSERCIÓN   A=ACTUALIZACIÓN

AS 
BEGIN  
	--SE DECLARA E INICIALIZA LA VARIABLE QUE NOS INDICARA SI GENERAMOS LA TRANSACCION EN ESTE SP
	DECLARE @V_EXIST_TRAN BIT = 0
    	BEGIN TRY
		--SE VERIFICA SI EXISTE UNA TRANSACCION EN EJECUCION
		IF (@@TRANCOUNT = 0) 
		BEGIN
			--EN CASO DE QUE NO SE INICIALIZA LA TRANSACCION
			BEGIN TRANSACTION
			--SE EDITA LA VARIABLE QUE INDICA QUE SE INICIO LA TRANSACCION EN ESTE BLOQUE PARA CANCELARLA SI ES NECESARIO
			SET @V_EXIST_TRAN = 1
		END	
		--SE VERIFICA SI SE INSERTA EL REGISTRO O SE ACTUALIZARA SEGUN LA VARIABLE DE TIPO DE TRANSACCION  QUE RECIBE EL SP
		IF @PIN_TIPO_TRANSACCION='I'
	    	BEGIN
			--SE INSERTA EL REGISTRO EN LA TABLA  ADM.C_PREGUNTA
			INSERT INTO ADM.C_PREGUNTA
					   ([CL_PREGUNTA]
						, [NB_PREGUNTA]
						, [DS_PREGUNTA]
						, [CL_TIPO_PREGUNTA]
						, [NO_VALOR]
						, [FG_REQUERIDO]
						, [FG_ACTIVO]
						, [ID_COMPETENCIA]
						, [ID_BITACORA]
						, [FE_CREACION]
						, [CL_USUARIO_APP_CREA]
						, [NB_PROGRAMA_CREA]
					)
			VALUES
					   (@PIN_CL_PREGUNTA
						, @PIN_NB_PREGUNTA
						, @PIN_DS_PREGUNTA
						, @PIN_CL_TIPO_PREGUNTA
						, @PIN_NO_VALOR
						, @PIN_FG_REQUERIDO
						, @PIN_FG_ACTIVO
						, @PIN_ID_COMPETENCIA
						, @PIN_ID_BITACORA
						,  GETDATE()
						, @PIN_CL_USUARIO_APP_CREA
						, @PIN_NB_PROGRAMA_CREA
					)			
		END ELSE BEGIN
			--SE ACTUALIZA EL REGISTRO EN LA TABLA  ADM.C_PREGUNTA
			UPDATE ADM.C_PREGUNTA SET
				[CL_PREGUNTA] = @PIN_CL_PREGUNTA
				, [NB_PREGUNTA] = @PIN_NB_PREGUNTA
				, [DS_PREGUNTA] = @PIN_DS_PREGUNTA
				, [CL_TIPO_PREGUNTA] = @PIN_CL_TIPO_PREGUNTA
				, [NO_VALOR] = @PIN_NO_VALOR
				, [FG_REQUERIDO] = @PIN_FG_REQUERIDO
				, [FG_ACTIVO] = @PIN_FG_ACTIVO
				, [ID_COMPETENCIA] = @PIN_ID_COMPETENCIA
				, [ID_BITACORA] = @PIN_ID_BITACORA
				, [FE_MODIFICACION] = GETDATE()
				, [CL_USUARIO_APP_MODIFICA] = @PIN_CL_USUARIO_APP_MODIFICA
				, [NB_PROGRAMA_MODIFICA] = @PIN_NB_PROGRAMA_MODIFICA
			       
			WHERE [ID_PREGUNTA] = @PIN_ID_PREGUNTA
									
		END
		--SE DEVUELVE LA VARIABLE DE RETORNO INDICANDO QUE TODO SE REALIZO CORRECTAMENTE
		SET @XML_RESULTADO = DBO.F_ERROR_CREAR_ENCABEZADO( @@ROWCOUNT, ERROR_NUMBER(), 'SUCCESSFUL')
		SET @XML_RESULTADO = DBO.F_ERROR_INSERTAR_MENSAJES(@XML_RESULTADO, 'Proceso exitoso', 'ES')
		SET @XML_RESULTADO = DBO.F_ERROR_INSERTAR_MENSAJES(@XML_RESULTADO, 'Successful Process', 'EN')
		--SI SE GENERO UNA TRANSACCION EN ESTE BLOQUE LA TERMINARA
		IF (@@TRANCOUNT > 0 AND @V_EXIST_TRAN = 1)
			COMMIT	
	END TRY
	BEGIN CATCH		
		--SI OCURRIO UN ERROR Y SE INICIO UNA TRANSACCION ENE ESTE BLOQUE SE CANCELARA LA TRANSACCION
		IF (@@TRANCOUNT > 0 AND @V_EXIST_TRAN = 1)
			ROLLBACK
		--SE INDICA EN LA VARIABLE DE RETORNO QUE OCURRIO UN ERROR
		--SET @POUT_CLAVE_RETORNO = 0
		--SE INSERTA EL ERROR EN LA TABLA		
		DECLARE @ERROR_CLAVE INT  = 	ERROR_NUMBER()
		DECLARE @ERROR_MENSAJE NVARCHAR(250)  = 	 ERROR_MESSAGE()
		
		SET @XML_RESULTADO = DBO.F_ERROR_CREAR_ENCABEZADO( @@ROWCOUNT, @ERROR_CLAVE, 'ERROR')
		SET @XML_RESULTADO = DBO.F_ERROR_INSERTAR_MENSAJES(@XML_RESULTADO, 'Ocurrió un error al procesar el registro', 'ES')
		SET @XML_RESULTADO = DBO.F_ERROR_INSERTAR_MENSAJES(@XML_RESULTADO, 'Ocurrió un error al procesar el registro', 'EN')
			
	END CATCH
END
