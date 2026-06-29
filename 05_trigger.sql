-- ====================================================================================
-- AUTOMATIZACIÓN: DISPARADOR DE INVENTARIO (TRIGGER)
-- Objetivo: Garantizar la consistencia del stock en tiempo real.
-- Evento: AFTER INSERT ON detalle_ordenes (Se activa luego de registrar una venta).
-- Lógica: Toma la cantidad vendida ('NEW.cantidad') y la resta del 
-- stock actual en la tabla 'productos' para el ID correspondiente.
-- ====================================================================================


USE supermercado_coto;

DELIMITER $$

CREATE TRIGGER actualizar_stock
AFTER INSERT ON detalle_ordenes
FOR EACH ROW
BEGIN
    UPDATE productos 
    SET stock = stock - NEW.cantidad
    WHERE id = NEW.producto_id;
END$$

DELIMITER ;


-- ====================================================================================
-- PRUEBA DEL REQUISITO FUNCIONAL (TESTING DEL TRIGGER)
-- Verificación manual de que la automatización funciona correctamente.
-- ====================================================================================


-- Stock del producto 1 ANTES
SELECT nombre, stock FROM productos WHERE id = 1;

-- Insertamos una nueva venta
INSERT INTO detalle_ordenes (orden_id, producto_id, cantidad, precio_unitario, subtotal)
VALUES (1, 1, 5, 180.00, 900.00);

-- Stock del producto 1 DESPUES (debería haber bajado 5)
SELECT nombre, stock FROM productos WHERE id = 1;
