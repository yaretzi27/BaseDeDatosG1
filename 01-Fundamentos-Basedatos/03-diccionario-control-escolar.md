# Diccionario de datos de la base de datos de control Escolar 

1.- Informacion General 

| Elemento | Valor | 
|:---  | :---  |
| Proyecto | control Escolar |
| version  | 1.0 |
| fech   | Junio 2026 |
| Elaborar | Carol Yaretzi Lopez Sanchez Estudiante|
| SGBD||

2 Descripcion del sistema de base de datos 

El sistema administra:
-carreras
-Alumnos
-Profesores
-Materias
-Grupos
-Inscripciones

Permite controlar la oferta academica y la inscripcion de estudiantes.

3.- Catalogo de Restricciones utilizados 
| codigo|Significa|
|:---  | :---  |
| PK|Pr Key |
| fk|Foreign Key|
| NN | Not Null|
| UQ|UNIQUE |
| AI | Auto Increment|
|CK | Check |
|DF | Default |

4.- Diccionario de datos 

## Tabla: Carrera 
Almacenar las carerras ofertadas por la universidad 

|  campo | |tipo | longitud | restricciones | descripcion| 
|
|id carrera | INT |- | PK, AI, NN | Identificador unico de la carrera  |
|nombre | varchar | 100 |UQ NN  | Nombre de la carrera |
| duracion_cuatrimestre | INT |- | NN, CK(>0) | Nombre de la carrera |
|

--
## Tabla carrera 
***Descripcion***
Almacenar Informacion 

|  campo | |tipo | longitud | restricciones | descripcion| 
| :----  | :----  | :---- | :---- | :---- |
|id alumno | INT |- | PK, AI, NN | Identificador unico de alumno  |
|matricula  | varchar | 100 |UQ NN  | Matricula Institucional |
| Nombre | VARCHAR | 30 | NN | Nombre del Alumno |
| apellido_paterno | VARCHAR | 50 | NULL | Apellido paterno |
| apellido_materno | VARCHAR | 50 | NULL | Apellido materno  |
| correo | VARCHAR | 100 | NULL | correo institucional   |
| apellido_materno | VARCHAR | 50 | NULL | Apellido materno  |
| apellido_materno | VARCHAR | 50 | NULL | Apellido materno  |


--

5.- RElaciones en la base de datos 

| Relacion | Cardinalidad | Descripcion  |
| :---- | :---- | :---- | :----|
|Carrera --> Alumno | 1:n | Una carrera tiene muchos alumnos | 
|Carrera --> Materia | 1:n | Una carrera tiene muchas materias | 
|Profesor  --> Grupo | 1:n | Una carrera puede impartir varios grupos | 
|Materia-> Alumno | 1:n | Una materia puede abrirse en varios grupos | 
|Alumno --> inscripcion | 1:n | Un alumno puede tener varias inscripciones  | 
|Grupo --> Inscripciones | 1:n | Un grupo puede tener muchos alumnos | 

6.- Matriz de claves Foreaneas
| Tabla | Campo FK | Referencia  |
| :---- | :---- | :---- | :----|
|Alumno | Id_carrera | Carrera(Id_carrera) |
|Materia | Id_carrera | Carrera(Id_carrera) |
| Grupo | Id_profesor | Profesor(Id_profesotr) |
|Grupo| Id_materia | Materia(id_materia) |
| inscripcion | Id_alumno| Alumno(id_alumno) |
| Inscripciones | Id_Grupo | Grupo(id_grupo) |

7. Integridad referencial 
| Regla | Descripcion |
| :--- | :--- |
| IR-01 | No se puedee registrar un alumno con una carerra inexisastente |
| IR-02 | No se puedee crear un grupo para un materia inexistente |
| IR-03 | No se puedee crear un grupo para un profesor inexistente |
| IR-04 | No se puedee inscribir un alumno en un grupo inexistente |
| IR-05 | No se puedee eliminer una a inexisastente carrera que tenga un alumno asociados sin antes reasignar o eliminarlos |

8. REGLAS DE NEGOCIO
| Codigo | Regla |
| :--- | :--- |
| IRN-01 | No se puedee registrar un alumno con una carerra inexisastente |
| RN-02 | No se puedee crear un grupo para un materia inexistente |
| RN-03 | No se puedee crear un grupo para un profesor inexistente |
| RN-04 | No se puedee inscribir un alumno en un grupo inexistente |
| RN-02 | No se puedee crear un grupo para un materia inexistente |
| RN-03 | No se puedee crear un grupo para un profesor inexistente |
| RN-04 | No se puedee inscribir un alumno en un grupo inexistente |
