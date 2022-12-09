-- 01. Criar DB
CREATE DATABASE SISTEMAWEB;

-- 02. Seta DB
USE SISTEMAWEB;

-- 03. Table Usuario
CREATE TABLE USUARIO
( IDUS INT AUTO_INCREMENT,
  NOME VARCHAR(50) NOT NULL,
  EMAIL VARCHAR(50) NOT NULL,
  SENHA VARCHAR(06) NOT NULL,
PRIMARY KEY (IDUS));

-- 04. Insert Usuario
INSERT INTO USUARIO
	 VALUES (1,'CRISTIANO MARTINS NUNES','cristiano@fapbetim.com.br','201902'),
			(2,'NOME DO ALUNO','aluno@fapbetim.com.br','123456');
            
-- 05. Select Usuario
SELECT * FROM USUARIO;

-- 06. Table Cliente
CREATE TABLE CLIENTE
( IDCL INT AUTO_INCREMENT,
  NOME VARCHAR(50) NOT NULL,
  EMAIL VARCHAR(50) NOT NULL,
PRIMARY KEY (IDCL));

-- 07. Insert Cliente
INSERT INTO CLIENTE
     VALUES (1,'Fap Betim','fapbetim@fap.com.br'),
			(2,'Fap Divinópolis','fapdivinopolis@fap.com.br');
            
-- 08. Select Cliente
SELECT * FROM CLIENTE;
            