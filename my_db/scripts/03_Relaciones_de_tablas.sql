## -----------------------------------------------------------------
-- Tema     : Creación de Base de Datos desde Cero
-- Proyecto : Vulcanizadora Josesito
-- SGBD     : MySQL 5.x
-- Autor    : Anghelo Goicochea -Luciana Ruiz - Jose Condor
-- -----------------------------------------------------------------
# Relaciones entre Tablas - Base de Datos `dbVulcanizadora`

Este documento describe la creación de relaciones entre las tablas de la base de datos `dbVulcanizadora`.

---

## 🔗 Relaciones Establecidas

### 1. Relación: `Customer (1) --- (∞) Vehicle`

- **Descripción**: Un cliente puede tener varios vehículos.
- **Acción**:
```sql
ALTER TABLE Vehicle
ADD CONSTRAINT fk_customer_vehicle
FOREIGN KEY (id_customer) REFERENCES Customer(id_customer);
```

---

### 2. Relación: `Customer (1) --- (∞) Order_of_service`

- **Descripción**: Un cliente puede tener muchas órdenes de servicio.
- **Acción**:
```sql
ALTER TABLE Order_of_service
ADD CONSTRAINT fk_customer_order
FOREIGN KEY (id_customer) REFERENCES Customer(id_customer);
```

---

### 3. Relación: `Product (1) --- (∞) Order_of_service`

- **Descripción**: Un producto puede estar relacionado con muchas órdenes de servicio.
- **Acción**:
```sql
ALTER TABLE Order_of_service
ADD CONSTRAINT fk_product_order
FOREIGN KEY (id_product) REFERENCES Product(id_product);
```

---

### 4. Relación: `Services (1) --- (∞) Order_of_service`

- **Descripción**: Un servicio puede estar incluido en muchas órdenes de servicio.
- **Acción**:
```sql
ALTER TABLE Order_of_service
ADD CONSTRAINT fk_service_order
FOREIGN KEY (Services_service_id) REFERENCES Services(service_id);
```

---

### 5. Relación: `Customer (1) --- (∞) Sale`

- **Descripción**: Un cliente puede realizar varias ventas.
- **Acción**:
```sql
ALTER TABLE Sale
ADD CONSTRAINT fk_customer_sale
FOREIGN KEY (id_customer) REFERENCES Customer(id_customer);
```

---

### 6. Relación: `Sale (1) --- (∞) Sale_detail`

- **Descripción**: Una venta puede tener varios detalles de venta.
- **Acción**:
```sql
ALTER TABLE Sale_detail
ADD CONSTRAINT fk_sale_detail
FOREIGN KEY (id_sale) REFERENCES Sale(id_sale);
```

---

### 7. Relación: `Product (1) --- (∞) Sale_detail`

- **Descripción**: Un producto puede aparecer en múltiples detalles de venta.
- **Acción**:
```sql
ALTER TABLE Sale_detail
ADD CONSTRAINT fk_product_detail
FOREIGN KEY (id_product) REFERENCES Product(id_product);
```

---

## 🔍 Verificación de Relaciones

```sql
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
```

---
