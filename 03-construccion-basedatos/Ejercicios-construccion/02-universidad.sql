--Crear la Base de Datos
CREATE DATABASE universidad;
GO

USE universidad;
GO

-- Tabla Dependiente
CREATE TABLE departamento(
num_dep INT NOT NULL IDENTITY(1,1),
nombre_dep VARCHAR(50) NOT NULL,
CONSTRAINT pk_departamento
PRIMARY KEY (num_dep)
);
GO

-- Tabla Alumno
CREATE TABLE alumno(
matricula INT NOT NULL IDENTITY(1,1),
nombre VARCHAR(30) NOT NULL,
apellido1 VARCHAR(20) NOT NULL,
apellido2 VARCHAR(20),
correo VARCHAR(50) NOT NULL,
fecha_nac DATE NOT NULL,
CONSTRAINT pk_alumno 
PRIMARY KEY (matricula),
CONSTRAINT uq_alumno_correo
UNIQUE (correo)
);
GO

-- Tabla Proyecto 
CREATE TABLE proyecto(
num_proy INT NOT NULL IDENTITY(1,1),
nombre_proye VARCHAR(50) NOT NULL,
presupuesto DECIMAL(12,2) NOT NULL,
CONSTRAINT pk_proyecto
PRIMARY KEY (num_proy)
);
GO

-- Tabla Profesor 
CREATE TABLE profesor(
num_profesor INT NOT NULL IDENTITY(1,1),
nombre VARCHAR(30) NOT NULL,
apellido1 VARCHAR(20) NOT NULL,
apellido2 VARCHAR(20),
num_dep INT NOT NULL,
CONSTRAINT pk_profesor
PRIMARY KEY (num_profesor),
CONSTRAINT fk_profesor_departamento 
FOREIGN KEY (num_dep) 
REFERENCES departamento(num_dep)
);
GO

-- Tabla Materia 
CREATE TABLE materia(
id_materia INT NOT NULL IDENTITY(1,1),
nombre_materia VARCHAR(50) NOT NULL,
creditos INT NOT NULL,
num_profesor INT NOT NULL,
CONSTRAINT pk_materia
PRIMARY KEY (id_materia),
CONSTRAINT fk_materia_profesor 
FOREIGN KEY (num_profesor) 
REFERENCES profesor(num_profesor)
);
GO

-- Tabla Numero
CREATE TABLE numero(
id_telefono INT NOT NULL IDENTITY(1,1),
matricula INT NOT NULL,
numero_tel VARCHAR(15) NOT NULL,
CONSTRAINT pk_numero 
PRIMARY KEY (id_telefono),
CONSTRAINT fk_numero_alumno
FOREIGN KEY (matricula) 
REFERENCES alumno(matricula)
);
GO

-- Tabla Credencial
CREATE TABLE credencial(
num_credencial INT NOT NULL IDENTITY(1,1),
fecha_inscripcion DATETIME2 NOT NULL,
vigencia DATE NOT NULL,
matricula INT NOT NULL,
CONSTRAINT pk_credencial
PRIMARY KEY (num_credencial),
CONSTRAINT fk_credencial_alumno 
FOREIGN KEY (matricula) 
REFERENCES alumno(matricula),
CONSTRAINT uq_credencial_alumno 
UNIQUE (matricula)
);
GO

-- Tabla Cursa
CREATE TABLE cursa(
matricula INT NOT NULL,
id_materia INT NOT NULL,
fecha_inscripcion DATETIME2 NOT NULL,
calif_final DECIMAL(4,2),
CONSTRAINT pk_cursa 
PRIMARY KEY (matricula, id_materia),
CONSTRAINT fk_cursa_alumno 
FOREIGN KEY (matricula) 
REFERENCES alumno(matricula),
CONSTRAINT fk_cursa_materia 
FOREIGN KEY (id_materia) 
REFERENCES materia(id_materia)
);
GO

-- Tabla Parcticipa 
CREATE TABLE participa(
num_profesor INT NOT NULL,
num_proy INT NOT NULL,
fecha_inicio DATE NOT NULL,
rol VARCHAR(30) NOT NULL,
CONSTRAINT pk_participa 
PRIMARY KEY (num_profesor, num_proy),
CONSTRAINT fk_participa_profesor 
FOREIGN KEY (num_profesor) 
REFERENCES profesor(num_profesor),
CONSTRAINT fk_participa_proyecto 
FOREIGN KEY (num_proy) 
REFERENCES proyecto(num_proy)
);
GO

-- Tabla Dependiente
CREATE TABLE dependiente(
num_dependiente INT NOT NULL IDENTITY(1,1),
nombre VARCHAR(30) NOT NULL,
edificio VARCHAR(20),
num_profesor INT NOT NULL,
CONSTRAINT pk_dependiente 
PRIMARY KEY (num_dependiente),
CONSTRAINT fk_dependiente_profesor 
FOREIGN KEY (num_profesor) 
REFERENCES profesor(num_profesor)
);
GO