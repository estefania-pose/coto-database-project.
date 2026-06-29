-- ==============================================================================
-- Consulta 1 — Productos con su categoría
-- Une la tabla productos con categorías para ver 
--a qué categoría pertenece cada producto.
-- ==============================================================================
USE supermercado_coto;

SELECT 
    p.id,
    p.nombre,
    p.precio,
    p.stock,
    c.nombre AS categoria
FROM productos p
JOIN categorias c ON p.categoria_id = c.id
ORDER BY c.nombre, p.nombre;


-- ===============================================================================
-- Consulta 2 — Stock bajo
-- Busca todos los productos que tienen menos de 50 unidades en stock. 
-- Útil para saber qué hay que reponer. Es un SELECT simple con filtro WHERE.
-- ===============================================================================

SELECT 
    nombre,
    stock,
    precio
FROM productos
WHERE stock < 50
ORDER BY stock ASC;


-- ==============================================================================
-- Consulta 3 — Total gastado por cliente
-- Une clientes con órdenes y suma cuánto gastó cada uno. 
-- Solo cuenta las órdenes completadas, no las canceladas ni pendientes. 
-- El GROUP BY agrupa todo por cliente.
-- ==============================================================================

SELECT 
    CONCAT(c.nombre, ' ', c.apellido) AS cliente,
    COUNT(o.id)                        AS cantidad_ordenes,
    SUM(o.total)                       AS total_gastado
FROM clientes c
JOIN ordenes o ON c.id = o.cliente_id
WHERE o.estado = 'completada'
GROUP BY c.id
ORDER BY total_gastado DESC;

-- =====================================================================================
-- Consulta 4 — Productos más vendidos
-- Une productos con el detalle de órdenes y suma cuántas unidades se vendió de cada uno.
-- El LIMIT 10 muestra solo los 10 más vendidos.
-- =====================================================================================

SELECT 
    p.nombre,
    SUM(d.cantidad)  AS unidades_vendidas,
    SUM(d.subtotal)  AS total_recaudado
FROM productos p
JOIN detalle_ordenes d ON p.id = d.producto_id
GROUP BY p.id
ORDER BY unidades_vendidas DESC
LIMIT 10;


-- ====================================================================================
-- Consulta 5 — Ventas por categoría
-- Muestra cuánto se recaudó en total por cada categoría.
-- Une tres tablas: categorías, productos y detalle de órdenes.
-- ====================================================================================

SELECT 
    c.nombre        AS categoria,
    COUNT(d.id)     AS cantidad_ventas,
    SUM(d.subtotal) AS total_recaudado
FROM categorias c
JOIN productos p ON c.id = p.categoria_id
JOIN detalle_ordenes d ON p.id = d.producto_id
GROUP BY c.id
ORDER BY total_recaudado DESC;


-- =======================================================================================
-- Consulta 6 — Detalle completo de órdenes
-- Une 5 tablas a la vez para mostrar en una sola fila: 
-- qué compró, quién lo compró, qué empleado atendió, cuánto pagó y el estado de la orden.
-- ========================================================================================

SELECT 
    o.id                               AS orden_id,
    CONCAT(c.nombre, ' ', c.apellido)  AS cliente,
    CONCAT(e.nombre, ' ', e.apellido)  AS empleado,
    p.nombre                           AS producto,
    d.cantidad,
    d.precio_unitario,
    d.subtotal,
    o.estado,
    o.fecha
FROM ordenes o
JOIN clientes        c ON o.cliente_id  = c.id
JOIN empleados       e ON o.empleado_id = e.id
JOIN detalle_ordenes d ON o.id          = d.orden_id
JOIN productos       p ON d.producto_id = p.id
ORDER BY o.id;


-- ====================================================================================
-- Consulta 7 — Empleados y su sucursal
-- Une empleados con sucursales para ver en qué local trabaja cada uno y en qué ciudad.
-- ====================================================================================

SELECT 
    CONCAT(e.nombre, ' ', e.apellido) AS empleado,
    e.cargo,
    s.nombre AS sucursal,
    s.ciudad
FROM empleados e
JOIN sucursales s ON e.sucursal_id = s.id
ORDER BY s.nombre, e.apellido;


-- =========================================================================================
-- Consulta 8 — Productos por proveedor
-- Muestra cuántos productos tiene cada proveedor y el precio promedio de esos productos. 
--El AVG calcula el promedio.
-- =========================================================================================

SELECT 
    pr.nombre       AS proveedor,
    COUNT(p.id)     AS cantidad_productos,
    AVG(p.precio)   AS precio_promedio
FROM proveedores pr
JOIN productos p ON pr.id = p.proveedor_id
GROUP BY pr.id
ORDER BY cantidad_productos DESC;


-- =========================================================================================
-- Consulta 9 — Órdenes pendientes
-- Filtra solo las órdenes que todavía no se completaron 
--y muestra el cliente y su teléfono para poder contactarlo.
-- =========================================================================================

SELECT 
    o.id                              AS orden_id,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente,
    c.telefono,
    o.total,
    o.fecha
FROM ordenes o
JOIN clientes c ON o.cliente_id = c.id
WHERE o.estado = 'pendiente';


-- =============================================================================================
-- Consulta 10 — Resumen general
-- Es un pantallazo de toda la base de datos en una sola fila: 
-- cuántos productos, clientes, empleados, sucursales y cuánto se facturó en total.
-- =============================================================================================

SELECT 
    (SELECT COUNT(*) FROM productos)                           AS total_productos,
    (SELECT COUNT(*) FROM clientes)                            AS total_clientes,
    (SELECT COUNT(*) FROM ordenes WHERE estado='completada')   AS ordenes_completadas,
    (SELECT SUM(total) FROM ordenes WHERE estado='completada') AS facturacion_total,
    (SELECT COUNT(*) FROM empleados)                           AS total_empleados,
    (SELECT COUNT(*) FROM sucursales)                          AS total_sucursales;
