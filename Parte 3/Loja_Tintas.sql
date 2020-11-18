DROP DATABASE IF EXISTS Loja_Tintas;
Create Database Loja_Tintas;
Use Loja_Tintas;

Create table PESSOA(
CPF VARCHAR(15) NOT NULL PRIMARY KEY,
NOME VARCHAR(100),
DATA_NASCIMENTO DATE
);

Create table FUNCIONARIO(
ID_FUNCIONARIO VARCHAR(15) PRIMARY KEY,
SALARIO_FUNCIONARIO FLOAT(53),
DATA_ADIMISSSAO DATE,
CARGA_HORARIA INTEGER,
FOREIGN KEY(ID_FUNCIONARIO) REFERENCES PESSOA (CPF)
);

Create table CLIENTE(
ID_CLIENTE VARCHAR(15) PRIMARY KEY,
TELEFONE_CLIENTE VARCHAR(15),
EMAIL_CLIENTE VARCHAR(100),
FOREIGN KEY(ID_CLIENTE) REFERENCES PESSOA (CPF)
);

Create table PAGAMENTO(
ID_PAGAMENTO INTEGER AUTO_INCREMENT PRIMARY KEY,
VALOR_PAGAMENTO FLOAT(53),
TIPO_PAGAMENTO VARCHAR(30),
DATA_PAGAMENTO DATE
);

Create table PEDIDO(
NUM_PEDIDO INTEGER AUTO_INCREMENT PRIMARY KEY,
QTDE_ITENS INTEGER,
DATA_PEDIDO DATE,
ID_CLIENTE VARCHAR(15),
ID_FUNCIONARIO VARCHAR(15),
ID_PAGAMENTO INTEGER,
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE),
FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIO (ID_FUNCIONARIO),
FOREIGN KEY (ID_PAGAMENTO) REFERENCES PAGAMENTO (ID_PAGAMENTO)
)AUTO_INCREMENT = 1001;

Create table ENTREGADOR(
CPF_ENTREGADOR VARCHAR(15) NOT NULL PRIMARY KEY,
NOME_ENTREGADOR VARCHAR(100),
TELEFONE_ENTREGADOR VARCHAR(15)
);

Create table ENTREGA(
NUM_ENTREGA INTEGER AUTO_INCREMENT PRIMARY KEY,
ENTREGADOR_RESPONSAVEL VARCHAR(100),
DATA_ENTREGA DATE,
NUM_PEDIDO INTEGER UNIQUE,
CPF_ENTREGADOR VARCHAR(15),
FOREIGN KEY (NUM_PEDIDO) REFERENCES PEDIDO (NUM_PEDIDO),
FOREIGN KEY (CPF_ENTREGADOR) REFERENCES ENTREGADOR (CPF_ENTREGADOR)
);

Create table FORNECEDOR(
ID_FORNECEDOR INTEGER NOT NULL PRIMARY KEY,
MARCA_REPRESENTANTE VARCHAR(50),
TELEFONE_FORNECEDOR VARCHAR(15)
);

Create table LOTE(
ID_LOTE INTEGER NOT NULL PRIMARY KEY,
QTDE_LOTE INTEGER,
DATA_VALIDADE_LOTE DATE
);

Create table TINTA(
ID_TINTA INTEGER AUTO_INCREMENT PRIMARY KEY,
MARCA_TINTA VARCHAR(50),
COR_TINTA VARCHAR(50),
TIPO_TINTA VARCHAR(50),
ID_LOTE INTEGER,
FOREIGN KEY (ID_LOTE) REFERENCES LOTE (ID_LOTE)
)AUTO_INCREMENT = 1000001;

Create table PEDIDO_TINTA(
NUM_PEDIDO INTEGER,
ID_TINTA INTEGER,
FOREIGN KEY (NUM_PEDIDO) REFERENCES PEDIDO (NUM_PEDIDO),
FOREIGN KEY (ID_TINTA) REFERENCES TINTA (ID_TINTA),
PRIMARY KEY (NUM_PEDIDO, ID_TINTA)
);

Create table FORNECEDOR_TINTA(
ID_FORNECEDOR INTEGER,
ID_TINTA INTEGER,
FOREIGN KEY (ID_FORNECEDOR) REFERENCES FORNECEDOR (ID_FORNECEDOR),
FOREIGN KEY (ID_TINTA) REFERENCES TINTA (ID_TINTA),
PRIMARY KEY (ID_FORNECEDOR, ID_TINTA)
);

INSERT INTO PESSOA VALUES("333.293.070-21", "Yasmin Alessandra Barbosa", "1994-07-24");
INSERT INTO PESSOA VALUES("515.845.488-43", "Bruno Mateus Nascimento", "1992-06-05");
INSERT INTO PESSOA VALUES("855.984.458-91", "Augusto Enrico Gael dos Santos", "1996-09-13");
INSERT INTO PESSOA VALUES("197.982.808-30", "Kamilly Alícia Isabelly Santos", "1994-08-21");
INSERT INTO PESSOA VALUES("910.222.368-65", "Clarice Marina Figueiredo", "1991-10-12");
INSERT INTO PESSOA VALUES("827.850.088-63", "Daniel Carlos Eduardo Alexandre Peixoto", "1994-05-04");
INSERT INTO PESSOA VALUES("198.656.328-61", "Gabriel Lucas Ian da Costa", "1998-11-15");
INSERT INTO PESSOA VALUES("584.047.828-81", "Fabiana Esther Juliana Caldeira", "1997-08-10");
INSERT INTO PESSOA VALUES("436.697.618-88", "Melissa Elaine Rosa Pereira", "1990-05-12");
INSERT INTO PESSOA VALUES("571.006.238-39", "Yago Felipe Antonio Barbosa", "1993-08-12");

INSERT INTO FUNCIONARIO VALUES("333.293.070-21", 1087.84 , "2019-03-20", 8);
INSERT INTO FUNCIONARIO VALUES("515.845.488-43", 1087.84 , "2019-03-20", 8);
INSERT INTO FUNCIONARIO VALUES("855.984.458-91", 2500.00 , "2019-03-20", 12);
INSERT INTO FUNCIONARIO VALUES("197.982.808-30", 1087.84 , "2019-06-02", 8);
INSERT INTO FUNCIONARIO VALUES("910.222.368-65", 1087.84 , "2019-07-05", 8);
INSERT INTO FUNCIONARIO VALUES("827.850.088-63", 1087.84 , "2019-07-12", 8);
INSERT INTO FUNCIONARIO VALUES("198.656.328-61", 543.92 , "2019-08-17", 4);
INSERT INTO FUNCIONARIO VALUES("584.047.828-81", 543.92 , "2019-09-29", 4);
INSERT INTO FUNCIONARIO VALUES("436.697.618-88", 1087.84 , "2020-01-20", 8);
INSERT INTO FUNCIONARIO VALUES("571.006.238-39", 1087.84 , "2020-02-06", 8);

INSERT INTO PESSOA VALUES("951.951.678-69", "Samuel Bernardo da Cruz", "1969-10-17");
INSERT INTO PESSOA VALUES("679.543.578-48", "Sabrina Helena Luzia da Luz", "1973-06-14");
INSERT INTO PESSOA VALUES("478.000.198-61", "Luzia Adriana Maya Moraes", "1985-12-26");
INSERT INTO PESSOA VALUES("841.961.568-43", "Ian Bernardo Gonçalves", "1956-08-23");
INSERT INTO PESSOA VALUES("300.766.408-09", "Victor Vinicius Almeida", "1970-06-19");
INSERT INTO PESSOA VALUES("736.544.908-08", "Cláudio Noah Anthony Moreira", "1969-07-27");
INSERT INTO PESSOA VALUES("816.322.578-58", "Alice Luiza Heloise Oliveira", "1978-02-25");
INSERT INTO PESSOA VALUES("822.737.038-13", "Vicente Pietro Sebastião da Rocha", "1951-02-13");
INSERT INTO PESSOA VALUES("913.801.178-60", "Rayssa Clarice Regina da Cruz", "1956-02-02");
INSERT INTO PESSOA VALUES("485.524.238-12", "Vinicius Heitor Aragão", "1964-05-19");

INSERT INTO CLIENTE VALUES("951.951.678-69", "(11) 3899-5575", "samuel__bernardodacruz@gmail.com.br");
INSERT INTO CLIENTE VALUES("679.543.578-48", "(11) 3899-5101", "sabrinahelenaluziadaluz__sabrinahelenaluziadaluz@a-qualitybrasil.com.br");
INSERT INTO CLIENTE VALUES("478.000.198-61", "(19) 3592-5028", "luziaadrianamayamoraes-80@acaoi.com.br");
INSERT INTO CLIENTE VALUES("841.961.568-43", "(11) 3619-9789", "ianbernardogoncalves__ianbernardogoncalves@murosterrae.com.br");
INSERT INTO CLIENTE VALUES("300.766.408-09", "(11) 3703-7056", "victorviniciusalmeida__victorviniciusalmeida@acmorgado.com.br");
INSERT INTO CLIENTE VALUES("736.544.908-08", "(18) 99445-1514", "claudionoahanthonymoreira__claudionoahanthonymoreira@lynce.com.br");
INSERT INTO CLIENTE VALUES("816.322.578-58", "(18) 99881-5295", "aliceluizaheloiseoliveira-75@morada.com.br");
INSERT INTO CLIENTE VALUES("822.737.038-13", "(19) 2554-1120", "vicentepietrosebastiaodarocha..vicentepietrosebastiaodarocha@engeseg.com.br");
INSERT INTO CLIENTE VALUES("913.801.178-60", "(11) 2926-9094", "rayssaclaricereginadacruz__rayssaclaricereginadacruz@cordeiromaquinas.com.br");
INSERT INTO CLIENTE VALUES("485.524.238-12", "(11) 2793-8688", "viniciusheitoraragao_@original-veiculos.com.br");

INSERT INTO PAGAMENTO VALUES("0", 20.00, "Dinheiro", "2019-03-21");
INSERT INTO PAGAMENTO VALUES("0", 500.00, "Dinheiro", "2019-03-22");
INSERT INTO PAGAMENTO VALUES("0", 120.00, "Cartão de crédito", "2019-04-18");
INSERT INTO PAGAMENTO VALUES("0", 80.00, "Cartão de débito", "2019-06-12");
INSERT INTO PAGAMENTO VALUES("0", 1220.00, "Dinheiro", "2019-09-01");
INSERT INTO PAGAMENTO VALUES("0", 980.00, "Dinheiro", "2019-10-17");
INSERT INTO PAGAMENTO VALUES("0", 12.50, "Cartão de crédito", "2019-11-15");
INSERT INTO PAGAMENTO VALUES("0", 22.20, "Dinheiro", "2020-01-05");
INSERT INTO PAGAMENTO VALUES("0", 300.00, "Cartão de débito", "2020-01-13");
INSERT INTO PAGAMENTO VALUES("0", 600.00, "Dinheiro", "2020-02-02");

INSERT INTO PEDIDO VALUES("0", 1, "2019-03-21", "951.951.678-69", "333.293.070-21", "1");
INSERT INTO PEDIDO VALUES("0", 4, "2019-03-22", "679.543.578-48", "515.845.488-43", "2");
INSERT INTO PEDIDO VALUES("0", 2, "2019-04-18", "478.000.198-61", "855.984.458-91", "3");
INSERT INTO PEDIDO VALUES("0", 3, "2019-06-12", "841.961.568-43", "197.982.808-30", "4");
INSERT INTO PEDIDO VALUES("0", 7, "2019-09-01", "300.766.408-09", "910.222.368-65", "5");
INSERT INTO PEDIDO VALUES("0", 6, "2019-10-17", "736.544.908-08", "827.850.088-63", "6");
INSERT INTO PEDIDO VALUES("0", 1, "2019-11-15", "816.322.578-58", "198.656.328-61", "7");
INSERT INTO PEDIDO VALUES("0", 2, "2020-01-05", "822.737.038-13", "584.047.828-81", "8");
INSERT INTO PEDIDO VALUES("0", 4, "2020-01-13", "913.801.178-60", "436.697.618-88", "9");
INSERT INTO PEDIDO VALUES("0", 8, "2020-02-02", "485.524.238-12", "571.006.238-39", "10");

INSERT INTO ENTREGADOR VALUES("323.386.288-10", "Oliver Joaquim Erick Porto", "(11) 99329-7134");
INSERT INTO ENTREGADOR VALUES("530.848.698-04", "Daniel Alexandre Vicente Bernardes", "(11) 99788-5128");
INSERT INTO ENTREGADOR VALUES("927.640.628-00", "Murilo Enzo da Silva", "(11) 3923-4287");
INSERT INTO ENTREGADOR VALUES("240.028.648-55", "Enrico Alexandre Bernardes", "(11) 99413-3276");
INSERT INTO ENTREGADOR VALUES("229.961.398-60", "Tiago Juan Julio Pires", "(11) 99289-0647");
INSERT INTO ENTREGADOR VALUES("217.036.038-77", "Matheus Daniel Moura", "(11) 98889-3925");
INSERT INTO ENTREGADOR VALUES("153.933.228-44", "Edson Filipe da Paz", "(11) 99607-4322");
INSERT INTO ENTREGADOR VALUES("471.341.188-43", "Ryan Caleb Vicente da Rocha", "(11) 98879-2282");
INSERT INTO ENTREGADOR VALUES("150.030.358-53", "Juan Bruno Peixoto", "(17) 99682-7239");
INSERT INTO ENTREGADOR VALUES("197.955.138-34", "Bruno Osvaldo Severino Lima", "(11) 98967-6312");

INSERT INTO ENTREGA VALUES("0", "Oliver Joaquim Erick Porto", "2019-03-22", "1001", "323.386.288-10");
INSERT INTO ENTREGA VALUES("0", "Daniel Alexandre Vicente Bernardes", "2019-03-23", "1002", "530.848.698-04");
INSERT INTO ENTREGA VALUES("0", "Murilo Enzo da Silva", "2019-04-19", "1003", "927.640.628-00");
INSERT INTO ENTREGA VALUES("0", "Enrico Alexandre Bernardes", "2019-06-13", "1004", "240.028.648-55");
INSERT INTO ENTREGA VALUES("0", "Tiago Juan Julio Pires", "2019-09-02", "1005", "229.961.398-60");
INSERT INTO ENTREGA VALUES("0", "Matheus Daniel Moura", "2019-10-18", "1006", "217.036.038-77");
INSERT INTO ENTREGA VALUES("0", "Edson Filipe da Paz", "2019-11-16", "1007", "153.933.228-44");
INSERT INTO ENTREGA VALUES("0", "Ryan Caleb Vicente da Rocha", "2020-01-06", "1008", "471.341.188-43");
INSERT INTO ENTREGA VALUES("0", "Juan Bruno Peixoto", "2020-01-14", "1009", "150.030.358-53");
INSERT INTO ENTREGA VALUES("0", "Bruno Osvaldo Severino Lima", "2020-02-03", "1010", "197.955.138-34");

INSERT INTO FORNECEDOR VALUES(1, "BRASILUX", "(81)92596-9568");
INSERT INTO FORNECEDOR VALUES(2, "EUCATEX", "(75)91368-6167");
INSERT INTO FORNECEDOR VALUES(3, "LUKSCOLOR", "(12)99441-7565");
INSERT INTO FORNECEDOR VALUES(4, "RENNER SAYERLACK", "(81)99501-2910");
INSERT INTO FORNECEDOR VALUES(5, "LOROY MERLIN", "(82)99310-7788");
INSERT INTO FORNECEDOR VALUES(6, "SUVINIL", "(11)99734-7527");
INSERT INTO FORNECEDOR VALUES(7, "CORAL", "(45)99756-6464");
INSERT INTO FORNECEDOR VALUES(8, "RURAL", "(14)99610-7699");
INSERT INTO FORNECEDOR VALUES(9, "SHERWIN-WILLIAMS", "(62)99647-7571");
INSERT INTO FORNECEDOR VALUES(10, "MEGA", "(44)997410-9574");

INSERT INTO LOTE VALUES(1, 20, "2023-10-15");
INSERT INTO LOTE VALUES(2, 10, "2022-12-18");
INSERT INTO LOTE VALUES(3, 12, "2021-09-02");
INSERT INTO LOTE VALUES(4, 20, "2023-01-22");
INSERT INTO LOTE VALUES(5, 15, "2023-10-17");
INSERT INTO LOTE VALUES(6, 10, "2022-03-29");
INSERT INTO LOTE VALUES(7, 12, "2023-11-15");
INSERT INTO LOTE VALUES(8, 10, "2022-06-30");
INSERT INTO LOTE VALUES(9, 20, "2021-04-09");
INSERT INTO LOTE VALUES(10, 12, "2023-05-24");

INSERT INTO TINTA VALUES("0", "BRASILUX", "VERMELHO - TOMATE", "ESMALTE A BASE D'AGUA", 2);
INSERT INTO TINTA VALUES("0", "SUVINIL", "BRANCO - GELO", "ESMALTE", 1);
INSERT INTO TINTA VALUES("0", "CORAL", "AZUL PISCINA", "LATEX", 3);
INSERT INTO TINTA VALUES("0", "SHERWIN-WILLIAMS", "AREIA", "LATEX", 4);
INSERT INTO TINTA VALUES("0", "SUVINIL", "CAMURÇA", "LATEX", 9);
INSERT INTO TINTA VALUES("0", "BRASILUX", "LAVANDA", "ESMALTE", 6);
INSERT INTO TINTA VALUES("0", "LUKSCOLOR", "MOSTARDA", "LATEX", 7);
INSERT INTO TINTA VALUES("0", "EUCATEX", "PÉROLA", "ESMALTE A BASE D'AGUA", 5);
INSERT INTO TINTA VALUES("0", "MEGA", "AMARELO - OURO", "ESMALTE", 10);
INSERT INTO TINTA VALUES("0", "RURAL", "PALHA", "LATEX", 2);

select * from PESSOA;
select * from FUNCIONARIO;
select * from CLIENTE;
select * from PAGAMENTO;
select * from PEDIDO;
select * from ENTREGADOR;
select * from FORNECEDOR;
select * from LOTE;
select * from TINTA;