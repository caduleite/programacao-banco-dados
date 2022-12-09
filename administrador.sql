
--criando a tabela

CREATE TABLE HEROIS_TB (COD_HEROI INT NOT NULL,

                                                  NOME_HEROI VARCHAR2(100),

                                   CLASSE_HEROI VARCHAR(100),

                                    FORCA_HEROI INT,

   INTELIGENCIA_HEROI INT,

   AGILIDADE_HEROI INT);

--selectionando a tabela

SELECT * FROM HEROIS_TB;

--inserindo um dado na tabela

BEGIN

INSERT INTO HEROIS_TB (COD_HEROI, NOME_HEROI, CLASSE_HEROI, FORCA, HEROI, INTELIGENCIA_HEROI, AGILIDADE_HEROI, INTELIGENCIA_HEROI) VALUES (1, ‘RIKI’, ‘DANO’, ‘18’,’14’,’30’);

COMMIT;

END;

--adicionando colunas na tabela

Alter table herois_tb add qtd_vida_heroi int;

Alter table herois_tb add qtd_mana_heroi int;

--excluindo coluna da tabela

Alter table herois_tb drop column qtd_mana_heroi;

--renomeando coluna da tabela

ALTER TABLE HEROIS_TB RENAME COLUMN qtd_vida_heroi TO quantidade_vida_heroi;