-- =======================================================================================
-- ESTRUCTURA DE LA BASE DE DATOS (SCHEMA)
-- Proyecto: Supermercado Coto
-- Objetivo: Creación de la base de datos y definición de todas las tablas y relaciones.
-- =======================================================================================

CREATE DATABASE IF NOT EXISTS supermercado_coto;
USE supermercado_coto;

CREATE TABLE categorias (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    nombre      VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE sucursales (
    id        INT PRIMARY KEY AUTO_INCREMENT,
    nombre    VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    ciudad    VARCHAR(100) NOT NULL,
    telefono  VARCHAR(20)
);

CREATE TABLE proveedores (
    id       INT PRIMARY KEY AUTO_INCREMENT,
    nombre   VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    email    VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE productos (
    id           INT PRIMARY KEY AUTO_INCREMENT,
    nombre       VARCHAR(150) NOT NULL,
    descripcion  VARCHAR(255),
    precio       DECIMAL(10,2) NOT NULL,
    stock        INT NOT NULL DEFAULT 0,
    categoria_id INT NOT NULL,
    proveedor_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);

CREATE TABLE clientes (
    id             INT PRIMARY KEY AUTO_INCREMENT,
    nombre         VARCHAR(100) NOT NULL,
    apellido       VARCHAR(100) NOT NULL,
    email          VARCHAR(100) UNIQUE NOT NULL,
    telefono       VARCHAR(20),
    direccion      VARCHAR(255),
    fecha_registro DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE empleados (
    id            INT PRIMARY KEY AUTO_INCREMENT,
    nombre        VARCHAR(100) NOT NULL,
    apellido      VARCHAR(100) NOT NULL,
    cargo         VARCHAR(100) NOT NULL,
    email         VARCHAR(100) UNIQUE NOT NULL,
    sucursal_id   INT NOT NULL,
    fecha_ingreso DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
);

CREATE TABLE ordenes (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id  INT NOT NULL,
    empleado_id INT,
    fecha       DATETIME DEFAULT CURRENT_TIMESTAMP,
    total       DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado      VARCHAR(20) NOT NULL DEFAULT 'pendiente',
    FOREIGN KEY (cliente_id)  REFERENCES clientes(id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);

CREATE TABLE detalle_ordenes (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    orden_id        INT NOT NULL,
    producto_id     INT NOT NULL,
    cantidad        INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal        DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orden_id)    REFERENCES ordenes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

CREATE TABLE stock_movimientos (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT NOT NULL,
    tipo        VARCHAR(10) NOT NULL,
    cantidad    INT NOT NULL,
    motivo      VARCHAR(255),
    fecha       DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);
