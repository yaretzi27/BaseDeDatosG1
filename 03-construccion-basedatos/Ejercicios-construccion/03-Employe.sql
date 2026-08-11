
-- Crear la Base de Datos
CREATE DATABASE employee;
GO

USE employee;
GO

-- Tabla Departamento
CREATE TABLE deparment(
    name VARCHAR(50) NOT NULL,
    number INT NOT NULL,
    manager VARCHAR(15),
    sladate DATE,
    CONSTRAINT pk_deparment 
    PRIMARY KEY (name, number)
);
GO

-- Tabla Empleado
CREATE TABLE employee(
    ssn VARCHAR(15) NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    address VARCHAR(100),
    salary DECIMAL(10,2),
    sex CHAR(1),
    birthdate DATE,
    namedep VARCHAR(50) NOT NULL,
    numberdep INT NOT NULL,
    jef VARCHAR(15),
    CONSTRAINT pk_employee
    PRIMARY KEY (ssn),
    CONSTRAINT fk_employee_deparment 
    FOREIGN KEY (namedep, numberdep) 
    REFERENCES deparment(name, number),
    CONSTRAINT fk_employee_jef 
    FOREIGN KEY (jef) 
    REFERENCES employee(ssn)
);
GO

-- Tabla Location
CREATE TABLE location(
    numlocation INT NOT NULL,
    namedep VARCHAR(50) NOT NULL,
    numberdep INT NOT NULL,
    numerlocation INT,
    CONSTRAINT pk_location 
    PRIMARY KEY (numlocation, namedep),
    CONSTRAINT fk_location_deparment
    FOREIGN KEY (namedep, numberdep) 
    REFERENCES deparment(name, number)
);
GO

-- Tabla Project
CREATE TABLE project(
    name VARCHAR(50) NOT NULL,
    number INT NOT NULL,
    location VARCHAR(50),
    namedep VARCHAR(50) NOT NULL,
    numberdep INT NOT NULL,
    CONSTRAINT pk_project 
    PRIMARY KEY (name, number),
    CONSTRAINT fk_project_deparment
    FOREIGN KEY (namedep, numberdep) 
    REFERENCES deparment(name, number)
);
GO

-- Tabla Dependent
CREATE TABLE dependent(
    name VARCHAR(50) NOT NULL,
    ssn VARCHAR(15) NOT NULL,
    sex CHAR(1),
    birthdate DATE,
    CONSTRAINT pk_dependent 
    PRIMARY KEY (name, ssn),
    CONSTRAINT fk_dependent_employee 
    FOREIGN KEY (ssn) 
    REFERENCES employee(ssn)
);
GO

--Tabla Works_On 
CREATE TABLE works_on(
    ssn VARCHAR(15) NOT NULL,
    nameproject VARCHAR(50) NOT NULL,
    numberprojet INT NOT NULL,
    hours DECIMAL(5,2),
    CONSTRAINT pk_works_on 
    PRIMARY KEY (ssn, nameproject, numberprojet),
    CONSTRAINT fk_works_on_employee 
    FOREIGN KEY (ssn) 
    REFERENCES employee(ssn),
    CONSTRAINT fk_works_on_project 
    FOREIGN KEY (nameproject, numberprojet) 
    REFERENCES project(name, number)
);
GO