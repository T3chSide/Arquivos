CREATE DATABASE FrostSide;
USE FrostSide;

-- Tabela Empresa
CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY auto_increment,
NomeComercial VARCHAR (45),
cnpj CHAR(14),
NomeRepresentante VARCHAR(45)
)auto_increment=1000;


-- Tabela Usuário
 CREATE TABLE usuario(
 idUsuario INT PRIMARY KEY auto_increment,
 senha VARCHAR(45),
 email VARCHAR (45),
 fkEmpresa INT,
 constraint fkEmpresaUser foreign key (fkEmpresa) references empresa(idEmpresa)
 );

-- Tabela Sensor
CREATE TABLE sensor (
idSensor INT PRIMARY KEY auto_increment,
statusSensor VARCHAR(20),
constraint chkStatus CHECK (statusSensor in ('Ativo','Inativo'))
);

-- Tabela RegistroSensor
CREATE TABLE registroSensor(
idRegistro INT PRIMARY KEY auto_increment,
temperatura INT,
dtHora DATETIME,
fkSensor INT,
foreign key (fkSensor) references sensor(idSensor)
);


 -- Tabela Container
 CREATE TABLE container (
 idContainer INT PRIMARY KEY auto_increment,
 tipoContainer VARCHAR (40),
 constraint chkTipoContainer CHECK (tipoContainer in('caminhao','armazenamento')),
 identificacao VARCHAR (60),
fkEmpresa INT,
foreign key (fkEmpresa) references empresa(idEmpresa),
fkSensor INT,
foreign key (fkSensor) references sensor(idSensor)
 )auto_increment=100;


-- Tabela endereço
CREATE TABLE endereco (
idEndereco INT PRIMARY KEY auto_increment,
rua VARCHAR(45),
bairro VARCHAR(45),
cep CHAR(9),
cidade VARCHAR(45),
fkContainer INT,
foreign key (fkContainer) references container(idContainer)
);

-- Tabela Lote
CREATE TABLE lote(
idLote INT PRIMARY KEY auto_increment,
qtdvacinas INT,
dtHoraInicio DATETIME,
dtFinal DATE,
fkContainer INT,
foreign key (fkContainer) references container(idContainer)
);

