-- Crear la Base de Datos 
CREATE DATABASE cursos;
GO

USE cursos;
GO

-- Tabla Profesor
CREATE TABLE profesor(
id_profesor INT NOT NULL IDENTITY(1,1),
nombre VARCHAR(30) NOT NULL,
apellido1 VARCHAR(20) NOT NULL,
apellido2 VARCHAR(20),
CONSTRAINT pk_profesor 
PRIMARY KEY (id_profesor)
);
GO

-- Tabla Especialidad
CREATE TABLE especialidad(
id_especialidad INT NOT NULL IDENTITY(1,1),
especialidad VARCHAR(50) NOT NULL,
id_profesor INT NOT NULL,
CONSTRAINT pk_especialidad 
PRIMARY KEY (id_especialidad),
CONSTRAINT fk_especialidad_profesor 
FOREIGN KEY (id_profesor) 
REFERENCES profesor(id_profesor)
);
GO

-- Tabla Curso
CREATE TABLE cursos(
num_cursos INT NOT NULL IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL,
creditos INT NOT NULL,
id_profesor INT NOT NULL,
CONSTRAINT pk_cursos 
PRIMARY KEY (num_cursos),
CONSTRAINT fk_cursos_profesor 
FOREIGN KEY (id_profesor) 
REFERENCES profesor(id_profesor)
);
GO