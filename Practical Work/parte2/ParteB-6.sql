CREATE OR REPLACE TRIGGER trgCorrigirAlteracaoBonus
BEFORE UPDATE OF Bonus ON Camareira --instrucao para o parametro bonus na tabela camareira
FOR EACH ROW
DECLARE
nao_diminuir_bonus_exception EXCEPTION; -- o bonus nao pode ser diminuido
aumento_do_bonus_50_exception EXCEPTION; -- o bonus so pode ser alterado ate 50%
bonus_null_exception EXCEPTION; -- o bonus nao pode ser null
BEGIN
    IF :OLD.Bonus > :NEW.Bonus THEN --se o bonus anterior for maior que o atual da uma excecao: o bonus nao pode ser diminuido
    RAISE nao_diminuir_bonus_exception;
    END IF;
    IF :NEW.Bonus > (:OLD.Bonus + (:OLD.Bonus * 0.5))THEN -- se o bonus for aumentado 50% da outra excecao
    RAISE aumento_do_bonus_50_exception;
    END IF;
    IF :NEW.Bonus IS NULL THEN -- o bonus nao pode ser nulo
    RAISE bonus_null_exception;
    END IF;
EXCEPTION
    WHEN nao_diminuir_bonus_exception THEN raise_application_error(-20004,'O bonus nao pode ser diminuido.');
    WHEN aumento_do_bonus_50_exception THEN raise_application_error(-20005,'O bonus nao pode ser aumentado mais do que 50%.');
    WHEN bonus_null_exception THEN raise_application_error(-20006, 'O bonus tem de corresponder a um valor.');
END;

-- testes
-- O bonus nao pode ser diminuido
UPDATE Camareira
SET Bonus=0.3
WHERE Camareira.Id=11;

-- row inserted
UPDATE Camareira
SET Bonus=10
WHERE Camareira.Id=12;

-- O bonus nao pode ser aumentado mais do que 50%
UPDATE Camareira
SET Bonus=5000
WHERE Camareira.Id=13;

-- O bonus tem de corresponder a um valor
UPDATE Camareira
SET Bonus=NULL
WHERE Camareira.Id=14;
