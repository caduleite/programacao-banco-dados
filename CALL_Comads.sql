CALL ADD_CORRENTISTA_CONTA (1, 'EDUARDO', '12344567890', 'M', '1999-06-05', 'EDU@HOST.COM.BR', 1, 15);
CALL ADD_CORRENTISTA_CONTA (2, 'JOSE ALMEIDA', NULL, NULL, NULL, 'JOSE@ELO.COM.BR', 3, 15, 'DOCES E GULOSEIMAS BETIM LTDA', '2019', '123451');
CALL SP_OP_FINC();


SELECT * FROM CONTA;

SELECT * FROM CORRENTISTA ORDER BY CODIGO DESC;

DELETE FROM CORRENTISTA WHERE CODIGO = 1112;

DROP PROCEDURE ADD_CORRENTISTA_CONTA;

SELECT * FROM HISTORICOCONTA;
