--!!!! WARNING !!!!
--!!!! Eliminar TODAS as tabelas do schema !!!!
--!!!!

BEGIN
    FOR R IN (SELECT 'drop table ' || Table_Name || ' cascade constraints' Cmd FROM User_Tables ORDER BY Table_Name)
        LOOP
            EXECUTE IMMEDIATE (R.Cmd);
        END LOOP;
END;
/

CREATE TABLE Pais
(
    Id   INT
        CONSTRAINT Pk_Pais PRIMARY KEY,
    Nome VARCHAR(250)
);

CREATE TABLE Distrito
(
    Id      INT
        CONSTRAINT Pk_Distrito PRIMARY KEY,
    Id_Pais INT
        CONSTRAINT Fk_Distrito_Pais REFERENCES Pais (Id),
    Nome    VARCHAR(250)
);

CREATE TABLE Concelho
(
    Id          INT
        CONSTRAINT Pk_Concelho PRIMARY KEY,
    Id_Distrito INT
        CONSTRAINT Fk_Concelho_Distrito REFERENCES Distrito (Id),
    Nome        VARCHAR(250)
);

CREATE TABLE Localidade
(
    Id          INT
        CONSTRAINT Pk_Localidade PRIMARY KEY,
    Id_Concelho INT
        CONSTRAINT Fk_Localidade_Concelho REFERENCES Concelho (Id),
    Nome        VARCHAR(250)
);

CREATE TABLE Codigo_Postal
(
    Id                INT
        CONSTRAINT Pk_Codigo_Postal PRIMARY KEY,
    Id_Localidade     INT
        CONSTRAINT Fk_Codigo_Postal_Localidade REFERENCES Localidade (Id),
    Designacao_Postal VARCHAR(250)
);

CREATE TABLE Cliente
(
    Id            INT
        CONSTRAINT Pk_Cliente PRIMARY KEY,
    Nome          VARCHAR(250),
    Nif           VARCHAR(15) UNIQUE,
    Id_Localidade INT
        CONSTRAINT Fk_Cliente_Localidade REFERENCES Localidade (Id),
    Email         VARCHAR(200) UNIQUE,
    Telefone      VARCHAR(20)
);

CREATE TABLE Estado_Reserva
(
    Id   INT
        CONSTRAINT Pk_Estado_Reserva PRIMARY KEY,
    Nome VARCHAR(250)
);

CREATE TABLE Epoca
(
    Id       INT
        CONSTRAINT Pk_Epoca PRIMARY KEY,
    Nome     VARCHAR(250),
    Data_Ini DATE
        CONSTRAINT Nn_Epoca_Data_Ini NOT NULL,
    Data_Fim DATE,
    CONSTRAINT Ck_Epoca_Datas CHECK (Data_Ini < Data_Fim)
);

CREATE TABLE Andar
(
    Id       INT
        CONSTRAINT Pk_Andar PRIMARY KEY,
    Nome     VARCHAR(250),
    Nr_Andar INT UNIQUE
);

CREATE TABLE Tipo_Quarto
(
    Id   INT
        CONSTRAINT Pk_Tipo_Quarto PRIMARY KEY,
    Nome VARCHAR(250)
);

CREATE TABLE Preco_Epoca_Tipo_Quarto
(
    Id_Epoca       INT
        CONSTRAINT Fk_Preco_Epoca_Epoca REFERENCES Epoca (Id),
    Id_Tipo_Quarto INT
        CONSTRAINT Fk_Preco_Epoca_Tipo REFERENCES Tipo_Quarto (Id),
    CONSTRAINT Pk_Preco_Epoca_Tipo_Quarto PRIMARY KEY (Id_Epoca, Id_Tipo_Quarto),
    Preco          NUMBER(6, 2)
);

CREATE TABLE Quarto
(
    Id             INT
        CONSTRAINT Pk_Quarto PRIMARY KEY,
    Id_Andar       INT NOT NULL
        CONSTRAINT Fk_Quarto_Andar REFERENCES Andar (Id),
    Nr_Quarto      INT NOT NULL,
    Id_Tipo_Quarto INT
        CONSTRAINT Fk_Quarto_Tipo_Quarto REFERENCES Tipo_Quarto (Id),
    Lotacao_Maxima INT,
    CONSTRAINT Uk_Quarto UNIQUE (Id_Andar, Nr_Quarto)
);

CREATE TABLE Reserva
(
    Id                 INT
        CONSTRAINT Pk_Reserva PRIMARY KEY,
    Id_Cliente         INT
        CONSTRAINT Fk_Reserva_Cliente REFERENCES Cliente (Id),
    Nome               VARCHAR(250),
    Nif                VARCHAR(20),
    Email              VARCHAR(200),
    Telefone           VARCHAR(20),
    Id_Tipo_Quarto     INT NOT NULL
        CONSTRAINT Fk_Reserva_Tipo_Quarto REFERENCES Tipo_Quarto (Id),
    Data               DATE,
    Data_Entrada       DATE,
    Data_Saida         DATE,
    Nr_Pessoas         INT,
    Preco              NUMBER(6, 2),
    Id_Estado_Reserva  INT
        CONSTRAINT Fk_Reserva_Estado REFERENCES Estado_Reserva (Id),
    Custo_Cancelamento NUMBER(6, 2),
    Custo_Extra        NUMBER(6, 2)
);

CREATE TABLE Checkin
(
    Id_Reserva INT
        CONSTRAINT Pk_Checkin PRIMARY KEY
        CONSTRAINT Fk_Checkin_Id_Reserva REFERENCES Reserva (Id),
    Data       DATE NOT NULL,
    Id_Quarto  INT
        CONSTRAINT Fk_Reserva_Quarto REFERENCES Quarto (Id)
);

CREATE TABLE Hospedes_Checkin
(
    Id_Reserva              INT
        CONSTRAINT Fk_Hospedes_Checkin_Reserva REFERENCES Checkin (Id_Reserva),
    Nr_Hospede              INT,
    CONSTRAINT Pk_Hospedes_Checkin PRIMARY KEY (Id_Reserva, Nr_Hospede),
    Nome                    VARCHAR(200),
    Id_Pais
        CONSTRAINT Fk_Hospedes_Checkin_Pais REFERENCES Pais (Id),
    Genero                  VARCHAR(1)
        CONSTRAINT Ck_Hospedes_Checkin_Genero CHECK (UPPER(Genero) IN ('M', 'F')),
    Documento_Identificacao VARCHAR(50)
);

CREATE TABLE Checkout
(
    Id_Reserva  INT
        CONSTRAINT Pk_Checkout_Id_Reserva PRIMARY KEY
        CONSTRAINT Fk_Checkout_Id_Reserva REFERENCES Checkin (Id_Reserva),
    Data        DATE NOT NULL,
    Observacoes VARCHAR(1000),
    Valor_Extra NUMBER(6, 2)
);

CREATE TABLE Conta_Consumo
(
    Id            INT
        CONSTRAINT Pk_Conta_Consumo PRIMARY KEY,
    Data_Abertura DATE,
    Id_Reserva    INT
        CONSTRAINT Fk_Conta_Consumo_Reserva REFERENCES Reserva (Id)
);

CREATE TABLE Artigo_Consumo
(
    Id    INT
        CONSTRAINT Pk_Artigo_Consumo PRIMARY KEY,
    Nome  VARCHAR(250),
    Preco NUMBER(6, 2)
);

CREATE TABLE Tipo_Funcionario
(
    Id   INT
        CONSTRAINT Pk_Tipo_Funcionario PRIMARY KEY,
    Nome VARCHAR(250)
);

CREATE TABLE Funcionario
(
    Id            INT
        CONSTRAINT Pk_Funcionario PRIMARY KEY,
    Nif           VARCHAR(20),
    Nome          VARCHAR(250),
    Morada        VARCHAR(200),
    Codigo_Postal INT
        CONSTRAINT Fk_Funcionario_Codigo_Postal REFERENCES Codigo_Postal (Id),
    Email         VARCHAR(200),
    Telefone      VARCHAR(20),
    Id_Tipo_Funcionario
        CONSTRAINT Fk_Funcionario_Tipo_Func REFERENCES Tipo_Funcionario (Id)
);

CREATE TABLE Funcionario_Manutencao
(
    Id             INT
        CONSTRAINT Pk_Funcionario_Manutencao PRIMARY KEY
        CONSTRAINT Fk_Funcionario_Manutencao_Func REFERENCES Funcionario (Id),
    Id_Responsavel INT
        CONSTRAINT Fk_Funcionario_Manutencao_Resp REFERENCES Funcionario_Manutencao (Id),
    Telefone       VARCHAR(20)
);

CREATE TABLE Camareira
(
    Bonus NUMBER (6,2),
    Id INT
        CONSTRAINT Pk_Camareira PRIMARY KEY
        CONSTRAINT Fk_Camareira_Funcionario REFERENCES Funcionario (Id)
);

CREATE TABLE Linha_Conta_Consumo
(
    Id_Conta_Consumo  INT
        CONSTRAINT Fk_Linha_Conta_Consumo REFERENCES Conta_Consumo (Id),
    Linha             INT,
    CONSTRAINT Pk_Linha_Conta_Consumo PRIMARY KEY (Id_Conta_Consumo, Linha),
    Id_Artigo_Consumo INT
        CONSTRAINT Fk_Linha_Conta_Consumo_Artigo REFERENCES Artigo_Consumo (Id),
    Data_Registo      DATE,
    Quantidade        INT,
    Preco_Unitario    NUMBER(6, 2),
    Id_Camareira      INT
        CONSTRAINT Fk_Linha_Conta_Consumo_Cam REFERENCES Camareira (Id)
);

CREATE TABLE Fatura
(
    Id                     INT
        CONSTRAINT Pk_Fatura PRIMARY KEY,
    Numero                 INT
        CONSTRAINT Nn_Fatura_Numero NOT NULL,
    Data                   DATE NOT NULL,
    Id_Cliente             INT
        CONSTRAINT Fk_Fatura_Cliente REFERENCES Cliente (Id),
    Id_Reserva             INT UNIQUE
        CONSTRAINT Fk_Fatura_Reserva REFERENCES Reserva (Id),
    Valor_Faturado_Reserva NUMBER(8, 2),
    Valor_Faturado_Consumo NUMBER(8, 2)
);

CREATE TABLE Linha_Fatura
(
    Id_Fatura           INT
        CONSTRAINT Fk_Linha_Fatura_Fatura REFERENCES Fatura (Id),
    Linha               INT,
    CONSTRAINT Pk_Linha_Fatura PRIMARY KEY (Id_Fatura, Linha),
    Id_Conta_Consumo    INT,
    Linha_Conta_Consumo INT,
    CONSTRAINT Fk_Linha_Fatura_Conta_Consumo FOREIGN KEY (Id_Conta_Consumo, Linha_Conta_Consumo) REFERENCES Linha_Conta_Consumo (Id_Conta_Consumo, Linha),
    Valor_Consumo       NUMBER(8, 2)
);

CREATE TABLE Modo_Pagamento
(
    Id   INT
        CONSTRAINT Pk_Modo_Pagamento PRIMARY KEY,
    Nome VARCHAR(250)
);

CREATE TABLE Pagamento
(
    Id_Fatura         INT
        CONSTRAINT Fk_Pagamento_Fatura REFERENCES Fatura (Id),
    Id_Modo_Pagamento INT
        CONSTRAINT Fk_Pagamento_Modo REFERENCES Modo_Pagamento (Id),
    Valor             NUMBER(8, 2),
    CONSTRAINT Pk_Pagamento PRIMARY KEY (Id_Fatura, Id_Modo_Pagamento)
);

CREATE TABLE Tipo_Intervencao
(
    Id   INT
        CONSTRAINT Pk_Tipo_Intervencao PRIMARY KEY,
    Nome VARCHAR(250)
);

CREATE TABLE Intervencao
(
    Id                  INT
        CONSTRAINT Pk_Intervencao PRIMARY KEY,
    Id_Quarto           INT NOT NULL
        CONSTRAINT Fk_Intervencao REFERENCES Quarto (Id),
    Id_Funcionario      INT
        CONSTRAINT Fk_Intervencao_Funcionario REFERENCES Funcionario (Id),
    Data                DATE,
    Descricao           VARCHAR(1000),
    Id_Tipo_Intervencao INT NOT NULL
        CONSTRAINT Fk_Intervencao_Tipo REFERENCES Tipo_Intervencao (Id)
);
