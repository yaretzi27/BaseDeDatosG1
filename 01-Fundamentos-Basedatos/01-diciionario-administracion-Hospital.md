Diccionario de datos de la base de datos de Hospital
 1.- Informacion General 

| Elemento | Valor | 
|:---  | :---  |
| Proyecto | Hospital |
| version  | 1.0 |
| fech   | Julio 2026 |
| Elaborar |  Carol Yaretzi Lopez SanchezEstudiante|
| SGBD|

2 Descripcion del sistema de base de datos 

El sistema administra:
-Pacientes
-Expedientes

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

##Tabla: Paciente
Almacena los datos personales de cada uno de los pacientes.

|  campo     | tipo   | longitud    | restricciones |        descripcion              | 
| :----      | :----  | :----       | :----         | :----                           |
|idPaciente  | INT    |       -     |   PK, AI, NN  |Identificador unico del paciente |
|Nombre      | VARCHAR|     40      |    NN         |Nombre del paciente              |
|Apellido1   |VARCHAR |     50      |    NN         |Primer apellido del paciente     |
|Apellido2   |VARCHAR |     50      |     -         |Segundo apellido del paciente    |
|FechaNaci   |INT     |     -       |     -         |Fecha de nacimiento del paciente |

--

##Tabla Exediente
Almecena el historial clinico de cada paciente.

|  campo        | tipo   |   longitud  | restricciones |        descripcion                      | 
| :----         | :----  |     :----   | :----         | :----                                   |
|NumExpediente  | INT    |       -     |   PK, AI, NN  |Identificador unico del expediente medico|
|FechaApertura  | DATE   |       -     |    NN         |Fecha de apertura del expediente         |
|TipoSangre     |CHAR    |       5     |    NN         |Tipo de sangre del paciente              |
|idPaciente     | INT    |       -     | FK, UQ, NN    |Clave que conecta con el paciente        |


5.-Relacion en la Base de datos 

|Relacion                  | Cardinalidad   |                          Descripcion                                            | 
|   :----                  |   :----        |                             :----                                               |
|Paciente > Expediente     |     1:1        |Un paciente tiene un solo expedinte y un expediente pertenece a un solo paciente |


6.-Matriz de Claves Foraneas 

| Tabla     | Campo FK  |       Referencia    |
| :----     | :----     | :----               | 
|Expediente |idPaciente | Paciente(idPaciente)|



7-.Integridad Referencial 
| Regla |                              Descripcion                                 |
| :---  |                               :---                                       |
| IR-01 | No se puedee registrar un expediente con un paciente inexisastente       |
| IR-02 | No se puede asignar un expediente a un paciente que ya tiene uno asociado|
| IR-03 |No se puede eliminar un paciente que tenga un expediente activo           |


8. REGLAS DE NEGOCIO
| Codigo   | Regla                                                                                 |
| :---     | :---                                                                                  |
|IRN-01    |Todo paciente debe contar obligatoriamente con un primer apellido para ser dado de alta|
|RN-01     |Cada paciente debe tener exatamente un expediente medico                               |
|RN-02     |Cada expediente medico pertenece a un unico paciente                                   |
|RN-03     |No puede existir un expediente sin paciente                                            |
|RN-04     |No puede existir un aciente sin expediente 