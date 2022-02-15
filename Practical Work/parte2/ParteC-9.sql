CREATE OR REPLACE TRIGGER trgAtualizaCliente
AFTER INSERT ON cliente
    FOR EACH ROW
DECLARE 
    CURSOR c_todas_reservas IS
    SELECT id_cliente,nif FROM reserva;
    c_id_cliente reserva.id_cliente%type;
    c_nif reserva.nif%type;
BEGIN
        OPEN c_todas_reservas;
            LOOP 
                FETCH c_todas_reservas INTO c_id_cliente,c_nif;
                IF :New.nif=c_nif THEN
                UPDATE reserva SET reserva.id_Cliente = :New.id,
                                   reserva.nome=:New.nome,
                                   reserva.telefone=:New.telefone,
                                   reserva.email=:New.email
                WHERE :New.nif=reserva.nif;
                END IF;
                
                EXIT WHEN c_todas_reservas%notfound;
                
            END LOOP;
            
        CLOSE c_todas_reservas;
END;

DELETE cliente WHERE id=501;
DELETE cliente WHERE id=502;

INSERT INTO cliente (id,nome,nif,id_localidade,email,telefone) 
VALUES (502,'Cliente 502',502,125,'fama@gmail.com',912456852);

INSERT INTO cliente (id,nome,nif,id_localidade,email,telefone) 
VALUES (501,'Cliente 503',501,125,'ama@gmail.com',789546210);

    
