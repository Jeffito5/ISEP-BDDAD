-- Parte 1.a
SELECT id_pedido_intervencao -- todos os pedidos de intervenção alocados a funcionários
FROM Pedido_Intervencao-- que não registaram nenhuma intervenção nas últimas 48h
WHERE id_funcionario IN (
    SELECT fm.id_funcionario -- todos os funcionários que não registaram nenhuma
    FROM Funcionario_Manutencao fm -- intervenção nas últimas 48h
    JOIN Pedido_Intervencao pi ON pi.id_funcionario=fm.id_funcionario
    JOIN Manutencao m ON m.id_pedido_intervencao=pi.id_pedido_intervencao
    WHERE TRUNC (SYSDATE - m.data_manutencao)*24 + TRUNC (MOD ( (SYSDATE - m.data_manutencao) * 24, 24)) < 48
)

INTERSECT

SELECT id_pedido_intervencao -- todos os pedidos de intervenção
FROM Pedido_Intervencao -- que não têm uma manutenção registada
WHERE id_pedido_intervencao NOT IN (
    SELECT id_pedido_intervencao
    FROM Manutencao
);

-- Parte 1.b
SELECT TO_CHAR(r.data_reserva, 'dd-mm-yyyy hh:mm') "data e hora", c.nome,
    CASE
        WHEN q.id_tipo_quarto=4 THEN c.localidade
        ELSE ' '
    END AS "Zona do País", r.data_entrada, r.data_saida
FROM Cliente c
JOIN Reserva r ON r.nif_cliente=c.nif
JOIN Quarto q ON r.numero_quarto=q.numero
WHERE c.nif NOT IN ( -- todos os clientes que fizeram reservas
    SELECT c.nif -- fora de Abril ou Junho deste ano
    FROM Cliente c
    JOIN Reserva r ON r.nif_cliente=c.nif
    WHERE NOT TRUNC(sysdate,'YEAR')=TRUNC(r.data_reserva, 'YEAR') -- não foi este ano
    OR (
    NOT (EXTRACT(MONTH FROM r.data_entrada)=4 AND EXTRACT(MONTH FROM r.data_saida)=4) -- não foi em abril
    AND NOT (EXTRACT(MONTH FROM r.data_entrada)=6 AND EXTRACT(MONTH FROM r.data_saida)=6) -- nem em junho
    )
)
-- a = foi este ano                = TRUNC(sysdate,'YEAR')=TRUNC(r.data_reserva, 'YEAR')
-- b = foi exclusivamente em abril = (EXTRACT(MONTH FROM r.data_entrada)=4 AND EXTRACT(MONTH FROM r.data_saida)=4)
-- c = foi exclusivamente em junho = (EXTRACT(MONTH FROM r.data_entrada)=6 AND EXTRACT(MONTH FROM r.data_saida)=6)
-- todas as reservas fora de abril e junho deste ano = !a || (!b && !c)
ORDER BY c.nome, "data e hora" DESC;



-- Parte 2.a
SELECT DISTINCT c.nome,c.localidade,c.concelho
FROM cliente c
INNER JOIN reserva r ON c.nif=r.nif_CLiente
AND r.numero_Quarto = (SELECT numero_Quarto
                        FROM reserva res
                        WHERE res.nif_Cliente='111111111')
ORDER BY nome;

-- Parte 2.b
SELECT c.id_Funcionario, f.nome
FROM camareira c
JOIN funcionario f ON f.id_Funcionario=c.id_Funcionario
JOIN limpeza_Camareira lc ON lc.id_funcionario=c.id_funcionario
JOIN limpeza l ON l.id_intervencao=lc.id_intervencao
JOIN reserva r ON l.cod_reserva=r.cod_reserva AND
sysdate>=add_months(sysdate, -6)
JOIN Quarto q ON r.numero_quarto=q.numero
WHERE q.numero IN (
    SELECT DISTINCT numero_Quarto
    FROM reserva res
    WHERE ((res.data_Saida) - (res.data_Entrada)) > (SELECT (AVG(res.data_Saida - res.data_Entrada)) "tipo_quarto"
    FROM reserva res
    INNER JOIN quarto q ON res.numero_Quarto=q.numero
    INNER JOIN tipo_De_Quarto tq ON q.id_Tipo_Quarto=tq.id_Tipo)
)



-- Parte 3.a
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
-- Parte 3.b
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
