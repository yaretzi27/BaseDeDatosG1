-- Crear Base de Datos
CREATE DATABASE sistema_pedido;
GO

USE sistema_pedido;
GO

-- Tabla Representante
CREATE TABLE representante (
    representante_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL,
    edad INT NOT NULL,
    oficina_id INT NULL,
    cargo VARCHAR(30) NOT NULL,
    fecha_contrato DATE NOT NULL,
    director_id INT NULL,
    cuota DECIMAL(10,2) NULL,
    ventas DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_representante
    PRIMARY KEY (representante_id),
    CONSTRAINT ck_representante_edad
    CHECK (edad >= 18),
    CONSTRAINT ck_representante_cuota
    CHECK (cuota IS NULL OR cuota >= 0.0),
    CONSTRAINT ck_representante_ventas
    CHECK (ventas >= 0.0),
    CONSTRAINT fk_representante_director
    FOREIGN KEY (director_id)
    REFERENCES representante(representante_id)
);
GO

-- Tabla Oficina
CREATE TABLE oficina (
    oficina_id INT NOT NULL IDENTITY(1,1),
    ciudad VARCHAR(30) NOT NULL,
    region VARCHAR(30) NOT NULL,
    objetivo DECIMAL(10,2) NOT NULL,
    ventas DECIMAL(10,2) NOT NULL,
    representante_id_jefe INT NULL,
    CONSTRAINT pk_oficina
    PRIMARY KEY (oficina_id),
    CONSTRAINT ck_oficina_objetivo
    CHECK (objetivo >= 0.0),
    CONSTRAINT ck_oficina_ventas
    CHECK (ventas >= 0.0),
    CONSTRAINT fk_oficina_jefe
    FOREIGN KEY (representante_id_jefe)
    REFERENCES representante(representante_id)
);
GO

--Relacion entre Repesentante y Oficina 
ALTER TABLE representante
ADD CONSTRAINT fk_representante_oficina
FOREIGN KEY (oficina_id)
REFERENCES oficina(oficina_id);
GO

-- 5. Tabla Cliente
CREATE TABLE cliente (
    cliente_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL,
    representante_id INT NOT NULL,
    limite_credito DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_cliente
    PRIMARY KEY (cliente_id),
    CONSTRAINT ck_cliente_limite
    CHECK (limite_credito >= 0.0),
    CONSTRAINT fk_cliente_representante
    FOREIGN KEY (representante_id)
    REFERENCES representante(representante_id)
);
GO

--Tabla Producto
CREATE TABLE producto (
    producto_id INT NOT NULL IDENTITY(1,1),
    id_fab VARCHAR(10) NOT NULL,
    id_producto VARCHAR(10) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    existencias INT NOT NULL,
    CONSTRAINT pk_producto
    PRIMARY KEY (producto_id),
    CONSTRAINT ck_producto_precio
    CHECK (precio >= 0.0),
    CONSTRAINT ck_producto_existencias
    CHECK (existencias >= 0)
);
GO

--Tabla Pedido
CREATE TABLE pedido (
    pedido_id INT NOT NULL IDENTITY(1,1),
    num_pedido INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    cliente_id INT NOT NULL,
    representante_id INT NOT NULL,
    fab VARCHAR(10) NOT NULL,
    producto_id INT NOT NULL,
    cant INT NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_pedido
    PRIMARY KEY (pedido_id),
    CONSTRAINT ck_pedido_cant
    CHECK (cant > 0),
    CONSTRAINT ck_pedido_importe
    CHECK (importe >= 0.0),
    CONSTRAINT fk_pedido_cliente
    FOREIGN KEY (cliente_id)
    REFERENCES cliente(cliente_id),
    CONSTRAINT fk_pedido_representante
    FOREIGN KEY (representante_id)
    REFERENCES representante(representante_id),
    CONSTRAINT fk_pedido_producto
    FOREIGN KEY (producto_id)
    REFERENCES producto(producto_id)
);
GO