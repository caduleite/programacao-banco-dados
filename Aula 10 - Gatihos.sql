/*  FACULDADE PITÁGORAS - UNIDADE BETIM/MG
    Curso: Ciência da Computação
    Disciplina: Programação em Banco de Dados
    Professor: Cristiano Martins Nunes
    Aula 11: SGBD Ms SQL Server 2017 - Triggers
*/
GO

-- 00. Database Aula11
DROP DATABASE IF EXISTS AULA11

GO
-- 01. Create Database
CREATE DATABASE AULA11

GO
-- 02. Use AULA11
USE AULA11;

GO
-- 03. Table Cliente
CREATE TABLE CLIENTE
(CODIGO INT IDENTITY(1000,1),
 NOME VARCHAR(50),
 DTHRCAD DATETIME DEFAULT SYSDATETIME(),
 PRIMARY KEY(CODIGO));

 GO
 -- 04. Insert Cliente
 INSERT INTO CLIENTE (NOME)
      VALUES ('CRISTIANO MARTINS NUNES'),
	         ('JOANA DARK'),
			 ('QUINCAS BORBA'); 

GO
-- 05. Select Cliente
SELECT * FROM CLIENTE;

GO
-- 06. Conceito de Tirggers 
 /* O objeto TRIGGER é um recurso muito interessante quanto ao 
   aspecto do BD presente dentro de um SGDB, pois 
   propõem que o BD tenha um pouco de vida própria, ou seja, não tenha uma 
   dependência constante de uma aplicação (SOFTWARE), ou acompanhamento 
   constante de um usuário para suporte ou manutenção do banco de dados. 
   Os Gatilhos (TRIGGERS) disparam a execução de códigos SQL armazenados no SGDB, 
   ou Códigos de Aplicações (SOFTWARE); sem a necessidade de uma chamada 
   específica para estes; são executados (disparados) quando uma situação 
   é satisfeita no banco de dados ou no SGDB, que é verificada 
   antes (BEFORE) ou DEPOIS (AFTER) da execução das instruções 
   SQL INSERT, UPDATE e DELETE, ou baseados em situações temporais, 
   com horários programados (Agendamento de Tarefas), 
   e repetição de rotinas pertinentes ao minimundo do banco de dados.
*/

GO
-- 07. Sintaxe Triggers
CREATE TRIGGER MSG_INSERT
ON CLIENTE
WITH ENCRYPTION 
AFTER INSERT
AS
PRINT 'ATENÇÃO - Cliente inserido na base de dados!!!';

 GO
 -- 07.1 Insert Cliente
 INSERT INTO CLIENTE (NOME)
      VALUES ('SILVIA COTTA'),
	         ('MARIANA MIRANDA'),
			 ('REBECA SILVA'); 

GO
-- 07.3 Drop Triggers
DROP TRIGGER MSG_INSERT

GO
-- 07.4 Select Cliente
SELECT * FROM CLIENTE

-- 07.5 Delete Cliente
DELETE FROM CLIENTE

GO
-- 08. Sintaxe Triggers
CREATE TRIGGER MSG_AVISO
ON CLIENTE
WITH ENCRYPTION 
INSTEAD OF INSERT
AS
PRINT 'Prezado Usuário: Cliente não inserido no BD';

GO
-- 09. Insert Cliente
 INSERT INTO CLIENTE (NOME)
      VALUES ('ALERQUINA SILVA'),
	         ('BERNADO MELLO'),
			 ('CALIXTO REIS');

GO
-- 09.1 Select Cliente
SELECT * FROM CLIENTE

GO
-- 10. Off Triggers 
ALTER TABLE CLIENTE 
DISABLE TRIGGER MSG_AVISO

-- 10.1 Insert Cliente
 INSERT INTO CLIENTE (NOME)
      VALUES ('Gatilho 01'),
	         ('Gatilho 02'),
			 ('Gatilho 03');

GO
-- 10.2 Select Cliente
SELECT * FROM CLIENTE

GO
-- 10.2 On Triggers 
ALTER TABLE CLIENTE 
ENABLE TRIGGER MSG_AVISO

GO
-- 10.3 Insert Cliente
 INSERT INTO CLIENTE (NOME)
      VALUES ('RETIFICA DE MOTORES SÃO JOSÉ'),
	         ('101 FESTAS & BAILES'),
			 ('RESTAURANTE TUDO DE BÃO');

GO
-- 10.4 Select Cliente
SELECT * FROM CLIENTE;

-- 11. Ver Triggres na table
EXEC sp_helptrigger @TABNAME = 'CLIENTE';

-- 11.1 Ver Triggres no BD
USE AULA11
SELECT *
  FROM sys.triggers
WHERE is_disabled = 0 or is_disabled = 1 

-- 12. SQLCMD - Exportação de Dados
-- -S . = Servidor | -d curso = banco de dados | -E = Trusted Connection | -Q = query a ser executada | -o = Arquivo para salvar resultados | -W remove espaços em branco | -s"," = delimitar com , | -h-1 = remover a primeira linha de cabeçalho
!!sqlcmd -S . -d Aula11 -E -Q "set nocount on; select * from cliente" -o "g:\root\cliente.txt" -W -s"," -h-1


-- 13. Lista de Exercício Procedimento + Gatilho

-- A) Criar a tabela Usuário
CREATE TABLE USUARIO
(IDUS INT IDENTITY(1,1),
 EMAIL VARCHAR(100),
 SENHA VARCHAR(10),
 PRIMARY KEY(IDUS));

-- B) Criar Chave Estrangeira 
ALTER TABLE USUARIO
ADD COD_CLIENTE INT;

-- C) Criar Relacionamento
ALTER TABLE USUARIO
ADD FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE (CODIGO);


-- C) Criar um gatilho:
-- i. Após a inserção de um novo cliente o gatiho deverá 
--    disparar um procedimento que irá criar/inserir um email e senha para o novo cliente.
--    o email do cliente terá o seguinte formato:
--    seucodigodeCliente@fapbetim.com.br e um senha gerada aleatoriamente para o
--    cliente.
-- ii. Exemplo: E-mail: 1002@fapbetim.com.br Senha: 125269444

-- D) Criar um gatilho
-- i. Quando executar o comando de delete na tabela usuário o gatilho deverá disparar um
-- procedimento para exportar todos os dados da tabela usuario para um arquivo txt