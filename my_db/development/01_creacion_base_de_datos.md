**BASE DE DATOS EN MYSQL**

# MYSQL

## Gestión de base de datos

### Crear base de datos

#### Archivos físicos de la base de datos

#### Poner en uso de la base de datos

#### Inventario de base de datos

#### Eliminar base de datos

---

## Creación de base de datos PRO

### MySQL

* Es uno de los SGBD más populares en el mundo.
* MySQL Community Edition (5.x) VS MySQL Enterprise Edition (8.x)
* Existe una gran comunidad y documentación disponible.
* Se integra fácilmente con lenguajes de programación populares.
* Se adapta a una gran variedad de aplicaciones simples y complejas.

---

## GESTIÓN DE BASE DE DATOS

Es el contenedor principal de todos los objetos de una base de datos.
Objetos: tablas, vistas, cursores, índices, procedimientos almacenados, etc.

---

## CREAR BASE DE DATOS

**Sintaxis para crear una base de datos:**

```sql
CREATE DATABASE nombre_de_tu_base_de_datos;
```

**Ejemplo:**

```sql
CREATE DATABASE dbVulcanizadora;
```

---

## ARCHIVOS FÍSICOS DE LA BASE DE DATOS

Los archivos físicos tienen la extensión: `.opt`, `.frm`, `.ibd`.

**Sintaxis para visualizar la ubicación de los archivos físicos:**

```sql
SHOW VARIABLES LIKE 'datadir';
```

---

## PONER EN USO DE LA BASE DE DATOS

**Sintaxis para poner en uso la base de datos:**

```sql
USE nombre_de_tu_base_de_datos;
```

**Ejemplo:**

```sql
USE dbVulcanizadora;
```

---

## INVENTARIO DE BASE DE DATOS

**Sintaxis para listar las bases de datos:**

```sql
SHOW DATABASES;
```

---

## ELIMINAR BASE DE DATOS

Antes de eliminar una base de datos, esta no debe estar en uso.
Para saber qué base de datos está en uso:

```sql
SELECT DATABASE();
```

Poner otra base en uso:

```sql
USE sakila;
```

Para eliminar una base de datos:

```sql
DROP DATABASE nombre_de_tu_base_de_datos;
```

**Ejemplo:**

```sql
DROP DATABASE dbVulcanizadora;
```

Verificar si se ha eliminado:

```sql
SHOW DATABASES;
```

*Tener presente que el eliminado es una operación irreversible.*

---

## CREACIÓN DE BASE DE DATOS PRO

```sql
CREATE DATABASE IF NOT EXISTS dbVulcanizadora
CHARACTER SET utf8mb4
COLLATE utf8mb4_spanish_ci;

USE dbVulcanizadora;
```
