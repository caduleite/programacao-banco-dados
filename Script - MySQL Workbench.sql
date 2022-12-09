/*  Faculdade Pitágoras - Unidade Betim
    Curso: Ciência da Computação
    Disciplina: Programação em Banco de Dados
    Professor: Cristiano Martins Nunes
    Aula 02: Unidade 1 - Repositório de Dados (Seção 1.1/1.2)
*/

-- ------------------------------------
-- SGBD MYSQL Workbench
-- ------------------------------------
-- 01. Todos os conjuntos de símbolos:
SHOW CHARACTER SET;

-- 02. Um conjunto de símbolo específico:
SHOW CHARACTER SET WHERE CHARSET LIKE 'latin1'; 

-- 02.1 Um conjunto de símbolo específico:
SHOW CHARACTER SET WHERE CHARSET LIKE 'utf8';

-- 03. Todos os conjuntos de regras:
SHOW COLLATION;

-- 04. Um conjunto de regras específica:
SHOW COLLATION WHERE collation LIKE '%utf8%';

-- 05. O conjunto de regras específica de uma tabela:
SHOW FULL COLUMNS FROM CORRENTISTA;

-- 06. O conjunto de símbolos de um BD:
SHOW VARIABLES LIKE"character_set_database";

-- 06.1 O conjunto de regras de um BD:
SHOW VARIABLES LIKE "collation_database";

-- 07. O conjunto de símbolos e regras de todos os BD: 
SELECT SCHEMA_NAME AS 'DATABASE', 
       DEFAULT_CHARACTER_SET_NAME AS 'CHARSET', 
       DEFAULT_COLLATION_NAME AS 'COLLATION' 
  FROM INFORMATION_SCHEMA.SCHEMATA;
  
-- 08. (Atenção NÃO EXECUTAR ESTE COMANDO!!!) - 
--     Alteração do conjunto de regras e símbolos: 

/* ALTER TABLE <table_name> 
    CONVERT TO CHARACTER SET <charset> 
                     COLLATE <collate>; 
                     
   ALTER DATABASE minhaBD 
    CHARACTER SET utf8 
		  COLLATE utf8_general_ci;*/
          

