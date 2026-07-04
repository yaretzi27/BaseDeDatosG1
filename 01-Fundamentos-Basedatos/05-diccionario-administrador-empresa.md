EJERCICIO 1 (Employee, Department, Project)
2.- Descripción del sistema de base de datos
El sistema administra:
-Empleados
-Departamentos
-Proyectos
-Dependientes
-Ubicaciones
-Horas trabajadas

Permite controlar la información de los empleados, los departamentos, los proyectos y las horas que cada empleado trabaja en un proyecto.
3.- Catálogo de restricciones utilizadas
Código |Significado |
PK |Primary Key |
FK | Foreign Key |
|NN | Not Null |
|UQ |Unique |
AI |Auto Increment |
CK | Check |
DF | Default |
4.- Diccionario de datos

## Tabla: Empleado
Campo| Tipo | Longitud | Restricciones | Descripción |
id_empleado |INT |- | PK, AI, NN |  Identificador del empleado |
|nombre |VARCHAR | 50 | NN| Nombre |
|apellido | VARCHAR | 50 | NN | Apellido |
| direccion | VARCHAR |100 | NULL | Dirección |
|salario | DECIMAL | - | NN | Salario | 
|sexo | CHAR | 1 | NN | Sexo | 
fecha_nacimiento | DATE | - | NN | Fecha de nacimiento |
|id_departamento | INT | - | FK, NN |Departamento al que pertenece |
|jefe | INT | - | FK | Jefe inmediato |


## tabla Departamento
|Campo|tipo | Restricciones | Descripción |
|id_departamento | INT | PK,AI,NN | identificador  |
|nombre | VARCHAR(100) | UQ, NN | Nombre del departamento |
gerente | INT | FK,NN | Gerente |
| fecha_inicio | DATE | NN| Fecha de inicio del gerente |

## tabla de proyecto
|Campo|tipo | Restricciones | Descripción |
|id_proyecto |  INT | PK,AI,NN | Identificador |
|nombre | VARCHAR(100) |UQ, NN, | Nombre del proyecto|
|ubicacion | VARCHAR(100) | NN | Ubicacion |
|id_departamento | INT | FK,NN | Departamneto responsable |

## tabla dependiente
|Campo|tipo | Restricciones | Descripción |
| id_ dependiente | int |PK,AI,NN | Identificador |
| nombre | VARCGAR (100) | NN | ES EL NOMBRE |
|Sexo | CHAR(1) | NN | es el sexo de la persona |
|fecha_naci | DATE | NN | Es la fecha de nacimiento | 
parentesco |    VARCHAR |(50) | NN |Es el parentesco  que tiene |
|id_empledo | INT | FK,NN | empledo |


## Trabaja en 
| campo | tipo | restricciones |
|id_empledo | INT | PK,FK |
|id_proyecto | INT | PK,FK |
|Horas | INT |NN |

## 5.- Relaciones
|Relación | Cardinalidad | Descripción |
|Departamento → Empleado | 1:N | Un departamento tiene muchos empleados.|
|Departamento → Proyecto | 1:N | Un departamento administra varios proyectos.|
|Empleado → Dependiente | 1:N |Un empleado puede tener varios dependientes.|
|Empleado → Proyecto | N:M |Un empleado trabaja en varios proyectos.|

## Matriz de claves foráneas
|Tabla | Campo FK | Referencia 
|Empleado | id_departamento | Departamento(id_departamento) |
|Proyecto | id_departamento | Departamento(id_departamento) |
|Dependiente | id_empleado | Empleado(id_empleado) |
|Trabaja_en | id_empleado | Empleado(id_empleado) |
| Trabaja_en | id_proyecto | Proyecto(id_proyecto) |

## Integridad referencial
IR-01 No se puede registrar un empleado con un departamento inexistente.
IR-02 No se puede registrar un proyecto sin departamento.
IR-03 No se puede registrar un dependiente sin empleado.
IR-04 No se puede registrar horas trabajadas sin empleado o proyecto existente.
## Reglas de negocio
RN-01 Un empleado pertenece a un solo departamento.
RN-02 Un departamento administra varios proyectos.
RN-03 Un empleado puede trabajar en varios proyectos.
RN-04 Un empleado puede tener varios dependientes
