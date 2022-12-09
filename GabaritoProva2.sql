/*******************
	Gabarito: Prova Oficial 02 
    ----------------
	Questão 01,02,03: Letra D
    Questão 04: II,III,I
    Questão 08: 1. c1->c2
		        2. (c1,c2)->c4
				3. c4->c6 
*******************/

/*******************
	Questão 05
*******************/
-- Database
CREATE DATABASE PROVA;

-- Seta DB
USE PROVA;

-- Table
CREATE TABLE EMPREGADO
( COD INT,
  NOME VARCHAR(50),
  SEXO ENUM('F','M'),
  SALARIO NUMERIC(15,2),
  FUNCAO ENUM('A','B','C'),
  PRIMARY KEY(COD));

-- Insert
INSERT INTO EMPREGADO
     VALUES (111,'Xisto Neves','M',4.50,'A'), 
			(56,'Ana Campos','F',2.88,'B'),
            (88,'Silvia Cotta','F',3.99,'C');
            
-- Select 
SELECT * 
  FROM EMPREGADO;
  
/*******************
	Questão 05.1
*******************/

DELIMITER //
CREATE FUNCTION FC_REAJUSTE_SAL(COD_EMP INT)
RETURNS NUMERIC(15,2)
BEGIN
	-- Variável
    DECLARE SAL NUMERIC(15,2);
    DECLARE FCEMP CHAR;
    DECLARE NOVO_SAL NUMERIC(15,2);
    
    -- Valor do salário
    SET SAL = (SELECT SALARIO 
				 FROM EMPREGADO 
				WHERE COD = COD_EMP);
                
    -- Função do Empregado
    SET FCEMP = (SELECT FUNCAO
				   FROM EMPREGADO 
				  WHERE COD = COD_EMP);

	-- Cálculo para reajuste do salário
    IF(FCEMP ='A') THEN
       SET NOVO_SAL = (SAL*0.10) + (SAL + 1.90); 
    ELSEIF (FCEMP ='B') THEN
		SET NOVO_SAL = (SAL*0.10) + (SAL + 1.70);
	ELSE 
		SET NOVO_SAL = (SAL*0.10) + (SAL + 1.50);
	END IF;
    
    RETURN NOVO_SAL;
    
END; // 

/*******************
	Questão 05.2
*******************/
SELECT COD,NOME,SEXO,SALARIO,FUNCAO,
       FC_REAJUSTE_SAL(COD) AS NOVO_SAL 
  FROM EMPREGADO;
  
/*******************
	Questão 06
*******************/
DELIMITER // 
CREATE PROCEDURE SP_NOVO_SAL(IN COD_EMP INT)
BEGIN
	-- Update salário
	UPDATE EMPREGADO
       SET SALARIO = FC_REAJUSTE_SAL(COD_EMP)
    WHERE COD = COD_EMP;
END; //

/*******************
	Questão 06.1
*******************/
CALL SP_NOVO_SAL(111); //

/*******************
	Questão 06.2
*******************/
SELECT * 
  FROM EMPREGADO; //
  
/*******************
	Questão 07
*******************/
CREATE VIEW V_Questao7
AS
SELECT CODF, NOMEFORNECEDOR, CIDADE, ESTADO, SIGLA,
	   COUNT(CODIGO) AS QNT_PRD
  FROM FORNECEDOR, PRODUTO
WHERE FORNECEDOR.CODF = PRODUTO.FORNECEDOR
GROUP BY CODF;
