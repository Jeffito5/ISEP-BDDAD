-- ** inserir dados nas tabelas **

-- ## tabela Marinheiro ##
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(22, 'Dustin',  7, TO_DATE('1975-09-13','yyyy-mm-dd'));
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(29, 'Brutus',  1, TO_DATE('1987-06-02','yyyy-mm-dd'));
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(31, 'Lubber',  8, TO_DATE('1965-03-17','yyyy-mm-dd'));
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(32, 'Andy',    8, TO_DATE('1995-01-01','yyyy-mm-dd'));
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(58, 'Rusty',  10, TO_DATE('1985-07-02','yyyy-mm-dd'));
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(64, 'Horácio', 7, TO_DATE('1985-03-17','yyyy-mm-dd'));
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(71, 'Zorba',  10, TO_DATE('2004-02-19','yyyy-mm-dd'));
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(74, 'Horácio', 9, TO_DATE('1985-02-22','yyyy-mm-dd'));
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(85, 'Art',     3, TO_DATE('1995-09-05','yyyy-mm-dd'));
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(95, 'Bob',     3, TO_DATE('1957-08-12','yyyy-mm-dd'));
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(13, 'Popeye',  3, TO_DATE('1998-06-23','yyyy-mm-dd'));
INSERT INTO marinheiro(idMarinheiro, nome, classificacao, dataNascimento) VALUES(44, 'Haddock', 3, TO_DATE('1957-05-31','yyyy-mm-dd'));

-- ## tabela Barco ##
INSERT INTO barco(idBarco, designacao, cor) VALUES(101, 'Interlake', 'azul');
INSERT INTO barco(idBarco, designacao, cor) VALUES(102, 'Interlake', 'vermelho');
INSERT INTO barco(idBarco, designacao, cor) VALUES(103, 'Clipper',   'verde');
INSERT INTO barco(idBarco, designacao, cor) VALUES(104, 'Marine',    'vermelho');

-- ## tabela Reserva ##
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(22, 101, TO_DATE('2019/10/10','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(22, 102, TO_DATE('2019/10/10','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(22, 103, TO_DATE('2019/08/10','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(22, 104, TO_DATE('2019/07/10','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(31, 102, TO_DATE('2019/10/11','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(31, 103, TO_DATE('2019/06/11','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(31, 104, TO_DATE('2019/12/11','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(64, 101, TO_DATE('2019/05/09','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(64, 102, TO_DATE('2019/08/09','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(64, 102, TO_DATE('2019/09/09','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(64, 102, TO_DATE('2019/10/09','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(74, 103, TO_DATE('2019/08/09','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(44, 101, TO_DATE('2020/05/09','yyyy/mm/dd'));
INSERT INTO reserva(idMarinheiro, idBarco, data) VALUES(44, 101, TO_DATE('2020/09/09','yyyy/mm/dd'));

-- ** guardar em DEFINITIVO as alterações na base de dados, se a opção Autocommit do SQL Developer não estiver ativada **
-- COMMIT;
/** 5
1. **/
/** a. **/
SELECT idMarinheiro,nome,classificacao
FROM marinheiro
WHERE classificacao=(SELECT MAX(classificacao)
                        FROM marinheiro) 
ORDER BY idMarinheiro ASC;

/** b. **/
SELECT idMarinheiro,nome,classificacao
FROM marinheiro  
ORDER BY classificacao DESC
FETCH FIRST 2 ROWS ONLY;

/** c. **/
SELECT idMarinheiro,nome,classificacao
FROM marinheiro
WHERE classificacao=(SELECT MAX(classificacao)
                        FROM marinheiro)
GROUP BY idMarinheiro, nome, classificacao
ORDER BY idMarinheiro ASC;

/** 2. **/
/** a.**/
SELECT idMarinheiro, nome, classificacao,
CASE
    WHEN classificacao > (SELECT AVG(classificacao) FROM Marinheiro) THEN 'Superior à média'
    ELSE ''
END "OBS"
FROM Marinheiro

/** b. **/
SELECT idMarinheiro, nome, classificacao,
CASE
    WHEN classificacao > (SELECT AVG(classificacao) FROM Marinheiro) THEN 'Superior à média'
    ELSE ''
END "OBS"
FROM Marinheiro
GROUP BY idMarinheiro, nome, classificacao;

/** c. **/
WITH
obs AS (
SELECT CASE
    WHEN classificacao > (SELECT AVG(classificacao) FROM Marinheiro) THEN 'Superior à média'
    ELSE ''
END "OBS", idMarinheiro
FROM Marinheiro
)

SELECT m.idMarinheiro, m.nome,m.classificacao, obs.obs
FROM Marinheiro m, obs
WHERE m.idMarinheiro = obs.idMarinheiro
GROUP BY m.idMarinheiro, m.nome, m.classificacao, obs.obs
ORDER BY idMarinheiro ASC;

/** 3. **/
/** a. **/
SELECT idMarinheiro,nome
FROM marinheiro 
WHERE idMarinheiro NOT IN (SELECT idMarinheiro
                            FROM reserva)
ORDER BY idMarinheiro;

/** b. **/
SELECT idMarinheiro, nome
FROM Marinheiro
WHERE idMarinheiro = ANY (
    SELECT idMarinheiro
    FROM Marinheiro 
    WHERE idMarinheiro NOT IN (SELECT idMarinheiro
                                FROM reserva));

/** c. **/
SELECT idMarinheiro, nome
FROM Marinheiro
MINUS
SELECT idMarinheiro, nome
FROM Marinheiro 
WHERE idMarinheiro IN (
    SELECT idMarinheiro
    FROM reserva
);

/** d. **/
SELECT DISTINCT m.idMarinheiro, m.nome
FROM Marinheiro m
LEFT JOIN Reserva r ON r.idMarinheiro=m.idMarinheiro
MINUS
SELECT DISTINCT m.idMarinheiro, m.nome
FROM Marinheiro m
JOIN Reserva r ON r.idMarinheiro=m.idMarinheiro;

/** 4. **/
SELECT DISTINCT data FROM reserva
WHERE data IN (
SELECT data FROM reserva
GROUP BY data
HAVING count(data)=(
SELECT MAX(count(data)) FROM reserva
GROUP BY data));

/** 5. **/
WITH
marinheiros_com_barcos_vermelhos_ou_verdes AS (
    SELECT DISTINCT m.idMarinheiro AS id, m.nome as nome
    FROM Marinheiro m, Reserva r, Barco b
    WHERE m.idMarinheiro=r.idMarinheiro AND r.idBarco=b.idBarco AND b.cor IN ('vermelho', 'verde')
)
SELECT COUNT(*)
FROM marinheiros_com_barcos_vermelhos_ou_verdes;