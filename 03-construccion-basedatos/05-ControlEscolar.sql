-- Crear la Base de Datos  
CREATE DATABASE control_escolar;
GO

-- Usar la Base de Datos 
USE control_escolar;
GO

-- Tabla Alumno
CREATE TABLE alumno(
id_alumno INT NOT NULL IDENTITY(1,1),
matricula VARCHAR(15) NOT NULL,
nombre VARCHAR(20) NOT NULL, 
apellido1 VARCHAR(15) NOT NULL,
apellido2 VARCHAR(15),
semestre INT NOT NULL,
CONSTRAINT pk_alumno
PRIMARY KEY (id_alumno),
CONSTRAINT uq_alumno_matricula
UNIQUE (matricula),
);
GO

-- Tabla Materia 
CREATE TABLE materia(
num_materia INT NOT NULL IDENTITY(1,1),
nombre VARCHAR(20) NOT NULL,
creditos INT NOT NULL,
CONSTRAINT pk_matricula
PRIMARY KEY(num_materia),
);
GO

-- Tabla Inscribe 
CREATE TABLE inscribe(
id_alumno INT NOT NULL,
num_materia INT NOT NULL,
fecha_inicio DATETIME2 NOT NULL,

);