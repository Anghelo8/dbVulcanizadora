CREATE DATABASE IF NOT EXISTS dbVulcanizadora 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_spanish_ci;
USE dbVulcanizadora;

-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    numeroTelefono VARCHAR(20),
    correo VARCHAR(100),
    direccion VARCHAR(255),
    fechaNacimiento DATE,
    sexo VARCHAR(20),
    tipoDocumento VARCHAR(50),
    numeroDocumento VARCHAR(50) UNIQUE NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE, -- TRUE para activo, FALSE para inactivo (eliminación lógica)
    fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Producto
CREATE TABLE Producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60),
    tipo VARCHAR(50),
    marca VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT,
    -- hay_en_stock BOOLEAN, -- Campo eliminado por ser redundante
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Nombre corregido
);

-- Tabla Servicio
CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    tipo_servicio VARCHAR(50),
    descripcion TEXT,
    estado_vehiculo BOOLEAN, -- Considera un nombre más específico como 'servicio_completado'
    fecha DATE,
    price DECIMAL(10, 2)
);

-- Tabla Vehiculo
CREATE TABLE Vehiculo (
    id_vehiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL, -- Columna que referencia a Cliente
    marca VARCHAR(50),
    tipo VARCHAR(50),
    placa VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(idCliente) -- ¡CORREGIDO aquí!
);

-- Tabla Venta
CREATE TABLE Venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL, -- Columna que referencia a Cliente
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(idCliente) -- ¡CORREGIDO aquí!
);

-- Tabla Orden_de_Servicio
CREATE TABLE Orden_de_Servicio (
    id_orden INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_producto INT,
    id_servicio INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado CHAR(1),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(idCliente), -- ¡CORREGIDO aquí!
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

-- Tabla Detalle_de_venta
CREATE TABLE Detalle_de_venta (
    id_detalle_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- Relación: Cliente (1) --- (∞) Vehiculo
-- Descripción: Un cliente puede tener varios vehículos.
ALTER TABLE Vehiculo
ADD CONSTRAINT fk_cliente_vehiculo
FOREIGN KEY (id_cliente) REFERENCES Cliente(idCliente); -- ¡CORREGIDO: idCliente!

-- Relación: Cliente (1) --- (∞) Orden_de_Servicio
-- Descripción: Un cliente puede tener muchas órdenes de servicio.
ALTER TABLE Orden_de_Servicio
ADD CONSTRAINT fk_cliente_orden
FOREIGN KEY (id_cliente) REFERENCES Cliente(idCliente); -- ¡CORREGIDO: idCliente!

-- Relación: Producto (1) --- (∞) Orden_de_Servicio
-- Descripción: Un producto puede estar relacionado con muchas órdenes de servicio.
ALTER TABLE Orden_de_Servicio
ADD CONSTRAINT fk_producto_orden
FOREIGN KEY (id_producto) REFERENCES Producto(id_producto);

-- Relación: Servicio (1) --- (∞) Orden_de_Servicio
-- Descripción: Un servicio puede estar incluido en muchas órdenes de servicio.
ALTER TABLE Orden_de_Servicio
ADD CONSTRAINT fk_servicio_orden
FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio);

-- Relación: Cliente (1) --- (∞) Venta
-- Descripción: Un cliente puede realizar varias ventas.
ALTER TABLE Venta
ADD CONSTRAINT fk_cliente_venta
FOREIGN KEY (id_cliente) REFERENCES Cliente(idCliente); -- ¡CORREGIDO: idCliente!

-- Relación: Venta (1) --- (∞) Detalle_de_venta
-- Descripción: Una venta puede tener varios detalles de venta.
ALTER TABLE Detalle_de_venta
ADD CONSTRAINT fk_venta_detalle
FOREIGN KEY (id_venta) REFERENCES Venta(id_venta);

-- Relación: Producto (1) --- (∞) Detalle_de_venta
-- Descripción: Un producto puede aparecer en múltiples detalles de venta.
ALTER TABLE Detalle_de_venta
ADD CONSTRAINT fk_producto_detalle
FOREIGN KEY (id_producto) REFERENCES Producto(id_producto);

USE dbVulcanizadora;

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
