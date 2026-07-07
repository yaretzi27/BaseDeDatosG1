# EJERCICIOS MODELO E-R

1. Ejercicio 1

1: En un hospital se registra informacion de sus pacientes 

 ## De cada paciente se desea almacenar:

 -Algo que lo identifique 
 -Nombre
 -Fecha de nacimiento

 ## De un expediente medico se almacena:

 -Numero de expediente
 -Fecha de apertura
 -Tipo de sangre

 ## Reglas de negocio 

 1.- Cada paciente debe tener exactamente 

 2. Ejercicio 2
 Una universidad administra 
 profesores y cursos 
 
 > De cada profesor se almacena:
 -Clave profesor 
 -nombre
 -Especialidad

 > De cada curso se almacena:
 Identificacion del curso
 - Nombre del curso
 -Creditos

 > REglas de negocio

 1. Un profesor puede impartir varios cucrsos
 2. Un curso solamnete  pude ser impartido por 
 un profesor 
 3. pude existir un profesor que actualmnete no 
 imparta cursos.
 4. Todo curso debe ser asignado a un profesor 
 
 Se debe ralizar lo siguinete:
 - entidades 
 -Identificar la relacion 
 **Imparte**
 -Determinar la cardinalidad 
 -determinar la participacion 

 Ejercico 3

 Una escuela administra alumnos y materias 
 de cada alumno se almacena:
 -matricula 
 - nombre 
 semestre 
  
  de cada materia se almacena 
  - clave de la materia 
  - nombre de la materia 
  - creditos 
  ## reglas de negocio 
  1. Un alumno piede inscribirse en varias materias 
  2. una materia puede tener muchos alumnos inscritos 
  3. pude exixtir una materia sin alumnos inscritos 
  4. todo alumno debe estar inscrito en almenos una materia 
5. de cada inscripcio se debe almacenar: 
fecha de inscripcio y calificacio final 
la relacion de estas entidades de debe llamar "inscribe"

EJERCICO 4
En una empresa encargada de realizar venta de productos:

>De cada cliente se almavcena:
- numero de cliente que lo identique 
-su nombre de cliente el cual es una persona  moral 
-RFC 
-
>La empresa realiza pedidos en los cuales almacena lo siguinete:
-almacena el numero de pedidos 
-fecha


>La empresa tambien almacena productos lo cuales registra lo siguiente:
- su numero de producto 
- el nombre el precio 

> Al realizar los pedidos deben registrar la canrtidad de productos pedidos y su precio 

REglas de negocio:
1. Un cliente puede realizar muchos productos 
2. cada pedido pertenece a un solo cliente 
3. un pedido puede contener varios productos 4. un producto puede aparecer en muchos pedidos 
5. un pedido debe contener al menos un producto
6. Un producto puede no haber sido vendido 
7. el detalle del pedido no existe sin ningun pedido 
8. el detalle del pedido no existe sin ningun producto
9. el detalle almacena cantidad 

## Ejercicio 5
EJERCICIO
En una empresa se administra la siguiente información:
Se almacena de cada departamento:
1. Nombre del departamento (único).
2. Número del departamento (único).
3. Empleado que administra el departamento.
4. Fecha en que el empleado comenzó a administrar el departamento.
Un departamento puede tener varias ubicaciones.
Cada departamento controla proyectos, de los cuales se almacena:
1. Nombre del proyecto (único).
2. Número del proyecto (único).
3. Ubicación del proyecto.
## De cada empleado se almacena:
1. Nombre.
2. Número de Seguro Social.
3. Dirección.
4. Salario.
5. Sexo.
6. Fecha de nacimiento.
## Además:
Cada empleado pertenece a un solo departamento.
Un empleado puede trabajar en varios proyectos.
Se registra el número de horas por semana que trabaja en cada proyecto.
Cada empleado tiene un supervisor directo (que también es un empleado).
De cada dependiente se almacena:
1. Nombre.
3. Sexo.
4. Fecha de nacimiento.
5. Parentesco con el empleado.
## Reglas de negocio
1. Un departamento tiene un nombre y un número únicos.
2. Un departamento es administrado por un solo empleado.
3. Se registra la fecha en que el empleado comenzó a administrar el departamento.
4. Un departamento puede tener una o varias ubicaciones.
5. Un departamento controla varios proyectos.
6. Cada proyecto pertenece a un solo departamento.
7. Cada proyecto tiene un nombre, un número y una ubicación únicos.
8. Un empleado pertenece a un solo departamento.
9. Un empleado puede trabajar en uno o varios proyectos.
10. En cada proyecto se registra el número de horas que trabaja el empleado por semana.
11. Cada empleado tiene un supervisor directo, quien también es un empleado.
12. Un empleado puede tener varios dependientes.
13. Cada dependiente pertenece a un solo empleado.
16. De cada dependiente se registra su nombre, sexo, fecha de nacimiento y parentesco con el empleado.
