CREATE OR REPLACE PROCEDURE prcRegistarReserva(c_id_tipo_quarto tipo_quarto.id%type,
data_entrada reserva.data_entrada%type,data_saida reserva.data_saida%type, 
num_Pessoas reserva.nr_pessoas%type,id_Cliente reserva.id_Cliente%type,nome cliente.nome%type,
nif cliente.nif%type,telefone cliente.telefone%type, email cliente.email%type)
IS
    p_id_Epoca epoca.id%type;
    preco_epoca reserva.preco%type;
    preco_reserva reserva.preco%type;
    reserva_nao_disponivel EXCEPTION;
    valor_obrigatorio_falta EXCEPTION;
    duracao INTEGER;
    id_Reserva INTEGER;
BEGIN
   /** BEGIN**/
   SELECT data_Saida-data_Entrada INTO duracao FROM dual;
   BEGIN    
            --Validação dos dados dos dados obrigatótios
            IF c_id_tipo_quarto IS NULL THEN
            RAISE valor_obrigatorio_falta;
            END IF;
            
            IF data_entrada IS NULL THEN
            RAISE valor_obrigatorio_falta;
            END IF;
            
            IF data_saida IS NULL THEN 
            RAISE valor_obrigatorio_falta;
            END IF;
            
            IF num_Pessoas IS NULL THEN
            RAISE valor_obrigatorio_falta;
            END IF;

            --verifica a disponibilidade da reserva
            IF fncDisponibilidadeReserva(c_id_tipo_quarto,data_entrada,duracao,num_Pessoas)= FALSE THEN
                RAISE reserva_nao_disponivel;
            END IF;
            
            SELECT MAX(id)+1 INTO id_Reserva FROM reserva;
            
            SELECT id INTO p_id_Epoca FROM epoca 
            WHERE data_Entrada BETWEEN data_ini AND data_fim;
            
            SELECT preco INTO preco_epoca  FROM preco_epoca_tipo_quarto
            WHERE id_epoca=p_id_Epoca
            AND id_tipo_quarto = c_id_tipo_quarto;
            
            preco_reserva:=preco_epoca*duracao;
            
   END;
   
  
        IF id_Cliente IS NOT NULL THEN
            INSERT INTO reserva (Id,Id_Cliente,Id_tipo_quarto,Data,Data_Entrada,Data_Saida,Nr_Pessoas,preco,id_estado_reserva) 
            VALUES (id_Reserva,id_Cliente,c_id_tipo_quarto,sysdate,
                     data_Entrada,data_Saida,num_Pessoas,preco_reserva,1);
        ELSE
        BEGIN
            IF nome IS NULL THEN 
            RAISE valor_obrigatorio_falta;
            END IF;
            IF nif IS NULL THEN 
            RAISE valor_obrigatorio_falta;
            END IF;
        END;
            INSERT INTO reserva (Id,Nome,Nif,Telefone,Email,Id_tipo_quarto,Data,Data_Entrada,Data_Saida,Nr_Pessoas,preco,id_estado_reserva) 
            VALUES (id_reserva,nome,nif,telefone,email,c_id_tipo_quarto,sysdate,data_Entrada,data_Saida,num_Pessoas,preco_reserva,1);
        END IF;
    
    EXCEPTION
    WHEN reserva_nao_disponivel THEN 
        RAISE_APPLICATION_ERROR(-20009, 'Reserva não disponivel');
    WHEN valor_obrigatorio_falta THEN
        RAISE_APPLICATION_ERROR(-20009, 'Dado Obigatório em falta');
END;


--testes

SET SERVEROUTPUT ON;

INSERT INTO epoca (id,nome,data_ini,data_fim) VALUES (9,'Epoca 9',to_Date('2021-01-01','YYYY-MM-DD'),to_Date('2020-03-31','YYYY-MM-DD'));

INSERT INTO preco_epoca_tipo_quarto(id_Epoca,id_tipo_quarto,preco) VALUES (9,2,40);
INSERT INTO preco_epoca_tipo_quarto(id_Epoca,id_tipo_quarto,preco) VALUES (9,1,30);
INSERT INTO preco_epoca_tipo_quarto(id_Epoca,id_tipo_quarto,preco) VALUES (9,3,50);
BEGIN
    prcRegistarReserva(4,to_Date('2020-12-27','YYYY-MM-DD'),
    to_Date('2020-12-28','YYYY-MM-DD'),4,NULL,'Fa Ma',985476340,NULL,NULL); 
END;

BEGIN
    prcRegistarReserva(2,to_Date('2021-01-25','YYYY-MM-DD'),
    to_Date('2021-01-27','YYYY-MM-DD'),4,NULL,'Fa Ma',502,NULL,NULL); 
END;


BEGIN
    prcRegistarReserva(2,to_Date('2021-01-25','YYYY-MM-DD'),
    to_Date('2021-01-27','YYYY-MM-DD'),4,NULL,NULL,503,NULL,NULL); 
END;

BEGIN
    prcRegistarReserva(2,to_Date('2021-01-27','YYYY-MM-DD'),
    to_Date('2021-01-28','YYYY-MM-DD'),4,NULL,'Ama Lia',501,NULL,NULL); 
END;

