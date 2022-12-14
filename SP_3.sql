DELIMITER //
CREATE PROCEDURE SP_DECLARA_VARIAVEL ( )
BEGIN
DECLARE NUMERO_NATURAL INT;
DECLARE NUMERO_DECIMAL NUMERIC(15,2);
DECLARE XX, YY INT DEFAULT 100;
SET NUMERO_NATURAL = 10;
SET NUMERO_DECIMAL = 1.1;
SELECT (CODIGO * NUMERO_NATURAL) AS N_NATURAL, (CODIGO * NUMERO_DECIMAL) AS N_DECIMAL, (CODIGO * XX) AS X, (CODIGO * YY) AS Y
FROM CLIENTE;
END