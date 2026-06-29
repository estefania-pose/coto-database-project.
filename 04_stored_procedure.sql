-- ==============================================================================
-- AUTOMATIZACIÓN: PROCEDIMIENTO ALMACENADO (STORED PROCEDURE)
-- Objetivo: Consultar de forma dinámica y centralizada el historial 
-- comercial de un cliente mediante su ID único.
-- Parámetros: Recibe un entero (cliente_id_param).
-- Retorna: Nombre completo, cantidad de compras y el monto total invertido.
-- ==============================================================================


USE supermercado_coto;

DELIMITER $$

CREATE PROCEDURE total_por_cliente(IN cliente_id_param INT)
BEGIN
    SELECT 
        c.nombre,
        c.apellido,
        COUNT(o.id)  AS cantidad_ordenes,
        SUM(o.total) AS total_gastado
    FROM clientes c
    JOIN ordenes o ON c.id = o.cliente_id
    WHERE c.id = cliente_id_param
    AND o.estado = 'completada'
    GROUP BY c.id;
END$$

DELIMITER ;


-- Ejemplo de uso del procedimiento (Prueba de ejecución):
USE supermercado_coto;
CALL total_por_cliente(1);
