-- -----------------------------------------------------------------
-- Tema     : Creación de Base de Datos desde Cero
-- Proyecto : Vulcanizadora Josesito
-- SGBD     : MySQL 5.x
-- Autor    : Anghelo Goicochea - Luciana Ruiz - Jose Condor
-- -----------------------------------------------------------------
# Relaciones entre Tablas - Base de Datos `dbVulcanizadora`

Este documento describe la creación de relaciones entre las tablas de la base de datos `dbVulcanizadora`.

---

## 🔗 Relaciones Establecidas

-- Asegúrate de usar tu base de datos
USE dbVulcanizadora;

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

---

-- Verificación de Relaciones (este comando no necesita cambios)
SELECT
    kcu.CONSTRAINT_NAME AS 'Nombre de Relación',
    kcu.REFERENCED_TABLE_NAME AS 'Tabla Padre',
    kcu.REFERENCED_COLUMN_NAME AS 'Primary Key',
    kcu.TABLE_NAME AS 'Tabla Hija',
    kcu.COLUMN_NAME AS 'Foreign Key'
FROM
    information_schema.KEY_COLUMN_USAGE AS kcu
WHERE
    kcu.TABLE_SCHEMA = 'dbVulcanizadora'
    AND kcu.REFERENCED_TABLE_NAME IS NOT NULL;

