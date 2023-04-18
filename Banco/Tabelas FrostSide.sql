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
  cep CHAR(9));
  
  CREATE TABLE empresa (
  idEmpresa INT PRIMARY KEY auto_increment,
  razaoSocial VARCHAR(45),
  CNPJ CHAR(18),
  fkEndereco INT,
    FOREIGN KEY (fkEndereco)
    REFERENCES endereco (idEndereco));
    
    CREATE TABLE usuario (
  idUsuário INT PRIMARY KEY auto_increment,
  nome VARCHAR(45),
  email VARCHAR(45),
  senha VARCHAR(45),
  documento VARCHAR(45),
  fkEmpresa INT,
    FOREIGN KEY (fkEmpresa)
    REFERENCES empresa (idEmpresa));
  
CREATE TABLE sensor (
  idSensor INT PRIMARY KEY auto_increment,
  tipo VARCHAR(45));
  
  CREATE TABLE registro (
  idRegistro INT PRIMARY KEY auto_increment,
  valor FLOAT,
  dataRegistro DATE,
  fkSensor INT,
    FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor));

CREATE TABLE caminhao (
  idcaminhao INT PRIMARY KEY auto_increment,
  fkSensor INT,
    FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor));


-- ver depois
CREATE TABLE armazenamento (
  fkSensor INT PRIMARY KEY auto_increment,
  idArmazenamento INT,
  fkEndereco INT,
    FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor),
    FOREIGN KEY (fkEndereco)
    REFERENCES endereco (idEndereco));

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
