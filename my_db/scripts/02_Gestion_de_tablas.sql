## -----------------------------------------------------------------
-- Tema     : Creación de Base de Datos desde Cero
-- Proyecto : Vulcanizadora Josesito
-- SGBD     : MySQL 5.x
-- Autor    : Anghelo Goicochea -Luciana Ruiz - Jose Condor
-- -----------------------------------------------------------------


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

-- Verificación de tablas creadas
SHOW TABLES;
