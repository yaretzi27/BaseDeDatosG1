# Construccion de Base de Datos con SQL-LDD

SQL (Structured Query Languaje ) se divide en cinco grandes grandes categorias:

1. *DDL (Data Definition Languaje)*
2. *DML (Data Manipulation Languaje)*
3. *DQL (Data Query Languaje)*
4. DLC   (Data Control Languaje)
5. TLC   (Transaction Control Languaje)

## SQL-DDL

*Lenguaje de Deficion de Datos*

Se utiliza para *crear y modificar la estructura* de una base de datos 

Con DDL trabajamos sobre los objetos de la base de datos:

- Base de datos 
- Tablas 
- Vistas
- Indices 
- Restricciones 
- Esquemas
- Store procedures
- trigger
- functions 

*Comandos Principales*

|Comando | Funcion          |
|CREATE  |Crear Objetos     |
|ALTER   |Modificar Objetos |
|DROP    |Eliminar Objetos  |
|TRUNCATE|Vaciar una tabla  |


## SQL-DML

*Lenguaje de Manipulacion de Datos*

Sirve para *trabajar con la informacion almacenada*

Aqui no cambia la estrcuctura, sini los registros

*Comando Principales*

|Comando    | Funcion                    |
| :---------| :--------------------------|
|INSERT     | Insertar Registros         |
|UPDATE     | Actualizar Registros       |
|DELETE     | Eliminar Registros         |

## SQL-DQL

*Lenguaje de Consulta de datos*

Su funcion es *consultar informacion*

*Comando Principal*

|Comando    | Funcion                   |
| :-------- | :------------------------ |
|SELECT     | Consultar Informacion     |

General se combina con:

- WHERE
- ORDER BY
- GROUP BY 
- HAVING 
- JOIN (LEFT, RIGHT, INNER, CROSS Y FULL)
- DISTINCT
- TOP / LIMIT
- Funciones de Agredado (SUM, AVG, MAX, MIN, COUNT)
- Funciones de Ventas (window function)

## Nomeclatura snake_case

*snake_case* es la convencion mas recomendada de ahora si se busca una nomeclatura moderna, portable y alineada con buenas practicas en distintos motores de base de datos.

La razon es que funciona de forma consinte en *SQLServer, Mysql* y especificamente en *postgresSQL*. Con snake_case se evitan problemas de mayuscula y se hacen las consultas sean mas legibles.

*Estandar de Construccion:*

|Objeto         | Convencion                   | Ejemplo                                                |
| :------------ | :----------------- ------    | :----------------------                                |
|Base de Datos  | snake_case                   | control_escolar                                        |
|Esquema        | snake_case                   | ventas, rh, seguridad                                  |
|Tabla          | Singular en snake_case       | cliente, pedido, detalle_pedido                        |
|Columna        | snake_case                   | cliente_id, fecha_registro, nombre, correo_electronico |
|PK             | <tabla>_id                   | cliente_id, categoria_id                               |
|FK             | Igual que la PK referenciada | cliente_id, producto_id                                |
|Tabla Puente   | <tabla1>_<tabla2>            | alumno_curso, proveedor_producto                       |


*Nombrar las Restricciones*

- pk_cliente
- fk_pedido_cliente -> pk_tablaorigen_tablareferenciada
- uq_cliente_correo_electronico
- ck_producto_precio
- df_cliente_activo

## Alter Table 

Permite modificar una tabla existente

- Agregar columnas 
- Eliminar columnas
- Modificar columnas
- Agregar restricciones 
- Eliminar restricciones