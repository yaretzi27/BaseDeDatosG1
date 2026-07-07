# Diccionario de datos de la base de datos de venta de productos 

1.- Informacion General 

| Elemento | Valor | 
|:---  | :---  |
| Proyecto | vebnta se productos|
| version  | 1.0 |
| fech   | Julio 2026 |
| Elaborar | Carol Yaretzi Lopez Sanchez Estudiante|
| SGBD||

2 Descripcion del sistema de base de datos 
-Clientes
-Pedidos
-Productos


Permite gestionar clientes, registrar pedidos y su contenido (productos, cantidades y precios unitarios al momento de la venta).

Catálogo de restricciones utilizadas
| código | Significa |
|---|---|
| PK | Primary Key | | FK | Foreign Key |
 | NN | Not Null | | UQ | UNIQUE |
 | AI | Auto Increment | | CK | Check |
 | DF | Default |


 4 Diccionario de datos

## Tabla: Cliente
Almacena a los clientes (personas morales).

|campo	|tipo	||longitud	restricciones	||descripción |
|:---  | :---  ||:---  | :---  |
|id_cliente	|INT	|-	|PK, AI, NN	|Identificador único del cliente |
|nombre |	VARCHAR	|150	|NN	 |Razón social del cliente |
|rfc	| VARCHAR	| 13	| UQ, NN, CK|	RFC de la empresa cliente|

## Tabla: Producto
Almacena el catálogo de productos.
|campo	|tipo	|longitud	|restricciones	|descripción|
|:---  | :---  ||:---  | :---  |
|id_producto |	INT	|-	|PK, AI, NN	|Identificador único del producto|
|nombre |	VARCHAR	| 120	 |NN	|Nombre del producto|
|precio |	INT	 |12,2	 |NN, CK(>=0)	|Precio |


## Tabla: Pedido
Encabezado de pedidos realizados por clientes.
|campo	|tipo	|longitud	|restricciones	|descripción
|:---  | :---  ||:---  | :---  |
|Num_productos |	INT	|-	|PK, AI, NN	|Identificador único del pedido|
|fecha |	DATE |	-	|NN	 |Fecha del pedido|


## Tabla venta
|campo	|tipo	|longitud	|restricciones	|descripción|
|:---  | :---  ||:---  | :---  |
|cantidad| INT | - |NN | Es la cantidad comprada
| precio_venta| INT | NN | Es el precio de la venta |

## Relaciones en la base de datos

|Relación |	Cardinalidad |	Descripción |
|:---  | :---  ||:---  | :---  |
|Cliente -> Pedido	1:n	Un cliente puede realizar muchos pedidos
|Pedido -> Producto	m:n	Un pedido contiene varios productos
|
 ## Matriz de claves foráneas
|Tabla	|Campo FK	|Referencia|
|:---  | :---  ||:---  | :---  |
|Pedido	id_cliente	Cliente(id_cliente)|
|Detalle_Pedido	id_pedido	Pedido(id_pedido)||
|Detalle_Pedido	id_producto	Producto(id_producto)

 ## Integridad referencial
|Regla	|Descripción|
|:---  | :---  ||:---  | :---  |
|IR-01	|No se puede registrar un pedido con un cliente inexistente.
|IR-02	|No se puede registrar un detalle con un pedido inexistente.
|IR-03	|No se puede registrar un detalle con un producto inexistente.
|IR-04	|No se debe eliminar un cliente que tenga pedidos asociados sin antes reasignarlos o eliminarlos.
|IR-05	|No se debe eliminar un producto que esté referenciado en detalles de pedido sin tratamiento previo.
|IR-06	|Si se elimina un pedido, se deben eliminar sus detalles

## Reglas de negocio

|Código |	Regla |
|RN-01 |	Un cliente puede realizar muchos pedidos.
|RN-02 |	Cada pedido pertenece a un solo cliente.
|RN-03 |	Un pedido puede contener varios productos.
|RN-04 |	Un producto puede aparecer en muchos pedidos.
|RN-05 |	Un pedido debe contener al menos un producto.
|RN-06 |	Un producto puede no haber sido vendido nunca.
|RN-07 |	El detalle del pedido no existe sin un pedido.
|RN-08 |	El detalle del pedido no existe sin un producto.
|RN-09 |	El detalle almacena cantidad > 0 y precio_unitario >= 0.
|RN-10 |	El subtotal de la línea es cantidad × precio_unitario.
|RN-11 |	El RFC del cliente debe ser único y con longitud válida