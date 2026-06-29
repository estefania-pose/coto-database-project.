-- ==========================================================================================
-- CARGA DE DATOS INICIALES (INSERTS)
-- Proyecto: Supermercado Coto
-- Objetivo: Inserción de registros de prueba (categorías, productos, clientes, órdenes).
-- ==========================================================================================

INSERT INTO categorias (nombre, descripcion) VALUES
('Lacteos',    'Leches, yogures, quesos y mantecas'),
('Carnes',     'Carnes rojas, pollo y cerdo'),
('Verduras',   'Frutas y verduras frescas'),
('Bebidas',    'Gaseosas, aguas y jugos'),
('Limpieza',   'Productos de limpieza del hogar'),
('Panaderia',  'Pan, facturas y productos de panaderia'),
('Congelados', 'Alimentos congelados y helados'),
('Almacen',    'Aceites, arroz, fideos y enlatados');

INSERT INTO sucursales (nombre, direccion, ciudad, telefono) VALUES
('Coto Palermo',       'Av. Santa Fe 3253',      'Buenos Aires', '011-4821-0000'),
('Coto Caballito',     'Av. Rivadavia 5200',     'Buenos Aires', '011-4902-0000'),
('Coto Quilmes',       'Av. Calchaqui 3900',     'Quilmes',      '011-4224-0000'),
('Coto Mar del Plata', 'Av. Juan B. Justo 3500', 'Mar del Plata','0223-480-0000'),
('Coto Cordoba',       'Av. Colon 4200',         'Cordoba',      '0351-460-0000');

INSERT INTO proveedores (nombre, contacto, email, telefono) VALUES
('Lacteos La Serenisima',   'Carlos Mendez',  'ventas@laserenisima.com.ar', '011-4000-1111'),
('Molinos Rio de la Plata', 'Ana Rodriguez',  'comercial@molinos.com.ar',   '011-4000-2222'),
('Coca-Cola FEMSA',         'Luis Fernandez', 'ventas@cocacola.com.ar',     '011-4000-3333'),
('Unilever Argentina',      'Maria Gonzalez', 'ventas@unilever.com.ar',     '011-4000-4444'),
('Carnes del Sur',          'Roberto Perez',  'ventas@carnesdelsur.com.ar', '011-4000-5555');

INSERT INTO productos (nombre, descripcion, precio, stock, categoria_id, proveedor_id) VALUES
('Leche La Serenisima 1L',       'Leche entera larga vida',         180.00, 200, 1, 1),
('Yogur Ser Frutilla 190g',      'Yogur descremado sabor frutilla', 250.00, 150, 1, 1),
('Queso Cremoso Mendicrim 400g', 'Queso cremoso untable',           850.00,  80, 1, 1),
('Manteca La Paulina 200g',      'Manteca sin sal',                 420.00, 100, 1, 1),
('Asado de tira x kg',           'Corte vacuno premium',           3500.00,  50, 2, 5),
('Pechuga de pollo x kg',        'Pollo fresco sin hueso',         2200.00,  60, 2, 5),
('Lomo x kg',                    'Corte vacuno de primera',        6500.00,  30, 2, 5),
('Tomate redondo x kg',          'Tomate fresco de temporada',      350.00, 100, 3, NULL),
('Papa x kg',                    'Papa blanca',                     280.00, 200, 3, NULL),
('Lechuga criolla',              'Lechuga fresca por unidad',       180.00,  80, 3, NULL),
('Coca-Cola 2.25L',              'Gaseosa cola familiar',           650.00, 300, 4, 3),
('Agua Mineral Villavicencio 2L','Agua sin gas',                    350.00, 250, 4, 3),
('Jugo Cepita Naranja 1L',       'Jugo de naranja sin azucar',      450.00, 180, 4, 3),
('Detergente Magistral 750ml',   'Detergente liquido limon',        380.00, 120, 5, 4),
('Jabon en polvo Skip 1kg',      'Jabon para ropa en polvo',        950.00,  90, 5, 4),
('Lavandina Ayudin 1L',          'Lavandina concentrada',           280.00, 150, 5, 4),
('Pan lactal Bimbo 500g',        'Pan de molde blanco',             480.00, 100, 6, 2),
('Medialunas x6',                'Medialunas de manteca',           550.00,  60, 6, NULL),
('Helado Freddo Chocolate 1L',   'Helado artesanal chocolate',     1800.00,  40, 7, NULL),
('Milanesas de pollo x500g',     'Milanesas rebozadas congeladas',  980.00,  70, 7, NULL),
('Arroz Marolio 1kg',            'Arroz largo fino',                350.00, 200, 8, 2),
('Fideos Matarazzo Spaghetti',   'Fideos secos 500g',               280.00, 180, 8, 2),
('Aceite Cocinero 1.5L',         'Aceite de girasol',               950.00, 120, 8, 2);

INSERT INTO clientes (nombre, apellido, email, telefono, direccion) VALUES
('Juan',   'Garcia',    'juan.garcia@email.com',    '11-4521-3344', 'Av. Corrientes 1234, CABA'),
('Maria',  'Lopez',     'maria.lopez@email.com',    '11-4532-5566', 'Av. Santa Fe 567, CABA'),
('Carlos', 'Martinez',  'carlos.martinez@email.com','11-4543-7788', 'Av. Rivadavia 890, CABA'),
('Ana',    'Fernandez', 'ana.fernandez@email.com',  '11-4554-9900', 'Av. Cabildo 234, CABA'),
('Pedro',  'Gonzalez',  'pedro.gonzalez@email.com', '11-4565-1122', 'Av. Las Heras 567, CABA'),
('Laura',  'Rodriguez', 'laura.rodriguez@email.com','11-4576-3344', 'Av. Pueyrredon 890, CABA'),
('Diego',  'Sanchez',   'diego.sanchez@email.com',  '11-4587-5566', 'Av. Callao 123, CABA'),
('Sofia',  'Torres',    'sofia.torres@email.com',   '11-4598-7788', 'Av. Belgrano 456, CABA');

INSERT INTO empleados (nombre, apellido, cargo, email, sucursal_id) VALUES
('Roberto',   'Perez',  'Cajero',     'roberto.perez@coto.com.ar',    1),
('Claudia',   'Nunez',  'Repositora', 'claudia.nunez@coto.com.ar',    1),
('Marcos',    'Ibanez', 'Supervisor', 'marcos.ibanez@coto.com.ar',    2),
('Valentina', 'Castro', 'Cajera',     'valentina.castro@coto.com.ar', 2),
('Hernan',    'Romero', 'Carnicero',  'hernan.romero@coto.com.ar',    3),
('Patricia',  'Silva',  'Gerente',    'patricia.silva@coto.com.ar',   1);

INSERT INTO ordenes (cliente_id, empleado_id, total, estado) VALUES
(1, 1, 2160.00, 'completada'),
(2, 1, 4650.00, 'completada'),
(3, 4, 1280.00, 'completada'),
(4, 1, 7200.00, 'completada'),
(5, 4, 3450.00, 'pendiente'),
(1, 1, 1580.00, 'completada'),
(6, 4,  980.00, 'cancelada'),
(7, 1, 5600.00, 'completada');

INSERT INTO detalle_ordenes (orden_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(1, 1,  2, 180.00,  360.00),
(1, 11, 1, 650.00,  650.00),
(1, 20, 2, 350.00,  700.00),
(1, 21, 2, 280.00,  560.00),
(2, 5,  1, 3500.00, 3500.00),
(2, 8,  2, 350.00,   700.00),
(2, 12, 1, 350.00,   350.00),
(2, 14, 1, 380.00,   380.00),
(3, 2,  2, 250.00,  500.00),
(3, 17, 1, 480.00,  480.00),
(3, 15, 1, 950.00,  950.00),
(4, 7,  1, 6500.00, 6500.00),
(4, 9,  2, 280.00,   560.00),
(4, 16, 1, 280.00,   280.00),
(5, 6,  1, 2200.00, 2200.00),
(5, 11, 2, 650.00,  1300.00),
(6, 1,  3, 180.00,  540.00),
(6, 2,  2, 250.00,  500.00),
(6, 17, 1, 480.00,  480.00),
(8, 5,  1, 3500.00, 3500.00),
(8, 6,  1, 2200.00, 2200.00);

INSERT INTO stock_movimientos (producto_id, tipo, cantidad, motivo) VALUES
(1,  'entrada', 500, 'Reposicion semanal'),
(5,  'entrada', 100, 'Entrega proveedor'),
(11, 'entrada', 300, 'Reposicion semanal'),
(1,  'salida',   50, 'Ventas del dia'),
(5,  'salida',   20, 'Ventas del dia'),
(11, 'salida',   80, 'Ventas del dia'),
(3,  'salida',   10, 'Producto vencido'),
(9,  'entrada', 200, 'Entrega proveedor');
