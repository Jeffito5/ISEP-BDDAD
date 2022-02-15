--sequences
--select * from user_sequences;
DECLARE
    V_Cmd VARCHAR(2000);
BEGIN
    FOR R IN (SELECT Sequence_Name FROM User_Sequences WHERE Sequence_Name NOT LIKE 'ISEQ%')
        LOOP
            V_Cmd := 'drop sequence ' || R.Sequence_Name;
            EXECUTE IMMEDIATE (V_Cmd);
        END LOOP;
    --
    FOR R IN (SELECT Table_Name FROM User_Tables)
        LOOP
            V_Cmd := 'create sequence seq_' || R.Table_Name;
            EXECUTE IMMEDIATE (V_Cmd);
        END LOOP;
END;
/

--Pa�ses
DECLARE
    V_Count INT         := 3;
    V_Label VARCHAR(50) := 'Pa�s';
BEGIN
    FOR I IN 1..V_Count
        LOOP
            INSERT INTO Pais(Id, Nome) VALUES (Seq_Pais.Nextval, V_Label || ' ' || I);
        END LOOP;
END;
/

--Distritos
DECLARE
    V_Count INT         := 5;
    V_Label VARCHAR(50) := 'Distrito';
BEGIN
    FOR R IN (SELECT Id, Nome FROM Pais)
        LOOP
            FOR I IN 1..V_Count
                LOOP
                    INSERT INTO Distrito(Id, Id_Pais, Nome)
                    VALUES (Seq_Distrito.Nextval, R.Id, V_Label || ' ' || I || ' ' || R.Nome);
                END LOOP;
        END LOOP;
END;
/

--Concelhos
DECLARE
    V_Count INT         := 5;
    V_Label VARCHAR(50) := 'Concelho';
BEGIN
    FOR R IN (SELECT Id, Nome FROM Distrito)
        LOOP
            FOR I IN 1..V_Count
                LOOP
                    INSERT INTO Concelho(Id, Id_Distrito, Nome)
                    VALUES (Seq_Concelho.Nextval, R.Id, V_Label || ' ' || I || ' ' || R.Nome);
                END LOOP;
        END LOOP;
END;
/

--Localidades
DECLARE
    V_Count INT         := 5;
    V_Label VARCHAR(50) := 'Localidade';
BEGIN
    FOR R IN (SELECT Id, Nome FROM Concelho)
        LOOP
            FOR I IN 1..V_Count
                LOOP
                    INSERT INTO Localidade(Id, Id_Concelho, Nome)
                    VALUES (Seq_Localidade.Nextval, R.Id, V_Label || ' ' || I || ' ' || R.Nome);
                END LOOP;
        END LOOP;
END;
/

--C�digos postais
DECLARE
    V_Count INT         := 5;
    V_Label VARCHAR(20) := 'C�digo Postal';
BEGIN
    FOR R IN (SELECT Id, Nome FROM Localidade)
        LOOP
            FOR I IN 1..V_Count
                LOOP
                    INSERT INTO Codigo_Postal(Id, Id_Localidade, Designacao_Postal)
                    VALUES (Seq_Codigo_Postal.Nextval, R.Id, V_Label || ' ' || I || ' ' || R.Nome);
                END LOOP;
        END LOOP;
END;
/

--Andares
DECLARE
    V_Count INT         := 3;
    V_Label VARCHAR(50) := 'Andar';
BEGIN
    FOR I IN 1..V_Count
        LOOP
            INSERT INTO Andar(Id, Nr_Andar, Nome) VALUES (Seq_Andar.Nextval, I, V_Label || ' ' || I);
        END LOOP;
END;
/

--Tipos de quarto
DECLARE
    V_Count INT         := 3;
    V_Label VARCHAR(50) := 'Tipo quarto';
BEGIN
    FOR I IN 1..V_Count
        LOOP
            INSERT INTO Tipo_Quarto(Id, Nome) VALUES (Seq_Tipo_Quarto.Nextval, V_Label || ' ' || I);
        END LOOP;
END;
/

--Quartos
DECLARE
    V_Count          INT         := 7;
    V_Label          VARCHAR(20) := 'Quarto';
    CURSOR C_Tq IS SELECT Id
                   FROM Tipo_Quarto
                   ORDER BY 1;
    R_Tq             C_Tq%ROWTYPE;
    V_Id_Tipo_Quarto Tipo_Quarto.Id%TYPE;
    V_Lotacao        INT;
BEGIN
    FOR R IN (SELECT Id, Nome FROM Andar)
        LOOP
            FOR I IN 1..V_Count
                LOOP
                    IF NOT C_Tq%ISOPEN THEN
                        OPEN C_Tq;
                    END IF;
                    FETCH C_Tq INTO R_Tq;
                    IF C_Tq%FOUND THEN
                        V_Id_Tipo_Quarto := R_Tq.Id;
                    ELSE
                        CLOSE C_Tq;
                        OPEN C_Tq;
                        FETCH C_Tq INTO R_Tq;
                        V_Id_Tipo_Quarto := R_Tq.Id;
                    END IF;
                    --
                    V_Lotacao := MOD(R.Id * I, 3) + 2;
                    INSERT INTO Quarto(Id, Id_Andar, Nr_Quarto, Id_Tipo_Quarto, Lotacao_Maxima)
                    VALUES (Seq_Quarto.Nextval, R.Id, I, V_Id_Tipo_Quarto, V_Lotacao);
                END LOOP;
        END LOOP;
END;
/

--Clientes
DECLARE
    V_Count INT         := 500;
    V_Label VARCHAR(50) := 'Cliente';
    CURSOR C IS SELECT Id
                FROM Localidade
                ORDER BY 1;
    R       C%ROWTYPE;
BEGIN
    FOR I IN 1..V_Count
        LOOP
            IF NOT C%ISOPEN THEN
                OPEN C;
            END IF;
            FETCH C INTO R;
            IF NOT C%FOUND THEN
                CLOSE C;
                OPEN C;
                FETCH C INTO R;
            END IF;
            --
            INSERT INTO Cliente(Id, Nome, Nif, Id_Localidade, Email, Telefone)
            VALUES (Seq_Cliente.Nextval, V_Label || ' ' || I, I, R.Id, NULL, NULL);
        END LOOP;
END;
/

--Tipos de funcion�rios
INSERT INTO Tipo_Funcionario(Id, Nome)
VALUES (1, 'Manuten��o');
INSERT INTO Tipo_Funcionario(Id, Nome)
VALUES (2, 'Camareira');
INSERT INTO Tipo_Funcionario(Id, Nome)
VALUES (3, 'Bar');
INSERT INTO Tipo_Funcionario(Id, Nome)
VALUES (4, 'Rece��o');

--Funcion�rios
DECLARE
    V_Count INT         := 10;
    V_Label VARCHAR(50) := 'Funcion�rio';
BEGIN
    FOR R IN (SELECT * FROM Tipo_Funcionario ORDER BY 1)
        LOOP
            FOR I IN 1..V_Count
                LOOP
                    INSERT INTO Funcionario(Id, Nif, Nome, Id_Tipo_Funcionario)
                    VALUES (Seq_Funcionario.Nextval, Seq_Funcionario.Currval, R.Nome || ' ' || I, R.Id);
                END LOOP;
        END LOOP;
END;
/

--Funcion�rios de manuten��o.
DECLARE
    V_Id_Responsavel Funcionario.Id%TYPE;
BEGIN
    FOR R IN (SELECT * FROM Funcionario WHERE Id_Tipo_Funcionario = 1)
        LOOP
            INSERT INTO Funcionario_Manutencao(Id, Id_Responsavel, Telefone) VALUES (R.Id, V_Id_Responsavel, R.Id);
            V_Id_Responsavel := R.Id;
        END LOOP;
END;
/

--Camareiras.
BEGIN
    FOR R IN (SELECT * FROM Funcionario WHERE Id_Tipo_Funcionario = 2)
        LOOP
            INSERT INTO Camareira(Id) VALUES (R.Id);
        END LOOP;
END;
/

--Artigos de consumo
DECLARE
    V_Count INT         := 30;
    V_Label VARCHAR(50) := 'Artigo consumo';
    V_Preco NUMBER;
BEGIN
    FOR I IN 1..V_Count
        LOOP
            INSERT INTO Artigo_Consumo(Id, Nome, Preco)
            VALUES (Seq_Artigo_Consumo.Nextval, V_Label || ' ' || I, MOD(V_Count, I) + 1);
        END LOOP;
END;
/

--Modos de pagamento
INSERT INTO Modo_Pagamento(Id, Nome)
VALUES (1, 'Numer�rio');
INSERT INTO Modo_Pagamento(Id, Nome)
VALUES (2, 'Cheque');
INSERT INTO Modo_Pagamento(Id, Nome)
VALUES (3, 'Cart�o de cr�dito');
INSERT INTO Modo_Pagamento(Id, Nome)
VALUES (4, 'Cart�o de d�bito');

--Estados reserva
INSERT INTO Estado_Reserva(Id, Nome)
VALUES (1, 'Aberta');
INSERT INTO Estado_Reserva(Id, Nome)
VALUES (2, 'Check-in');
INSERT INTO Estado_Reserva(Id, Nome)
VALUES (3, 'Check-out');
INSERT INTO Estado_Reserva(Id, Nome)
VALUES (4, 'Cancelada');
INSERT INTO Estado_Reserva(Id, Nome)
VALUES (5, 'Finalizada');

DECLARE
    V_Count INT         := 30;
    V_Label VARCHAR(50) := 'Artigo consumo';
    V_Preco NUMBER;
BEGIN
    FOR I IN 1..V_Count
        LOOP
            INSERT INTO Artigo_Consumo(Id, Nome, Preco)
            VALUES (Seq_Artigo_Consumo.Nextval, V_Label || ' ' || I, MOD(V_Count, I) + 1);
        END LOOP;
END;
/

--epocas 2019
INSERT INTO Epoca(Id, Nome, Data_Ini, Data_Fim)
VALUES (1, 'Epoca 1', TO_DATE('2019-01-01', 'yyyy-mm-dd'), TO_DATE('2019-03-31', 'yyyy-mm-dd'));
INSERT INTO Epoca(Id, Nome, Data_Ini, Data_Fim)
VALUES (2, 'Epoca 2', TO_DATE('2019-04-01', 'yyyy-mm-dd'), TO_DATE('2019-06-30', 'yyyy-mm-dd'));
INSERT INTO Epoca(Id, Nome, Data_Ini, Data_Fim)
VALUES (3, 'Epoca 3', TO_DATE('2019-07-01', 'yyyy-mm-dd'), TO_DATE('2019-08-31', 'yyyy-mm-dd'));
INSERT INTO Epoca(Id, Nome, Data_Ini, Data_Fim)
VALUES (4, 'Epoca 4', TO_DATE('2019-09-01', 'yyyy-mm-dd'), TO_DATE('2019-12-31', 'yyyy-mm-dd'));

--�pocas 2020
INSERT INTO Epoca(Id, Nome, Data_Ini, Data_Fim)
VALUES (5, '�poca 5', TO_DATE('2020-01-01', 'yyyy-mm-dd'), TO_DATE('2020-03-31', 'yyyy-mm-dd'));
INSERT INTO Epoca(Id, Nome, Data_Ini, Data_Fim)
VALUES (6, '�poca 6', TO_DATE('2020-04-01', 'yyyy-mm-dd'), TO_DATE('2020-06-30', 'yyyy-mm-dd'));
INSERT INTO Epoca(Id, Nome, Data_Ini, Data_Fim)
VALUES (7, '�poca 7', TO_DATE('2020-07-01', 'yyyy-mm-dd'), TO_DATE('2020-08-31', 'yyyy-mm-dd'));
INSERT INTO Epoca(Id, Nome, Data_Ini, Data_Fim)
VALUES (8, '�poca 8', TO_DATE('2020-09-01', 'yyyy-mm-dd'), TO_DATE('2020-12-31', 'yyyy-mm-dd'));

--Pre�os por �poca e tipo de quarto
DECLARE
    V_Preco NUMBER;
BEGIN
    FOR R1 IN (SELECT * FROM Epoca)
        LOOP
            FOR R2 IN (SELECT * FROM Tipo_Quarto)
                LOOP
                    V_Preco := MOD(R1.Id * R2.Id * 10, 20) + 30;
                    INSERT INTO Preco_Epoca_Tipo_Quarto(Id_Epoca, Id_Tipo_Quarto, Preco) VALUES (R1.Id, R2.Id, V_Preco);
                END LOOP;
        END LOOP;
END;
/

INSERT INTO Tipo_Intervencao(Id, Nome)
VALUES (1, 'Limpeza');
INSERT INTO Tipo_Intervencao(Id, Nome)
VALUES (2, 'Manuten��o');

--reservas (N por cada dia, de 1-1-2019 at� 31-12-2020)
DECLARE
    K_Count          INT         := 10;
    V_Count          INT;
    V_Label          VARCHAR(50) := 'Reserva';
    V_Di             DATE;
    V_Df             DATE;
    V_D              DATE;
    V_Id_Cliente     Cliente.Id%TYPE;
    V_Step           INT         := 7; --de K em K reservas escolho efetivamente um cliente.
    V_Id_Reserva     INT;
    V_Nr_Pessoas     INT;
    V_Id_Tipo_Quarto INT;
    V_Dias           INT;
    V_Lag_Dias       INT;
    V_Preco          NUMBER;
BEGIN
    V_Di := TO_DATE('2019-01-01', 'yyyy-mm-dd');
    V_Df := TO_DATE('2020-12-31', 'yyyy-mm-dd');
    V_D := V_Di;
    WHILE V_D < V_Df
        LOOP
            FOR I IN 1..K_Count
                LOOP
                    V_Id_Reserva := Seq_Reserva.Nextval;
                    --gerar alguns clientes
                    SELECT COUNT(0) INTO V_Count FROM Cliente;
                    V_Id_Cliente := MOD(V_Count, V_Id_Reserva - (TRUNC(V_Id_Reserva / V_Count)) * V_Count);
                    IF V_Id_Cliente <= 10 THEN V_Id_Cliente := NULL; END IF;
                    --tipo de quarto � obtido ciclicamente
                    SELECT COUNT(0) INTO V_Count FROM Tipo_Quarto;
                    V_Id_Tipo_Quarto := MOD(V_Id_Reserva, V_Count) + 1;
                    --N� de dias da reserva � obtido ciclicamente.
                    V_Dias := MOD(V_Id_Reserva, 3) + 1;
                    V_Lag_Dias := MOD(V_Id_Reserva, 30);
                    --N� de pessoas(1 at� 4)
                    V_Nr_Pessoas := MOD(V_Id_Reserva, 4) + 1;
                    --Pre�o
                    BEGIN
                        SELECT A.Preco
                        INTO V_Preco
                        FROM Preco_Epoca_Tipo_Quarto A
                        JOIN Epoca B ON (A.Id_Epoca = B.Id)
                        WHERE Id_Tipo_Quarto = V_Id_Tipo_Quarto
                          AND V_D + V_Lag_Dias BETWEEN B.Data_Ini AND B.Data_Fim;
                    EXCEPTION
                        WHEN OTHERS THEN
                            V_Preco := 35;
                    END;
                    --
                    INSERT INTO Reserva(Id, Id_Cliente, Nome, Id_Tipo_Quarto, Data, Data_Entrada, Data_Saida,
                                        Nr_Pessoas, Preco, Id_Estado_Reserva)
                    VALUES (V_Id_Reserva, V_Id_Cliente, 'Cliente reserva ' || V_Id_Reserva, V_Id_Tipo_Quarto, V_D,
                            V_D + V_Lag_Dias, V_D + V_Lag_Dias + V_Dias, V_Nr_Pessoas, V_Preco * V_Dias, 1);
                END LOOP;
            ----
            V_D := V_D + 1;
        END LOOP;
END;
/

--Checkins
CREATE OR REPLACE FUNCTION Isquartoindisponivel(P_Id_Quarto INT, P_Data DATE) RETURN BOOLEAN
    IS
    V_Count INT;
BEGIN
    SELECT COUNT(*)
    INTO V_Count
    FROM Checkin A
    LEFT JOIN Checkout B ON (A.Id_Reserva = B.Id_Reserva)
    WHERE A.Id_Quarto = P_Id_Quarto
      AND ((A.Data >= TRUNC(P_Data) AND B.Data IS NULL) --tenho checkin mas n?o tenho checkout
        OR
           (A.Data <= TRUNC(P_Data) AND B.Data >= TRUNC(P_Data)));
    RETURN (V_Count > 0);
END;
/

DECLARE
    V_Data_Ref DATE := TO_DATE('2020-11-30', 'yyyy-mm-dd');
    CURSOR Ca IS SELECT *
                 FROM Artigo_Consumo
                 ORDER BY 1;
    Ra         Ca%ROWTYPE;
    CURSOR Cc IS SELECT *
                 FROM Camareira
                 ORDER BY 1;
    Rc         Cc%ROWTYPE;
BEGIN
    FOR R1 IN (SELECT * FROM Reserva WHERE Data_Entrada < V_Data_Ref AND Data_Saida <= V_Data_Ref)
        LOOP
            FOR R2 IN (SELECT * FROM Quarto WHERE Id_Tipo_Quarto = R1.Id_Tipo_Quarto ORDER BY Id)
                LOOP
                    IF NOT Isquartoindisponivel(R2.Id, R1.Data_Entrada) THEN
                        INSERT INTO Checkin(Id_Reserva, Data, Id_Quarto) VALUES (R1.Id, R1.Data_Entrada, R2.Id);
                        INSERT INTO Checkout(Id_Reserva, Data) VALUES (R1.Id, R1.Data_Saida);
                        INSERT INTO Conta_Consumo(Id, Data_Abertura, Id_Reserva)
                        VALUES (Seq_Conta_Consumo.Nextval, R1.Data_Entrada, R1.Id);
                        IF NOT Ca%ISOPEN THEN
                            OPEN Ca;
                        END IF;
                        FETCH Ca INTO Ra;
                        IF Ca%NOTFOUND THEN
                            CLOSE Ca;
                            OPEN Ca;
                            FETCH Ca INTO Ra;
                        END IF;
                        IF NOT Cc%ISOPEN THEN
                            OPEN Cc;
                        END IF;
                        FETCH Cc INTO Rc;
                        IF Cc%NOTFOUND THEN
                            CLOSE Cc;
                            OPEN Cc;
                            FETCH Cc INTO Rc;
                        END IF;
                        INSERT INTO Linha_Conta_Consumo(Id_Conta_Consumo, Linha, Id_Artigo_Consumo, Data_Registo,
                                                        Quantidade, Preco_Unitario, Id_Camareira)
                        VALUES (Seq_Conta_Consumo.Currval, 1, Ra.Id, R1.Data_Entrada, 1, Ra.Preco, Rc.Id);
                        UPDATE Reserva SET Id_Estado_Reserva = 2 WHERE Id = R1.Id;
                        EXIT;
                    END IF;
                END LOOP;
        END LOOP;
END;
/

--
COMMIT;

SELECT *
FROM Reserva;