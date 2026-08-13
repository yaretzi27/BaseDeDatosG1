/*==================================================================================================

ejercicio extra con la base de datos Northwind

====================================================================================================*/

use NORTHWND;

-- Mostrar las ventas realizadas en Francia, brazil y belgica
-- de 10 de julio e 1996 al 31 de Diciembre de 1998, que tenga Region de Envio,
-- para los clientes VICTE, HANAR y SUPRD, y ordenados por fecha de pedido de la mas
-- cercana a la mas antigua.

SELECT
	o.OrderID AS numero_orden,
	O.CustomerID AS cliente,
	o.ShipCountry AS pais_envio,
	o.OrderDate AS fecha_orden,
	UPPER(FORMAT (o.OrderDate, 'mmm ', 'es_Es')) AS (mes_orden),
	UPPER(FORMAT (o.OrderDate, 'dddd', 'es_Es')) AS (dia_orden),
	DATEPART(YEAR, O.OrderDate) AS [año_orden]
FROM Orders AS o
WHERE o.ShipCountry IN ('France' , ' Brazil' , 'belgui')
	AND 
	o.CustomerID IN ('VICTE',' HANAR' , 'SUPRD')
		AND 
		o.OrderDate Between '1996-07-10' AND '1998-12-24'
		ORDER  BY o.OrderDate ASC;
		