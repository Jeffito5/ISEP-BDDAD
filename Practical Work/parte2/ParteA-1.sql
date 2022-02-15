CREATE OR REPLACE FUNCTION Fnc_Get_Quarto_Reserva(V_Id_Reserva Reserva.Id%TYPE) RETURN Quarto.Id%TYPE
    IS
    Dummy               INTEGER;
    V_Id_Estado_Reserva Reserva.Id_Estado_Reserva%TYPE;
    V_Id_Quarto         Quarto.Id%TYPE;
    V_Data_Entrada      Reserva.Data_Entrada%TYPE;
    V_Data_Saida        Reserva.Data_Saida%TYPE;
    Ex_Parametro_Invalido EXCEPTION;
BEGIN
    -- validar parâmetro
    -- a) parâmetro é null
    IF V_Id_Reserva IS NULL THEN
        RAISE Ex_Parametro_Invalido;
    END IF;
    -- b) reserva não existe
    SELECT COUNT(*)
    INTO Dummy
    FROM Reserva
    WHERE Id = V_Id_Reserva;
    IF Dummy = 0 THEN
        RAISE Ex_Parametro_Invalido;
    END IF;
    -- c) reserva já tem quarto associado
    SELECT COUNT(*)
    INTO Dummy
    FROM Checkin
    WHERE Id_Reserva = V_Id_Reserva;
    IF Dummy = 1 THEN
        RAISE Ex_Parametro_Invalido;
    END IF;
    -- d) estado da reserva inválido
    SELECT Id_Estado_Reserva
    INTO V_Id_Estado_Reserva
    FROM Reserva
    WHERE Id = V_Id_Reserva;
    IF V_Id_Estado_Reserva NOT IN (1, 2) THEN
        RAISE Ex_Parametro_Invalido;
    END IF;

    -- ir buscar datas de entrada e saída da reserva pedida
    SELECT Data_Entrada, Data_Saida
    INTO V_Data_Entrada, V_Data_Saida
    FROM Reserva
    WHERE Id = V_Id_Reserva;

    SELECT Q1.Id
    INTO V_Id_Quarto
    FROM Quarto Q1
    WHERE Q1.Id NOT IN
          ( -- quarto não ocupado na data de reserva
              SELECT Q1.Id
              FROM Quarto Q1
              JOIN Checkin C ON C.Id_Quarto = Q1.Id
              JOIN Reserva R ON R.Id = C.Id_Reserva
              WHERE (V_Data_Saida > R.Data_Entrada -- data de entrada não
                  AND V_Data_Saida < R.Data_Saida) -- pertence ao intervalo
                 OR (V_Data_Entrada > R.Data_Entrada -- e data de saída também
                  AND V_Data_Entrada < R.Data_Saida)
          )
      AND Q1.Id_Tipo_Quarto =
          ( -- tipo de quarto especificado
              SELECT Id_Tipo_Quarto
              FROM Reserva
              WHERE Id = V_Id_Reserva
          )
    ORDER BY Q1.Id_Andar, -- menor andar
             ( -- mínimo de dias de ocupação no último ano
                 SELECT SUM(R2.Data_Saida - R2.Data_Entrada + 1)
                 FROM Quarto Q2,
                      Checkin C2,
                      Reserva R2
                 WHERE R2.Id = C2.Id_Reserva
                   AND Q2.Id = C2.Id_Quarto
                   AND SYSDATE - R2.Data_Saida <= 365
                   AND Q2.Id = Q1.Id
                 GROUP BY Q2.Id
             )
        FETCH FIRST ROW ONLY;

    RETURN V_Id_Quarto;

EXCEPTION
    WHEN Ex_Parametro_Invalido THEN
        RETURN NULL;
END;

-- // testes --
-- todas as reservas sem checkin efetuado
SELECT Id,
       Id_Tipo_Quarto,
       TO_CHAR(Data_Entrada, 'dd/mm/yyyy') "data entrada",
       TO_CHAR(Data_Saida, 'dd/mm/yyyy')   "data saida"
FROM Reserva
WHERE Id NOT IN (
    SELECT Id_Reserva
    FROM Checkin
)
  AND Id = 6743
ORDER BY Data_Entrada DESC, 2;

-- todos os quartos do tipo 3, ordenados por andar e pelo
-- número de dias em que estiveram ocupados durante o último ano --
SELECT Q1.Id,
       Q1.Id_Tipo_Quarto,
       Q1.Id_Andar,
       (
           SELECT SUM(R2.Data_Saida - R2.Data_Entrada) AS N_Dias
           FROM Quarto Q2,
                Checkin C2,
                Reserva R2
           WHERE R2.Id = C2.Id_Reserva
             AND Q2.Id = C2.Id_Quarto
             AND SYSDATE - R2.Data_Saida <= 365
             AND Q2.Id = Q1.Id
           GROUP BY Q2.Id
       ) AS N_Dias
FROM Quarto Q1
WHERE Q1.Id_Tipo_Quarto = 3
ORDER BY Q1.Id_Andar, N_Dias;


-- todos os quartos ocupados no período de estada da reserva 6853
SELECT DISTINCT Q1.Id                                 "id quarto",
                R.Id                                  "id reserva",
                TO_CHAR(R.Data_Entrada, 'dd/mm/yyyy') "data entrada",
                TO_CHAR(R.Data_Saida, 'dd/mm/yyyy')   "data saida"
FROM Quarto Q1
JOIN Checkin C ON C.Id_Quarto = Q1.Id
JOIN Reserva R ON R.Id = C.Id_Reserva
WHERE ((TO_DATE('28-11-2020', 'dd-mm-yyyy') > R.Data_Entrada -- data de entrada não
    AND TO_DATE('28-11-2020', 'dd-mm-yyyy') < R.Data_Saida) -- pertence ao intervalo
    OR (TO_DATE('1-12-2020', 'dd-mm-yyyy') > R.Data_Entrada -- e data de saída também
        AND TO_DATE('1-12-2020', 'dd-mm-yyyy') < R.Data_Saida))
  AND Q1.Id_Tipo_Quarto = 3
ORDER BY 1;

-- bloco anónimo
BEGIN
    Dbms_Output.Put_Line('Quarto para reserva 6743: '
        || NVL(TO_CHAR(Fnc_Get_Quarto_Reserva(6743)), 'NULL') || '.');
    Dbms_Output.Put_Line('Quarto para reserva NULL: '
        || NVL(TO_CHAR(Fnc_Get_Quarto_Reserva(NULL)), 'NULL') || '.');
    Dbms_Output.Put_Line('Quarto para reserva 7500 (não existe): '
        || NVL(TO_CHAR(Fnc_Get_Quarto_Reserva(7500)), 'NULL') || '.');
    Dbms_Output.Put_Line('Quarto para reserva 100 (já tem um quarto associado): '
        || NVL(TO_CHAR(Fnc_Get_Quarto_Reserva(100)), 'NULL') || '.');
    UPDATE Reserva SET Id_Estado_Reserva = 5 WHERE Id = 71;
    Dbms_Output.Put_Line('Quarto para reserva 71 (estado inválido): '
        || NVL(TO_CHAR(Fnc_Get_Quarto_Reserva(71)), 'NULL') || '.');
END;
