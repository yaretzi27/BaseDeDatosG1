--Crear una base de datos 
CREATE DATABASE bdconstraint;
Go

--Usar la bese de datos
USE bdconstraint;
GO

--RAZON DE CARDINALIDAD 1:1

--Crear tabla paciente
CREATE TABLE paciente(
	Idpaciente INT NOT NULL,
	Nombre VARCHAR (40) NOT NULL,
	Apellido1 VARCHAR (20) NOT NULL,
	Apellido2 VARCHAR (20)  NULL,
	Fechanaci DATE NOT NULL,
	CONSTRAINT pk_paciente
	PRIMARY KEY (Idpaciente )
);
GO

CREATE TABLE expediente (
Indexp INT NOT NULL PRIMARY KEY,
Fechaapertura DATE NOT NULL,
Tiposangre char(3) NULL,
Idpaciente INT NOT NULL,
CONSTRAINT unique_idpaciente
UNIQUE(idpaciente),
CONSTRAINT fk_expedinte_paciente
FOREIGN KEY (Idpaciente)
REFERENCES paciente (Idpaciente)
);
GO


--Datos para las tablas 

INSERT INTO paciente
VALUES (1,'Jose Domingo', 'Perez',
			'Hernandez',  '1995-03-21');


INSERT INTO paciente
VALUES (2,'Jose Luis', 'Herrera',
			'Gallardo',  '1978-04-06');

Select * from paciente

INSERT INTO paciente
VALUES (3,'Marile', 'Lopez',
			'Cruz',  '2005-01-14'),
       (4,'Gladis Jhoana', 'Santiago',
			'Higinio',  '2007-07-13');

--INSERTAR EXPEIENTE
  INSERT INTO expediente
  VALUES (1,'GETDATE()', '+0', 1);

  SELECT * FROM expediente





