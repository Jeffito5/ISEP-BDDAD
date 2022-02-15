--função para verificar a existencia do tipo de quarto
CREATE OR REPLACE FUNCTION tipo_quarto_existe(id_tipo_quarto INTEGER) RETURN BOOLEAN 
IS 
    count_quarto INTEGER;
BEGIN 
        SELECT count(*) INTO count_quarto FROM tipo_quarto
        WHERE id=id_tipo_quarto;
    RETURN count_quarto>0;
END;

CREATE OR REPLACE FUNCTION fncDisponibilidadeReserva (tipo_quarto_choose tipo_quarto.id%TYPE, 
data_pretendida reserva.Data%type, duracao INTEGER, num_Pessoas reserva.nr_pessoas%type) RETURN BOOLEAN
IS
--definicao das variaveis
    nr_quarto INTEGER;
    disponibilidade BOOLEAN;
    nr_quarto_com_lotacao_disponivel INTEGER;
    data_terminada reserva.data_Saida%type;
    dado_nao_valido EXCEPTION;
    tipo_quarto_inexistente EXCEPTION;
    data_nao_valida EXCEPTION;    
BEGIN
        BEGIN
            --Verificação de dados: 
            --verificação de existencia de tipo de quarto
            BEGIN
                IF tipo_quarto_existe(tipo_quarto_choose)= FALSE THEN
                RAISE tipo_quarto_inexistente;
                END IF;
            END;
            --verificação de dados nulos
            IF data_pretendida IS NULL 
            OR duracao IS NULL 
            OR tipo_quarto_choose IS NULL 
            OR num_Pessoas IS NULL THEN
            RAISE dado_nao_valido;
            END IF;
            --verificação da data de reserva, não pode ser no passado
            IF data_pretendida < SYSDATE() THEN
            RAISE data_nao_valida;
            END IF;
            --verificação de dados negativos
            IF duracao<=0 OR  num_Pessoas<=0 THEN
            RAISE dado_nao_valido;
            END IF;
            --obtenção dos numeros do quarto do tipo e com a lotação suficiente
            SELECT count(*) INTO nr_quarto_com_lotacao_disponivel FROM quarto 
            WHERE lotacao_Maxima>=num_Pessoas AND tipo_quarto_choose=id_tipo_quarto;   
            
            --data de saída prevista
            SELECT data_pretendida+duracao INTO data_terminada FROM dual;
            
        END;
        
        --consulta da disponibilidade
        SELECT count(*) INTO nr_quarto FROM reserva 
        WHERE id_tipo_quarto=tipo_quarto_choose
        AND (data_Entrada BETWEEN data_pretendida AND data_terminada
        OR data_saida BETWEEN data_pretendida AND data_terminada);
    
    
    return nr_quarto<=nr_quarto_com_lotacao_disponivel;
EXCEPTION 
WHEN dado_nao_valido THEN 
    RAISE_APPLICATION_ERROR(-20001, 'O(s) valor(es) introduzido(s) são invalidos ou nulos');
WHEN tipo_quarto_inexistente THEN 
    RAISE_APPLICATION_ERROR(-20002, 'Tipo de quarto inexistente');
WHEN data_nao_valida THEN 
    RAISE_APPLICATION_ERROR(-20003, 'Data não válida');
END;

--testes fncDisponibilidadeReserva
SET SERVEROUTPUT ON;

BEGIN
    IF fncDisponibilidadeReserva(2,to_Date('2020-12-16','YYYY-MM-DD'),8,2)=TRUE THEN
        dbms_output.put_line('Reserva disponivel');
    ELSE 
        dbms_output.put_line('Reserva indisponivel');
    END IF;
END;

BEGIN
    IF fncDisponibilidadeReserva(2,to_Date('2021-01-25','YYYY-MM-DD'),8,2)=TRUE THEN
        dbms_output.put_line('Reserva disponivel');
    ELSE 
        dbms_output.put_line('Reserva indisponivel');
    END IF;
END;

BEGIN
    IF fncDisponibilidadeReserva(3,to_Date('2020-12-25','YYYY-MM-DD'),1,4)=TRUE THEN
        dbms_output.put_line('Reserva disponivel');
    ELSE 
        dbms_output.put_line('Reserva indisponivel');
    END IF;
END;

BEGIN
    IF fncDisponibilidadeReserva(3,to_Date('2020-12-27','YYYY-MM-DD'),1,4)=TRUE THEN
        dbms_output.put_line('Reserva disponivel');
    ELSE 
        dbms_output.put_line('Reserva indisponivel');
    END IF;
END;

BEGIN
    IF fncDisponibilidadeReserva(4,to_Date('2020-12-27','YYYY-MM-DD'),1,4)=TRUE THEN
        dbms_output.put_line('Reserva disponivel');
    ELSE 
        dbms_output.put_line('Reserva indisponivel');
    END IF;
END;