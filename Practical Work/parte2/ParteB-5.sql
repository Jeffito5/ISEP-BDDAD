SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE prcAtualizarBonusCamareiras
(mes IN NUMBER, ano IN NUMBER DEFAULT (EXTRACT(YEAR FROM sysdate)))
IS 
Mes_Invalido EXCEPTION; -- variavel para as excecoes
Ano_Invalido EXCEPTION; -- variavel para as excecoes
v_id_camareira Linha_Conta_Consumo.Id_Camareira%type;
v_consumo INTEGER;
v_camareira Camareira.Id%type;
CURSOR cursor_consumo IS -- cursor com o if da camareira
    SELECT Id_Camareira
    FROM Linha_Conta_Consumo,
        Camareira
    WHERE Linha_Conta_Consumo.Id_Camareira = Camareira.Id
    GROUP BY Id_Camareira;
BEGIN
    -- verificar se o ano e maior que 2020
    IF ano>extract(year from sysdate) THEN
        RAISE Ano_Invalido;
    END IF;
    -- verificar se o mes está entre 1 e 12
    IF mes>12 OR mes<1 THEN
        RAISE Mes_Invalido;
    END IF;

    OPEN cursor_consumo;
    LOOP
        FETCH cursor_consumo INTO v_id_camareira;
        EXIT WHEN cursor_consumo%NOTFOUND;

        SELECT Id_Camareira, SUM(Quantidade * Preco_Unitario) -- atribuir o id da camareira a variavel v_camareira e o consumo a variavel v_consumo
        INTO v_camareira, v_consumo
        FROM Linha_Conta_Consumo
        WHERE Linha_Conta_Consumo.Id_Camareira = v_id_camareira
          AND EXTRACT(YEAR FROM Data_Registo) = ano
          AND EXTRACT(MONTH FROM Data_Registo) = mes
        GROUP BY id_Camareira;

        -- aplicar criterios do bonus: >1000-15%/ <= 1000 e >=500-10%/<500 e >100-5%/ <=100 sem bónus
        CASE WHEN v_consumo <= 100 THEN
            UPDATE Camareira
            SET Bonus = 0
            WHERE Camareira.Id = v_camareira;
            
            WHEN v_consumo < 500 AND v_consumo > 100 THEN
                UPDATE Camareira
                SET Bonus = v_consumo * 0.05
                WHERE CAMAREIRA.ID = v_camareira;
                
            WHEN v_consumo <= 1000 AND v_consumo >= 500 THEN
                UPDATE Camareira
                SET Bonus = v_consumo * 0.10
                WHERE CAMAREIRA.ID = v_camareira;

            WHEN v_consumo > 1000 THEN
                UPDATE Camareira
                SET Bonus = v_consumo * 0.15
                WHERE CAMAREIRA.ID = v_camareira;
         
            END CASE;
    END LOOP;    
    EXCEPTION
    WHEN Ano_Invalido THEN
        RAISE_APPLICATION_ERROR(-20000, 'Ano invalido. Tente novamente');
    WHEN Mes_Invalido THEN
        RAISE_APPLICATION_ERROR(-20000, 'Mes invalido. Tente novamente'); 
END;

-- testes
DECLARE 
v_bonus Camareira.Bonus%TYPE;
v_id_camareira Camareira.Id%TYPE;
BEGIN 
    prcAtualizarBonusCamareiras(4,2019);
END;
    

        