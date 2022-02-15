--Parte 2
-- 2 A)
SELECT DISTINCT c.nome,c.localidade,c.concelho
FROM cliente c
INNER JOIN reserva r ON c.nif=r.nif_CLiente
AND r.numero_Quarto = (SELECT numero_Quarto
                        FROM reserva res
                        WHERE res.nif_Cliente='111111111')
ORDER BY nome;

-- 2 B)
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




