--eliminar tabelas (eventualmente) existentes

DROP TABLE cd CASCADE CONSTRAINTS PURGE;
DROP TABLE musica CASCADE CONSTRAINTS PURGE;

--criar tabelas

CREATE TABLE cd (
    codCd          INTEGER CONSTRAINT pkCdCod PRIMARY KEY,
    titulo         VARCHAR(40) CONSTRAINT nnCdTitulo NOT NULL,
    dataCompra     DATE,
    valorPago      NUMERIC(5,2),
    localCompra    VARCHAR(20)
);

CREATE TABLE musica (
    nrMusica    INTEGER,
    codCd       INTEGER,    
    titulo      VARCHAR(40) CONSTRAINT nnMusicaTitulo NOT NULL,
    interprete  VARCHAR(30) CONSTRAINT nnMusicaInterprete NOT NULL,
    duracao     NUMERIC(4,2),
    
    CONSTRAINT pkMusicaNrMusicaCodCd  PRIMARY KEY (codCd, nrMusica)
);

ALTER TABLE musica ADD CONSTRAINT fkMusicaCodCd FOREIGN KEY (codCd) REFERENCES cd (codCd);

--preencher tabelas

INSERT INTO cd VALUES (1, 'Punkzilla', TO_DATE('22/Abril/2013','DD/MON/YY'), 55.00 , 'FNAC');
INSERT INTO cd VALUES (2, 'Classic Duets', TO_DATE('21/Maio/2019','DD/MON/YY'), 30.50, 'Worten');
INSERT INTO cd VALUES (3, 'The Wall', TO_DATE('22/Abril/2013','DD/MON/YY'), 25.80, 'FNAC');
INSERT INTO cd VALUES (4, 'Hits 4', TO_DATE('10/Setembro/2019','DD/MON/YY'), 42.30, 'Worten');
INSERT INTO cd VALUES (5, 'Songs of Experience', TO_DATE('1/Janeiro/2020','DD/MON/YY'), 10.99, NULL);
INSERT INTO cd VALUES (6, 'Giesta 2', TO_DATE('15/Junho/2019','DD/MON/YY'), 9.10, NULL);

INSERT INTO musica VALUES (1, 1, 'Dream of Waking', 'AFI', 3.05);
INSERT INTO musica VALUES (2, 1, 'Still', 'Rufio', 3.02);
INSERT INTO musica VALUES (3, 1, 'Behind the Music', 'The Vandals', 2.41);
INSERT INTO musica VALUES (4, 1, 'Why Are You Alive', 'The Vandals', 2.34);
INSERT INTO musica VALUES (5, 1, 'Vandals', 'The Vandals', 4.01);
INSERT INTO musica VALUES (6, 1, 'Days of the Phoenix', 'AFI', 3.28);
INSERT INTO musica VALUES (7, 1, 'Wester', 'AFI', 3.02);

INSERT INTO musica VALUES (1, 2, 'Bizet: Les pécheurs de perles...', 'Orquestra Filarmónica Real', 5.24);
INSERT INTO musica VALUES (2, 2, 'Verdi: Otello/Act 2', 'Orquestra Sinfónica Chicago', 6.47);
INSERT INTO musica VALUES (3, 2, 'Verdi: Aida/Act 4', 'Loring Maazel', 4.38);
INSERT INTO musica VALUES (4, 2, 'Puccini: Turandot', 'Zubin Mehta', 3.08);

INSERT INTO musica VALUES (1, 3, 'In the Flesh', 'Pink Floyd', 3.20);
INSERT INTO musica VALUES (2, 3, 'The Thin Lee', 'Pink Floyd', 2.30);
INSERT INTO musica VALUES (3, 3, 'Mother', 'Pink Floyd', 5.34);
INSERT INTO musica VALUES (4, 3, 'Don''t Leave Me Now', 'Pink Floyd', 4.17);
INSERT INTO musica VALUES (5, 3, 'Young Lust', 'Pink Floyd', 3.33);

INSERT INTO musica VALUES (1, 4, 'It''s Alright(Baby''s Coming Back)', 'Eurythmics', 3.05);
INSERT INTO musica VALUES (2, 4, 'Hounds of Love' , 'Kate Bush', 3.02);
INSERT INTO musica VALUES (3, 4, 'Calling America', 'Electric Light Orchestra', 2.41);
INSERT INTO musica VALUES (4, 4, 'Suspicious Minds', 'Fine Young Cannibals', 2.34);
INSERT INTO musica VALUES (5, 4, 'I''m Your Man', 'Wham!', 3.28);

INSERT INTO musica VALUES (1, 5, 'Love is All We Have Left', 'U2', 2.41);
INSERT INTO musica VALUES (2, 5, 'Lights of Home' , 'U2', 4.16);
INSERT INTO musica VALUES (3, 5, 'You''re the Best Thing About Me', 'U2', 3.45);
INSERT INTO musica VALUES (4, 5, 'Get Out of Your Own Way', 'U2', 3.58);
INSERT INTO musica VALUES (5, 5, 'American Soul', 'U2', 4.21);
INSERT INTO musica VALUES (6, 5, 'Summer of Love', 'U2', 3.24);
INSERT INTO musica VALUES (7, 5, 'Red Flag Day', 'U2', 3.19);
INSERT INTO musica VALUES (8, 5, 'The Showman', 'U2', 3.23);

INSERT INTO musica VALUES (1, 6, 'Valsa em Espiral', 'Miguel Araújo', 3.34);
INSERT INTO musica VALUES (2, 6, '1987' , 'Miguel Araújo', 4.12);
INSERT INTO musica VALUES (3, 6, 'Meio Conto', 'Miguel Araújo', 3.13);
INSERT INTO musica VALUES (4, 6, 'Via Norte', 'Miguel Araújo', 3.35);
INSERT INTO musica VALUES (5, 6, 'Sangemil', 'Miguel Araújo', 4.03);
INSERT INTO musica VALUES (6, 6, 'Lurdes Valsa Lenta', 'Miguel Araújo', 4.41);
INSERT INTO musica VALUES (7, 6, 'Axl Rose', 'Miguel Araújo', 5.03);
INSERT INTO musica VALUES (8, 6, '20% Mais', 'Miguel Araújo', 1.20);
INSERT INTO musica VALUES (9, 6, 'Vândalo', 'Miguel Araújo', 4.45);
INSERT INTO musica VALUES (10, 6, 'Aqui Dali', 'Miguel Araújo', 4.45);

/** guardar em DEFINITIVO as alterações na base de dados, se a opção Autocommit 
    do SQL Developer não estiver ativada **/
-- COMMIT; 
/** 5 
1. Mostrar todos os dados da tabela cd**/    
select * from cd;

/** 2. Mostrar todos os dados da tabela musica **/ 
select * from musica;

/** A.
1. Mostrar o título e a data de compra de todos os CD **/ 
select titulo,dataCompra from cd;

/** 2. Mostrar a data de compra de todos CD **/ 
select dataCompra from cd;

/** 3. Mostrar o resultado da alínea anterior, mas sem registos repetidos **/ 
select distinct dataCompra from cd;

/** 4. Mostrar o código dos CD e os respetivos intérpretes, sem registos repetidos **/ 
select distinct codCd,interprete from musica;

/** 5. Mostrar o resultado anterior com a primeira coluna intitulada "Código do CD" **/ 
select distinct codCd as "Código do CD" ,interprete from musica ;

/** 6. Mostrar o título, o valor pago e o respetivo valor do IVA de todos os CD. O valor do IVA é calculado de
acordo com a seguinte fórmula: valor do IVA = (valor pago * 0.23) / 1.23 **/ 
select titulo,valorPago,((valorPago*0.23)/1.23) as "IVA_PAGO" from cd;

/** B.
1. Mostrar todos os dados das músicas do CD com o código 2 **/
select * from musica where codCd=2;

/** 2. Mostrar todos os dados das músicas que não pertencem ao CD com o código 2 **/
select * from musica where codCd!=2;

/** 3. Mostrar todos os dados das músicas do CD com o código 2 cuja duração seja superior a 5 **/
select * from musica where codCd=2 and duracao>5;

/** 4. Mostrar todos os dados das músicas do CD com o código 2 cuja duração pertença ao intervalo [4,6];  **/
select * from musica where codCd=2 and (duracao>=4 and duracao<=6);

/** 5. Mostrar todos os dados das músicas do CD com o código 2 cuja duração seja inferior a 4 ou superior a 6 **/
select * from musica where codCd=2 and (duracao<4 or duracao>6);

/** 6. Mostrar todos os dados das músicas com o número: 1, 3, 5 ou 6 **/
select * from musica where nrMusica=1 or nrMusica=3 or nrMusica=5 or nrMusica=6;

/** 7. Mostrar todos os dados das músicas com o número diferente de 1, 3, 5 e 6 **/
select * from musica where nrMusica!=1 or nrMusica!=3 or nrMusica!=5 or nrMusica!=6;

/** 8. Mostrar todos os dados das músicas cujo intérprete é uma orquestra **/
select * from musica where interprete like 'Orquestra%';

/** 9. Mostrar todos os dados das músicas cujo nome do intérprete tem a letra Y **/
select * from musica where interprete like '%y%' or interprete like '%Y%';

/** 10. Mostrar todos os dados das músicas cujo nome termina com DAL?, sendo ? qualquer caráter **/
select * from musica where titulo like '%dal_' or titulo like '%Dal_';

/** 11. Mostrar todos os dados das músicas cujo título tem o caráter % **/
select * from musica where titulo like '%%%';

/** 12. Mostrar todos os dados das músicas cujo título é iniciado pela letra B, D ou H **/
select * from musica where titulo like 'B%' or titulo like 'D%' or titulo like 'H%';

/** 13. Mostrar todos os dados dos CD sem o local de compra registado **/
select * from cd where localcompra is null;

/** 14. Mostrar todos os dados dos CD com o local de compra registado. **/
select * from CD where localcompra is not null;

/** C
1. Mostrar os títulos dos CD comprados na FNAC **/
select titulo from cd where localCompra like 'FNAC';

/** 2. Mostrar os títulos dos CD que não foram comprados na FNAC **/
select titulo from cd where localCompra not like 'FNAC' or localCompra is null;

/** D
1. Mostrar os títulos dos CD que não foram comprados na FNAC, por ordem alfabética inversa **/
select titulo from cd where localCompra not like 'FNAC' or localCompra is null ORDER BY titulo DESC;

/** 2. Mostrar o título e a data de compra dos CD, por ordem alfabética do título do CD **/
select titulo, dataCompra from cd ORDER BY titulo ASC;

/** 3. Mostrar o título e a data de compra dos CD, por ordem descendente da data de compra do CD; **/
select titulo, dataCompra from cd ORDER BY dataCompra DESC;

/** 4. Mostrar o título e o local de compra dos CD, por ordem ascendente do local de compra do CD; **/
select titulo, localCompra from cd ORDER BY localCompra ASC;

/** 5. Mostrar o resultado da alínea anterior, mas por ordem descendente do local de compra do CD; **/
select titulo, localCompra from cd ORDER BY localCompra DESC;

/** 6. Mostrar o título, o valor pago e o respetivo valor do IVA dos CD, por ordem decrescente do IVA; **/
select titulo, valorPago,((valorPago*0.23)/1.23) as "IVA_PAGO" from cd ORDER BY IVA_PAGO DESC;

/** 7. Mostrar o título do CD por ordem descendente da data de compra e, no caso da igualdade de datas, por
ordem alfabética do título **/
select titulo from CD ORDER BY datacompra DESC,titulo ASC;

/** E
1. Mostrar a quantidade de músicas **/
select COUNT(*) from musica;

/** 2. Mostrar a quantidade de locais de compra distintos **/
select COUNT(DISTINCT localCompra) from cd;

/** 3. Mostrar o total gasto com a compra de todos os CD, o maior e o menor valor pago por um CD **/
select SUM(valorPago),MAX(valorPago),MIN(valorPago) from cd;

/** 4. Mostrar a média da duração de todas as músicas **/
select AVG(duracao) from musica;

/** 5. Mostrar o total do valor pago na FNAC **/
select SUM(valorPago)from cd where localCompra like 'FNAC' ;

/** 6. Mostrar a diferença entre o maior e o menor valor pago na FNAC **/
select  (MAX (valorpago)-MIN (valorPago)) from cd where localCompra like 'FNAC';

