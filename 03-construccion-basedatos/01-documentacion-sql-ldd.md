# construccion de Base de datos con SQL-LDD


SQL (Structured quer lenjuage) se divide en cinco grandes categorias:

1. ddl(data Defenition Lanjuage)
2. DML ( Date Manipulation Lanjuage)
3. DQL (Data quer Lanjuage)
4. DCL (Data Control Lanjuage)
5. TCL (Transacion control lanjuage)

## SQL-DLL

** Lanjuage de Defenition de Datos **

se utiliza para crear ** y modificxar la estructura** de una base de datos
Base de datos
-Tablas
- Visitas
-Indices
-Restricciones
-Esquemas
-Strore Procedures
-Trigger
-fuctions

**comandos principales
| Comando | Funcion |
| :---     | :---   |
|Create   | crear objetos |
|Alert   | Modificar objetos |
|Drop   | elimina objetos |
|TRUNCANTE   | VACIA una tabla |


## SQL-DML

**Lenjuage de manipulacion de datos**
sirve para **Trabajar  la informacion almaccenada**
Aqui no cambia la estructura, si no los rgistros



**comandos principales
| Comando | Funcion |
| :---     | :---   |
|INSERT   | inserta registros |
|update   | ACtualiza registris |
|delte   | elimina registros|
|TRUNCANTE   | VACIA objetos |


## SQL-DQL
**Lenjuage de consulta de datos **

su funcio es ** consultar informacion**

**comandos principales
| Comando | Funcion |
| :---     | :---   |
|SELECT   | Consultar informacion |

General se combina:

-Where
-ORDER BY
-GROUP BY
-HAVING
-JOIN(LEFT, RIGHT, INNER, CROSS Y FULL)
- DISTINCT
-TOP / LIMIT
-funcion de agregado (SUM, AVG , MAX, MIN COUNT)
-Funcion de ventana (window fuction)

## Nomenclactura snake_case

**snake_case** es la convecion mas  recomendada de dia de ahora si se busac una nomeclatura moderna, portable y aliniada 
con buenas practicas en distintos morores de base de datos

la razo es que funciona de forma consistente  en **SQLSERVER,
MYsql** y especialmente en **postgresSQL**. con snake_case se evitan problemas de mayusculas  y se hacen las consultas sean mas legibles.

## Estandar de construccion:**

  Objeto | |Conveccion  | Ejemplo |
|
|Base de datos | snake_case |control escolar |
|Esquema    | snake_case |ventas. rh, seguridad  |
|Tabla  | Singular en snake_case | clientte pedido, detalle de pedido |
|Columna  | snake_case | cliente_id, fecha_registro, nombre, correo_electronico |
|PK| <tabla> id |cliente_id, categoria_id|
|FK| igual que la PK referenciada |cliente_id, poducto_id|
|Tabla puente| <tabla><tabla2> |cliente_id, provedor_producto|

**Nombrar las restricciones

-pk_cliente
-fk_cliente -> pk_tablaorigen




