/* ============================================================================================

DQL (Data Query Languaje) en SQLSERVER

Archivo: 06-filtrado-registros-where.sql


Descripcion: Se recueran unicamente las filas que cumplen determinadas condiciones mediante la clausula where

ORDEN SINTACTICO

SELECT/ TOP/ DISTINCT
FROM
JOINS/ON
WHERE
GROUP BY
HAVING
ORDER BY

ORDEN DE EJECUCION

FROM / JOINS (INNER, LEFT, RIGHT, CROSS, FULL, SELF)
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
TOP

OPERADORES ARITMETICOS
()
*, /, %
+, -


OPERADORES RELACIONALES
= Igual que
< Menor que
> Mayor que
<= Menor igual que
>= Mayor igual que
<> Diferente que
!= Diferente


OPERADORES LOGICOS (boolean)
NOT
AND
OR
===============================================================================================*/


/*==================================================================================================
Sintaxis

SELECT
	columna_1,
	columna_2,
	columna_n
	FROM nombre_tabla
	WHERE condicion;

	Nota: condicion puede ser relacional y a combinacion de esta con logica
	Nota: El SELECT no filtra registros

===================================================================================================*/

--Seleccionar el producto cuyo precio es $200
SELECT
	p.codigo AS [Codigo]
	p.nombre AS [Producto]
	p.precio AS [Precio]
FROM productos AS p;
WHERE precio = 200;

--Seleccionar el cliente cuyo identificador es 25
SELECT
	c.id_cliente,
	CONCAT (c.nombre, '', c.apellido_paterno, '', c.apellido_materno) AS nombre_completo,
c.correo
FROM clientes AS c
WHERE c.id_cliente = 25;


-- Comparacion de cadenas de texto
-- Los valores de texto deben escribirse entre comillas simples

-- Seleccionar las categorias
SELECT
	c.nombre AS [Categoria]
FROM categorias AS c
WHERE c.nombre = 'Computo';

-- Seleccionar los datos del cliente con nombre Cliente1
SELECT
c.id_cliente,
	CONCAT (c.nombre, '',
	c.apellido_paterno, '',
	c.apellido_materno) AS nombre_completo,
c.correo
FROM cliente AS c;
WHERE nombre = 'Cliente1';

-- Seleccionar los datos del empleado que no pertenezcan al departamento 1
SELECT
e.nombre,
e.id_departamento,
e.salario
FROM empleados AS e;
WHERE id_departamento =1;
GO

-- Seleccionar los datos de los productos deonde el precio sea superior a $490
SELECT
	p.id_producto,
	p.nombre,
	p.id_categoria,
	p.precio
	FROM producto AS p
	WHERE p.precio
FROM productos
WHERE existencia<10;

-- Seleccionar los datos de los productos con existencia critica inferior a 10 unidades

-- Seleccionar los datos de los empleados donde su salario sea de $30,000 en adelante
SELECT 
	e.id_empleado,
	e.nombre,
	e.id_departamento,
	e.salario
FROM emlpleado AS e
WHERE salario >= 30000

-- Seleccionar los datos de los productos donde sus precios sean de $10 o menos
SELECT 
	p.id_producto,
	p.nombre,
	p.id_categoria,
	p.precio
FROM productos AS p
WHERE p.precio <=10
-- Comparacion de fechas
-- Las fechas deben escribirse ebtre comillas simples

-- Se recomienda el formato AAAA-MM-DD

-- Seleccionar los datos de las ventas realizadas el 24 de diciembre de 2025

SELECT
	v.id_venta,
	v.fecha,
	v.id_cliente,
	v.id_empleado
FROM ventas as v
WHERE fecha = '2025-12-24'

-- Seleccionar los datos de las ventas realizadas en 2025

SELECT
	v.id_venta,
	v.fecha,
	YEAR(v.fecha) AS [A�O],
	FORMAT(v.fecha, 'MMMM') AS [mes_ingles],
	FORMAT(v.fecha, 'MMMM', 'es-ES') AS [mes_espa�ol],
	DAY(v.fecha) AS [dia],
	FORMAT(v.fecha, 'dddd') AS [mes_ingles],
	UPPER(FORMAT (v.fecha, 'dddd', 'es-ES')) AS [dia_espa�ol],
	UPPER(FORMAT (v.fecha, 'ddd', 'es-ES')) AS [mes_abreviatura],
	v.id_cliente,
	v.id_empleado
FROM ventas as v
WHERE MONTH (fecha) = 4;

-- MOSTRAR LOS PRODUCTOS CON PRECIO ENTRE $200 Y $300 QUE ADEMAS TENGAN MENOS DE cincuenta unidades

SELECT
		p.codigo,
		p.nombre,
		p.precio,
		p,existencia
FROM productos AS p
WHERE p.precio >=200;
	AND
	p.precio<=300
	AND
	p.existencia <50
ORDER BY precio DESC

--Mostrar productos con existencia inferior a 10 o superior a 190
SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE p.existencia<10
	OR
	p.existencia>190

	--OPERADOR NOT

	--Mostrar los productos que su precio no sea mayor a 400
	SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE NOT p.precio <= 400;


-- Mostrar los empleados de los departamentos 1 y 2 que tengan salario mayor a 25,000
SELECT
	e.id_empleado
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE (e.id_departamento=1
	OR
	e.id_departamento = 2)
	AND e.salario >25000;
;

--Mostrar los empleados que no tienen jefe
SELECT
	p.id_empleado,
	p.id_departamento,
	p.nombre,
	p.id_jefe
FROM empleados AS p
WHERE p.id_jefe IS NOT NULL;

-- OPERADOR BETWEEN
-- Permite comprobar si un valor se encuentra dentro de un rango inclusivo

/*==================================================================
WHERE columna BETWEEN limite_inferior AND limite_superior
====================================================================*/

-- Mostrar empleados con salario entre $15,000 y $20,000, incluyendo ambos limites

SELECT
    e.id_empleado,
    e.nombre,
    e.salario
FROM empleados AS e
WHERE salario BETWEEN 15000 AND 20000
ORDER BY 3 DESC;

SELECT
    e.id_empleado,
    e.nombre,
    e.salario
FROM empleados AS e
WHERE e.salario>=15000
      AND
      e.salario<=20000;

-- Mostrar los productos que los precios esten en el rango de 100 y 200
SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia
FROM productos AS p
WHERE p.precio BETWEEN 100 AND 200;
-- Mostrar las ventas del 1 de enero de 2025 al 10 de enero de 2025
SELECT
    v.id_venta AS [numero_venta],
    v.id_cliente AS [cliente],
    v.id_empleado AS [vendedor],
    v.fecha AS [fecha_venta],
    UPPER(FORMAT(v.fecha, 'MMMM', 'es-ES')) AS [mes_venta],
    UPPER(FORMAT(v.fecha, 'dddd', 'es-ES')) AS [dia_venta],
    DATEPART(YEAR, v.fecha) AS [año_venta]
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10'
ORDER BY [cliente] ASC;

-- Mostrar los productos que su rango de precios no este entre 100 y 400

SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia
FROM productos AS p
WHERE p.precio NOT BETWEEN 100 AND 400;

-- OPERADOR IN
-- permite comparar una columna con una lista de valores

/*==================================================================
WHERE columna IN (valor_1, valor_2, valor_3)
====================================================================*/

-- Mostrar productos pertenecientes a las categorias 1,7 o 12

SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia,
    p.id_categoria
FROM productos AS p
WHERE p.id_categoria IN (1,7,12)
ORDER BY p.id_categoria;


SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia,
    p.id_categoria
FROM productos AS p
WHERE p.id_categoria  = 1
      OR p.id_categoria = 7
      OR p.id_categoria = 12
ORDER BY p.id_categoria;

-- Mostrar todos los productos que no pertenecen a la categoria 1, 7 o 12

SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia,
    p.id_categoria
FROM productos AS p
WHERE p.id_categoria NOT IN (1,7,12)
ORDER BY p.id_categoria;

/*==========================================TODO OPERADOR LIKE ==========
permite buscar patrones dentro de valores de texto

sintaxis

WEHRE columna like 'patron';

los patrones puede contener comodines:

comodin   Significado
%          cero, uo o varios valores
_          Exactamente un carecter
[abc]      Un caracter incluido en la lista
[a-f]      in caracter incluido en el rango
[^abc] un caracter no incluido en la lista
=============================================================================*/

-- comodin %
-- este simbolo%prenta candidad de caracteres incluyendo 0 caracteres


 --comienza
 -- HWHERE nombre LIKE 'Cliente%'
 -- valores que comienzan con cliente

 -- termina
 -- WHERE correo'%mail.com'
 -- valores que termina con mail.com

 --contiene
 ---WHERE nombre LIKE '%a%'
 -- valores que contiene el caracter en cualquier posicion

 -- buscar codigos del producto que comienzen con el P001

 SELECT 
 p.codigo,
 p.nombre,
 p.precio
 FROM productos AS p
 WHERE p.codigo LIKE 'P001%';

 SELECT *
 FROM Customers
 WHERE CompanyName LIKE 'Bo%';

  SELECT *
 FROM Customers
 WHERE ContacTitle LIKE '%er%'


 -- comodin de un caracter
 --- el guin bajo _ representa exactamente un  cracter


 -- buscar los correos de los clientes que terminen exactamente con 10@mail.com

 SELECT 
 c.id_cliente,
 c.nombre,
 c.correo
 FROM cliente AS c
 WHERE c.correo LIKE '%10@mail.com';

 -- Mpstrar los nombres que contienen el caracter uno
 SELECT
p.codigo
 p.nombre,
 p.precio
 FROM producto AS p
 WHERE p.nombre LIKE '%1%';
 
 -- comodin de un caracter
 --- el guin bajo _ representa exactamente un  cracter

 --- mostrar los codigos con P000 y exactamente un caracter adicional
 SELECT 
p.codigo,
 p.nombre,
 p.precio
 FROM producto AS p
 WHERE p.codigo LIKE 'P00_';

 -- Patrones con corchetes
  SELECT
p.codigo,
 p.nombre,
 p.precio
 FROM producto AS p
 WHERE p.codigo LIKE 'P000[1-5]';

 SELECT 
p.codigo,
 p.nombre,
 p.precio
 FROM producto AS p
 WHERE p.codigo LIKE 'P000[^1-5]';
 
 --- Buscar un guion bajo literal

 -- en LIKE _ es un comodin
 -- las ciidades de esta base de datos, contiene guines bajos, por elemplo:
 -- ciudad_1_1

 --- Para buscar un _ literal medinate corchetes se pude utilizar lo siguiente

 SELECT * 
 FROM CUIDADES
 WHERE nombre LIKE '%[_]%' --- significa un caracter de guin bajo literal

