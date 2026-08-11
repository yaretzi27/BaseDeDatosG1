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







