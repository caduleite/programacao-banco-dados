CREATE DATABASE RHCOMPUTACAO;
-- 6) A.
select * from colaborador 
order by NOMECOLABORADOR;

-- 6) B.
select * from funcao
order by idf desc;

-- 6) C. 
select * from setor;

-- 6) D.
SELECT MAX(CHAPA), NOMECOLABORADOR, SEXO 
  FROM colaborador;

-- 6) E.
SELECT IDS, NOMESETOR
from setor
WHERE NOMESETOR LIKE '%O';

-- 6) F.
select CHAPA, NOMECOLABORADOR, SEXO, SALARIO
from colaborador
where SALARIO
and SEXO = 'F'
order by NOMECOLABORADOR ASC, SALARIO;

-- 6) G. N.CHAPA - > 427 / SALARIO - > 1.45
select CHAPA, NOMECOLABORADOR, SEXO, DTNASC, SALARIO
from colaborador 
where NOMECOLABORADOR = 'CARLOS EDUARDO DOS SANTOS LEITE'; 
-------------------------------------------------------------
UPDATE colaborador
SET NOMECOLABORADOR =  'CARLOS EDUARDO DOS SANTOS LEITE',
DTNASC = '1999-06-05'
where CHAPA = 427;

-- 6) H.
select COUNT(CHAPA) AS QNT , SEXO
from colaborador 
group by SEXO;


-- 6) K.
select * 
from colaborador, FUNCAO
where colaborador.IDF = FUNCAO.IDF
order by NOMECOLABORADOR, NOMEFUNCAO;

-- 6) M.
select S.IDS, S.NOMESETOR, AVG(C.SALARIO), COUNT (C.CHAPA) AS QNT_COL
from setor S, FUNCAO F, colaborador
where S.IDS = F.IDS
and F.IDF = C.IDF
group by S.IDS, S.NOMESETOR
order by MEDIA, S.NOMESETOR;



-- 6) O.
select  CODIGO, NOMEDEP,SEXO, DTNASC
from dependente
where SEXO in ('F, M')
and year (DTNASC) between '2013' AND '2017'
order by year (DTNASC), NOMEDEP

-- 6) Q.
create view V_setor_colaborador 
as
select S.IDS, SNOMESETOR, F.IDF, FNOMEFUNCAO, C.CHAPA, C.NOMECOLABORADOR, C.DTAMISSAo, C.DTEMISSAO, CIDST, SC.NOMESTATUS
from SETOR S, FUNCAO F, colaborador C, statuscolaborador SC
where S,IDS = F.IDS 
and F.IDF = C.IDF
and C.IDST = SC.IDST;









