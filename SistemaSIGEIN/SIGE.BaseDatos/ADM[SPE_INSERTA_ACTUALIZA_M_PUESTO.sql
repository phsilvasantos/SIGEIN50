USE [SIGEIN]
GO
/****** Object:  StoredProcedure [ADM].[SPE_INSERTA_ACTUALIZA_M_PUESTO]    Script Date: 19/11/2015 06:36:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Proyecto: Sigein 5.0
-- Copyright (c) - Acrux - 2015
-- Author: Margarita Salcedo
-- CREATE date: 14/09/2015
-- Description: Inserta un nuevo M_PUESTO
-- =============================================
ALTER PROCEDURE [ADM].[SPE_INSERTA_ACTUALIZA_M_PUESTO] 
	@POUT_CLAVE_RETORNO int OUT      --APLICA PARA REGRESAR UN NÚMERO 0 PARA ERROR Y 1 PARA CORRECTO
    	, @PIN_ID_PUESTO AS int
		, @PIN_FG_ACTIVO AS bit
		, @PIN_FE_INACTIVO AS datetime
		, @PIN_CL_PUESTO AS nvarchar(20)
		, @PIN_NB_PUESTO AS nvarchar(100)
		, @PIN_ID_PUESTO_JEFE AS int
		, @PIN_ID_DEPARTAMENTO AS int
		, @PIN_XML_CAMPOS_ADICIONALES AS xml
		, @PIN_ID_BITACORA AS int
		, @PIN_CL_USUARIO_APP_CREA AS nvarchar(50)
		, @PIN_CL_USUARIO_APP_MODIFICA AS nvarchar(50)
		, @PIN_NB_PROGRAMA_CREA AS nvarchar(50)
		, @PIN_NB_PROGRAMA_MODIFICA AS nvarchar(50)
		, @PIN_NO_EDAD_MINIMA AS tinyint
        , @PIN_NO_EDAD_MAXIMA AS tinyint
        , @PIN_CL_GENERO AS nvarchar(40)
        , @PIN_CL_ESTADO_CIVIL AS nvarchar(40)
        , @PIN_XML_REQUERIMIENTOS AS xml
        , @PIN_XML_OBSERVACIONES AS xml
        , @PIN_XML_RESPONSABILIDAD AS xml
        , @PIN_XML_AUTORIDAD AS xml
        , @PIN_XML_CURSOS_ADICIONALES AS xml
        , @PIN_XML_MENTOR AS xml
        , @PIN_CL_TIPO_PUESTO AS nvarchar(40)
        , @PIN_ID_CENTRO_ADMINISTRATIVO AS int
        , @PIN_ID_CENTRO_OPERATIVO AS int
        , @PIN_ID_PAQUETE_PRESTACIONES AS int
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
			--SE INSERTA EL REGISTRO EN LA TABLA  ADM.M_PUESTO
			INSERT INTO ADM.M_PUESTO
					   ([FG_ACTIVO]
						, [FE_INACTIVO]
						, [CL_PUESTO]
						, [NB_PUESTO]
						, [ID_PUESTO_JEFE]
						, [ID_DEPARTAMENTO]
						, [XML_CAMPOS_ADICIONALES]
						, [FE_CREACION]
						, [CL_USUARIO_APP_CREA]
						, [NB_PROGRAMA_CREA]
					)
			VALUES
					   (@PIN_FG_ACTIVO
						, @PIN_FE_INACTIVO
						, @PIN_CL_PUESTO
						, @PIN_NB_PUESTO
						, @PIN_ID_PUESTO_JEFE
						, @PIN_ID_DEPARTAMENTO
						, @PIN_XML_CAMPOS_ADICIONALES
						,  GETDATE()
						, @PIN_CL_USUARIO_APP_CREA
						, @PIN_NB_PROGRAMA_CREA
					)			
		END ELSE BEGIN
			--SE ACTUALIZA EL REGISTRO EN LA TABLA  ADM.M_PUESTO
			UPDATE ADM.M_PUESTO SET
				[FG_ACTIVO] = @PIN_FG_ACTIVO
				, [FE_INACTIVO] = @PIN_FE_INACTIVO
				, [CL_PUESTO] = @PIN_CL_PUESTO
				, [NB_PUESTO] = @PIN_NB_PUESTO
				, [ID_PUESTO_JEFE] = @PIN_ID_PUESTO_JEFE
				, [ID_DEPARTAMENTO] = @PIN_ID_DEPARTAMENTO
				, [XML_CAMPOS_ADICIONALES] = @PIN_XML_CAMPOS_ADICIONALES
				, [FE_MODIFICACION] = GETDATE()
				, [CL_USUARIO_APP_MODIFICA] = @PIN_CL_USUARIO_APP_MODIFICA
				, [NB_PROGRAMA_MODIFICA] = @PIN_NB_PROGRAMA_MODIFICA
			       
			WHERE [ID_PUESTO] = @PIN_ID_PUESTO
									
		END
		--SE DEVUELVE LA VARIABLE DE RETORNO INDICANDO QUE TODO SE REALIZO CORRECTAMENTE
		SET @POUT_CLAVE_RETORNO = 1
		--SI SE GENERO UNA TRANSACCION EN ESTE BLOQUE LA TERMINARA
		IF (@@TRANCOUNT > 0 AND @V_EXIST_TRAN = 1)
			COMMIT	
	END TRY
	BEGIN CATCH		
		--SI OCURRIO UN ERROR Y SE INICIO UNA TRANSACCION ENE ESTE BLOQUE SE CANCELARA LA TRANSACCION
		IF (@@TRANCOUNT > 0 AND @V_EXIST_TRAN = 1)
			ROLLBACK
		--SE INDICA EN LA VARIABLE DE RETORNO QUE OCURRIO UN ERROR
		SET @POUT_CLAVE_RETORNO = 0
		--SE INSERTA EL ERROR EN LA TABLA		
		DECLARE @ERROR_CLAVE INT  = 	ERROR_NUMBER()
		DECLARE @ERROR_MENSAJE NVARCHAR(250)  = 	 ERROR_MESSAGE()
		EXEC	ADM.SPE_INSERTA_S_ERROR
			@PIN_CL_CLAVE = @ERROR_CLAVE,
			@PIN_DS_ERROR = @ERROR_MENSAJE,
			@PIN_CL_USUARIO_APP_CREA =@PIN_CL_USUARIO_APP_CREA,
			@PIN_NB_PROGRAMA_CREA = @PIN_NB_PROGRAMA_CREA
			
	END CATCH
END
