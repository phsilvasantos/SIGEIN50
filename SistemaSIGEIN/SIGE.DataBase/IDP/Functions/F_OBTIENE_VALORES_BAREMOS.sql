﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [IDP].[F_OBTIENE_VALORES_BAREMOS]
(
	-- Add the parameters for the function here
	@PIN_NO_OPCION AS INT,
	@PIN_NO_RESULTADO AS DECIMAL(13,3),
	@PIN_CL_VARIABLE AS NVARCHAR(50) = NULL
)
RETURNS INT
AS
BEGIN
	
	-- VARIABLES PARA CALCULAR EL COEFICIENTE INTELECTUAL
	DECLARE @V_NO_VALOR AS INT = 0
	
	-- PARA OBTENER BAREMOS DE PENSAMIENTO LABORAL 2
	IF @PIN_NO_OPCION = 1 BEGIN

		SET @V_NO_VALOR = CASE
								WHEN @PIN_NO_RESULTADO <= 18 THEN 1
								WHEN @PIN_NO_RESULTADO BETWEEN 19 AND 24 THEN 2
								WHEN @PIN_NO_RESULTADO >= 25 THEN 3
								ELSE 0 END
		
	END

	-- PARA OBTENER BAREMOS DE PENSAMIENTO LABORAL 1
	IF @PIN_NO_OPCION = 2 BEGIN

		IF @PIN_CL_VARIABLE = 'LABORAL1-REP-DT' BEGIN

			SET @V_NO_VALOR = CASE 
									WHEN @PIN_NO_RESULTADO < -2 THEN 1
									WHEN @PIN_NO_RESULTADO >= 4 THEN 3
									ELSE 2 END
			
		END

		IF @PIN_CL_VARIABLE = 'LABORAL1-REP-IT' BEGIN
			
			SET @V_NO_VALOR = CASE 
									WHEN @PIN_NO_RESULTADO < -1.5 THEN 1
									WHEN @PIN_NO_RESULTADO >= 1.5 THEN 3
									ELSE 2 END
		END

		IF @PIN_CL_VARIABLE = 'LABORAL1-REP-ST' BEGIN

			SET @V_NO_VALOR = CASE 
									WHEN @PIN_NO_RESULTADO  < -2.5 THEN 1
									WHEN @PIN_NO_RESULTADO >= 1.5 THEN 3
									ELSE 2 END

		END

		IF @PIN_CL_VARIABLE = 'LABORAL1-REP-CT' BEGIN

			SET @V_NO_VALOR = CASE 
									WHEN @PIN_NO_RESULTADO < -3.5 THEN 1
									WHEN @PIN_NO_RESULTADO >= 0.5 THEN 3
									ELSE 2 END

		END

	END

	-- PARA OBTENER BAREMOS DE ESTILO DE PENSAMIENTO
	IF @PIN_NO_OPCION = 3 BEGIN

		SET @V_NO_VALOR = CASE 
								WHEN @PIN_NO_RESULTADO > 64.0 THEN 3
								WHEN @PIN_NO_RESULTADO BETWEEN 40 AND 64 THEN 2
								WHEN @PIN_NO_RESULTADO < 40 THEN 1
								ELSE 0 END

	END

	-- PARA OBTENER BAREMOS DE INTERES PERSONAL
	IF @PIN_NO_OPCION = 4 BEGIN

		SET @V_NO_VALOR = CASE 
								WHEN @PIN_NO_RESULTADO >= 60 THEN 3
								WHEN @PIN_NO_RESULTADO BETWEEN 40 AND 59 THEN 2
								WHEN @PIN_NO_RESULTADO < 39 THEN 1
								ELSE 0 END

	END

	-- PARA OBTENER BAREMOS DE TECNICA DE PC
	IF @PIN_NO_OPCION = 5 BEGIN

		IF @PIN_CL_VARIABLE = 'TECNICAPC_REP_S' BEGIN
			SET @V_NO_VALOR = CASE 
									WHEN @PIN_NO_RESULTADO >= 19 THEN 3
									WHEN @PIN_NO_RESULTADO <= 14 THEN 1
									ELSE 2 END
		END

		IF @PIN_CL_VARIABLE = 'TECNICAPC_REP_I' BEGIN
			SET @V_NO_VALOR = CASE 
									WHEN @PIN_NO_RESULTADO >= 13 THEN 3
									WHEN @PIN_NO_RESULTADO <= 9 THEN 1
									ELSE 2 END
		END

		IF @PIN_CL_VARIABLE = 'TECNICAPC_REP_H' BEGIN
			SET @V_NO_VALOR = CASE 
									WHEN @PIN_NO_RESULTADO >= 19 THEN 3
									WHEN @PIN_NO_RESULTADO <= 14 THEN 2
									ELSE 2 END
		END
		IF @PIN_CL_VARIABLE = 'TECNICAPC_REP_C' BEGIN
			SET @V_NO_VALOR = CASE 
									WHEN @PIN_NO_RESULTADO >=16 THEN 3
									WHEN @PIN_NO_RESULTADO <= 13 THEN 1
									ELSE 2 END
		END

	END

	--PARA BAREMOS DE ADAPTACION AL MEDIO
	IF @PIN_NO_OPCION = 6 BEGIN
		
		--VERDE
		IF @PIN_CL_VARIABLE = 'AP-PRODUCTIVIDAD' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO IN (0,1,2) THEN 3
									WHEN @PIN_NO_RESULTADO IN (3,4) THEN 2
									WHEN @PIN_NO_RESULTADO IN (7,6,5) THEN 1
									ELSE 0 END
		END

		-- ROJO
		IF @PIN_CL_VARIABLE = 'AP-EMPUJE' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO IN (0,1,2) THEN 3
									WHEN @PIN_NO_RESULTADO IN (3,4) THEN 2
									WHEN @PIN_NO_RESULTADO IN (5,6,7) THEN 1
									ELSE 0 END
		END

		-- AMARILLO
		IF @PIN_CL_VARIABLE = 'AP-SOCIABILIDAD' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO IN (0,1,2) THEN 3
									WHEN @PIN_NO_RESULTADO IN (3,4) THEN 2
									WHEN @PIN_NO_RESULTADO IN (7,6,5) THEN 1
									ELSE 0 END
		END

		-- VIOLETA
		IF @PIN_CL_VARIABLE = 'AP-CREATIVIDAD' BEGIN
			SET @V_NO_VALOR = CASE 
									WHEN @PIN_NO_RESULTADO IN (0,1,2) THEN 3
									WHEN @PIN_NO_RESULTADO IN (3,4) THEN 2
									WHEN @PIN_NO_RESULTADO IN (7,5,6) THEN 1
									ELSE 0 END
		END

		--AZUL
		IF @PIN_CL_VARIABLE = 'AP-PACIENCIA' BEGIN
			SET @V_NO_VALOR = CASE 
									WHEN @PIN_NO_RESULTADO IN (0,1,2) THEN 3
									WHEN @PIN_NO_RESULTADO IN (3,4) THEN 2
									WHEN @PIN_NO_RESULTADO IN (7,6,5) THEN 1
									ELSE 0 END
		END

		-- MARRÓN
		IF @PIN_CL_VARIABLE = 'AP-ENERGÍA' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO IN (5,6,7) THEN 3
									WHEN @PIN_NO_RESULTADO IN (3,4) THEN 2
									WHEN @PIN_NO_RESULTADO IN (0,1,2) THEN 1
									ELSE 0 END
		END

		--GRIS
		IF @PIN_CL_VARIABLE = 'AP-PARTICIPACIÓN' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO IN (5,6,7) THEN 3
									WHEN @PIN_NO_RESULTADO IN (3,4) THEN 2
									WHEN @PIN_NO_RESULTADO IN (0,1,2) THEN 1
									ELSE 0 END
		END

		-- NEGRO
		IF @PIN_CL_VARIABLE = 'AP-AUTOESTIMA Y SEGURIDAD' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO IN (5,6,7) THEN 3
									WHEN @PIN_NO_RESULTADO IN (3,4) THEN 2
									WHEN @PIN_NO_RESULTADO IN (0,1,2) THEN 1
									ELSE 0 END
		END
	END

	-- PARA BAREMOS DE APTITUD MENTAL 2
	IF @PIN_NO_OPCION = 7 BEGIN
		IF @PIN_CL_VARIABLE = 'PORCENTAJE' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO < 50 THEN 1
									WHEN @PIN_NO_RESULTADO BETWEEN 50 AND 75 THEN 2
									WHEN @PIN_NO_RESULTADO > 75 THEN 3
									ELSE 0 END
		END

		IF @PIN_CL_VARIABLE = 'APTITUD2_REP_CI' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO >= 110 THEN 3
									WHEN @PIN_NO_RESULTADO BETWEEN 90 AND 109 THEN 2
									WHEN @PIN_NO_RESULTADO < 90 THEN 1
									ELSE 0 END
		END

		IF @PIN_CL_VARIABLE = 'APTITUD2_REP_C4' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO = 5 THEN 3
									WHEN @PIN_NO_RESULTADO IN (4,3) THEN 2
									WHEN @PIN_NO_RESULTADO IN (2,1) THEN 1
									ELSE 0 END
		END
	END

	-- PARA BAREMOS DE APTITUD MENTAL 1
	IF @PIN_NO_OPCION = 8 BEGIN
		IF @PIN_CL_VARIABLE = 'PORCENTAJE' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO <= 59 THEN 1
									WHEN @PIN_NO_RESULTADO BETWEEN 60 AND 79 THEN 2
									WHEN @PIN_NO_RESULTADO >= 80 THEN 3
									ELSE 0 END
		END

		IF @PIN_CL_VARIABLE = 'APTITUD1_REP_TOTAL' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO >= 151 THEN 3
									WHEN @PIN_NO_RESULTADO BETWEEN 123 AND 150 THEN 2
									ELSE 1 END
		END

		IF @PIN_CL_VARIABLE = 'APTITUD1_REP_CI' BEGIN
			SET @V_NO_VALOR = CASE
									WHEN @PIN_NO_RESULTADO >= 111 THEN 3
									WHEN @PIN_NO_RESULTADO BETWEEN 90 AND 110 THEN 2
									ELSE 1 END
		END
	END

	--PARA BAREMOS DE TIVA (HONESTIDAD)
	IF @PIN_NO_OPCION = 9 BEGIN
		SET @V_NO_VALOR = CASE 
								WHEN @PIN_NO_RESULTADO BETWEEN 0 AND 70 THEN 1
								WHEN @PIN_NO_RESULTADO BETWEEN 71 AND 80 THEN 2
								WHEN @PIN_NO_RESULTADO BETWEEN 81 AND 100 THEN 3
								ELSE 0 END
	END

	-- PARA BEREMOS DE ORTOGRAFIA
	IF @PIN_NO_OPCION = 10 BEGIN
		SET @V_NO_VALOR = CASE
								WHEN @PIN_NO_RESULTADO >= 64 THEN 3
								WHEN @PIN_NO_RESULTADO BETWEEN 48 AND 63 THEN 2
								WHEN @PIN_NO_RESULTADO <= 47 THEN 1
								ELSE 0 END

	END
	-- Return the result of the function
	RETURN @V_NO_VALOR

END
