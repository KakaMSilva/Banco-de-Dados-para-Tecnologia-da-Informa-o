create database empresa
default character set utf8 
default collate utf8_general_ci;


CREATE TABLE Dependentes (
    idDependentes int NOT NULL auto_increment,
    Empregado_idEmpregado int,
    NomeDependentes VARCHAR(50) NULL,
    Data_Nasc DATE NULL,
    Sexo ENUM('M', 'F') NULL,
    RG INTEGER UNSIGNED NULL,
    PRIMARY KEY (idDependentes),
    FOREIGN KEY (Empregado_idEmpregado ) REFERENCES Empregado (idEmpregado)
);

CREATE TABLE Empregado (
  idEmpregado int NOT NULL auto_increment,
  Departamento_idDepartamento int,
  NomeEmpregado VARCHAR(50) NULL NOT NULL,
  CPF VARCHAR(15)  NULL NOT NULL,
  Sexo ENUM('M', 'F') NULL NOT NULL,
  Telefone INTEGER(15) UNSIGNED NULL,
  CEP VARCHAR(50) NULL NOT NULL,
  Data_de_Nascimento DATE NULL NOT NULL,
  Cargo VARCHAR(50) NULL NOT NULL,
  Supervisor VARCHAR(50) NULL,
  Salario FLOAT(15,2) NULL NOT NULL,
  PRIMARY KEY(idEmpregado),
  FOREIGN KEY (Departamento_idDepartamento ) REFERENCES Departamento (idDepartamento)
);


CREATE TABLE Projetos (
  idProjetos int NOT NULL auto_increment,
  Data_de_início DATE NULL,
  Participantes VARCHAR(500) NULL,
  Etapas  INTEGER UNSIGNED NULL,
  Descrição text NULL,
  PRIMARY KEY(idProjetos)
);


CREATE TABLE Departamento  (
  idDepartamento int NOT NULL auto_increment,
  Descrição text  NULL,
  Nome VARCHAR(50) NULL,
  Gerente VARCHAR(50) NULL,
  PRIMARY KEY(idDepartamento)
);

CREATE TABLE Departamento_Nos_Projetos (
Departamento_idDepartamento int, 
Projetos_idProjetos int,
Date_acesso date,
FOREIGN KEY (Departamento_idDepartamento) REFERENCES departamento (idDepartamento),
FOREIGN KEY (Projetos_idProjetos) REFERENCES Projetos (idProjetos)
);

CREATE TABLE Empregado_Nos_Projetos (
  Empregado_idEmpregado int ,
  Projetos_idProjetos int,
  Descrição text NULL,
  Data_Final DATE,
  FOREIGN KEY (Empregado_idEmpregado) REFERENCES Empregado (idEmpregado), 
  FOREIGN KEY (Projetos_idProjetos) REFERENCES Projetos (idProjetos)
);



INSERT INTO Dependentes
(idDependentes, Empregado_idEmpregado, NomeDependentes, Data_Nasc, Sexo, RG)
VALUES
('1', '1', 'Júlia Castro', '2007-02-01', 'f', '411598582'),
('2', '1', 'Isabella Oliveira', '2001-11-09', 'f', '412852974'),
('3', '2', 'Gabrielly Melo', '2014-05-21', 'm', '224152269'),
('4', '2', 'Matheus', '2000-04-11', 'm', '168932222'),
('5', '2', 'Joao', '2014-03-20', 'm', '202122566'),
('6', '3', 'Luis Carvalho', '2018-11-14', 'm', '393644807'),
('7', '4', 'Paulo Silva', '2004-12-17', 'm', '418820545'),
('8', '4', 'Gabriel Santos', '1994-09-24', 'm', '207315395'),
('9', '5', 'Miguel Souza', '1995-07-08', 'm', '328717897'),
('10', '10', 'Leila Cavalcanti', '2011-04-04', 'f', '242892784'),
('11', '13', 'Leonor Correia', '2009-08-25', 'f', '506249487'),
('12', '14', 'Fernanda Sousa', '2017-03-14', 'f', '204791662'),
('13', '15', 'Sophia Dias', '1999-02-28', 'f', '265095037'),
('14', '16', 'Marcos Araujo', '2001-11-30', 'm', '207120523'),
('15', '16', 'Marcos Araujo', '2001-11-30', 'm', '207120523'),
('16', '17', 'Luiz Azevedo', '2002-09-27', 'm', '183333007');

select * from dependentes;
SET sql_safe_updates=0;
delete  from dependentes;




INSERT INTO Empregado
(idEmpregado, Departamento_idDepartamento, NomeEmpregado, CPF, Sexo, Telefone, CEP, Data_de_Nascimento, Cargo, Supervisor, Salario)
VALUES
('1', '2', 'Kamilly Mariane Pereira', '47603778670', 'F', '30372736', '83408521', '1993-10-10', 'Programador', 'Heloisa Beatriz Barbosa', '1400.00'),
('2', '2', 'Sueli Juliana Carla Martins', '47603778671', 'F', '30372720', '83408522', '1991-11-20', 'Programador', 'Heloisa Beatriz Barbosa', '1400.00'),
('3', '2', 'Heloisa Beatriz Barbosa', '47603778672',  'F',  '30372721', '83408523', '1994-03-22', 'Supervisor', 'Pietro Carlos da Cunha', '2000.00'),
('4', '5', 'Carla Márcia Sophie Souza', '47603778673',  'F',  '30372722', '83408524', '1995-02-11', 'Financeiro', 'Marcos', '1200.00'),
('5', '5', 'Theo Paulo Drumond', '47603778674', 'M',   '30372723', '83408525', '1996-05-09', 'Financeiro', 'Aparecida Julia Pereira', '1200.00'),
('6', '5', 'Tomás Luís da Cruz', '47603778675', 'M', '30372724', '83408526', '1998-07-05', 'Financeiro', 'Aparecida Julia Pereira', '1200.00'),
('7', '6', 'Rayssa Antonella Pietra Assis', '47603778676', 'F', '30372726', '83408527', '1992-12-09', 'Suporte', 'Fátima Lívia Rayssa Cardoso', '1500.00'),
('8', '6', 'Erick Leonardo Murilo de Paula', '47603778677', 'M', '30372725', '83408528', '1993-11-15', 'Suporte', 'Fátima Lívia Rayssa Cardoso', '1500.00'),
('9', '2', 'Pietro Carlos da Cunha', '47603778678', 'M', '30372727', '83408529', '1995-10-17', 'Chefe TI', 'Sérgio Gabriel Galvão', '4000.00'),
('10', '5', 'Aparecida Julia Pereira', '47603778679', 'F', '30372728', '83408510', '1994-09-18', 'Chefe Financeiro', 'Sérgio Gabriel Galvão', '3000.00'),
('11', '1', 'André Alexandre Augusto Drumond', '47603778680', 'M', '30372729', '83408511', '1991-08-19', 'Limpeza', 'Sérgio Gabriel Galvão', '1000.00'),
('12', '4', 'Joaquim Kaique Fernando dos Santos','47603778681', 'M',  '30372730', '83408512', '1990-07-20', 'Secretaria', 'Sérgio Gabriel Galvão', '1200.00'),
('13', '2', 'Silvana Luzia Brenda da Cunha', '47603778682', 'F', '30372731', '83408513', '1998-05-14', 'Programador', 'Heloisa Beatriz Barbosa', '1400.00'),
('14', '2', 'Rayssa Clarice Maya Teixeira', '47603778683', 'F', '30372732', '83408514', '1997-04-24', 'Programador', 'Heloisa Beatriz Barbosa', '1400.00'),
('15', '0', 'Sérgio Gabriel Galvão', '47603778684', 'M', '30372733', '83408515', '1995-03-25', 'Chefe', null, '7000.00'),
('16', '3', 'Gabriel Silva', '47603778685', 'M', '30372734', '83408516', '1996-02-25', 'RH', 'Daiane Joana Josefa Gonçalves', '1200.00'),
('17', '3', 'Daiane Joana Josefa Gonçalves', '12345678911' , 'F', '30372735', '83408517', '1997-01-10', 'Chefe RH', 'Sérgio Gabriel Galvão', '3000.00'),
('18', '6', 'Fátima Lívia Rayssa Cardoso', '12345678912' , 'F', '30372700', '83408500', '1997-04-11', 'Chefe TI Suporte', 'Sérgio Gabriel Galvão', '3000.00');


select * from empregado;
SET sql_safe_updates=0;
delete  from empregado;



INSERT INTO Projetos
(idProjetos, Data_de_início, Participantes, Etapas, Descrição)
VALUES
('1', '2010-03-20', 'Daiane Joana Josefa Gonçalves', '2', 'Demitir funcionarios'),
('2','2020-03-21', 'Kamilly Mariane Pereira, Sueli Juliana Carla Martins', '8', 'Desenvolver um site'),
('3', '2019-03-22', 'Silvana Luzia Brenda da Cunha, Rayssa Clarice Maya Teixeira ', '9', 'Desenvolver um app'),
('4', '2018-03-23', 'Sérgio Gabriel Galvão, Aparecida Julia Pereira, Pietro Carlos da Cunha, Daiane Joana Josefa Gonçalves, Fátima Lívia Rayssa Cardoso ', '1', 'Falar sobre o futuro da empresa com outros chefes do departamento'),
('5', '2019-03-24', 'Daiane Joana Josefa Gonçalves, Gabriel Silva', '7', 'Entrevista sobre empregados futuros'),
('6', '2019-03-25', 'Rayssa Antonella Pietra Assis, Erick Leonardo Murilo de Paula, Pietro Carlos da Cunha, Fátima Lívia Rayssa Cardoso', '3', 'Arrumar setups do computador'),
('7', '2019-03-26', 'Sérgio Gabriel Galvão, Joaquim Kaique Fernando dos Santos ', '1', 'Falar sobre a liberação da catraca'),
('8', '2019-03-27', 'Joaquim Kaique Fernando dos Santos, André Alexandre Augusto Drumond', '2', 'Falar sobre as limpezas'),
('9', '2019-03-28', 'Theo Paulo Drumond, Tomás Luís da Cruz, Carla Márcia Sophie Souza, Aparecida Julia Pereira', '7', 'Contabilidade da empresa'),
('10', '2019-03-29', 'Tomás Luís da Cruz, Pietro Carlos da Cunha, André Alexandre Augusto Drumond, Silvana Luzia Brenda da Cunha, Fátima Lívia Rayssa Cardoso', '4', 'Aniversario do chefe'),
('11', '2019-03-10', 'Kamilly Mariane Pereira, Sueli Juliana Carla Martins, Silvana Luzia Brenda da Cunha, Rayssa Clarice Maya Teixeira', '7', 'Solucionar o problema do app e site desenvolvidos'),
('12', '2010-03-11', 'Heloisa Beatriz Barbosa, Pietro Carlos da Cunha', '2', 'Relatorio do site e app'),
('13', '2020-03-12', 'Daiane Joana Josefa Gonçalves, Aparecida Julia Pereira', '5', 'Quitação de conta da empresa'),
('14', '2020-03-13', 'Daiane Joana Josefa Gonçalves, Kamilly Mariane Pereira', '2', 'Promover a supervisora'),
('15', '2017-03-04', 'Joaquim Kaique Fernando dos Santos', '15', 'Expanção da empresa');



select * from Projetos;
SET sql_safe_updates=0;
delete  from Projetos;



INSERT INTO Departamento
(idDepartamento, Descrição, Nome, Gerente)
VALUES
('1', 'Gera limpeza do predio', 'Limpeza', 'André Alexandre Augusto Drumond'),
('2', 'Desenvolvedores', 'Programadores', 'Pietro Carlos da Cunha'),
('3', 'Recurso humano', 'RH', 'Daiane Joana Josefa Gonçalves'),
('4', 'Recpção', 'Secretaria', 'Sérgio Gabriel Galvão'),
('5', 'Contabilidade', 'Financeiro', 'Aparecida Julia Pereira'),
('6', 'Suporte ao equipamento tecnologicos', 'Suporte', 'Fátima Lívia Rayssa Cardoso');



select * from Departamento;
SET sql_safe_updates=0;
delete  from Projetos;

 INSERT INTO Departamento_Nos_Projetos
 (Departamento_idDepartamento, Projetos_idProjetos, Date_acesso)
 VALUES
 ('5', '1', '2018-04-20'),
 ('3', '1', '2020-05-31'),
 ('2', '2', '2018-09-21'),
 ('2', '3', '2020-06-24'),
 ('3', '4', '2018-06-24'),
 ('5', '4', '2019-08-28'), 
 ('4', '5', '2020-08-27'), 
 ('3', '5', '2019-11-23'), 
 ('6', '6', '2020-07-08'), 
 ('3', '7', '2019-10-07'), 
 ('4', '7', '2019-03-23'),
 ('1', '8', '2019-04-18'), 
 ('5', '9', '2018-05-04'), 
 ('2', '11', '2020-05-26'),
 ('2', '12', '2019-11-14'), 
 ('5', '13', '2018-09-14'), 
 ('3', '14', '2019-11-14'), 
 ('15', '15', '2018-10-14');
 
 select * from Departamento_Nos_Projetos;
 SET sql_safe_updates=0;
 delete  from Departamento_Nos_Projetos;
 
 
 INSERT INTO Empregado_Nos_Projetos
 (Empregado_idEmpregado, Projetos_idProjetos, Descrição, Data_Final)
 VALUES
 ('17', '1','Reunião de corte de custo','2020-02-20'),
 ('1', '2', 'Desenvolver um site', '2014-03-19'),
 ('2', '2', 'Desenvolver um site', '2014-03-19'),
 ('13', '3','Reunião falar sobre o app para testar','2019-05-18'),
 ('14', '3','Reunião falar sobre o app para testar','2019-05-18'),
 ('9', '4','Reunião com os top','2018-06-17'),
 ('10', '4','Reunião com os top','2018-06-17'),
 ('15', '4','Reunião com os top','2018-06-17'),
 ('17', '4','Reunião com os top','2018-06-17'),
 ('18', '4','Reunião com os top','2018-06-17'),
 ('17', '5','Reunião pra contratar','2019-09-07'),
 ('16', '5','Reunião pra contratar','2019-09-07'),
 ('8', '6','Reunião para arrumar setps','2016-11-29'),
 ('9', '6','Reunião para arrumar setps','2016-11-29'),
 ('14', '6','Reunião para arrumar setps','2016-11-29'),
 ('18', '6','Reunião para arrumar setps','2016-11-29'),
 ('12', '7','Reunião catraca','2017-03-10'),
 ('15', '7','Reunião catraca','2017-03-10'),
 ('12', '8','Reunião de limpeza','2018-07-20'),
 ('4', '9','Reunião contabilidade','2019-03-03'),
 ('5', '9','Reunião contabilidade','2019-03-03'),
 ('6', '9','Reunião contabilidade','2019-03-03'),
 ('10', '9','Reunião contabilidade','2019-03-03'),
 ('6', '10', 'Reunião aniversario', '2019-11-11'),
 ('9', '10', 'Reunião aniversario', '2019-11-11'),
 ('13', '10', 'Reunião aniversario', '2019-11-11'),
 ('18', '10', 'Reunião aniversario', '2019-11-11'),
 ('9', '1', 'Reunião do problema do app e site','2020-08-11'),
 ('9', '2', 'Reunião do problema do app e site','2020-08-11'),
 ('9', '13', 'Reunião do problema do app e site','2020-08-11'),
 ('9', '14', 'Reunião do problema do app e site','2020-08-11'),
 ('3', '12', 'Reunião de relatorio','2017-06-04'),
 ('9', '12', 'Reunião de relatorio','2017-06-04'),
 ('10', '13', 'Reunião de contas','2018-09-26'),
 ('17', '13', 'Reunião de contas','2018-09-26'),
 ('1', '14', 'Reunião de promoção','2018-04-16'),
 ('17', '14', 'Reunião de promoção','2018-04-16'),
 ('10', '15','Reunião de expanção','2019-05-22');
 
 
select * from Empregado_Nos_Projetos;
SET sql_safe_updates=0;
delete  from Empregado_Nos_Projetos;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`(Percentual int)
BEGIN
Update empregado
  Set  Salario = Salario + salario * (1 + (Percentual / 100));
END$$

DELIMITER ;

call empresa.new_procedure(50);

select empregado.NomeEmpregado, dependentes.NomeDependentes from empregado
left join dependentes 
on empregado.idEmpregado = dependentes.Empregado_idEmpregado;



select NomeEmpregado  from empregado
WHERE Salario = (select max(Salario) from empregado);


select NomeEmpregado, max(Salario) from empregado
WHERE Salario = (select max(Salario) from empregado);




select NomeEmpregado, Salario from empregado
order by Salario asc;




select avg(Salario) from empregado 
where Sexo = 'M'; 

select avg(Salario) from empregado 
where Sexo = 'F';



select NomeEmpregado, Cargo from empregado
where Cargo like 'Chefe%';


select distinct empregado.NomeEmpregado, count(*) from empregado
join empregado_nos_projetos
on empregado.idEmpregado = empregado_nos_projetos.Empregado_idEmpregado
join projetos
on empregado_nos_projetos.Projetos_idProjetos =  projetos.idProjetos
group by NomeEmpregado
order by NomeEmpregado asc;



update empregado
set Cargo = 'Supervisor', Salario = '2000.00', Supervisor = 'Pietro Carlos da Cunha'
where idEmpregado = '1';

delete from empregado
where idEmpregado = '3';

