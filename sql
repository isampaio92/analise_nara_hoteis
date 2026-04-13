-- Criação do banco de dados
CREATE DATABASE  analise_nara_hoteis;
USE analise_nara_hoteis;

-- 1. Tabela Hoteis 
CREATE TABLE hoteis (
    id_hotel INT PRIMARY KEY,
    nome_hotel VARCHAR(100),
    cidade VARCHAR(100),
    estado CHAR(2),
    categoria VARCHAR(50),
    n_quartos INT
);

-- 2. Tabela Hospedes 
CREATE TABLE hospedes (
    id_hospede INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    cidade_origem VARCHAR(100),
    estado CHAR(2),
    data_nascimento DATE,
    genero CHAR(1)
);

-- 3. Tabela Quartos 
CREATE TABLE quartos (
    id_quarto VARCHAR(10) PRIMARY KEY,
    id_hotel INT,
    tipo_quarto VARCHAR(50),
    capacidade INT,
    valor_base DECIMAL(10,2),
    andar INT,
    vista VARCHAR(50),
    FOREIGN KEY (id_hotel) REFERENCES hoteis(id_hotel)
);

-- 4. Tabela Reservas 
CREATE TABLE reservas (
    id_reserva INT PRIMARY KEY,
    id_hospede INT,
    id_quarto VARCHAR(10),
    id_hotel INT,
    data_checkin DATE,
    data_checkout DATE,
    canal_reserva VARCHAR(50),
    valor_diaria DECIMAL(10,2),
    status_reserva VARCHAR(50),
    data_reserva DATE,
    FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
    FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto),
    FOREIGN KEY (id_hotel) REFERENCES hoteis(id_hotel)
);

-- 5. Tabela Avaliacoes 
CREATE TABLE avaliacoes (
    id_avaliacao INT PRIMARY KEY,
    id_reserva INT,
    nota_geral DECIMAL(4,1),
    nota_limpeza DECIMAL(4,1),
    nota_atendimento DECIMAL(4,1),
    nota_custo_beneficio DECIMAL(4,1),
    comentario TEXT,
    data_avaliacao DATE,
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva)
);

-- Carregar Hoteis
LOAD DATA INFILE 'C:/Users/faria.leonardo/Documents/analise_nara_hoteis/csv/hoteis.csv'
INTO TABLE hoteis
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Carregar Hospedes
LOAD DATA INFILE 'C:/Users/faria.leonardo/Documents/analise_nara_hoteis/csv/hospedes.csv'
INTO TABLE hospedes
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Carregar Quartos
LOAD DATA INFILE 'C:/Users/faria.leonardo/Documents/analise_nara_hoteis/csv/quartos.csv'
INTO TABLE quartos
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_quarto, id_hotel, tipo_quarto, capacidade, @valor_base, andar, vista);

-- Carregar Reservas
LOAD DATA INFILE 'C:/Users/faria.leonardo/Documents/analise_nara_hoteis/csv/reservas.csv'
INTO TABLE reservas
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Carregar Avaliacoes
LOAD DATA INFILE 'C:/Users/faria.leonardo/Documents/analise_nara_hoteis/csv/avaliacoes.csv'
INTO TABLE avaliacoes
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_avaliacao, id_reserva, nota_geral, nota_limpeza, nota_atendimento, nota_custo_beneficio, comentario, data_avaliacao);