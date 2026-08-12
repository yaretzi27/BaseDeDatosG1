DQL

Archivo 05: basi

Descripcion: Se realizan consultas basicas con selec


-- Uso de SELECT *

-- Sintaxis 

USE comercial_db;
GO

------------------
Sintaxi 
SELECT *
FROM nombre_tabla
NOTA - El asterisco signific todas las columna sde la nombre_tabla

Nose recomienda utilizarla siempre

1 - Reduce la claridad de la consulta 
2- Puede aumentar el consumo de recursos
3- Puede afectar aplicaciones futuras 
--------------------

SELECT *
FROM productos;

-- Proyeccion de la tabla productos
c

SELECT
     nombre,
     codigo,
     precio
FROM productos;
GO

--Alias de columnas (Sobrenombre que se le pone a un campo)

SELECT 
    codigo AS codigo_producto,
    nombre AS nombre_producto,
    precio AS precio_unitario
FROM productos;    

-- Alias con espacios 
SELECT 
    codigo AS [codigo producto],
    nombre AS [nombre producto],
    precio AS [precio unitario],
FROM productos;  

SELECT 
    codigo AS 'codigo producto',
    nombre AS 'nombre producto',
    precio AS 'precio unitario',
FROM productos;  

-- Alias sin instrucciones AS (no recomndadas)

SELECT 
    codigo  codigo_producto,
    nombre  nombre_producto,
    precio  precio_unitario,
FROM productos;  

SELECT 
    codigo  [codigo_producto],
    nombre  nombre_producto,
    precio  precio_unitario,
FROM productos;  

-- Alias de Tablas (es util en los joins y en nombres ambiguos)

SELECT 
      p.codigo, 
      p.nombre, 
      p.precio
FROM productos AS p;


SELECT 
C.id_categoria,



SELECT 
      p.codigo AS Código, 
      p.nombre AS [Nombre Producto] 
      P.precio AS 'Precio Unitario'
FROM productos AS p;

--Columnas Calculdaas, Campos calculados  y E-R (Atributo Derivado)

--Seleccionar el codigo, nombre, precio, esxitencia, y el valor del inventario

SELECT
    P.codigo AS codigo_producto,
    P.nombre AS nombre_producto,
    P.precio AS precio_unitario,
    p.esxitencia,
    (p.esxitencia * P.precio) AS precio_inventario

FROM productos AS P;

Operadores Aritmeticos y más ejerccios 

   + Suma
   - resta 
   * multiplicacion 
   / division
   % modulo o residuo de la divicion
   ======================================================

-- Seleccionar los empleados y calcular sa salario anul
    SELECT 
    e.nombre,
    e.apellido_paterno,
    e.salario AS salario_anual,
    (salario * 12) AS salario_anual

    FROM empleados AS e;

       -- Seleccionar los empleados y calcular sa salario anul
    SELECT 
    e.nombre,
    e.apellido_paterno,
    e.salario AS salario_anual,
    (salario * 12) AS salario_anual

    FROM empleados AS e;
    GO

--Seleccionar el detalle de las ventas, mostrando 
-- numero de ventas, cantidad, precio, descuento
-- calcular el importe bruto(cantidad por el precio)
--calcular el importe con descuento (importe bruto * descuento /100)
-- calcular el importe neto (importe bruto por 1 menos el descuento entre 100)

SELECT 
dv.id_ventas AS #ventas,
dv.cantidad AS cantidad_vendida,
dv.precio AS [precio de venta],
dv.descuento AS 'descuento de venta',
(dv.cantidad * dv.precio) AS importe_bruto,
(dv.cantidad * dv.precio / 100.0) AS importe_descuento
dv.cantidad * dv.precio * (1.0 - descuento / 100.0)
FROM detalle_ventas AS dv
GO