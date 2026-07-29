-- =====================================================================
-- Módulo 2 - Unidad 1: Diseño de estructura de base de datos
-- Sistema de gestión de ventas
-- =====================================================================

-- ---------------------------------------------------------------------
-- Tabla 1: clientes
-- ---------------------------------------------------------------------
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    -- Número entero simple, y lo marcamos como PRIMARY KEY para que
    -- identifique de forma única a cada cliente (no puede repetirse ni ser nulo).

    nombre VARCHAR(100) NOT NULL,
    -- Texto de hasta 100 caracteres. Es más que suficiente para nombres y
    -- apellidos, y VARCHAR no desperdicia espacio si el nombre es más cort

    perfil_bio TEXT,
    -- Usamos TEXT porque una biografía o nota no tiene un largo predecible:
    -- puede ser una frase corta o un párrafo entero. TEXT no impone un
    -- límite de caracteres como sí lo hace VARCHAR.

    fecha_registro DATE NOT NULL
    -- Solo nos interesa el día en que se registró el cliente, no la hora.
    -- Por eso usamos DATE y no TIMESTAMP.
);

SELECT * FROM clientes

-- ---------------------------------------------------------------------
-- Tabla 2: productos
-- ---------------------------------------------------------------------

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    -- Igual que en clientes: identificador único del producto.

    descripcion VARCHAR(255) NOT NULL,
    -- Texto de hasta 255 caracteres, el estándar habitual para nombres o
    -- descripciones cortas de producto.

    precio DECIMAL(10, 2) NOT NULL,
    -- DECIMAL(10,2) y no FLOAT: cuando hablamos de dinero necesitamos
    -- precisión exacta (que 19.99 sea siempre 19.99). FLOAT puede generar
    -- pequeños errores de redondeo por cómo almacena los números, algo
    -- inaceptable para precios. El (10,2) permite hasta 8 dígitos enteros
    -- y 2 decimales.

    esta_activo SMALLINT NOT NULL DEFAULT 1
    -- Para indicar si el producto está a la venta, usamos un número pequeño
    -- (1 = activo, 0 = inactivo) en lugar de BOOLEAN. Elegimos SMALLINT
    -- porque BOOLEAN no existe como tal en SQL Server (ahí se usaría BIT),
    -- mientras que SMALLINT sí funciona igual en PostgreSQL y en SQL Server,
    -- así el script corre en cualquiera de los dos motores sin cambios.
);

SELECT * FROM productos
