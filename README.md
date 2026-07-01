# 🛒 Base de Datos Relacional - Supermercado (Caso Coto)

Este proyecto consiste en el diseño, implementación y explotación de una base de datos relacional para un modelo de supermercado orientada al análisis de datos comerciales y automatización de procesos.

## 🚀 Tecnologías Utilizadas
* **Herramienta Integral:** MySQL Workbench (utilizado para el diseño del modelo, la creación de la base de datos y la ejecución de todas las consultas).
* **Editor de Código:** Visual Studio Code (para la organización y documentación de los scripts del repositorio).

## 📊 Modelo de Datos (DER)
El sistema cuenta con un modelo robusto que gestiona clientes, sucursales, empleados, proveedores, categorías, productos, órdenes de compra y movimientos de stock.

<img src="https://github.com/user-attachments/assets/c84bc3ee-4afe-4533-8146-debd32180e43" width="100%" style="max-width: 600px; height: auto;" alt="diagrama ER" />

## 💡 Funcionalidades Destacadas del Proyecto

### 1. Consultas y Reportes Avanzados (`03_queries.sql`)
* **Análisis de Clientes:** Consultas avanzadas utilizando `GROUP BY`, `CONCAT`, `COUNT` y funciones de agregación como `SUM` para identificar el comportamiento de compra de los usuarios.
* **Trazabilidad de Ventas:** Uso de múltiples `JOIN` para consolidar el detalle de los tickets de facturación de las sucursales.

### 2. Automatización y Programabilidad (`04_objetos_avanzados.sql`)
* **Triggers de Inventario:** Creación de un disparador `AFTER INSERT` en los detalles de las órdenes para restar automáticamente el stock físico de los productos cada vez que se concreta una venta.
* **Stored Procedures:** Procedimiento almacenado parametrizado para consultar de forma dinámica el historial consolidado de cualquier cliente mediante su ID.
