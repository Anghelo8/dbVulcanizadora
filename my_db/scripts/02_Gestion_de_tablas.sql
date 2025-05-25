## -----------------------------------------------------------------
-- Tema     : Creación de Base de Datos desde Cero
-- Proyecto : Vulcanizadora Josesito
-- SGBD     : MySQL 5.x
-- Autor    : Anghelo Goicochea -Luciana Ruiz - Jose Condor
-- -----------------------------------------------------------------


-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    celular CHAR(9) NOT NULL,
    correo_electronico VARCHAR(255),
    tipo_de_documento CHAR(3),
    numero_de_documento VARCHAR(20),
    atributo_9 INT,
    fecha DATE,
    estado BOOLEAN
);

-- Tabla Producto
CREATE TABLE Producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60),
    tipo VARCHAR(50),
    marca VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT,
    hay_en_stock BOOLEAN,
    fecha_de_regi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Servicio
CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    tipo_servicio VARCHAR(50),
    descripcion TEXT,
    estado_vehiculo BOOLEAN,
    fecha DATE,
    price DECIMAL(10, 2)
);

-- Tabla Vehiculo
CREATE TABLE Vehiculo (
    id_vehiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    marca VARCHAR(50),
    tipo VARCHAR(50),
    placa VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabla Venta
CREATE TABLE Venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabla Orden_de_Servicio
CREATE TABLE Orden_de_Servicio (
    id_orden INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_producto INT,
    id_servicio INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado CHAR(1),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
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
