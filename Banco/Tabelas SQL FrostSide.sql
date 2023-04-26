CREATE DATABASE FrostSide;
USE FrostSide;

-- Tabela Empresa
CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY auto_increment,
NomeComercial VARCHAR (45),
cnpj CHAR(14),
NomeRepresentante VARCHAR(45)
)auto_increment=1000;
 INSERT INTO empresa VALUES
 (null,'Instituto Butantan', '3784600058-17', 'Rui Curi');
 INSERT INTO empresa VALUES
 (null,'Eurofarma', '7181990020-27', 'Frederico Nishimoto');
 SELECT * FROM empresa;

-- Tabela Usuário
 CREATE TABLE usuario(
 idUsuario INT PRIMARY KEY auto_increment,
 nome VARCHAR (45),
 nomeUser VARCHAR (45),
 senha VARCHAR(45),
 email VARCHAR (45),
 fkEmpresa INT,
 constraint fkEmpresaUser foreign key (fkEmpresa) references empresa(idEmpresa)
 );
 INSERT INTO usuario VALUES 
 (null,'Barbara Almeida','BarbaraAlmeida703', 'instB2023#1','AlmeidaBarbara_instituto703@butantan.gov.br',1000),
 (null, 'Victor Santos','VictorSantos703','instB2023#2','SantosVictor_instituto703@butantan.gov.br',1000),
(null, 'Valdir Campos','CValdir290','euroF2023#1','ValdirC290euro@eurofarma.gov.br',1001),
(null, 'Raquel Davilla','DRaquel290','euroF2023#2','RaquelD290euro@eurofarma.gov.br',1001);
SELECT * FROM usuario;


-- Tabela Sensor
CREATE TABLE sensor (
idSensor INT PRIMARY KEY auto_increment,
statusSensor VARCHAR(20),
constraint chkStatus CHECK (statusSensor in ('Ativo','Inativo'))
);

INSERT INTO sensor VALUES 
(null, 'Ativo'),
(null, 'Ativo'),
(null, 'Ativo'),
(null, 'Inativo');
SELECT * FROM sensor;

-- Tabela RegistroSensor
CREATE TABLE registroSensor(
idRegistro INT PRIMARY KEY auto_increment,
temperatura INT,
dtHora  DATETIME default current_timestamp,
fkSensor INT,
foreign key (fkSensor) references sensor(idSensor)
);

INSERT INTO registroSensor (temperatura,fkSensor) VALUES 
(3 , 1),
(4, 2),
(5 , 3),
(null , 4);
SELECT * FROM registroSensor;

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

INSERT INTO container VALUES 
(NULL,'caminhao','AFD4-984',1001,'1'),
(NULL,'armazenamento',NULL,1001,'2'),
(NULL,'caminhao','VNJ0-376',1000,'3'),
(NULL,'armazenamento',NULL,1000,'4');

SELECT * FROM container;



-- Tabela endereço
CREATE TABLE endereco (
idEndereco INT PRIMARY KEY auto_increment,
rua VARCHAR(45),
numero VARCHAR(20),
bairro VARCHAR(45),
cep CHAR(9),
cidade VARCHAR(45),
fkContainer INT,
foreign key (fkContainer) references container(idContainer)
);

INSERT INTO endereco VALUES 
(NULL, 'R. Ferraz de Vasconcelosl','80 ','Nossa Sra. do Ó','02760-060','São Paulo',103),
(NULL, ' Rua Oscar de Moura Lacerda','231',' Imirim ',' 02541-070','São Paulo',101);
SELECT * FROM endereco;

-- Tabela Lote
CREATE TABLE lote(
idLote INT PRIMARY KEY auto_increment,
qtdvacinas INT,
dtHoraInicio DATE,
dtFinal DATE,
fkContainer INT,
foreign key (fkContainer) references container(idContainer)
);

INSERT INTO lote VALUES 
(null,200, '2023-04-23','2024-04-23',100),
(null,200, '2023-04-23','2024-04-23',101),
(null,150, '2023-04-23','2024-04-23',102),
(null,150, '2023-04-23','2024-04-23',102);
SELECT * FROM lote;








