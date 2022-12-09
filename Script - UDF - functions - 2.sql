DELIMITER // 
CREATE FUNCTION UDF_CAMBIO(VALOR NUMERIC(15,2), COD INT)
RETURNS VARCHAR(100)
BEGIN
    -- Variavéis:
	DECLARE RESULT NUMERIC(15,2);
    DECLARE MENSG VARCHAR(100);
    
    -- Codicional:
	IF(COD = 1) THEN
       
       -- Cálculos:
       SET RESULT = (VALOR/5.77);
       SET MENSG = CONCAT('R$ ',VALOR,' equivale a ',RESULT,' Dollar');
	ELSEIF (COD = 2) THEN
			-- Cálculos:
            SET RESULT = (VALOR/6.77);
            SET MENSG = CONCAT('R$ ',VALOR,' equivale a ',RESULT,' Libra');
	ELSEIF (COD = 3) THEN
            -- Cálculos:
            SET RESULT = (VALOR/7.93);
            SET MENSG = CONCAT('R$ ',VALOR,' equivale a ',RESULT,' Euro');
	ELSE 
           -- Cálculos:
		   SET RESULT = 0;
           SET MENSG = ('Atenção código de cambio incorreto!');
    END IF;
RETURN MENSG;
END;