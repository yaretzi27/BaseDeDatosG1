sql
CREATE DATABASE profesor;
GO

USE profesor;
GO

--Tabla Alumno
CREATE TABLE Alumno (
Matricula VARCHAR (20) NOT NULL,
Nombre VARCHAR (50) NOT NULL,
Apellido VARCHAR(50) NOT NULL,
Apellido2 VARCHAR (50),
Correo VARCHAR (100),
FechaNaci DATE,
PRIMARY KEY (Matricula)
);
GO

-- Tabla Departamento
CREATE TABLE Departamento (
NumDepa INT IDENTITY(1,1),
Nombre VARCHAR (100) NOT NULL,
Edificio VARCHAR (50),
PRIMARY KEY (NumDepa)
);
GO

--Tabla Telefono
CREATE TABLE Telefono (
telefono_id INT IDENTITY (1,1),
Matricula VARCHAR(20) NOT NULL,
NumeroTotal VARCHAR(20),
Tel VARCHAR (20),
PRIMARY KEY (telefono_id),
CONSTRAINT PK_Telefono_Alumno
FOREIGN KEY (Matricula)
REFERENCES Alumno(Matricula)
ON DELETE CASCADE
ON UPDATE CASCADE
);
GO

-- Tabla Credencial
CREATE TABLE Credencial (
NumCredencial INT IDENTITY (1,1),
FechaInscripcion DATE  NOT NULL,
Vigencia DATE NOT NULL,
Matricula VARCHAR (20) NOT NULL,
Idtel INT NULL,
PRIMARY KEY (NumCredencial),
CONSTRAINT FK_CREDENCIAL_ALUMNO
FOREIGN KEY (Matricula)
REFERENCES Alumno (Matricula)
ON DELETE CASCADE 
ON UPDATE CASCADE,
CONSTRAINT FK_CREDENCUAL_TELEFONO
FOREIGN KEY (Idtel)
REFERENCES Telefono(telefono_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

-- Tabla Profesor
CREATE TABLE Profesor (
    NumProfe INT IDENTITY (1,1),
    Nombre VARCHAR (30) NOT NULL,
    Apellido VARCHAR (20) NOT NULL,
    Apellido2 VARCHAR(20),
    NumDepa INT NOT NULL,
    NumDep INT NULL,
    Participa INT NULL,
    NumProyecto INT NULL,
    PRIMARY KEY (NumProfe),
    CONSTRAINT FK_Profesor_departamento 
        FOREIGN KEY (NumDepa) 
        REFERENCES Departamento (NumDepa)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
GO

-- Tabla Proyecto
CREATE TABLE Proyecto (
NumProyects INT IDENTITY(1,1),
Nombre VARCHAR(100) NOT NULL,
Presupuesto DECIMAL (12,2),
Profesor INT NULL,
NumDep INT NULL,
PRIMARY KEY (NumProyects),
CONSTRAINT FK_proyects_profesor
FOREIGN KEY (Profesor)
REFERENCES Profesor(NumProfe)
ON DELETE NO ACTION 
ON UPDATE NO ACTION,
CONSTRAINT FK_proyects_departamento
FOREIGN KEY (NumDep)
REFERENCES Departamento (NumDepa)
ON DELETE NO ACTION 
ON UPDATE NO ACTION 
);
GO

-- Tabla Materia 
CREATE TABLE Materia (
    materiaID INT IDENTITY (1,1),
    nombreMateria VARCHAR (70) NOT NULL,
    creditos INT NOT NULL,
    numProf INT NOT NULL,
    totalMateria INT,
    numProfe INT NULL,
    PRIMARY KEY (materiaID),
    CONSTRAINT FK_Materia_Profesor
        FOREIGN KEY (numProf)
        REFERENCES Profesor(NumProfe)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
GO

--Tabla Dependiente 
CREATE TABLE Dependiente(
NumProf INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    FechaNaci DATE,
    Parentesco VARCHAR(50),
    NumProfe INT NULL,
    PRIMARY KEY (NumProf, Nombre),
    CONSTRAINT FK_Dependiente_Profesor 
        FOREIGN KEY (NumProf) 
        REFERENCES Profesor(Numprofe)
        ON DELETE CASCADE ON UPDATE CASCADE
); 
GO

-- Tabla Cursa
CREATE TABLE Cursa (
    matricula VARCHAR(20) NOT NULL,
    materiaID INT NOT NULL,
    transcripcion TEXT,
    calificacionFinal DECIMAL(4,2),
    fechaInscripcion DATE,
    PRIMARY KEY (matricula, materiaID),
    CONSTRAINT FK_Cursa_Alumno
        FOREIGN KEY (matricula)
        REFERENCES Alumno(matricula)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Cursa_Materia
        FOREIGN KEY (materiaID)
        REFERENCES Materia(materiaID)
        ON DELETE NO ACTION ON UPDATE CASCADE
);
GO

-- Tabla Participa 
CREATE TABLE Participa (
    numProfe INT NOT NULL,
    numProyect INT NOT NULL,
    rol VARCHAR(50),
    fechaInicio DATE,
    PRIMARY KEY (numProfe, numProyect),
    CONSTRAINT FK_Participa_Profesor
        FOREIGN KEY (numProfe)
        REFERENCES Profesor(NumProfe)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Participa_Proyects
        FOREIGN KEY (numProyect)
        REFERENCES Proyecto(NumProyects)
        ON DELETE NO ACTION ON UPDATE CASCADE
);
GO

ALTER TABLE Profesor
ADD CONSTRAINT FK_Profesor_Proyecto
FOREIGN KEY (NumProyecto)
REFERENCES Proyecto(NumProyects);
GO