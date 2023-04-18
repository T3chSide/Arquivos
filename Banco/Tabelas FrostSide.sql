CREATE DATABASE FrostSide;
USE FrostSide ;

CREATE TABLE endereco (
  idEndereco INT PRIMARY KEY auto_increment,
  estado VARCHAR(45),
  cidade VARCHAR(45),
  bairro VARCHAR(45),
  logradouro VARCHAR(45),
  numero VARCHAR(45),
  complemento VARCHAR(45),
  cep CHAR(9)
  
  );
  
  DESC endereco;
  
  CREATE TABLE empresa (
  idEmpresa INT PRIMARY KEY auto_increment,
  razaoSocial VARCHAR(45),
  CNPJ CHAR(18),
  fkEndereco INT,
    FOREIGN KEY (fkEndereco)
    REFERENCES endereco (idEndereco));
    
    DESC empresa;
    
    CREATE TABLE usuario (
  idUsuário INT PRIMARY KEY auto_increment,
  nome VARCHAR(45),
  email VARCHAR(45),
  senha VARCHAR(45),
  documento VARCHAR(45),
  fkEmpresa INT,
    FOREIGN KEY (fkEmpresa)
    REFERENCES empresa (idEmpresa));
    
    DESC usuario;
  
CREATE TABLE sensor (
  idSensor INT PRIMARY KEY auto_increment,
  tipo VARCHAR(45));
  
  DESC sensor;
  
  CREATE TABLE registro (
  idRegistro INT PRIMARY KEY auto_increment,
  valor FLOAT,
  dataRegistro DATE,
  fkSensor INT,
    FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor));

DESC registro;

CREATE TABLE caminhao (
  idcaminhao INT PRIMARY KEY auto_increment,
  fkSensor INT,
    FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor));
    -- dados do caminhao?

DESC caminhao;



CREATE TABLE armazenamento (
  idArmazenamento INT PRIMARY KEY auto_increment,
  fkSensor INT,
  fkEndereco INT,
    FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor),
    FOREIGN KEY (fkEndereco)
    REFERENCES endereco (idEndereco));
    
DESC armazenamento;
    
CREATE TABLE lote (
  idLote INT PRIMARY KEY auto_increment,
  fkCaminhao INT,
  qntdVacinas VARCHAR(45),
  tipoVacina VARCHAR(45),
  fkArmazenamento INT,
    FOREIGN KEY (fkCaminhao)
    REFERENCES caminhao (idcaminhao),
    FOREIGN KEY (fkArmazenamento)
    REFERENCES armazenamento (idArmazenamento));
    
DESC lote;
