DELIMITER //
CREATE PROCEDURE SP_CONDICAO_IF_ELSE (IN NUMERO INT)
BEGIN
IF NUMERO >= 0 THEN
SELECT 'NUMERO DE ENTRADA É MAIOR OU IGUAL A ZERO !!!' AS RESPOSTA_1;
ELSE
SELECT 'NUMERO DE ENTRADA É MENOR QUE ZERO !!!' AS RESPOSTA_2;
END IF;
END