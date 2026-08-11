CREATE DATABASE Logitech_db;

USE Logitech_db;

CREATE TABLE motorista (
		id_motorista INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(100) NOT NULL,
        cpf VARCHAR(11) NOT NULL,
        telefone VARCHAR(11),
        email VARCHAR (100),
        cnh VARCHAR(11)
	);
    
CREATE TABLE frota (
		id_frota INT PRIMARY KEY AUTO_INCREMENT,
        placa VARCHAR(7) NOT NULL,
        modelo VARCHAR(50),
        ano DATE,
        capacidade_carga DECIMAL(5,2),
        status VARCHAR(20)
	);
    
CREATE TABLE ferramenta (
		id_ferramenta INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(100),
        descricao TEXT,
        quantidade INT
	);
    
CREATE TABLE rota (
		id_rota INT PRIMARY KEY AUTO_INCREMENT,
        origem VARCHAR(50),
        destino VARCHAR(100),
        distancia_km DECIMAL(5,2),
        tempo_estimado VARCHAR(100)
	);    
    
CREATE TABLE entrega (
		id_entrega INT PRIMARY KEY AUTO_INCREMENT,
        descricao TEXT,
        data_saida DATE,
        data_prevista DATE,
        status VARCHAR(20),
        id_rota_fk INT,
        CONSTRAINT id_rota_entrega
        FOREIGN KEY (id_rota_fk) REFERENCES rota(id_rota)
		ON DELETE CASCADE
	);
        
CREATE TABLE motorista_frota (
		id_motorista INT,
        id_frota INT,
        data_inicio DATE,
        data_fim DATE,
        
        PRIMARY KEY(id_motorista, id_frota),
        FOREIGN KEY(id_motorista) REFERENCES motorista(id_motorista) ON DELETE CASCADE,
        FOREIGN KEY (id_frota) REFERENCES frota(id_frota) ON DELETE CASCADE
	);
    
CREATE TABLE frota_ferramenta (
		id_frota INT,
		id_ferramenta INT,
		quantidade_utilizada INT,

		PRIMARY KEY (id_frota, id_ferramenta),
		FOREIGN KEY (id_frota) REFERENCES frota(id_frota) ON DELETE CASCADE,
		FOREIGN KEY (id_ferramenta) REFERENCES ferramenta(id_ferramenta) ON DELETE CASCADE
);

CREATE TABLE entrega_motorista (
		id_entrega INT,
		id_motorista INT,

		PRIMARY KEY (id_entrega, id_motorista),
		FOREIGN KEY (id_entrega) REFERENCES entrega(id_entrega) ON DELETE CASCADE,
		FOREIGN KEY (id_motorista) REFERENCES motorista(id_motorista) ON DELETE CASCADE
);