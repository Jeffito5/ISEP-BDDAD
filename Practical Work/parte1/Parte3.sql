--## PARTE 3 ##
--** a **
SELECT numero,(
SELECT tipo FROM tipo_De_Quarto
WHERE quarto.id_Tipo_Quarto=id_Tipo) AS "Tipo De Quarto" 
FROM quarto
WHERE id_Tipo_Quarto!=1 AND numero IN (
SELECT numero_Quarto FROM reserva 
WHERE id_Estado!=1 
GROUP BY numero_quarto
HAVING count(numero_Quarto)>1); 

 
SELECT count(numero_Quarto) FROM reserva 
WHERE id_Estado!=1 
GROUP BY numero_quarto
HAVING count(numero_Quarto)>1;
--** b **
SELECT nome FROM cliente
WHERE (nif IN (
SELECT nif_Cliente FROM reserva
WHERE numero_Quarto IN (SELECT numero FROM quarto
WHERE id_Tipo_Quarto=4))
AND 
nif IN (
SELECT nif_Cliente FROM reserva 
WHERE data_Entrada BETWEEN (SELECT data_Inicio FROM epoca WHERE id_Epoca=3) AND (SELECT data_Fim FROM epoca WHERE id_Epoca=3))
AND 
nif IN (
SELECT nif_Cliente FROM reserva 
WHERE data_Entrada>=TO_DATE('2018','yyyy'))
AND 
nif IN (
SELECT nif_Cliente FROM reserva 
WHERE cod_Reserva IN (
SELECT cod_Reserva FROM conta 
WHERE num_Conta IN (
SELECT num_Conta FROM conta 
WHERE num_Conta IN (
SELECT num_Conta FROM consumo 
WHERE id_Produto IN (
SELECT id_Produto FROM consumo 
GROUP BY id_Produto
ORDER BY count(*) DESC
FETCH FIRST ROW ONLY)))))
AND 
nif IN (
SELECT nif_Cliente FROM reserva 
WHERE cod_Reserva IN (
SELECT cod_Reserva FROM conta 
WHERE num_Conta IN (
SELECT num_Conta FROM conta 
WHERE num_Conta IN (
SELECT num_Conta FROM consumo 
WHERE id_Produto IN (
SELECT id_Produto FROM (
SELECT id_Produto, ROWNUM rnum FROM (
SELECT id_Produto FROM consumo
GROUP BY id_Produto 
ORDER BY count(*) DESC)
 WHERE ROWNUM <=2
) 
WHERE rnum = 2))))));