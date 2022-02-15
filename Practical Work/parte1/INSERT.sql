-- ** inserir dados nas tabelas **
-- ## tabela andar ##
INSERT INTO andar(nome, numero) VALUES('1', 1);
INSERT INTO andar(nome, numero) VALUES('2', 2);

-- ## tabela tipo_De_Quarto  ## 
INSERT INTO tipo_De_Quarto (tipo, id_Tipo, custo_Base) VALUES('single', 1, 100);
INSERT INTO tipo_De_Quarto (tipo, id_Tipo, custo_Base) VALUES('twin', 2, 200);
INSERT INTO tipo_De_Quarto (tipo, id_Tipo, custo_Base) VALUES('superior', 3, 400);
INSERT INTO tipo_De_Quarto (tipo, id_Tipo, custo_Base) VALUES('suite', 4, 500);
-- ## tabela quarto ##
/** 1 andar **/
--single
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 100, 1, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 101, 1, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 102, 1, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 103, 1, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 104, 1, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 105, 1, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 106, 1, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 107, 1, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 108, 1, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 109, 1, 1); 
--twin
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 110, 1, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 111, 1, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 112, 1, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 113, 1, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 114, 1, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 115, 1, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 116, 1, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 117, 1, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 118, 1, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 119, 1, 2); 
--superior
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 120, 1, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 121, 1, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 122, 1, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 123, 1, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 124, 1, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 125, 1, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 126, 1, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 127, 1, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 128, 1, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 129, 1, 3); 
--suite
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 130, 1, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 131, 1, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 132, 1, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 133, 1, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 134, 1, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 135, 1, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 136, 1, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 137, 1, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 138, 1, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 139, 1, 4); 

/** 2ï¿½ andar **/
--single
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 200, 2, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 201, 2, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 202, 2, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 203, 2, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 204, 2, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 205, 2, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 206, 2, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 207, 2, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 208, 2, 1);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(1, 209, 2, 1); 
--twin
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 210, 2, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 211, 2, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 212, 2, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 213, 2, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 214, 2, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 215, 2, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 216, 2, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 217, 2, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 218, 2, 2);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 219, 2, 2); 
--superior
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 220, 2, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 221, 2, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 222, 2, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 223, 2, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 224, 2, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 225, 2, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 226, 2, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 227, 2, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 228, 2, 3);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 229, 2, 3); 
--suite
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 230, 2, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 231, 2, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 232, 2, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 233, 2, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 234, 2, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 235, 2, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 236, 2, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 237, 2, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(4, 238, 2, 4);
INSERT INTO quarto(lotacao, numero, numero_Andar, id_Tipo_Quarto) VALUES(2, 239, 2, 4); 

-- ## tabela epoca ##
INSERT INTO epoca(nome, mes_inicio, mes_fim, id_Epoca, taxa_constante) VALUES('Baixa', 1, 5, 1, 1);
INSERT INTO epoca(nome, mes_inicio, mes_fim, id_Epoca, taxa_constante) VALUES('Media', 10, 12, 2, 1.5);
INSERT INTO epoca(nome, mes_inicio, mes_fim, id_Epoca, taxa_constante) VALUES('Alta', 6, 9, 3, 2);

-- ## tabela cliente ##
/** ï¿½ltimos 6 meses **/
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Jose Silva', 111111111, 'jose@silva.com', 962994584, 'Norte', 'Alijo', 'Vila Real');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Eduarda Magalhaes', 111111112, 'eduarda@magalhaes.com', 932855628, 'Sul', 'Albufeira', 'Algarve');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Telmo Custodio', 111111113, 'telmo@custodio.com', 912774511, 'Centro', 'Mealhada', 'Coimbra');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Marco Baiao', 111111114, 'marco@baiao.com', 952918351, 'Norte', 'Ponte de Lima', 'Viana do Castelo');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Marilia Coimbra', 111111115, 'marilia@coimbra.com', 951003517, 'Sul', 'Lagos', 'Algarve');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Andre Garrido', 111111116, 'andre@garido.com', 951966152, 'Centro', 'Penacova', 'Coimbra');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Pedro Lopes', 111111117, 'pedro@lopes.com', 961455528, 'Norte', 'Amares','Braga');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Dulce Lousa', 111111118, 'dulce@lousa.com', 910000361, 'Sul', 'Loule', 'Algarve');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Angela Martinho', 111111119, 'angela@martinho.com', 918882411, 'Centro', 'Amor', 'Leiria');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Piedade Lopes', 111111110, 'piedade@lopes.com', 951733615, 'Norte', 'Esposende', 'Braga');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Joao Neto', 111111411, 'joao@neto.com', 950016221, 'Sul', 'Santiago do Cacem', 'Alentejo');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Alvaro Novais', 111151111, 'alvaro@novais.com', 958133281, 'Centro', 'Milagres', 'Leiria');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Rafael Lagos', 111341111, 'rafael@lagos.com', 950015533, 'Norte', 'Maia', 'Porto');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Adelino Proenca', 171111111, 'adelino@proenca.com', 950122350, 'Sul', 'Sines', 'Alentejo');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Natália Domingues', 111115611, 'natalia@domingues.com', 951077341, 'Centro', 'Lardosa', 'Castelo Branco');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Fatima Quintas', 111345111, 'fatima@quintas.com', 960001469, 'Norte', 'Trofa', 'Porto');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Cristina Ferreira', 117811111, 'cristina@ferreira.com', 913477712, 'Sul', 'Arraiolos', 'Alentejo');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Josue Aldeia', 111193111, 'josue@aldeia.com', 960933331, 'Centro', 'Tinalhas', 'Castelo Branco');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Francisco Guedes', 171111511, 'francisco@guedes.com', 961111731, 'Norte', 'Vimioso', 'Braganca');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Maria Leal', 111111781, 'maria@leal.com', 950144442, 'Sul', 'Mourao', 'Alentejo');
/** fora dos ï¿½ltimos 6 meses **/
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Barack Obama', 174929363, 'barackoficial@obama.com', 961945188, 'Ilhas', 'Santa Cruz', 'Madeira');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Russell Lucas', 184729562, 'russell@lucas.com', 958888153, 'Centro', 'Calde', 'Viseu');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Moises Rebelo', 174826492, 'moises@rebelo.com', 951119266, 'Sul', 'Portimao', 'Alentejo');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Kevin Felgueiras', 173048744, 'kevin@felgueiras.com', 951777251, 'Norte', 'Mirandela', 'Braganca');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Michelle Obama', 183603675, 'michelleoficial@obama.com', 955518451, 'Ilhas', 'Santa Cruz', 'Madeira');
/** mesmos quartos**/
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Maria Leal', 111741781, 'maria@leal.com', 952745111, 'Ilhas', 'Funchal', 'Madeira');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Ana Abelho', 191511781, 'ana@abelho.com', 917778244, 'Ilhas', 'Ribeira Brava', 'Madeira');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Abel Abranches', 911261781, 'abel@abranches.com', 914271000, 'Ilhas', 'Castelo Branco', 'Acores');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Berto Beltrao', 111710781, 'berto@beltrao.com', 951122339, 'Ilhas', 'Capelo', 'Acores');

INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Dwyane Wade', 111811781, 'dwyane@wade.com', 950164444, 'Ilhas', 'Lordelo', 'Vila Real');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Linda Bezerra', 111911781, 'linda@bezerra.com', 956661773, 'Ilhas', 'Constatim', 'Vila Real');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Carlos Caldas', 111511781, 'carlos@caldas.com', 956565111, 'Ilhas', 'Gondomar', 'Porto');
INSERT INTO cliente(nome, nif, email, telefone, zona_Do_Pais, localidade, concelho) VALUES('Rita Frazao', 117311781, 'rita@frazao.com', 961001821, 'Ilhas', 'Valongo', 'Porto');

-- ## tabela estado ##
INSERT INTO estado(id_Estado, nome) VALUES(1, 'Cancelada');
INSERT INTO estado(id_Estado, nome) VALUES(2, 'Reservada');
INSERT INTO estado(id_Estado, nome) VALUES(3, 'Ativa');
INSERT INTO estado(id_Estado, nome) VALUES(4, 'Finalizada');

-- ## tabela reserva ##                                                                                       
-- ï¿½poca baixa                                                                                                                                                                                                                                    
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(407, TO_DATE('2017-04-10','yyyy-mm-dd'), TO_DATE('2017-04-17','yyyy-mm-dd'), 222, 1, 1, 111911781, 4, 4, TO_DATE('2017-04-01','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(404, TO_DATE('2018-04-11','yyyy-mm-dd'), TO_DATE('2018-04-14','yyyy-mm-dd'), 222, 4, 1, 911261781, 4, 4, TO_DATE('2018-04-01','yyyy-mm-dd'));  
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(100, TO_DATE('2020-01-13','yyyy-mm-dd'), TO_DATE('2020-01-16','yyyy-mm-dd'), 230, 8, 1, 111111111, 4, 1, TO_DATE('2020-01-02','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(500, TO_DATE('2020-05-13','yyyy-mm-dd'), TO_DATE('2020-05-16','yyyy-mm-dd'), 230, 9, 1, 184729562, 4, 2, TO_DATE('2020-04-30','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(100, TO_DATE('2020-06-13','yyyy-mm-dd'), TO_DATE('2020-06-16','yyyy-mm-dd'), 115, 10, 1, 174826492, 1, 2, TO_DATE('2020-02-01','yyyy-mm-dd')); -- relevante para parte 1.b
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(512, TO_DATE('2020-03-15','yyyy-mm-dd'), TO_DATE('2020-03-20','yyyy-mm-dd'), 220, 11, 1, 173048744, 4, 4, TO_DATE('2020-03-03','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(403.5, TO_DATE('2020-04-10','yyyy-mm-dd'), TO_DATE('2020-04-17','yyyy-mm-dd'), 232, 12, 1, 183603675, 4, 4, TO_DATE('2020-03-31','yyyy-mm-dd')); -- relevante para parte 1.b
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(203.5, TO_DATE('2020-04-13','yyyy-mm-dd'), TO_DATE('2020-04-16','yyyy-mm-dd'), 206, 24, 3, 111111411, 4, 1, TO_DATE('2020-02-29','yyyy-mm-dd')); -- relevante para parte 1.b

-- ï¿½poca mï¿½dia
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(600, TO_DATE('2017-11-04','yyyy-mm-dd'), TO_DATE('2017-11-26','yyyy-mm-dd'), 210, 5, 2, 111710781, 2, 4, TO_DATE('2017-11-01','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(600, TO_DATE('2018-10-01','yyyy-mm-dd'), TO_DATE('2018-10-08','yyyy-mm-dd'), 200, 6, 2, 111741781, 2, 4, TO_DATE('2018-09-20','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(75, TO_DATE('2020-10-07','yyyy-mm-dd'), TO_DATE('2020-10-12','yyyy-mm-dd'), 115, 18, 2, 111111117, 1, 1, TO_DATE('2020-10-01','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(753.5, TO_DATE('2020-10-13','yyyy-mm-dd'), TO_DATE('2020-10-16','yyyy-mm-dd'), 105, 19, 2, 111111116, 4, 2, TO_DATE('2020-10-02','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(305.5, TO_DATE('2020-11-07','yyyy-mm-dd'), TO_DATE('2020-11-12','yyyy-mm-dd'), 135, 20, 2, 111111118, 4, 2, TO_DATE('2020-10-25','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(300, TO_DATE('2020-11-15','yyyy-mm-dd'), TO_DATE('2020-11-21','yyyy-mm-dd'), 138, 21, 2, 111111119, 3, 2, TO_DATE('2020-11-01','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(600, TO_DATE('2018-12-04','yyyy-mm-dd'), TO_DATE('2018-12-26','yyyy-mm-dd'), 200, 22, 2, 111511781, 2, 4, TO_DATE('2018-11-20','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(600, TO_DATE('2020-12-09','yyyy-mm-dd'), TO_DATE('2020-12-16','yyyy-mm-dd'), 200, 23, 2, 111111110, 2, 4, TO_DATE('2020-12-01','yyyy-mm-dd'));

-- ï¿½poca alta
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(1007, TO_DATE('2017-06-01','yyyy-mm-dd'), TO_DATE('2017-06-10','yyyy-mm-dd'), 219, 2, 3, 191511781, 4, 2, TO_DATE('2017-05-20','yyyy-mm-dd')); -- relevante para parte 1.b
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(1000, TO_DATE('2017-09-03','yyyy-mm-dd'), TO_DATE('2017-09-11','yyyy-mm-dd'), 219, 3, 3, 111811781, 4, 2, TO_DATE('2017-08-25','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(1006.5, TO_DATE('2019-07-03','yyyy-mm-dd'), TO_DATE('2019-07-11','yyyy-mm-dd'), 230, 7, 3, 117311781, 4, 2, TO_DATE('2019-06-20','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(203.5, TO_DATE('2020-07-13','yyyy-mm-dd'), TO_DATE('2020-07-16','yyyy-mm-dd'), 206, 13, 3, 111111411, 4, 1, TO_DATE('2020-06-30','yyyy-mm-dd')); -- relevante para parte 1.b
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(206, TO_DATE('2020-07-16','yyyy-mm-dd'), TO_DATE('2020-07-22','yyyy-mm-dd'), 200, 14, 3, 111151111, 4, 1, TO_DATE('2020-07-01','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(200, TO_DATE('2020-08-17','yyyy-mm-dd'), TO_DATE('2020-08-20','yyyy-mm-dd'), 224, 15, 3, 111341111, 1, 2, TO_DATE('2020-08-01','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(400, TO_DATE('2020-08-21','yyyy-mm-dd'), TO_DATE('2020-08-24','yyyy-mm-dd'), 231, 16, 3, 171111111, 1, 2, TO_DATE('2020-08-01','yyyy-mm-dd'));
INSERT INTO reserva(custo, data_Entrada, data_Saida, numero_Quarto, cod_Reserva, id_Epoca, nif_CLiente, id_Estado, num_Pessoas, data_Reserva) VALUES(1006.5, TO_DATE('2020-09-03','yyyy-mm-dd'), TO_DATE('2020-09-10','yyyy-mm-dd'), 239, 17, 3, 111115611, 4, 2, TO_DATE('2020-08-20','yyyy-mm-dd'));

-- ## tabela fatura ## 
-- finalizadas   
INSERT INTO fatura(cod_Reserva) VALUES(1);
INSERT INTO fatura(cod_Reserva) VALUES(2);
INSERT INTO fatura(cod_Reserva) VALUES(3);
INSERT INTO fatura(cod_Reserva) VALUES(4);
INSERT INTO fatura(cod_Reserva) VALUES(7);
INSERT INTO fatura(cod_Reserva) VALUES(8);
INSERT INTO fatura(cod_Reserva) VALUES(9);
INSERT INTO fatura(cod_Reserva) VALUES(11);
INSERT INTO fatura(cod_Reserva) VALUES(12);
INSERT INTO fatura(cod_Reserva) VALUES(13);
INSERT INTO fatura(cod_Reserva) VALUES(14);
INSERT INTO fatura(cod_Reserva) VALUES(17);
INSERT INTO fatura(cod_Reserva) VALUES(19);
INSERT INTO fatura(cod_Reserva) VALUES(20);
-- canceladas menos de 15 dias antes da data de check in
INSERT INTO fatura(cod_Reserva) VALUES(10);
INSERT INTO fatura(cod_Reserva) VALUES(15);
INSERT INTO fatura(cod_Reserva) VALUES(18);

-- ## tabela tipo_Pagamento  ##
INSERT INTO tipo_Pagamento (id_Tipo_Pagamento, descricao) VALUES(1, 'Cheque');
INSERT INTO tipo_Pagamento (id_Tipo_Pagamento, descricao) VALUES(2, 'Cartao de Credito');
INSERT INTO tipo_Pagamento (id_Tipo_Pagamento, descricao) VALUES(3, 'Cartao de Debito');

-- ## tabela fatura_Tipo_Pagamento ## 
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(1, 1);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(2, 2);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(3, 3);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(4, 2);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(7, 2);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(8, 1);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(9, 3);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(11, 3);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(12, 1);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(13, 2);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(14, 1);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(17, 3);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(19, 3);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(20, 1);
-- canceladas menos de 15 dias antes da data de check in
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(10, 2);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(15, 2);
INSERT INTO fatura_Tipo_Pagamento(cod_Reserva, id_Tipo_Pagamento) VALUES(18, 2);

-- ## tabela conta ## 
-- terminadas   
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(1, TO_DATE('2017-04-10','yyyy-mm-dd'), 1);
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(2, TO_DATE('2017-08-02','yyyy-mm-dd'), 2);
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(3, TO_DATE('2018-04-11','yyyy-mm-dd'), 4);
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(4, TO_DATE('2019-07-04','yyyy-mm-dd'), 7);
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(5, TO_DATE('2020-03-15','yyyy-mm-dd'), 11);
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(6, TO_DATE('2020-04-10','yyyy-mm-dd'), 12);
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(7, TO_DATE('2020-07-14','yyyy-mm-dd'), 13);
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(8, TO_DATE('2020-07-16','yyyy-mm-dd'), 14);
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(9, TO_DATE('2020-09-04','yyyy-mm-dd'), 17);
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(10, TO_DATE('2020-10-13','yyyy-mm-dd'), 19);
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(11, TO_DATE('2020-11-08','yyyy-mm-dd'), 20);
-- ativa
INSERT INTO conta(num_Conta, data_Abertura, cod_Reserva) VALUES(12, TO_DATE('2020-11-15','yyyy-mm-dd'), 21);

-- ## tabela funcionario ##
-- 5 registos de camareira #acrescentar id_tipo_funcionario
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(1, 'Maria Barbosa', 183507249, 'Celeiros', 'maria@barbosa.com', 936428463);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(2, 'Madalena Pereira', 159284026, 'Aveleda', 'madalena@pereira.com', 961734297);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(3, 'Branca Rodrigues', 103273738, 'Sequeira', 'branca@rodrigues.com', 962007144);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(4, 'Rute Lopes', 162852015, 'Lamego', 'rute@lopes.com', 936277751);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(5, 'Bruna Carvalho', 183628529, 'Figueira da Foz', 'bruna@carvalho.com', 962610063);
-- 5 registos de funcionarioRececao
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(6, 'Joao Nogueira', 100627483, 'Alfarelos', 'joao@nogueira.com', 961773517);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(7, 'Catarina Meixedo', 183002619, 'Arrifana', 'catarina@meixedo.com', 935516638);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(8, 'Luis Teixeira', 188255490, 'Vila Nova de Cerveira', 'luis@teixeira.com', 962715449);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(9, 'Eduarda Faria', 106338267, 'Moimenta da Beira', 'eduarda@faria.com', 962211745);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(10, 'Miguel Silva', 106637881, 'Castanheiro do Sul', 'miguel@silva.com', 963371321);
-- 5 registos de funcionarioRestaurante
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(11, 'Bruno Moreira', 107337284, 'Almaceda', 'bruno@moreira.com', 962715537);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(12, 'Isabel Pereira', 177483627, 'Ourondo', 'isabel@pereira.com', 961100274);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(13, 'Rodrigo Lima', 197362281, 'Alizo', 'rodrigo@lima.com', 935511098);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(14, 'Joana Sousa', 184528364, 'Atalaia', 'joana@sousa.com', 936713441);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(15, 'Tiago Rocha', 199263391, 'Galveias', 'tiago@rocha.com', 963481755);
-- registos de funcionarioManutencao
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(16, 'Antonio Carneiro', 100663381, 'Fragosa', 'antonio@carneiro.com', 934117225);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(17, 'Beatriz Damiao', 166387721, 'Barrancos', 'beatriz@damiao.com', 961725661);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(18, 'Antonio Barroca', 199223551, 'Alfundao', 'antonio@barroca.com', 960777155);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(19, 'Sandrina Pires', 166332871, 'Matosinhos', 'sandrina@pires.com', 931199776);
INSERT INTO funcionario(id_Funcionario, nome, nif, morada, email, telefone) VALUES(20, 'Paulo Correia', 183328817, 'Vila Nova de Gaia', 'paulo@correia.com', 964388917);

-- ## tabela camareira ##
INSERT INTO camareira(id_Funcionario) VALUES(1);
INSERT INTO camareira(id_Funcionario) VALUES(2);
INSERT INTO camareira(id_Funcionario) VALUES(3);
INSERT INTO camareira(id_Funcionario) VALUES(4);
INSERT INTO camareira(id_Funcionario) VALUES(5);

-- ## tabela funcionario_Rececao  ##
INSERT INTO funcionario_Rececao (id_Funcionario) VALUES(6);
INSERT INTO funcionario_Rececao (id_Funcionario) VALUES(7);
INSERT INTO funcionario_Rececao (id_Funcionario) VALUES(8);
INSERT INTO funcionario_Rececao (id_Funcionario) VALUES(9);
INSERT INTO funcionario_Rececao (id_Funcionario) VALUES(10);

-- ## tabela funcionario_Restaurante  ##
INSERT INTO funcionario_Restaurante (id_Funcionario) VALUES(11);
INSERT INTO funcionario_Restaurante (id_Funcionario) VALUES(12);
INSERT INTO funcionario_Restaurante (id_Funcionario) VALUES(13);
INSERT INTO funcionario_Restaurante (id_Funcionario) VALUES(14);
INSERT INTO funcionario_Restaurante (id_Funcionario) VALUES(15);

-- ## tabela funcionario_Manutencao  ##
INSERT INTO funcionario_Manutencao (id_Funcionario, telefone, id_Responsavel) VALUES(16, 223572983, 1000);
INSERT INTO funcionario_Manutencao (id_Funcionario, telefone, id_Responsavel) VALUES(17, 223572984, 1001);
INSERT INTO funcionario_Manutencao (id_Funcionario, telefone, id_Responsavel) VALUES(18, 223572985, 1002);
INSERT INTO funcionario_Manutencao (id_Funcionario, telefone, id_Responsavel) VALUES(19, 223572986, 1003);
INSERT INTO funcionario_Manutencao (id_Funcionario, telefone, id_Responsavel) VALUES(20, 223572987, 1004);

-- ## tabela produto ##
INSERT INTO produto(descricao, preco, id_Produto) VALUES('Cerveja', 2, 1);
INSERT INTO produto(descricao, preco, id_Produto) VALUES('Refrigerante', 2, 2);
INSERT INTO produto(descricao, preco, id_Produto) VALUES('Agua', 1.5, 3);
INSERT INTO produto(descricao, preco, id_Produto) VALUES('Croquetes', 3, 4);
INSERT INTO produto(descricao, preco, id_Produto) VALUES('Lanche misto', 1.5, 5);
INSERT INTO produto(descricao, preco, id_Produto) VALUES('Pasteis', 2, 6);
INSERT INTO produto(descricao, preco, id_Produto) VALUES('Frutas', 2, 7);

-- ## tabela consumo ##
-- registos de bebidas 
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(1, 1, 1, 1);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(2, 2, 2, 1);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(3, 3, 3, 2);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(4, 4, 1, 2);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(5, 5, 2, 3);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(6, 1, 3, 4);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(7, 2, 1, 4);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(8, 3, 2, 5);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(9, 4, 3, 5);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(10, 5, 1, 5);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(11, 1, 1, 6);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(12, 2, 2, 6);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(13, 3, 3, 7);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(14, 4, 1, 8);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(15, 5, 2, 8);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(16, 1, 3, 9);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(17, 2, 1, 9);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(35, 2, 2, 9);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(18, 3, 2, 10);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(19, 4, 3, 11);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(20, 5, 1, 11);
-- registos de snacks
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(21, 1, 4, 1);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(22, 2, 5, 2);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(23, 3, 6, 2);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(24, 4, 7, 3);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(25, 5, 4, 4);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(26, 1, 5, 5);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(27, 2, 6, 5);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(28, 1, 4, 5);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(29, 2, 5, 6);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(30, 3, 6, 7);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(31, 4, 7, 8);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(32, 5, 4, 9);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(33, 1, 5, 10);
INSERT INTO consumo(id_Consumo, id_Funcionario, id_Produto, num_Conta) VALUES(34, 2, 6, 11);

-- ## tabela intervencao ##
INSERT INTO intervencao(id_Intervencao) VALUES(1);
INSERT INTO intervencao(id_Intervencao) VALUES(2);
INSERT INTO intervencao(id_Intervencao) VALUES(3);
INSERT INTO intervencao(id_Intervencao) VALUES(4);
INSERT INTO intervencao(id_Intervencao) VALUES(5);
INSERT INTO intervencao(id_Intervencao) VALUES(6);
INSERT INTO intervencao(id_Intervencao) VALUES(7);
INSERT INTO intervencao(id_Intervencao) VALUES(8);
INSERT INTO intervencao(id_Intervencao) VALUES(9);
INSERT INTO intervencao(id_Intervencao) VALUES(10);
INSERT INTO intervencao(id_Intervencao) VALUES(11);
INSERT INTO intervencao(id_Intervencao) VALUES(12);
INSERT INTO intervencao(id_Intervencao) VALUES(13);
INSERT INTO intervencao(id_Intervencao) VALUES(14);
INSERT INTO intervencao(id_Intervencao) VALUES(15);
INSERT INTO intervencao(id_Intervencao) VALUES(16);
INSERT INTO intervencao(id_Intervencao) VALUES(17);
INSERT INTO intervencao(id_Intervencao) VALUES(18);
INSERT INTO intervencao(id_Intervencao) VALUES(19);
INSERT INTO intervencao(id_Intervencao) VALUES(20);

-- ## tabela limpeza ##
INSERT INTO limpeza(id_Intervencao, cod_Reserva) VALUES(1, 14);
INSERT INTO limpeza(id_Intervencao, cod_Reserva) VALUES(2, 17);
INSERT INTO limpeza(id_Intervencao, cod_Reserva) VALUES(3, 3);
INSERT INTO limpeza(id_Intervencao, cod_Reserva) VALUES(4, 6);
INSERT INTO limpeza(id_Intervencao, cod_Reserva) VALUES(5, 8);
INSERT INTO limpeza(id_Intervencao, cod_Reserva) VALUES(6, 10);
INSERT INTO limpeza(id_Intervencao, cod_Reserva) VALUES(7, 12);
INSERT INTO limpeza(id_Intervencao, cod_Reserva) VALUES(8, 13);
INSERT INTO limpeza(id_Intervencao, cod_Reserva) VALUES(9, 15);
INSERT INTO limpeza(id_Intervencao, cod_Reserva) VALUES(10, 20);

-- ## tabela limpeza_Camareira ##
INSERT INTO limpeza_Camareira(id_Intervencao, id_Funcionario) VALUES(1, 1);
INSERT INTO limpeza_Camareira(id_Intervencao, id_Funcionario) VALUES(2, 2);
INSERT INTO limpeza_Camareira(id_Intervencao, id_Funcionario) VALUES(3, 2);
INSERT INTO limpeza_Camareira(id_Intervencao, id_Funcionario) VALUES(4, 3);
INSERT INTO limpeza_Camareira(id_Intervencao, id_Funcionario) VALUES(5, 4);
INSERT INTO limpeza_Camareira(id_Intervencao, id_Funcionario) VALUES(6, 4);
INSERT INTO limpeza_Camareira(id_Intervencao, id_Funcionario) VALUES(7, 5);
INSERT INTO limpeza_Camareira(id_Intervencao, id_Funcionario) VALUES(8, 5);
INSERT INTO limpeza_Camareira(id_Intervencao, id_Funcionario) VALUES(9, 5);
INSERT INTO limpeza_Camareira(id_Intervencao, id_Funcionario) VALUES(10, 3);

-- ## tabela pedido_Intervencao ##
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(1,16,'reparar frigobar');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(2,17,'reparar vasos da varanda');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(3,18,'reparar chuveiro');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(4,19,'reparar frigobar');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(5,20,'reparar vasos da varanda');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(6,16,'reparar chuveiro');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(7,17,'reparar frigobar');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(8,18,'reparar vasos da varanda');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(9,19,'reparar chuveiro');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(10,20,'reparar frigobar');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(11,16,'reparar vasos da varanda');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(12,17,'reparar chuveiro');
INSERT INTO pedido_Intervencao(id_pedido_intervencao, id_funcionario, descricao) VALUES(13,18,'reparar frigobar');

-- ## tabela manutencao ##
INSERT INTO manutencao(id_intervencao, id_pedido_intervencao, data_Manutencao) VALUES(11,1,TO_DATE('16-11-2020','dd-mm-yyyy'));
INSERT INTO manutencao(id_intervencao, id_pedido_intervencao, data_Manutencao) VALUES(12,2,TO_DATE('21-11-2020','dd-mm-yyyy'));
INSERT INTO manutencao(id_intervencao, id_pedido_intervencao, data_Manutencao) VALUES(13,3,TO_DATE('16-11-2020','dd-mm-yyyy'));
INSERT INTO manutencao(id_intervencao, id_pedido_intervencao, data_Manutencao) VALUES(14,4,TO_DATE('21-11-2020','dd-mm-yyyy'));
INSERT INTO manutencao(id_intervencao, id_pedido_intervencao, data_Manutencao) VALUES(15,5,TO_DATE('16-11-2020','dd-mm-yyyy'));
INSERT INTO manutencao(id_intervencao, id_pedido_intervencao, data_Manutencao) VALUES(16,6,TO_DATE('21-11-2020','dd-mm-yyyy'));
INSERT INTO manutencao(id_intervencao, id_pedido_intervencao, data_Manutencao) VALUES(17,7,TO_DATE('16-11-2020','dd-mm-yyyy'));
INSERT INTO manutencao(id_intervencao, id_pedido_intervencao, data_Manutencao) VALUES(18,8,TO_DATE('16-11-2020','dd-mm-yyyy'));
INSERT INTO manutencao(id_intervencao, id_pedido_intervencao, data_Manutencao) VALUES(19,9,TO_DATE('21-11-2020','dd-mm-yyyy'));
INSERT INTO manutencao(id_intervencao, id_pedido_intervencao, data_Manutencao) VALUES(20,10,TO_DATE('16-11-2020','dd-mm-yyyy'));
