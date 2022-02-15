SET SERVEROUTPUT ON

-- funcao auxiliar para ver se o ano e bissexto
CREATE OR REPLACE FUNCTION ano_bissexto(anoB IN NUMBER)
    RETURN BOOLEAN
    IS
    ano_bissexto1 BOOLEAN := FALSE;
BEGIN
    IF (MOD(anoB, 4) = 0)
        AND ((MOD(anoB, 100) <> 0) OR (MOD(anoB, 400) = 0))
    THEN
        ano_bissexto1 := TRUE;
    END IF;

    RETURN ano_bissexto1;
END;

--funcao auxiliar para calcular o numero de dias num mes
CREATE OR REPLACE FUNCTION days_in_a_month(mes1 IN NUMBER, anoB IN NUMBER)
    RETURN NUMBER
    IS
    days_in_month NUMBER(2);
BEGIN
    CASE -- verificar os meses que tem 31 dias
        WHEN (mes1 = 1
            OR mes1 = 3
            OR mes1 = 5
            OR mes1 = 7
            OR mes1 = 8
            OR mes1 = 10
            OR mes1 = 12
            )
            THEN
                days_in_month := 31;
        WHEN mes1 = 2 -- se for fevereiro teremos de ver se o ano e bissexto
            THEN
                IF (ano_bissexto(anoB))
                THEN
                    days_in_month := 29; -- e bissexto logo tem 29 dias
                ELSE
                    days_in_month := 28; -- e comum logo tem 28 dias
                END IF;
        ELSE
            days_in_month := 30; -- se nao for nem fevereiro nem os restantes meses com 31 dias entao tem 30 dias
        END CASE;

    RETURN days_in_month;
END;

CREATE OR REPLACE FUNCTION  fncObterRegistoMensalCamareira
(mes IN INTEGER, ano IN INTEGER DEFAULT (EXTRACT(YEAR FROM sysdate) - 1)) RETURN SYS_REFCURSOR --retorna o cursor
IS 
c_camareira SYS_REFCURSOR;  -- cria o cursor
Mes_Invalido EXCEPTION; -- variavel para as excecoes
Ano_Invalido EXCEPTION; -- variavel para as excecoes
BEGIN
    -- verificar se o ano e maior que 2020
    IF ano>extract(year from sysdate) THEN
        RAISE Ano_Invalido;
    END IF;
    -- verificar se o mes está entre 1 e 12
    IF mes>12 OR mes<1 THEN
        RAISE Mes_Invalido;
    END IF;
    
    --identificador único da camareira, nome da camareira, valor total dos consumos registados, data do primeiro registo 
    -- de consumo e data do último registo de consumo e quantidade de dias em que não foram registados quaisquer consumos
    OPEN c_camareira FOR
        SELECT f.Id, f.nome "Nome", SUM(lcc.Quantidade*lcc.Preco_Unitario) "Valor_total_consumos", MIN(lcc.Data_Registo) "Primeiro_registo", 
        MAX(lcc.Data_Registo) "Ultimo_registo", days_in_a_month(mes, ano) - COUNT(DISTINCT lcc.Data_Registo)
        FROM Funcionario f,Linha_Conta_Consumo lcc 
        WHERE lcc.Id_Camareira=f.Id
        AND mes = EXTRACT(Month FROM lcc.Data_Registo)
        AND ano = EXTRACT(Year FROM lcc.Data_Registo)
        GROUP BY f.Id, f.nome
        ORDER BY f.Id ASC;
    RETURN c_camareira;
    
    EXCEPTION
    WHEN Ano_Invalido THEN
        RAISE_APPLICATION_ERROR(-20000, 'Ano invalido. Tente novamente');
    WHEN Mes_Invalido THEN
        RAISE_APPLICATION_ERROR(-20000, 'Mes invalido. Tente novamente');    
        
END;

-- testes
DECLARE
    cursor_camareira SYS_REFCURSOR;
    v_id_camareira Linha_Conta_Consumo.Id_Camareira%TYPE;
    v_nome_camareira Funcionario.nome%TYPE;
    v_total_consumos INTEGER;
    v_data_primeiro_registo DATE;
    v_data_ultimo_registo DATE;
    v_dias_sem_consumos INTEGER;
BEGIN
    cursor_camareira := fncObterRegistoMensalCamareira(6,2020);
    LOOP
        FETCH cursor_camareira INTO v_id_camareira, v_nome_camareira, v_total_consumos, v_data_primeiro_registo, v_data_ultimo_registo, v_dias_sem_consumos;
        EXIT WHEN cursor_camareira%NOTFOUND;
        dbms_output.put_line('ID da camareira: ' || v_id_camareira || ' | Nome da camareira: ' || v_nome_camareira || ' | Valor total dos consumos: ' || v_total_consumos ||
                             ' | Data do primeiro registo: ' || v_data_primeiro_registo || ' | Data do ultimo registo: ' ||
                             v_data_ultimo_registo || ' | Dias sem  qualquer consumo: ' || v_dias_sem_consumos);
    END LOOP;
END;
