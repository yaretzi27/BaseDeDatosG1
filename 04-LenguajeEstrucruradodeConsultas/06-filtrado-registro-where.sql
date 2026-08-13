/*==============================================
DQL (DATA QUERY languaje ) en SQLSERVER
archivo  06-filtado-registro-where.sql
descripcion : se recupera unicamente las filas que cumplen determinadamnete 
condiciones mediante la clausula where
orden SINTACTICO 
FROM 
JOINS/ON 
WHERE 
GROUP BY
HAVING 
ORDER BY

ORDEN EJECUCION 

FROM/joins (INNER, LEFT, RIGH, CROSS, FULL, SELF)
WHERE 
GROUP BY
HAVING
SELECT 
DISTINCT
ORDER BY
TOP
===========================================*/

/*=============================================0
SELect 
columna_1,
columna_2,
columna_n,
FROM nombre_tabla
WHERE condicion,

Nota: condicion pude ser relacionar  y a combinacion de esta con logica.
Nota: El SELECT no filtra registros 
===========================================*/

-- selcionar el´producto cuyo precio es $200

SELECT 
p.codigo AS [codigo],
p.nombre AS [Producto],
p.precio AS [Precio]
From productos AS p
WHERE precio=200;

---- Selecionar el cliente cuyo identificador es 25
SELECT 
	c.id_cliente,
	CONCAT (c.nombre, ' ',
	c.apellido_paterno, ' ', 
	c.apellido_materno) AS nombre:completo,
	c.correo
	FROM clientes AS c
	WHERE c.id_cliente = 25

-- cpmparacion de cadenas de texto 
--- valores de texto deben escribirse

SELECT 
c.nombre AS [Categoria]
fROM categoria  AS c
WHERE c.nombre = 'computo';

-- selecionar los datos del cliente con nombfre Cliente1
SELECT 
c.id_cliente,
CONCAT (c.nombre. '' ,
		c.apellido_paterno, ' ', 
	c.apellido_materno) AS nombre_completo,
	c.correo
	FROM clientes AS c
	WHERE  nombre = 'CLIENTE1'
-- selciionra los datos del empleado que no pertenesca al departemento 1
SELECT 
e.id_empleado,
e.nombre,
e.id_departamento,
e.salrio,
FROm empleados AS 
-- selccionar los datos de los productos donde el precio sea superior a $490
SELECT 
p.id_producto,
p.nombre,
p.id_categoria,

-- selecionat los datos del producto con exixtencia  critica inferir a 
---10 unidaees
SELECT 
p.id_producto,
p.nomvre,
p.id_categoria,

-- selecionar los datos de los empleados donde su salario sea de $30,000 en 
-- addlante 
SELECT 
E.id_empleado,
e.nombre,
e.id_
--- selcionar los datos  de los productos donde sus precios sean de $10 o menos
SELECT 
p.id_producto,
p.nombre,
p.id_categoria,
p.precio
FROM productos AS p
WHERE p.precio <=10;
-- comparacion de fechas
--- las fechas deben escribirse entre comillas simples
 -- selciionar 
SELECT 
v.id_venta,
v.fecha,
v.id_cliente,
v.id_empleado
FROM ventas AS v
WHERE fecha = '2025-12-24';

-- selciionar los datos de las ventas realizadas en el 2025

SELECT 
v.id_venta,
v.fecha,
YEAR(v.fecha) AS [año],
FORMAT (v.fecha , 'mmm') AS [mes_ingles],
  FORMAT (v.fecha) AS [dia]
v.id_cliente,
v.id_empleado
FROM ventas AS v
WHERE MONTH (fecha) = 4;

-- selecionar todas las ventas anteriores al 1 de febrero de 2025

---DISTINCT 
--- qiuta elementos repetidos de una o la combinacion de columnas {
-- muestrame los sexos de los clientes 

SELECT DISTINCT 
sexo 
FROM clientes AS  c;

SELECT DISTINCT 
id_ciudad
FROM clientes  AS c;


SELECT DISTINCT 
cu.nombre;.
FROM clientes AS c
INNER JOIN ciudades as cu
on c,id_cuidado = cu.id_ciudad;

-- seleciionar los desciuentos unicos de las ventasn

SELECT 
dv.descuento
FROM detalle_venta AS dv
ORDER BY  dv.descuento DEC;

---tOP 
---limita la cantidad de filas devueltas por una consulta
SELECT TOP(20)
dv.id_venta
dv,precio,
dv.cantidad,
dv.descuento,
FROM detalle_venta as dv;

---selecionar los datos de los productos mostrando el codigo y el valor 
-- del inventario, donde el valor del inventario debe ser mayor a 50000

SELECT 
p.codigo as codigo_producto,
p.existencia AS existencia,
p.precio AS precio, 
(p.precio * p.exisitencia) AS valor_inventario
From productos AS p 
WHERE (p.precio * p.existencia) > 500;

-- mostrar los productos con precio que esten entre $200 y $300


SELECT 
p.codigo as codigo_producto,
p.existencia AS existencia,
p.precio AS precio, 
(p.precio * p.exisitencia) AS valor_inventario
From productos AS p 
WHERE precio >=200 AND precio <=300;
-- INSTRUCCION BETWEEN

SELECT 
p.codigo as codigo_producto,
p.existencia AS existencia,
p.precio AS precio, 
(p.precio * p.exisitencia) AS valor_inventario
From productos AS p 
WHERE precio BETWEEN 200 AND 300;

--- -- mostrar los productos con precio que esten entre $200 y $300 que ademas
-- de cincuenta unidades

SELECT 
p.codigo,
p.nombre,
p.precio,
p.existencia
FROM productos AS p;
WHERE p.precio>=200
		and p.precio<=300
		AND 
		p.existencia < 50
ORDER BY precio DESC;

-- mostrar      productos existencia inferior a 10 superior a 190

--- ORDENADOR NOT 

SELECT 
p.codigo,
p.nombre,
p.precio,
p.existencia
FROM productos AS p
WHERE p.existencia  10
		
	OR 
		p.existencia >190;



--- ORDENADOR NOT 

-- mostrar los productos que no sean mayores a 400

SELECT 
p.codigo,
p.nombre,
p.precio,
p.existencia
FROM productos AS p
WHERE NOT p.precio>400;


-- mostrar los empleados de los departamentos uno y dos que tengan salario mayor 
--- a $25,000
SELECT 
e.id_empledo,
e.nombre,
e.salario,
e.id_departamento
FROM empleado AS e
WHERE(e.departamento =1
or
e.id_departamento = 2)
AND e.salario >25000;

--- mostrar los empledos qie no tiene jefe 
SELECT 
p.id_empledos,
p.id_departamneto,
p.nombre,
p.id_jefe
FROM empleados AS p
WHERE P.id_jefe IS NULL;

-- OPERADOR BETWEN
--permite comprobar si un valor se encuentan dentro de un frango inclusivo 

/* =====================================================
WHERE columna BETWEEN limite_inferior AND limite superior
===========================================================*/

--- Mostrar empledos con salario entre $15,000 y $20,000 incluyendo ambos limites 
SELECT 
e.id_empeado,
e.nombre,
e.salario
FROM empleados AS e 
WHERE salario BETWEEN 15000 AND 20000
ORDER BY 3 DESC;

SELECT 
e.id_empeado,
e.nombre,
e.salario
FROM empleados AS e 
WHERE e.slario >=15000
		and 
		e.salario<=20000;

---  mostrar los´productos que los precios esten en el rango de 100 o 200
SELECT 
p.codigo,
p.nombre,
p.precio,
p.existencia
FROM productos AS p
WHERE p.precio BETWEEN	100 AND 200;

-- mostrar las ventas del 1 de enero del 2025 al 10 de enro del 2025
SELECT 
v.id_venta AS [numero_venta],
v.id_cliente AS [cliente],
v.id_empledo AS [vendedor],
v.fecha AS [fecha_venta],
UPPER (FORMAT(V.fecha 'm'. 'es_ES')) AS [mes_venta],
UPPER (FORMAT (v.fecha, 'dddd', 'es_ES')) AS [dia_venta],
DATEPART(YEAR, v.fecha) AS [año_venta]
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10'
ORDER BY [cliente] ASC;


-- mostra los productos que su rango de precio no este entre 100 y 400
SELECT 
p.codigo,
p.nombre,
p.precio,
p.existencia
FROM productos AS p
WHERE p.precio AS p
WHERE p.precio NOT BETWEEN 100 AND 400;

---- operador IN 
---permite comparar una columna con una lista DE valore
/*========================================================00
WHERE  columna IN(valor_1, valor_2, valor_3)
=============================================*/
-- mostrar productos pertenencientes a las categorias 1, 7, o 12
SELECT 
p.codigo,
p.nombre,
p.precio,
p.existencia
p.id_categoria
FROM productos AS p
WHERE p.id_categoria = 1
OR p.id_categoria=7
OR p.id_categoria =12
ORDER BY	p.id_categoria;
/*==========================================000 TODO OPERADOR LIKE ==========
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

