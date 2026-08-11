-- Alter Table

use Pruebaatributos
GO

SELECT*
FROM alumno;

TRUNCATE TABLE alumno;

-- Muestra los datos de una tabla pr codigo
SELECT
 COLUM_NAME,
 DATA_TYPE,
 CHARACTER_MAXIMUN__LENGTH,
 IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMS
WHERE TABLE_NAME='alumno';

-- Agregaruna columna 
ALTER TABLE alumno
ADD telefono VARCHAR (20) NOT NULL
GO

-- AGREGAR  MAS DE UNA COLUMNA
ALTER TABLE alumno
ADD curp VARCHAR (18),
matricula VARCHAR (13) NOT NULL;

-- Modificar un tipo de dato
ALTER TABLE alumno
ALTER COLUMN telefono VARCHAR(30);
GO


--MODIFICAR Y AGREGAR RESTRICCIONES
-- PRIMARY KEY

-- estte codigo crea una taba con cero resgistros apartir de otra tabla

SELECT TOP  0 *
INTO
FROM alumno2
FROM alumno;

SELECT *
FROM alumno;


SELECT * FROM alumno2;

SELECT 
	o.name AS nombre_restriccion,
	So.type AS tipo_restriccion
FROM sys.objects AS o
WHERE o.parent_objet_id = OBJECT_ID('alumnos2')
AND o.type IN ('PK','F','UQ','C','D')
ORDER BY o.type_desc;

-- Muestra los datos de una tabla pr codigo
SELECT
 COLUM_NAME,
 DATA_TYPE,
 CHARACTER_MAXIMUN__LENGTH,
 IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMS
WHERE TABLE_NAME='alumno2';

-- primary key
ALTER TABLE alumno2
ADD CONSTRAINT pk_alumno2
PRIMARY KEY (num_alumno);

-- crear una tabla para la foreign key
CREATE TABLE carrera(
    carrera_id INT NOT NULL  IDENTITY(1,1)
    CONSTRAINT pk_carrera 
    PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL
);
GO

ALTER TABLE alumno2
ADD carrera_id INT;

ALTER TABLE alumno2
ADD CONSTRAINT fk_alumno2_carrera
FOREIGN KEY (carrera_id)
REFERENCES  carrera (carrera_id)
ON DELETE CASCADE
ON UPDATE NO ACTION;

-- agregar un check
ALTER TABLE alumno2
ADD CONSTRAINT ck_alumno2_telefono
CHECK (Telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');

-- AGREGAR UN DEFAULT 
ALTER TABLE alumno2
ADD activo BIT NOT NULL;

ALTER TABLE alumno2
ADD CONSTRAINT df_alumno2_activo
DEFAULT 1
FOR activo;

--UNIQUE

ALTER TABLE alumno2
ADD CONSTRAINT uq_alumno2_matricula
UNIQUE (matricula);

SELECT 
	o.name AS nombre_restriccion,
	So.type AS tipo_restriccion
FROM sys.objects AS o
WHERE o.parent_objet_id = OBJECT_ID('alumnos2')
AND o.type IN ('PK','F','UQ','C','D')
ORDER BY o.type_desc;

-- Eliminar foreign key
ALTER TABLE alumno2
DROP  CONSTRAINT fk_alumno2_carrera;

-- Eliminar primary key
ALTER TABLE alumno2
DROP CONSTRAINT pk_alumno2;

ALTER TABLE alumno2
DROP CONSTRAINT pk_carrera;

-- Eliminr los UNIQUE
ALTER TABLE alumno2
DROP CONSTRAINT uq_alumno2_matricula;

-- Eleiminar checks 
ALTER TABLE alumno2
DROP CONSTRAINT ck_alumno2_telefono;

-- Eliminar una columna
ALTER TABLE alumno2
DROP COLUMN matricula;

-- DROP 

-- Eliminar la tabal alumno2
DROP TABLE alumno2;

-- eliminar mas de una tabla a la vez 
DROP TABLE alumno, carrera;

-- BASE DE DATOS ASI SE ELIMINA UNA BASE DE DATOS
USE MASTER;
IF DB_ID('pruebaatributos') IS NOT NULL
BEGIN
    DROP DATABASE pruebaatributos;
END
--se termino el tema de CREATE ALTER DROP donde se craeon tablas restricciones (pk,fk,unique check y default; tambien se realizaron cambios utilizando ALTER en agreagr columnas ,
 --modificar tipos de datos ,restricciones y elimniacion de restricciones