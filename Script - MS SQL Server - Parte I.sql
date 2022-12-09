/*  FACULDADE PIT�GORAS - UNIDADE BETIM/MG
    Curso: Ci�ncia da Computa��o
    Disciplina: Programa��o em Banco de Dados
    Professor: Cristiano Martins Nunes
    Aula 02: SGBD Microsoft SQL Server 2017 - PARTE I
*/

-- 00. Cria��o de BD
CREATE DATABASE FAPBETIM;

-- 01. Seta BD
USE FAPBETIM;

-- 01.1 Cria��o de BD (Arquivos)
CREATE DATABASE FAPDIV
ON ( NAME = FAPDIV_DAT,  
    FILENAME = 'G:\Root\20192\Programa��o em Banco de Dados\MS SQL Server - Database\FAPDIV_DAT.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = FAPDIV_LOG,  
    FILENAME = 'G:\Root\20192\Programa��o em Banco de Dados\MS SQL Server - Database\FAPDIV_LOG.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB )

-- 01.2 Cria��o de BD (Interface Gr�fica)
   /* 01. Pasta Banco de Dados
      02. Bot�o direito
	  03. Novo Banco de dados...
	  04. Nome do Banco de dados: FAPBH
	  05. Bot�o direito no BD FAPBH / Propriedades... */

-- 01.3 Cria��o de BD (Interface Gr�fica)
   /* 01. Pasta Banco de Dados
      02. Bot�o direito
	  03. Novo Banco de dados...
	  04. Nome do Banco de dados: FAPCONTAGEM
	  05. Bot�o Script... */

-- 02. Exclus�o de BD
DROP DATABASE FAPBETIM;

-- 02.1 Exclus�o de BD (Interface Gr�fica)
   /* 01. Pasta Banco de Dados
      02. Selecione o BD p/exclus�o
	  03. Bot�o direito / Excluir...
	  04. Clique no [Bot�o OK] */

-- 02.2 Cria��o de BD (Interface Gr�fica)
   /* 01. Pasta Banco de Dados
      02. Bot�o direito
	  03. Novo Banco de dados...
	  04. Nome do Banco de dados: FAPCONTAGEM
	  05. Bot�o Script... */


-- 03. Tipos de Dados
   https://docs.microsoft.com/pt-br/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-2017

-- 03.1 Num�ricos Exatos: 
   bigint, int, smallint, tinyint, numeric, smallint, smallmoney, tinyint, money

-- 03.2 Num�ricos aproximados:
   float, real

-- 03.3 Data e Hora:
   date, datetime, datetime2, datetimeoffset, smalldatetime, time

-- 03.4 Cadeias de caracteres:
   char, varchar, text

-- 03.5 Cadeias de caracteres Unicode:
   nchar, nvarchar, ntext

-- 03.6 Cadeia de caracteres bin�ria:
   binary, image, varbinary

-- 03.7 Outros tipos de dados:
   table, cursor, hierarchyid, sql_variant, Tipos de geometria espacial, Tipos de geografia espacial, 
   rowversion, uniqueidentifier, xml

-- 04. Create Table
CREATE TABLE [ALUNOS FAP BETIM]
([CPF] [VARCHAR] (11),
 [NOME] [VARCHAR] (100),
 [SEXO] [CHAR] (1),
 [VALOR MENSALIDADE] [MONEY],
 [NASCIMENTO] [DATE],
 PRIMARY KEY ([CPF]));

-- 04.1 Select Table
SELECT * FROM [ALUNOS FAP BETIM];

-- 04.2 Insert Table
 INSERT INTO [ALUNOS FAP BETIM]
      VALUES ('11100022277','CRISTIANO MARTINS NUNES','M',1500.99,'1968-12-31');
 
 -- 04.3 Insert Table
INSERT INTO [ALUNOS FAP BETIM]
     VALUES ('22200022277','PREDRO MARTINS NUNES','M',1500.99,'1970-10-01'),
			('33300022277','KELLEM MARTINS NUNES','F',$1500.99,'1975-05-11');

-- 04.4 Create Table
CREATE TABLE [ALUNOSFAPBH]
( CPF VARCHAR(11),
  NOME VARCHAR(100) NOT NULL,
  VALORMENSALIDADE MONEY,
  NASCIMENTO DATETIME,
  PRIMARY KEY (CPF));

-- 04.5 Select Table
SELECT * FROM [ALUNOSFAPBH];
 
-- 04.6 Insert Table
INSERT INTO [ALUNOSFAPBH]
     VALUES ('00000002019','PREDRO MARTINS NUNES',1500.99,'1970-10-01 00:00:000'),
			('00000002020','KELLEM MARTINS NUNES',$1500.99,'1975-05-11 00:00:000');

-- 05. Create Table (Interface Gr�fica)
   /* 01. Selecione o Banco de Dados
      02. Selecione a pasta Tabelas
	  03. Bot�o direito / Novo / Tabela...
	  04. Informe o Nome da Coluna, o Tipo de Dados, Permitir dados nulos (S/N)
	  05. Barra de Ferramentas [bot�o Salvar]
	  06. informe o nome da tabela */

-- 05.1 Create Table (Interface Gr�fica / Script)
   /* 01. Selecione a Tabela Banco de Dados
      03. Bot�o direito / Script de Tabela como...
	  04. Create para / Janela para editor de nova consulta */

-- 06. Excluir Tabela
DROP TABLE [dbo].[ALUNOS FAP BETIM];

-- 06.1 Excluir Tabela
DROP TABLE ALUNOSFAPBH;

