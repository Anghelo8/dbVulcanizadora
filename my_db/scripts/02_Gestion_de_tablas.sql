## -----------------------------------------------------------------
-- Tema     : Creación de Base de Datos desde Cero
-- Proyecto : Vulcanizadora Josesito
-- SGBD     : MySQL 5.x
-- Autor    : Anghelo Goicochea -Luciana Ruiz - Jose Condor
-- -----------------------------------------------------------------

-- Base de Datos: Vulcanizadora
CREATE DATABASE IF NOT EXISTS dbVulcanizadora
CHARACTER SET utf8mb4
COLLATE utf8mb4_spanish_ci;
USE dbVulcanizadora;

-- Tabla Customer
CREATE TABLE Customer (
    id_customer INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone CHAR(9) NOT NULL,
    email VARCHAR(255),
    document_type CHAR(3),
    document_number VARCHAR(20),
    date DATE,
    estate BOOLEAN
);

-- Tabla Vehicle
CREATE TABLE Vehicle (
    id_vehicle INT PRIMARY KEY AUTO_INCREMENT,
    id_customer INT NOT NULL,
    brand VARCHAR(50),
    type VARCHAR(50),
    plate VARCHAR(20),
    FOREIGN KEY (id_customer) REFERENCES Customer(id_customer)
);

-- Tabla Services
CREATE TABLE Services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    service_type VARCHAR(50),
    description TEXT,
    service_status BLOB,
    date DATE
);

-- Tabla Product
CREATE TABLE Product (
    id_product INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60),
    type VARCHAR(50),
    price DECIMAL(10,2),
    `in stock` BOOLEAN,
    stock INT,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Order_of_service
CREATE TABLE Order_of_service (
    id_order INT PRIMARY KEY AUTO_INCREMENT,
    id_customer INT NOT NULL,
    id_product INT,
    Services_service_id INT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status CHAR(1),
    FOREIGN KEY (id_customer) REFERENCES Customer(id_customer),
    FOREIGN KEY (id_product) REFERENCES Product(id_product),
    FOREIGN KEY (Services_service_id) REFERENCES Services(service_id)
);

-- Tabla Sale
CREATE TABLE Sale (
    id_sale INT PRIMARY KEY AUTO_INCREMENT,
    id_customer INT NOT NULL,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    FOREIGN KEY (id_customer) REFERENCES Customer(id_customer)
);

-- Tabla Sale_detail
CREATE TABLE Sale_detail (
    id_sale_detail INT PRIMARY KEY AUTO_INCREMENT,
    id_sale INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (id_sale) REFERENCES Sale(id_sale),
    FOREIGN KEY (id_product) REFERENCES Product(id_product)
);

-- Verificación de tablas creadas
SHOW TABLES;
