﻿-- =============================================
-- Proyecto: Sigein 5.0
-- Copyright (c) - Acrux - 2015
-- Author: Daniela Sanchez
-- CREATE date: 29/12/2015
-- Description: Elimina un registro de la tabla C_CENTRO_OPTVO
-- =============================================
CREATE PROCEDURE [ADM].[SPE_ELIMINA_CENTRO_OPTVO]
@XML_RESULTADO XML OUT,     --APLICA PARA REGRESAR UN NÚMERO 0 PARA ERROR Y 1 PARA CORRECTO
@PIN_ID_CENTRO_OPTVO AS Uniqueidentifier, 
@PIN_CL_USUARIO_APP_CREA AS nvarchar(50), --USUARIO QUE MANDA A ELIMINAR EL REGISTRO
@PIN_NB_PROGRAMA_CREA AS nvarchar(50) -- PROGRAMA DONDE EL USUARIO MANDA ELIMINAR EL REGISTRO
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

DELETE FROM ADM.C_CENTRO_OPTVO WHERE ID_CENTRO_OPTVO = @PIN_ID_CENTRO_OPTVO

       SET @XML_RESULTADO = DBO.F_ERROR_CREAR_ENCABEZADO( @@ROWCOUNT, 1, 'SUCCESSFUL')
SET @XML_RESULTADO = DBO.F_ERROR_INSERTAR_MENSAJES(@XML_RESULTADO, 'Se eliminó el centro operativo satisfactoriamente', 'ES')
SET @XML_RESULTADO = DBO.F_ERROR_INSERTAR_MENSAJES(@XML_RESULTADO, 'Se eliminó el centro operativo satisfactoriamente', 'EN')

--SI SE GENERO UNA TRANSACCION EN ESTE BLOQUE LA TERMINARA
IF (@@TRANCOUNT > 0 AND @V_EXIST_TRAN = 1)
COMMIT	
END TRY
BEGIN CATCH	
--SI OCURRIO UN ERROR Y SE INICIO UNA TRANSACCION ENE ESTE BLOQUE SE CANCELARA LA TRANSACCION
IF (@@TRANCOUNT > 0 AND @V_EXIST_TRAN = 1)
ROLLBACK

DECLARE @ERROR_CLAVE INT  = ERROR_NUMBER()
DECLARE @ERROR_MENSAJE NVARCHAR(250)  = ERROR_MESSAGE()
    SET @XML_RESULTADO = DBO.F_ERROR_CREAR_ENCABEZADO( @@ROWCOUNT, @ERROR_CLAVE, 'ERROR')
SET @XML_RESULTADO = DBO.F_ERROR_MENSAJES( @ERROR_CLAVE,@ERROR_MENSAJE)
SET @XML_RESULTADO = DBO.F_ERROR_MENSAJES( @ERROR_CLAVE,@ERROR_MENSAJE)

END CATCH	
END 