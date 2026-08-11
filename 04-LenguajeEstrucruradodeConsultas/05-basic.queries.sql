	USE comercial_db;
	GO
--- Uso se SELECT *

/*================================
--sintaxis 
select *
FROM nombre_tabla;
Nota el asterisco significa todas las columnas de tabla

No se recomienda utilizarla siempre 
1) reduce la claridad de la consulta
2) puede aumentar el consumo de recusos 
3) puede afectar aplicaciones futuras 
==========================*/
SELECT * 
FROM productos;


--- PROYECCION DE LA TABLA DE LOS PRODUCTOS
SELECT 
		codigo, 
		nombre,
		precio
FROM productos;
GO

SELECT 
		nombre,
		codigo,
		precio

FROM productos;
GO

---Alias de columna (Sobrenombre que le ponen a los campos )
SELECT 
		codigo AS codigo_producto,
		nombre AS nombre_producto,
		precio AS precio_unitario,
FROM productos;

--- Alias con espacio 
SELECT 
		codigo AS [codigo producto],
		nombre AS [nombre producto],
		precio AS [precio unitario],
FROM productos;


SELECT 
		codigo AS 'codigo producto',
		nombre AS'nombre producto',
		precio AS 'precio unitario',
FROM productos;

---	Alias 
SELECT 
		codigo AS 'codigo producto',
		nombre AS'nombre producto',
		precio AS 'precio unitario',
FROM productos;

SELECT 
		codigo  [codigo producto],
		nombre [nombre producto],
		precio  [precio unitario],
FROM productos;

-- alias sin tabla (es util en los joins y en nombres ambiguos )
SELECT 
	p.codigo, 
	p.nombre,
	p.precio
FROM productos AS p;


SELECT 
c.id_categoria,c.nombre, p.id_producto,
p.nombre, p.precio

FROM categorias AS c
INNER JOIN 
productos AS p
ON c.id_categoria = p.id_categoria;

SELECT 
	p.codigo AS codigo,
	p.nombre AS [Nombre producto],
	p.precio AS 'Precio Unitario'
FROM productos AS p;
GO 

--- columnas calculadas,
---- campos calculados y E-R ( Atrivutos derivados )

---- seleccionar el codigo, nombre, precio, existencia
-- y el valor del inventario 
SELECT 
p.codigo AS codigo_producto,
p.nombre AS nombre_producto,
p.precio AS precio_unitario,
p.existencia,
(p.existencia * p.precio) AS precio_inventario
FROM productos AS p;
GO

-- TODO : operacion arimeticas 
/*===========================================
+ suma 
- resta
* multiplicacion 
/ division 
% modulo o reciduo de la division
=========================*/