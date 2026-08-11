/* =====================================================

DQL ()

Archivo_01-Create-Database.sql

Descripcion: Crear la base de Datos para la practica de consultas 
=======================================================*/


USE master;
GO

IF DB_ID('comercial_db') IS NOT NULL
BEGIN
     ALTER DATABASEcomercial_db
     SET SINGLE_USER
     WITH ROLLBACK IMMEDIATE;

     DROP DATABASE comercial_db;
END;
GO     

CREATE DATABASE comercial_db;
GO

USE comercial_db;
GO
SELECT DB_ID('comercial_db')


PRINT 'La Base de datos comercial-db se creo correctamente';
GO
--