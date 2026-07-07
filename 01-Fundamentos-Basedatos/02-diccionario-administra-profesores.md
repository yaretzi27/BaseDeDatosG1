1.- Informacion General 

| Elemento | Valor | 
|:---  | :---  |
| Proyecto | Administrador de profesores y cursos |
| version  | 1.0 |
| fech   | Junio 2026 |
| Elaborar | Carol Yaretzi Lopez Sanchez Estudiante|
| SGBD||

Ejercicio 2: Sistema de Profesores y Cursos
El sistema administra:

- Profesores
- Cursos

Permite controlar la asignación de cursos a los profesores de la universidad.

---

3.- Catálogo de restricciones utilizadas

Código| Significado
PK| Primary Key|
FK| Foreign Key|
NN| Not Null|
UQ| Unique|
AI| Auto Increment|
CK| Check|
DF| Default|

---

4.- Diccionario de datos

 ## Tabla: Profesor

Descripción: Almacena la información de los profesores de la universidad.

Campo| Tipo| Longitud| Restricciones| Descripción
|:---  | :---  ||:---  | :---  |
|id_profesor| INT| -| PK, AI, NN| Identificador único del profesor |
|clave_profesor| VARCHAR| 20| UQ, NN| Clave institucional del |profesor|
|nombre| VARCHAR| 100| NN| Nombre completo del profesor|
|especialidad| VARCHAR| 100| NN| Especialidad del profesor |

---

 ## Tabla: Curso

Descripción: Almacena la información de los cursos ofertados por la universidad.

|Campo| Tipo| Longitud| Restricciones| Descripción
|:---  | :---  ||:---  | :---  |
|id_curso| INT| -| PK, AI, NN| Identificador único del curso|
|nombre_curso| VARCHAR| 100| NN| Nombre del curso|
|creditos| INT| -| NN, CK (>0)| Número de créditos del curso|
|id_profesor| INT| -| FK, NN| Profesor asignado al curso|

---

5.- Relaciones en la base de datos
|:---  | :---  ||:---  | :---  |
|Relación| Cardinalidad| Descripción|
| Profesor-> curso |1:N |Cada curso solo puede ser impartido por un profesor.|
---

6.- Matriz de claves foráneas

Tabla| Campo FK| Referencia|
|:---  | :---  ||:---  | :---  |
|Curso| id_profesor| Profesor(id_profesor) |

---

Integridad referencial

Regla| Descripción
IR-01| No se puede registrar un curso con un profesor inexistente.
IR-02| No se puede eliminar un profesor que tenga cursos asignados sin antes reasignarlos o eliminarlos.

---

Reglas de negocio

Código| Regla
RN-01| Un profesor puede impartir varios cursos.
RN-02| Un curso solamente puede ser impartido por un profesor.
RN-03| Puede existir un profesor que actualmente no imparta cursos.
RN-04| Todo curso debe estar asignado obligatoriamente a un profesor.