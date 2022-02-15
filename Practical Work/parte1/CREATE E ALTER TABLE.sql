-- ##DROP TABLE ##
-- #Eliminar as tabelas existentes # 
DROP TABLE andar                        CASCADE CONSTRAINTS PURGE;
DROP TABLE quarto                       CASCADE CONSTRAINTS PURGE;
DROP TABLE tipo_De_Quarto               CASCADE CONSTRAINTS PURGE;
DROP TABLE reserva                      CASCADE CONSTRAINTS PURGE;
DROP TABLE epoca                        CASCADE CONSTRAINTS PURGE;
DROP TABLE cliente                      CASCADE CONSTRAINTS PURGE;
DROP TABLE fatura                       CASCADE CONSTRAINTS PURGE;
DROP TABLE tipo_Pagamento               CASCADE CONSTRAINTS PURGE;
DROP TABLE estado                       CASCADE CONSTRAINTS PURGE;
DROP TABLE consumo                      CASCADE CONSTRAINTS PURGE;
DROP TABLE conta                        CASCADE CONSTRAINTS PURGE;
DROP TABLE camareira                    CASCADE CONSTRAINTS PURGE;
DROP TABLE funcionario                  CASCADE CONSTRAINTS PURGE;
DROP TABLE funcionario_Rececao          CASCADE CONSTRAINTS PURGE;
DROP TABLE funcionario_Restaurante      CASCADE CONSTRAINTS PURGE;
DROP TABLE produto                      CASCADE CONSTRAINTS PURGE;
DROP TABLE manutencao                   CASCADE CONSTRAINTS PURGE;
DROP TABLE intervencao                  CASCADE CONSTRAINTS PURGE;
DROP TABLE limpeza                      CASCADE CONSTRAINTS PURGE;
DROP TABLE limpeza_Camareira            CASCADE CONSTRAINTS PURGE;
DROP TABLE fatura_Tipo_Pagamento        CASCADE CONSTRAINTS PURGE;
DROP TABLE funcionario_Manutencao       CASCADE CONSTRAINTS PURGE;
DROP TABLE pedido_Intervencao           CASCADE CONSTRAINTS PURGE;

--## CREATE TABLE ##

CREATE TABLE andar (
    nome                VARCHAR(20)     CONSTRAINT nnAndarNome NOT NULL,
    numero              INTEGER         CONSTRAINT pkAndarnumero PRIMARY KEY
);

CREATE TABLE quarto (
    lotacao             INTEGER        CONSTRAINT nnQuartoLotatacao NOT NULL,
    numero              INTEGER        CONSTRAINT pkQuartoNumero PRIMARY KEY,
    numero_Andar        INTEGER        CONSTRAINT nnQuartoNumeroAndar NOT NULL,
    id_Tipo_Quarto      INTEGER        CONSTRAINT nnQuartoIdTipoQuarto NOT NULL
);

CREATE TABLE tipo_De_Quarto (
    tipo                VARCHAR(20)     CONSTRAINT nnTipoDeQuartoTipo NOT NULL,
    id_Tipo             INTEGER         CONSTRAINT pkTipoDeQuartoIdTipo PRIMARY KEY,
    custo_Base          NUMERIC(8,2)    CONSTRAINT nnTipoDeQuartoCustoBase NOT NULL
);

CREATE TABLE epoca (
    nome                VARCHAR(20)        CONSTRAINT nnEpocaNome NOT NULL,
    mes_inicio          INTEGER            CONSTRAINT nnEpocaMesInicio NOT NULL,
    mes_fim             INTEGER            CONSTRAINT nnEpocaMesFim NOT NULL,
    id_Epoca            INTEGER            CONSTRAINT pkEpocaIdEpoca PRIMARY KEY,
    taxa_constante      NUMERIC(8,2)       CONSTRAINT nnEpocaTaxaConstante NOT NULL
);

CREATE TABLE reserva (
    custo           NUMERIC(10,2),
    data_Entrada    DATE                            CONSTRAINT nnReservaDataEntrada NOT NULL,
    data_Saida      DATE                            CONSTRAINT nnReservaDataSaida NOT NULL,
    cod_Reserva     INTEGER                         CONSTRAINT pkReservaCodReserva PRIMARY KEY,
    numero_Quarto   INTEGER                         CONSTRAINT nnReservaNumeroQuarto NOT NULL,
    id_Epoca        INTEGER                         CONSTRAINT nnReservaIdEpoca NOT NULL,
    nif_CLiente     NUMERIC(9)                      CONSTRAINT nnResersaNifCliente NOT NULL,
    id_Estado       INTEGER DEFAULT 2               CONSTRAINT nnReservaIdEstado NOT NULL,
    num_Pessoas     INTEGER                         CONSTRAINT nnReservaNumPessoas NOT NULL,
    data_Reserva    TIMESTAMP                       CONSTRAINT nnReservaDataReserva NOT NULL,
                                                    CONSTRAINT ckReservaQuartoFree  UNIQUE(numero_Quarto,data_Entrada,data_Saida),
                                                    CONSTRAINT ckReservaDataInicioDataFim   CHECK(data_Saida>=data_Entrada),
                                                    CONSTRAINT ckReservaDataReserva CHECK(data_Reserva<=data_Entrada)
);

CREATE TABLE fatura (
    cod_Reserva         INTEGER                     CONSTRAINT nnFaturaCodReserva PRIMARY KEY
);

CREATE TABLE fatura_Tipo_Pagamento (
    cod_Reserva         INTEGER                     CONSTRAINT nnFaturaTipoPagamentoCodReserva  NOT NULL,
    id_Tipo_Pagamento        INTEGER                CONSTRAINT nnFaturaTipoPagamentoIdPagamento  NOT NULL,
                                                    CONSTRAINT pkFaturaTipoPagamentoCodReservaIdPagamento PRIMARY KEY(id_Tipo_Pagamento,cod_Reserva)
);

CREATE TABLE tipo_Pagamento (
    id_Tipo_Pagamento        INTEGER                CONSTRAINT pkTipoPagamentoIdPagamento PRIMARY KEY,
    descricao           VARCHAR(100)                CONSTRAINT nnTipoPagamentoDescricao NOT NULL
);

CREATE TABLE estado (
    id_Estado           INTEGER                     CONSTRAINT pkEstadoIdEstado PRIMARY KEY,
    nome                VARCHAR(20)                 CONSTRAINT nnEstadoNome NOT NULL
);

CREATE TABLE cliente (
    nome                VARCHAR(20)                 CONSTRAINT nnClienteNome NOT NULL,
    nif                 NUMERIC(9)                  CONSTRAINT pkClienteNif PRIMARY KEY,
    email               VARCHAR(100)                CONSTRAINT nnClienteEmail NOT NULL
                                                    CONSTRAINT ckClienteEmail CHECK(REGEXP_LIKE(email, '^(\S+)\@(\S+)\.(\S+)$')),
    telefone            NUMERIC(9)                  CONSTRAINT nnClienteTelefone NOT NULL,
    zona_Do_Pais        VARCHAR(35)                 CONSTRAINT nnClienteZonaDoPais NOT NULL,
    localidade          VARCHAR(35)                 CONSTRAINT nnClienteLocalidade NOT NULL, 
    concelho            VARCHAR(35)                 CONSTRAINT nnClienteConselho NOT NULL
);

CREATE TABLE conta (
    num_Conta           INTEGER                     CONSTRAINT pkContaNumConta PRIMARY KEY,
    data_Abertura       DATE, 
    cod_Reserva         INTEGER                     CONSTRAINT nnContaCodReserva NOT NULL
                                                    CONSTRAINT uContaCodReserva UNIQUE
);

CREATE TABLE consumo (
    id_Consumo          INTEGER                     CONSTRAINT pkConsumoIdConsumo PRIMARY KEY,
    id_Funcionario      INTEGER                     CONSTRAINT nnConsumoIdFuncionario NOT NULL,
    id_Produto          INTEGER                     CONSTRAINT nnConsumoIdProduto NOT NULL,
    num_Conta           INTEGER                     CONSTRAINT nnConsumoNumConta NOT NULL
);

CREATE TABLE produto (
    descricao           VARCHAR(100)                CONSTRAINT nnProdutoDescricao NOT NULL,
    preco               NUMERIC(8,2)                CONSTRAINT nnProdutoPreco NOT NULL,
    id_Produto          INTEGER                     CONSTRAINT pkProdutoIdProduto PRIMARY KEY
);

CREATE TABLE funcionario (
    id_Funcionario      INTEGER                     CONSTRAINT pkFuncionarioIdFuncionario PRIMARY KEY,
    nome                VARCHAR(100)                CONSTRAINT nnFuncionarioNome NOT NULL,
    nif                 NUMERIC(9)                  CONSTRAINT nnFuncionarioNif NOT NULL
                                                    CONSTRAINT uFuncionarioIdFuncionario UNIQUE,
    morada              VARCHAR(30)                 CONSTRAINT nnFuncionariaMorada NOT NULL,
    email               VARCHAR(50)                 CONSTRAINT nnFuncionarioEmail NOT NULL
                                                    CONSTRAINT ckFuncionarioEmail CHECK(REGEXP_LIKE(email, '^(\S+)\@(\S+)\.(\S+)$')),
    telefone            NUMERIC(9)                  CONSTRAINT nnFuncionarioTelefone NOT NULL
                                                    CONSTRAINT uFuncionarioTelefone UNIQUE
);

CREATE TABLE pedido_Intervencao (
    id_pedido_intervencao   INTEGER                 CONSTRAINT pkPedidoIntervencaoIdPedidoIntervencao PRIMARY KEY,
    id_funcionario          INTEGER                 CONSTRAINT nnPedidoIntervencaoIdFuncionario NOT NULL,
    descricao               VARCHAR(100)            CONSTRAINT nnPedidoIntervencaoDescricao     NOT NULL
);

CREATE TABLE camareira (
    id_Funcionario      INTEGER                     CONSTRAINT pkCamareiraIdFuncionario PRIMARY KEY
);

CREATE TABLE funcionario_Rececao (
    id_Funcionario           INTEGER                CONSTRAINT pkFuncionarioRececaoIdFuncionario PRIMARY KEY
);

CREATE TABLE funcionario_Restaurante (
    id_Funcionario             INTEGER              CONSTRAINT pkFuncionarioRestauranteIdFuncionario PRIMARY KEY       
);

CREATE TABLE funcionario_Manutencao (
    id_Funcionario              INTEGER             CONSTRAINT pkFuncionarioManutencaoIdFuncionario PRIMARY KEY,
    telefone                    NUMERIC(9)          CONSTRAINT nnFuncionarioManutencaoTelefone NOT NULL,
    id_Responsavel              INTEGER             CONSTRAINT nnFuncionarioManutencaoIdResponsavel NOT NULL
);

CREATE TABLE limpeza_Camareira (
    id_Intervencao              INTEGER,
    id_Funcionario              INTEGER,
    CONSTRAINT pkLimpezaCamareiraIdIntervencaoIdFuncionario PRIMARY KEY(id_Intervencao,id_Funcionario)
);

CREATE TABLE limpeza (
    id_Intervencao              INTEGER              CONSTRAINT pkLimpezaIdIntervencao PRIMARY KEY,
    cod_Reserva                 INTEGER              CONSTRAINT nnLimpezaCodReserva     NOT NULL
);

CREATE TABLE intervencao (
    id_Intervencao             INTEGER             CONSTRAINT pkIntervencaoIdIntervencao PRIMARY KEY
);

CREATE TABLE manutencao (
    id_Intervencao              INTEGER             CONSTRAINT pkManutencaoIdIntervencao PRIMARY KEY,
    id_pedido_intervencao       INTEGER             CONSTRAINT nnManutencaoIdPedidoIntervencao NOT NULL,
    data_Manutencao             DATE                CONSTRAINT nnManutencaoData NOT NULL
);

-- ## alter table ##

-- # Alterar a tabela para chave estrangeiro #

--ALTER TABLE cd      ADD CONSTRAINT fkCdIdEditora    FOREIGN KEY (codCd)  REFERENCES editora(idEditora);

ALTER TABLE quarto                  ADD CONSTRAINT fkQuartoNumeroAndar                          FOREIGN KEY (numero_Andar)                  REFERENCES andar(numero);
ALTER TABLE quarto                  ADD CONSTRAINT fkQuartoIdTipoQuarto                         FOREIGN KEY (id_Tipo_Quarto)                REFERENCES tipo_De_Quarto(id_Tipo);
ALTER TABLE reserva                 ADD CONSTRAINT fkReservaNumeroQuarto                        FOREIGN KEY (numero_Quarto)                 REFERENCES quarto(numero);
ALTER TABLE reserva                 ADD CONSTRAINT fkReservaIdEpoca                             FOREIGN KEY (id_Epoca)                      REFERENCES epoca(id_Epoca);
ALTER TABLE reserva                 ADD CONSTRAINT fkReservaNifCliente                          FOREIGN KEY (nif_Cliente)                   REFERENCES cliente(nif);
ALTER TABLE reserva                 ADD CONSTRAINT fkReservaIdEstado                            FOREIGN KEY (id_Estado)                     REFERENCES estado(id_Estado);
ALTER TABLE fatura                  ADD CONSTRAINT fkFaturaCodReserva                           FOREIGN KEY (cod_Reserva)                   REFERENCES reserva(cod_Reserva);
ALTER TABLE fatura_Tipo_Pagamento   ADD CONSTRAINT fkFaturaTipoPagamentoCodReserva              FOREIGN KEY (cod_Reserva)                   REFERENCES fatura(cod_Reserva);
ALTER TABLE fatura_Tipo_Pagamento   ADD CONSTRAINT fkFaturaTipoPagementoIdPagamento             FOREIGN KEY (id_Tipo_Pagamento)             REFERENCES tipo_Pagamento(id_Tipo_Pagamento);
ALTER TABLE conta                   ADD CONSTRAINT fkContaCodReserva                            FOREIGN KEY (cod_Reserva)                   REFERENCES reserva(cod_Reserva);
ALTER TABLE consumo                 ADD CONSTRAINT fkConsumoIdFuncionario                       FOREIGN KEY (id_Funcionario)                REFERENCES camareira(id_Funcionario);
ALTER TABLE consumo                 ADD CONSTRAINT fkConsumoIdProduto                           FOREIGN KEY (id_Produto)                    REFERENCES produto(id_Produto);
ALTER TABLE consumo                 ADD CONSTRAINT fkConsumoNumConta                            FOREIGN KEY (num_Conta)                     REFERENCES conta(num_Conta);
ALTER TABLE camareira               ADD CONSTRAINT fkCamareiraIdFuncionario                     FOREIGN KEY (id_Funcionario)                REFERENCES funcionario(id_Funcionario);
ALTER TABLE funcionario_Rececao     ADD CONSTRAINT fkFuncionarioRececaoIdFuncionario            FOREIGN KEY (id_Funcionario)                REFERENCES funcionario(id_Funcionario);
ALTER TABLE funcionario_Restaurante ADD CONSTRAINT fkFuncionarioRestauranteIdFuncionario        FOREIGN KEY (id_Funcionario)                REFERENCES funcionario(id_Funcionario);
ALTER TABLE funcionario_Manutencao  ADD CONSTRAINT fkFuncionarioManutencaoIdFuncionario         FOREIGN KEY (id_Funcionario)                REFERENCES funcionario(id_Funcionario);
ALTER TABLE limpeza                 ADD CONSTRAINT fkLimpezaIdIntervencao                       FOREIGN KEY (id_Intervencao)                REFERENCES intervencao(id_Intervencao);
ALTER TABLE limpeza                 ADD CONSTRAINT fkLimpezaCodReserva                          FOREIGN KEY (cod_Reserva)                   REFERENCES reserva(cod_Reserva);
ALTER TABLE limpeza_Camareira       ADD CONSTRAINT fkLimpezaCamareiraIdIntervencao              FOREIGN KEY (id_Intervencao)                REFERENCES limpeza(id_Intervencao);
ALTER TABLE limpeza_Camareira       ADD CONSTRAINT fkLimpezaCamreiraIdDuncionario               FOREIGN KEY (id_Funcionario)                REFERENCES camareira(id_Funcionario);
ALTER TABLE manutencao              ADD CONSTRAINT fkManutencaoIdIntervencao                    FOREIGN KEY (id_Intervencao)                REFERENCES intervencao(id_Intervencao);
ALTER TABLE quarto                  ADD CONSTRAINT ckNumeroAndar                                CHECK(numero_Andar=CAST((numero/100) AS INTEGER));
ALTER TABLE manutencao              ADD CONSTRAINT fkManutencaoIdPedidoIntervencao              FOREIGN KEY (id_pedido_intervencao)         REFERENCES Pedido_Intervencao(id_pedido_intervencao);
ALTER TABLE pedido_Intervencao      ADD CONSTRAINT fkPedidoIntervencaoIdFuncionario             FOREIGN KEY (id_funcionario)                REFERENCES funcionario_Manutencao(id_funcionario);


