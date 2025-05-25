## -----------------------------------------------------------------
-- Tema     : Creación de Base de Datos desde Cero
-- Proyecto : Vulcanizadora Josesito
-- SGBD     : MySQL 5.x
-- Autor    : Anghelo Goicochea -Luciana Ruiz - Jose Condor
-- -----------------------------------------------------------------

-- Tabla Cliente
-- NOTA: 'id_cliente' ahora es 'idCliente' y tiene nuevas columnas.
INSERT INTO Cliente (idCliente, nombre, apellido, numeroTelefono, correo, direccion, fechaNacimiento, sexo, tipoDocumento, numeroDocumento, estado, fechaRegistro)
VALUES (1, 'Juan', 'Pérez', '789456123', 'juan.perez@email.com', 'Av. Siempre Viva 123', '1985-10-20', 'Masculino', 'DNI', '12345678', TRUE, NOW());

-- Tabla Vehiculo
-- NOTA: La columna 'id_cliente' en Vehiculo ahora referencia a 'idCliente' en Cliente.
INSERT INTO Vehiculo (id_vehiculo, id_cliente, marca, tipo, placa)
VALUES (1, 1, 'Toyota', 'Sedán', 'ABC-123');

-- Tabla Producto
-- NOTA: Se eliminó 'hay_en_stock' y 'fecha_de_regi' ahora es 'fecha_registro'.
INSERT INTO Producto (id_producto, nombre, tipo, marca, precio, stock, fecha_registro)
VALUES (1, 'Aceite 20W50', 'Lubricante', 'Castrol', 50.00, 20, NOW());
-- Agregué 'marca' ya que tu tabla Producto la tiene, y el valor estaba ausente en tu INSERT original.

-- Tabla Servicio
INSERT INTO Servicio (id_servicio, tipo_servicio, descripcion, estado_vehiculo, fecha, price)
VALUES (1, 'Cambio de aceite', 'Cambio completo de aceite de motor y filtro.', TRUE, CURDATE(), 50.00);

-- Tabla Orden_de_Servicio
-- NOTA: La columna 'id_cliente' en Orden_de_Servicio ahora referencia a 'idCliente' en Cliente.
INSERT INTO Orden_de_Servicio (id_orden, id_cliente, id_producto, id_servicio, fecha, estado)
VALUES (1, 1, 1, 1, NOW(), 'P'); -- 'P' podría significar Pendiente, por ejemplo.

-- Tabla Venta
-- NOTA: La columna 'id_cliente' en Venta ahora referencia a 'idCliente' en Cliente.
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

