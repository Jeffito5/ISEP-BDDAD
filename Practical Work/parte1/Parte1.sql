-- a
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

-- b
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
