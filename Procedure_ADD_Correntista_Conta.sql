DELIMITER //
CREATE PROCEDURE ADD_CORRENTISTA_CONTA 
(IN PPESSOA INT, PNOME VARCHAR(50), PCPF VARCHAR(11), PSEXO CHAR, PDTNASC DATE, PEMAIL VARCHAR (50), PCONTA INT, PAGENCIA INT, PNOMEF VARCHAR(50), PCNPJ INT, PINSC INT)
    BEGIN
		DECLARE PCODIGO INT;
        IF(PCODIGO = 1) THEN
       -- INSERT CORRENTISTA
	INSERT INTO CORRENTISTA (NOMECORRENTISTA, IDTC, DTCAD, CPF, SEXO, DTNASC, EMAIL)
	VALUES (PNOME, PPESSOA, NOW(), PCPF, PSEXO, PDTNASC, PEMAIL);
    ELSE
        INSERT INTO CORRENTISTA (NOMECORRENTISTA, IDTC, DTCAD, CNPJ, NOMEFANTASIA, INSCESTADUAL,EMAIL)
	VALUES (PNOME, PPESSOA, NOW(), PCNPJ,PNOMEF, PINSC, PEMAIL);
	END IF;

-- SELECIONAR CORRENTISTA
SET PCODIGO = (SELECT MAX(CODIGO) FROM CORRENTISTA);

-- INSERT CONTA
INSERT INTO CONTA(AGENCIA, CORRENTISTA, DTABERTURA, SALDOCONTA, TIPO)
			VALUES(PAGENCIA, PCODIGO, NOW(), 0, PCONTA);
-- SAIDA
SELECT * FROM CORRENTISTA, CONTA
WHERE CODIGO = PCODIGO
AND CODIGO = CORRENTISTA;

END;


-- SELECT * FROM TIPOCORRENTISTA;