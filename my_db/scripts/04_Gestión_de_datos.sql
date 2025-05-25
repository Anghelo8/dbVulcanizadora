## -----------------------------------------------------------------
-- Tema     : Creación de Base de Datos desde Cero
-- Proyecto : Vulcanizadora Josesito
-- SGBD     : MySQL 5.x
-- Autor    : Anghelo Goicochea -Luciana Ruiz - Jose Condor
-- -----------------------------------------------------------------

-- Tabla Cliente
INSERT INTO Cliente (id_cliente, nombre, apellido, direccion, celular, correo_electronico, tipo_de_documento, numero_de_documento, fecha, estado)
VALUES (1, 'Juan', 'Pérez', 'Av. Siempre Viva 123', '789456123', 'juan.perez@email.com', 'CI', '12345678', '2024-05-25', true);

-- Tabla Vehiculo
INSERT INTO Vehiculo (id_vehiculo, id_cliente, marca, tipo, placa)
VALUES (1, 1, 'Toyota', 'Sedán', 'ABC-123');

-- Tabla Producto
INSERT INTO Producto (id_producto, nombre, tipo, precio, en_stock, stock, fecha_de_regi)
VALUES (1, 'Aceite 20W50', 'Lubricante', 50.00, true, 20, NOW());

-- Tabla Servicio
INSERT INTO Servicio (id_servicio, tipo_servicio, descripcion, estado_vehiculo, fecha, price)
VALUES (1, 'Cambio de aceite', 'Cambio completo de aceite de motor', true, CURDATE(), 50.00);

-- Tabla Orden_de_Servicio
INSERT INTO Orden_de_Servicio (id_orden, id_cliente, id_producto, fecha, estado, id_servicio)
VALUES (1, 1, 1, NOW(), 'A', 1);

-- Tabla Venta
INSERT INTO Venta (id_venta, id_cliente, fecha, total)
VALUES (1, 1, NOW(), 100.00);

-- Tabla Detalle_de_venta
INSERT INTO Detalle_de_venta (id_detalle_venta, id_venta, id_producto, cantidad, precio_unitario)
VALUES (1, 1, 1, 2, 50.00);

-- Consultas para verificar los datos insertados
SELECT * FROM Cliente;
SELECT * FROM Vehiculo;
SELECT * FROM Producto;
SELECT * FROM Servicio;
SELECT * FROM Orden_de_Servicio;
SELECT * FROM Venta;
SELECT * FROM Detalle_de_venta;

