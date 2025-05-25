## -----------------------------------------------------------------
-- Tema     : Creación de Base de Datos desde Cero
-- Proyecto : Vulcanizadora Josesito
-- SGBD     : MySQL 5.x
-- Autor    : Anghelo Goicochea -Luciana Ruiz - Jose Condor
-- -----------------------------------------------------------------

-- Tabla Customer
INSERT INTO Customer (id_customer, name, lastname, address, phone, email, document_type, document_number, date, estate)
VALUES (1, 'Juan', 'Pérez', 'Av. Siempre Viva 123', '789456123', 'juan.perez@email.com', 'CI', '12345678', '2024-05-25', true);

-- Tabla Vehicle
INSERT INTO Vehicle (id_vehicle, id_customer, brand, type, plate)
VALUES (1, 1, 'Toyota', 'Sedán', 'ABC-123');

-- Tabla Product
INSERT INTO Product (id_product, name, type, price, `in stock?`, stock, registration_date)
VALUES (1, 'Aceite 20W50', 'Lubricante', 50.00, true, 20, NOW());

-- Tabla Services
INSERT INTO Services (service_id, service_type, description, service_status, date)
VALUES (1, 'Cambio de aceite', 'Cambio completo de aceite de motor', b'1', CURDATE());

-- Tabla Order_of_service
INSERT INTO Order_of_service (id_order, id_customer, id_product, date, status, Services_service_id)
VALUES (1, 1, 1, NOW(), 'A', 1);

-- Tabla Sale
INSERT INTO Sale (id_sale, id_customer, sale_date, total)
VALUES (1, 1, NOW(), 100.00);

-- Tabla Sale_detail
INSERT INTO Sale_detail (id_sale_detail, id_sale, id_product, quantity, unit_price)
VALUES (1, 1, 1, 2, 50.00);


SELECT * FROM Customer;
SELECT * FROM Vehicle;
SELECT * FROM Product;
SELECT * FROM Services;
SELECT * FROM Order_of_service;
SELECT * FROM Sale;
SELECT * FROM Sale_detail;
