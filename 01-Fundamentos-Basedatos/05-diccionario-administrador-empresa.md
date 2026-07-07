Diccionario de datos de la base de datos Employe
 1.- Informacion General 

| Elemento | Valor      | 
|:---      | :---       |
| Proyecto | Hospital   |
| version  | 1.0        |
| fech     | Junio 2026 |
| Elaborar | Carol yaretzi lopez sanchez|
|          |

2 Descripcion del sistema de base de datos 

El sistema administra:
-Emloyee
-Department
-Project
-Works_On
-Dependent

Permite mantener un mejor control, ordenado y directo de cada paciente asignado.

3.-Catalogo de Restrricciones Utilizadas 
|Codigo|  Significado   |
|----- | ------------   | 
|PK    |  Primary Key   |
|FK    |  Foreign Key   |  
|MN    |  Not Null      |
|UQ    |  Unique        |
|AI    |  Auto Increment|


4.-Diccionario de Datos 


##Tabla Employe
Almacena los datos  personales de los empleados 

|  campo     | tipo   | longitud    | restricciones |        descripcion                                | 
| :----      | :----  | :----       | :----         | :----                                             |
|Name        |VARCHAR |     40      |   PK, AI, NN  |Identificador unico del empleado                   |
|FistName    |NVARCHAR|     30      |    NN         |Primer nombre del empleado                         |
|LastName    |VARCHAR |     20      |    NN         |Apellido del empleado                              |
|Sex         | CHAR   |     1       |    NN         |Genero del empleado                                |
|Salary      |DECIMAL |     10      |    NN         |Salario del empleado                               |
|Ssn         |INT     |     -       |    PK,NN      |Numero de seguro social                            |
|Address     |VARCHAR |     100     |    NN         |Direccion de recidencia de mpleado                 |
|Birthday    |DATE    |     -       |    NN         |Fecha de cumpleaños                                |
|Name_dep    |VARCHAR |     50      |    NN         |Nombre del departamento                            |
|Number_dep  | INT    |     -       |    FK,NN      |Clave foranea que conecta con el numero de departamento|
|Jef         |VARCHAR |     15      |    FK, NULL   |Jefe del departamento                              |


##Tabla Department
Almecena informacion de las areas de las empresas 

|  campo     | tipo   | longitud    | restricciones |        descripcion                        | 
| :----      | :----  | :----       | :----         | :----                                     |
|Name        |VARCHAR |     50      |   UQ, NN      |Nombre del deparatmento                    |
|number      |INT     |     -       |    PK, NN     |Numero que identifica al departamento      |
|manager     |VARCHAR |     15      |    FK,UQ,NN   |Empleado que administra el departaento     |
|Stadate     | DATE   |     -       |    NN         |Fecha de nacimiento del manager            |


##Tabla Location
Almacen las ubicaciones de los diferents departamentos de la organizacion

|  campo         | tipo   | longitud    | restricciones |        descripcion                        | 
| :----          | :----  | :----       | :----         | :----                                     |
|Num_location    |  INT   |     -       |    NN         |Numero interno de la localización          |
|Name_dep        |VARCHAR |     50      |    PK,NN      |Nombre del departamento                    |
|Number_dep      |  INT   |     -       |    FK,NN      |Clave foranea que conecta con el departamento|



##Tabla Project
Almacena los proyecto de la empresa

|  campo     | tipo   | longitud    | restricciones |        descripcion                        | 
| :----      | :----  | :----       | :----         | :----                                     |
|Name        |VARCHAR |     50      |   FK, NN      |Nombre del proyecto                        |
|number      |INT     |     -       |   FK, PK, NN  |Clave primaria y foranea del proyecto      |
|Location    |VARCHAR |     50      |   NN          |Ubicación donde se realiza el proyecto     |
|Name_dep    |VARCHAR |     50      |   NN          |Nombre del departamento que lo control     |


##Tabla Works_ON
Tabla intermedia que conecta con empleado y proyecto

|  campo          | tipo   | longitud    | restricciones |        descripcion                                    | 
| :----           | :----  | :----       | :----         | :----                                                 |
|Ssn              |VARCHAR |     15      |    PK,FK,NN   |Clave foranea del empleado que trabaja en el proyecto  |
|name_project     |INT     |     -       |    PK, NN     |Numero que identifica al departamento                  |
|number_project   |INT     |     -       |    PK,FK,NN   |Clave foranea del numero de proyecto                   |
|hours            |DECIMAL |     4 .5    |    NN         |Cantidad de horas dedicads                             |



##Tabla Dependent
Almacena los familiares o dependientes de cada empleado

|  campo     | tipo   | longitud    | restricciones |        descripcion                  |
| :----      | :----  | :----       | :----         | :----                               |
|Name        |VARCHAR |     50      |   PK, NN      |Nombre del dependiente               |
|sex         |CHAR    |     1       |   NN          |Genero del dependiente               |
|Birthdate   |DATE    |     -       |   NN          |Fecha de nacimiento del dependiente  |



6-.Matriz de Claves Foraneas
|  Tabla     | Campo FK      | Referencias        |
| :----      | :----         | :----              |
|Employee    |Jef Fk         |Employee(ssn)       |
|Employee    |Number_dep FK  |Department(number)  |
|Department  |manager FK     |Employee(ssn)       |
|Location    |Number_Dep     |Department(number)  |
|project     |Number  FK     |Department(number)  |
|Works_ON    | Ssn  FK       |Employee(ssn)       |



7.Integridad Referencial

|Regla |  Descripcion   |
|----- | ------------   |
|IR-01 |No se puede registrar un departamento con un manager que no exista en la tabla Employee |
|IR-02 |Si se elimina un registro en la tabla Employee, Sus registros correspondientes en las tablas dependientes deben eliminarse automáticamente| 
|IR-03 |No se puede asignar una localización en la tabla Location a un número de departamento inexistente|push 