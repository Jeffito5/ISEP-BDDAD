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

INSERT INTO musica VALUES (1, 2, 'Bizet: Les p�cheurs de perles...', 'Orquestra Filarm�nica Real', 5.24);
INSERT INTO musica VALUES (2, 2, 'Verdi: Otello/Act 2', 'Orquestra Sinf�nica Chicago', 6.47);
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

INSERT INTO musica VALUES (1, 6, 'Valsa em Espiral', 'Miguel Ara�jo', 3.34);
INSERT INTO musica VALUES (2, 6, '1987' , 'Miguel Ara�jo', 4.12);
INSERT INTO musica VALUES (3, 6, 'Meio Conto', 'Miguel Ara�jo', 3.13);
INSERT INTO musica VALUES (4, 6, 'Via Norte', 'Miguel Ara�jo', 3.35);
INSERT INTO musica VALUES (5, 6, 'Sangemil', 'Miguel Ara�jo', 4.03);
INSERT INTO musica VALUES (6, 6, 'Lurdes Valsa Lenta', 'Miguel Ara�jo', 4.41);
INSERT INTO musica VALUES (7, 6, 'Axl Rose', 'Miguel Ara�jo', 5.03);
INSERT INTO musica VALUES (8, 6, '20% Mais', 'Miguel Ara�jo', 1.20);
INSERT INTO musica VALUES (9, 6, 'V�ndalo', 'Miguel Ara�jo', 4.45);
INSERT INTO musica VALUES (10, 6, 'Aqui Dali', 'Miguel Ara�jo', 4.45);

/** guardar em DEFINITIVO as altera��es na base de dados, se a op��o Autocommit 
    do SQL Developer n�o estiver ativada **/
-- COMMIT; 
/** 5 
1. Mostrar todos os dados da tabela cd**/    
select * from cd;

/** 2. Mostrar todos os dados da tabela musica **/ 
select * from musica;

/** A.
1. Mostrar o t�tulo e a data de compra de todos os CD **/ 
select titulo,dataCompra from cd;

/** 2. Mostrar a data de compra de todos CD **/ 
select dataCompra from cd;

/** 3. Mostrar o resultado da al�nea anterior, mas sem registos repetidos **/ 
select distinct dataCompra from cd;

/** 4. Mostrar o c�digo dos CD e os respetivos int�rpretes, sem registos repetidos **/ 
select distinct codCd,interprete from musica;

/** 5. Mostrar o resultado anterior com a primeira coluna intitulada "C�digo do CD" **/ 
select distinct codCd as "C�digo do CD" ,interprete from musica ;

/** 6. Mostrar o t�tulo, o valor pago e o respetivo valor do IVA de todos os CD. O valor do IVA � calculado de
acordo com a seguinte f�rmula: valor do IVA = (valor pago * 0.23) / 1.23 **/ 
select titulo,valorPago,((valorPago*0.23)/1.23) as "IVA_PAGO" from cd;

/** B.
1. Mostrar todos os dados das m�sicas do CD com o c�digo 2 **/
select * from musica where codCd=2;

/** 2. Mostrar todos os dados das m�sicas que n�o pertencem ao CD com o c�digo 2 **/
select * from musica where codCd!=2;

/** 3. Mostrar todos os dados das m�sicas do CD com o c�digo 2 cuja dura��o seja superior a 5 **/
select * from musica where codCd=2 and duracao>5;

/** 4. Mostrar todos os dados das m�sicas do CD com o c�digo 2 cuja dura��o perten�a ao intervalo [4,6];  **/
select * from musica where codCd=2 and (duracao>=4 and duracao<=6);

/** 5. Mostrar todos os dados das m�sicas do CD com o c�digo 2 cuja dura��o seja inferior a 4 ou superior a 6 **/
select * from musica where codCd=2 and (duracao<4 or duracao>6);

/** 6. Mostrar todos os dados das m�sicas com o n�mero: 1, 3, 5 ou 6 **/
select * from musica where nrMusica=1 or nrMusica=3 or nrMusica=5 or nrMusica=6;

/** 7. Mostrar todos os dados das m�sicas com o n�mero diferente de 1, 3, 5 e 6 **/
select * from musica where nrMusica!=1 or nrMusica!=3 or nrMusica!=5 or nrMusica!=6;

/** 8. Mostrar todos os dados das m�sicas cujo int�rprete � uma orquestra **/
select * from musica where interprete like 'Orquestra%';

/** 9. Mostrar todos os dados das m�sicas cujo nome do int�rprete tem a letra Y **/
select * from musica where interprete like '%y%' or interprete like '%Y%';

/** 10. Mostrar todos os dados das m�sicas cujo nome termina com DAL?, sendo ? qualquer car�ter **/
select * from musica where titulo like '%dal_' or titulo like '%Dal_';

/** 11. Mostrar todos os dados das m�sicas cujo t�tulo tem o car�ter % **/
select * from musica where titulo like '%%%';

/** 12. Mostrar todos os dados das m�sicas cujo t�tulo � iniciado pela letra B, D ou H **/
select * from musica where titulo like 'B%' or titulo like 'D%' or titulo like 'H%';

/** 13. Mostrar todos os dados dos CD sem o local de compra registado **/
select * from cd where localcompra is null;

/** 14. Mostrar todos os dados dos CD com o local de compra registado. **/
select * from CD where localcompra is not null;

/** C
1. Mostrar os t�tulos dos CD comprados na FNAC **/
select titulo from cd where localCompra like 'FNAC';

/** 2. Mostrar os t�tulos dos CD que n�o foram comprados na FNAC **/
select titulo from cd where localCompra not like 'FNAC' or localCompra is null;

/** D
1. Mostrar os t�tulos dos CD que n�o foram comprados na FNAC, por ordem alfab�tica inversa **/
select titulo from cd where localCompra not like 'FNAC' or localCompra is null ORDER BY titulo DESC;

/** 2. Mostrar o t�tulo e a data de compra dos CD, por ordem alfab�tica do t�tulo do CD **/
select titulo, dataCompra from cd ORDER BY titulo ASC;

/** 3. Mostrar o t�tulo e a data de compra dos CD, por ordem descendente da data de compra do CD; **/
select titulo, dataCompra from cd ORDER BY dataCompra DESC;

/** 4. Mostrar o t�tulo e o local de compra dos CD, por ordem ascendente do local de compra do CD; **/
select titulo, localCompra from cd ORDER BY localCompra ASC;

/** 5. Mostrar o resultado da al�nea anterior, mas por ordem descendente do local de compra do CD; **/
select titulo, localCompra from cd ORDER BY localCompra DESC;

/** 6. Mostrar o t�tulo, o valor pago e o respetivo valor do IVA dos CD, por ordem decrescente do IVA; **/
select titulo, valorPago,((valorPago*0.23)/1.23) as "IVA_PAGO" from cd ORDER BY IVA_PAGO DESC;

/** 7. Mostrar o t�tulo do CD por ordem descendente da data de compra e, no caso da igualdade de datas, por
ordem alfab�tica do t�tulo **/
select titulo from CD ORDER BY datacompra DESC,titulo ASC;

/** E
1. Mostrar a quantidade de m�sicas **/
select COUNT(*) from musica;

/** 2. Mostrar a quantidade de locais de compra distintos **/
select COUNT(DISTINCT localCompra) from cd;

/** 3. Mostrar o total gasto com a compra de todos os CD, o maior e o menor valor pago por um CD **/
select SUM(valorPago),MAX(valorPago),MIN(valorPago) from cd;

/** 4. Mostrar a m�dia da dura��o de todas as m�sicas **/
select AVG(duracao) from musica;

/** 5. Mostrar o total do valor pago na FNAC **/
select SUM(valorPago)from cd where localCompra like 'FNAC' ;

/** 6. Mostrar a diferen�a entre o maior e o menor valor pago na FNAC **/
select  (MAX (valorpago)-MIN (valorPago)) from cd where localCompra like 'FNAC';

