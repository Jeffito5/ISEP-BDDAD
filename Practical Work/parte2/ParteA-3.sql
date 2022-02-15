CREATE OR REPLACE TRIGGER Trg_Epocas_Nao_Sobrepostas
    AFTER INSERT OR UPDATE
    ON Epoca
BEGIN
    FOR I_Epoca_1 IN (SELECT * FROM Epoca)
        LOOP
            FOR I_Epoca_2 IN (SELECT * FROM Epoca WHERE Id != I_Epoca_1.Id)
                LOOP
                    IF I_Epoca_1.Data_Ini BETWEEN I_Epoca_2.Data_Ini AND I_Epoca_2.Data_Fim THEN
                        RAISE_APPLICATION_ERROR(-20149, 'Data de início da época de ID ' || I_Epoca_1.Id ||
                                                        ' interseta com a época ' || I_Epoca_2.Id);
                    END IF;
                    IF I_Epoca_1.Data_Fim BETWEEN I_Epoca_2.Data_Ini AND I_Epoca_2.Data_Fim THEN
                        RAISE_APPLICATION_ERROR(-20149, 'Data de fim da época de ID ' || I_Epoca_1.Id ||
                                                        ' interseta com a época ' || I_Epoca_2.Id);
                    END IF;
                END LOOP;
        END LOOP;
END;

-- // testes --
-- visualização de todas as épocas
SELECT *
FROM Epoca;
-- inserir uma época inválida
INSERT INTO Epoca(Id, Nome, Data_Ini, Data_Fim)
VALUES (9, 'Época 9',
        TO_DATE('2020-10-01', 'yyyy-mm-dd'),
        TO_DATE('2021-01-5', 'yyyy-mm-dd'));
-- visualização de todas as épocas
SELECT *
FROM Epoca;
-- inserir uma época válida
INSERT INTO Epoca(Id, Nome, Data_Ini, Data_Fim)
VALUES (9, 'Época 9',
        TO_DATE('2021-01-01', 'yyyy-mm-dd'),
        TO_DATE('2021-01-31', 'yyyy-mm-dd'));
-- visualização de todas as épocas
SELECT *
FROM Epoca;
-- remover a época criada para teste
DELETE
FROM Epoca
WHERE Id = 9;
-- tentar fazer um update com valores inválidos
UPDATE Epoca
SET Data_Fim = TO_DATE('2020-08-01', 'yyyy-mm-dd')
WHERE Id = 3;