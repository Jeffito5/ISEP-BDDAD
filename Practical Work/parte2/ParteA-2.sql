CREATE OR REPLACE PROCEDURE Prc_Check_Out(Row_Reserva Reserva%ROWTYPE)
    IS
    -- cursores e respetivas variáveis iterativas
    CURSOR C_Contas_Consumo IS
        SELECT Id
        FROM Conta_Consumo
        WHERE Id_Reserva = Row_Reserva.Id;
    V_Id_Conta_Consumo_Iteracao Conta_Consumo.Id%TYPE;
    --
    CURSOR C_Linhas_Conta_Consumo
        (V_Id_Conta_Consumo Conta_Consumo.Id%TYPE) IS
        SELECT *
        FROM Linha_Conta_Consumo
        WHERE Id_Conta_Consumo = V_Id_Conta_Consumo;
    Row_Linha_Conta_Consumo     Linha_Conta_Consumo%ROWTYPE;
    --
    CURSOR C_Linhas_Fatura
        (V_Id_Fatura Fatura.Id%TYPE) IS
        SELECT Valor_Consumo
        FROM Linha_Fatura
        WHERE Id_Fatura = V_Id_Fatura;
    V_Valor_Consumo             Linha_Fatura.Valor_Consumo%TYPE;
    -- outras variáveis
    V_Id_Fatura                 Fatura.Id%TYPE;
    V_Preco_Artigo              Artigo_Consumo.Preco%TYPE;
    Dummy                       INTEGER;
    Nao_Tem_Checkin EXCEPTION;
    Ja_Tem_Fatura EXCEPTION ;
BEGIN
    -- verificar se a reserva ainda não fez o checkin
    SELECT COUNT(*)
    INTO Dummy
    FROM Checkin
    WHERE Id_Reserva = Row_Reserva.Id;
    IF Dummy != 1 THEN
        RAISE Nao_Tem_Checkin;
    END IF;
    -- verificar se a reserva já tem uma fatura associada
    SELECT COUNT(*)
    INTO Dummy
    FROM Fatura
    WHERE Id_Reserva = 51;
    IF Dummy = 1 THEN
        RAISE Ja_Tem_Fatura;
    END IF;

    -- ## criar nova fatura
    V_Id_Fatura := Seq_Fatura.Nextval;
    INSERT INTO Fatura(Id, Numero, Data, Id_Cliente,
                       Id_Reserva, Valor_Faturado_Reserva)
    VALUES (V_Id_Fatura, V_Id_Fatura, SYSDATE,
            Row_Reserva.Id_Cliente, Row_Reserva.Id, Row_Reserva.Preco);

    -- ## para linha-conta-consumo de cada conta-consumo da reserva,
    -- criar uma linha-fatura ##
    OPEN C_Contas_Consumo;
    LOOP
        FETCH C_Contas_Consumo INTO V_Id_Conta_Consumo_Iteracao;

        -- a linhas associadas à conta
        OPEN C_Linhas_Conta_Consumo(V_Id_Conta_Consumo_Iteracao);
        LOOP
            FETCH C_Linhas_Conta_Consumo INTO Row_Linha_Conta_Consumo;

            -- o custo do artigo da linha
            SELECT Preco
            INTO V_Preco_Artigo
            FROM Artigo_Consumo
            WHERE Id = Row_Linha_Conta_Consumo.Id_Artigo_Consumo;

            INSERT INTO Linha_Fatura(Id_Fatura, Linha, Id_Conta_Consumo,
                                     Linha_Conta_Consumo, Valor_Consumo)
            VALUES (V_Id_Fatura, Seq_Linha_Fatura.Nextval, V_Id_Conta_Consumo_Iteracao,
                    Row_Linha_Conta_Consumo.Linha, V_Preco_Artigo * Row_Linha_Conta_Consumo.Quantidade);

            EXIT WHEN C_Linhas_Conta_Consumo%NOTFOUND;
        END LOOP;
        CLOSE C_Linhas_Conta_Consumo;

        EXIT WHEN C_Contas_Consumo%NOTFOUND;
    END LOOP;
    CLOSE C_Contas_Consumo;

    -- ## colocar o valor dos consumos na fatura
    OPEN C_Linhas_Fatura(V_Id_Fatura);
    LOOP
        FETCH C_Linhas_Fatura INTO V_Valor_Consumo;

        UPDATE Fatura
        SET Valor_Faturado_Consumo = V_Valor_Consumo
        WHERE Id = V_Id_Fatura;

        EXIT WHEN C_Linhas_Fatura%NOTFOUND;
    END LOOP;
    CLOSE C_Linhas_Fatura;

    -- alterar estado da reserva
    UPDATE Reserva
    SET Id_Estado_Reserva = (
        SELECT Id
        FROM Estado_Reserva
        WHERE Nome LIKE 'Check%out'
    )
    WHERE Id = Row_Reserva.Id;

    -- criar checkout
    INSERT INTO Checkout(Id_Reserva, Data)
    VALUES (Row_Reserva.Id, SYSDATE);

    RETURN;

EXCEPTION
    WHEN Nao_Tem_Checkin THEN
        RAISE_APPLICATION_ERROR(-20000, 'A reserva dada como parâmetro não tem checkin efetuado.');
    WHEN Ja_Tem_Fatura THEN
        RAISE_APPLICATION_ERROR(-20000, 'A reserva dada como parâmetro já tem uma fatura associada.');
END;


-- // apagar checkouts das reservas 51 e 52 --
DELETE
FROM Checkout
WHERE Id_Reserva IN (51, 52);
DELETE
FROM Linha_Fatura
WHERE Id_Fatura IN (
    SELECT Id
    FROM Fatura
    WHERE Id_Reserva IN (51, 52)
);
DELETE
FROM Fatura
WHERE Id_Reserva IN (51, 52);

-- todas as reservas com checkin feito mas sem checkout
SELECT Id,
       Id_Cliente,
       Id_Tipo_Quarto,
       TO_CHAR(Data_Entrada, 'dd/mm/yyyy') "data entrada",
       TO_CHAR(Data_Saida, 'dd/mm/yyyy')   "data saida",
       Nr_Pessoas,
       Preco,
       Id_Estado_Reserva
FROM Reserva
WHERE Id IN (
    SELECT Id_Reserva
    FROM Checkin
)
  AND Id NOT IN (
    SELECT Id_Reserva
    FROM Checkout
);

-- todos os consumos registados nas
-- linhas das contas da reserva 51
SELECT Ac.Id "id artigo", Ac.Preco, Lcc.Quantidade, Lcc.Linha
FROM Artigo_Consumo Ac
JOIN Linha_Conta_Consumo Lcc ON Ac.Id = Lcc.Id_Artigo_Consumo
JOIN Conta_Consumo Cc ON Lcc.Id_Conta_Consumo = Cc.Id
JOIN Reserva R ON R.Id = Cc.Id_Reserva
WHERE R.Id = 51;

-- executar procedimento com reserva 51
DECLARE
    Row_Reserva Reserva%ROWTYPE;
BEGIN
    SELECT *
    INTO Row_Reserva
    FROM Reserva
    WHERE Id = 51;
    Prc_Check_Out(Row_Reserva);
END;
-- verificar fatura resultante
SELECT *
FROM Fatura;
-- verificar estado da reserva 51
SELECT R.Id "ID reserva", Er.Nome "nome do estado", R.Id_Estado_Reserva "ID estado"
FROM Reserva R
JOIN Estado_Reserva Er ON R.Id_Estado_Reserva = Er.Id
WHERE R.Id = 51;
-- verificar o checkout
SELECT *
FROM Checkout
WHERE Id_Reserva = 51;

-- testar exceção
DECLARE
    Row_Reserva Reserva%ROWTYPE;
BEGIN
    SELECT *
    INTO Row_Reserva
    FROM Reserva
    WHERE Id = 131;--reserva não fez o checkin
    Prc_Check_Out(Row_Reserva);--exceção levantada
END;
-- verificar que não foi adicionada uma nova fatura
SELECT *
FROM Fatura;