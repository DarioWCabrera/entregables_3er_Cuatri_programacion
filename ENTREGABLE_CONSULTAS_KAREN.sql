create schema facturacion_1;
use facturacion_1;

-- 
-- TABLE: E01_CLIENTE 
--
CREATE TABLE E01_CLIENTE(
    nro_cliente    INTEGER        NOT NULL,
    nombre         VARCHAR(45)    NOT NULL,
    apellido       VARCHAR(45)    NOT NULL,
    direccion      VARCHAR(45)    NOT NULL,
    activo         SMALLINT       NOT NULL,
    CONSTRAINT PK_E01_CLIENTE PRIMARY KEY (nro_cliente)
);
-- 
-- TABLE: E01_DETALLE_FACTURA 
--
CREATE TABLE E01_DETALLE_FACTURA(
    nro_factura        INTEGER    NOT NULL,
    codigo_producto    INTEGER    NOT NULL,
    nro_item           INTEGER    NOT NULL,
    cantidad           FLOAT      NOT NULL,
    CONSTRAINT PK_E01_DETALLE_FACTURA PRIMARY KEY (nro_factura, codigo_producto)
);
-- 
-- TABLE: E01_FACTURA 
--
CREATE TABLE E01_FACTURA(
    nro_factura      INTEGER    NOT NULL,
    fecha            DATE       NOT NULL,
    total_sin_iva    DOUBLE     NOT NULL,
    iva              DOUBLE     NOT NULL,
    total_con_iva    DOUBLE,
    nro_cliente      INTEGER    NOT NULL,
    CONSTRAINT PK_E01_FACTURA PRIMARY KEY (nro_factura)
);
-- 
-- TABLE: E01_PRODUCTO 
--
CREATE TABLE E01_PRODUCTO(
    codigo_producto    INTEGER        NOT NULL,
    marca              VARCHAR(45)    NOT NULL,
    nombre             VARCHAR(45)    NOT NULL,
    descripcion        VARCHAR(45)    NOT NULL,
    precio             FLOAT          NOT NULL,
    stock              INTEGER        NOT NULL,
    CONSTRAINT PK_E01_PRODUCTO PRIMARY KEY (codigo_producto)
);
-- 
-- TABLE: E01_TELEFONO 
--
CREATE TABLE E01_TELEFONO(
    codigo_area     INTEGER    NOT NULL,
    nro_telefono    INTEGER    NOT NULL,
    tipo            CHAR(1)    NOT NULL,
    nro_cliente     INTEGER    NOT NULL,
    CONSTRAINT PK_E01_TELEFONO PRIMARY KEY (codigo_area, nro_telefono)
);
-- 
-- TABLE: E01_DETALLE_FACTURA 
--
ALTER TABLE E01_DETALLE_FACTURA ADD CONSTRAINT FK_E01_DETALLE_FACTURA_PRODUCTO
    FOREIGN KEY (codigo_producto)
    REFERENCES E01_PRODUCTO(codigo_producto)
;

ALTER TABLE E01_DETALLE_FACTURA ADD CONSTRAINT FK_E01_DETALLE_FACTURA_FACTURA 
    FOREIGN KEY (nro_factura)
    REFERENCES E01_FACTURA(nro_factura)
;
-- 
-- TABLE: E01_FACTURA 
--
ALTER TABLE E01_FACTURA ADD CONSTRAINT FK_E01_FACTURA_CLIENTE 
    FOREIGN KEY (nro_cliente)
    REFERENCES E01_CLIENTE(nro_cliente)
;
-- 
-- TABLE: E01_TELEFONO 
--
ALTER TABLE E01_TELEFONO ADD CONSTRAINT FK_E01_TELEFONO_CLIENTE 
    FOREIGN KEY (nro_cliente)
    REFERENCES E01_CLIENTE(nro_cliente)
;
-- 1 Mostrar todos los clientes registrados en la base de datos.
SELECT * FROM E01_CLIENTE;
-- 2 Listar solo el nombre y apellido de todos los clientes. 
SELECT nro_cliente nombre, apellido FROM E01_CLIENTE;
-- 3 Mostrar todos los productos con sus precios y stock
SELECT * FROM E01_PRODUCTO;
-- 4 Mostrar el nombre, apellido y dirección de los clientes que tengan un 
-- valor de activo mayor a 100. 
SELECT nro_cliente, nombre, apellido, direccion FROM E01_CLIENTE WHERE activo <100;
-- 5 Listar todos los productos cuyo precio sea mayor a 800. 
SELECT * FROM E01_PRODUCTO WHERE precio >800;
-- 6 Mostrar todos los clientes cuyo apellido comience con la letra M.
SELECT nro_cliente, apellido, nombre FROM E01_CLIENTE WHERE apellido LIKE "M%";
-- 7 Mostrar los productos cuyo nombre contenga la palabra meat.
SELECT nombre  FROM e01_producto  WHERE(nombre LIKE'meat'); 
-- 8 Obtener las diferentes marcas de productos (sin repetir). 
SELECT DISTINCT marca FROM E01_PRODUCTO;
-- 9 Mostrar todos los clientes cuyo valor de activo esté entre 50 y 100
SELECT * FROM E01_CLIENTE WHERE activo BETWEEN 50 AND 100;
-- 10 Listar los productos cuyo precio sea mayor a 500 y su stock mayor a 
-- 400. 
SELECT * FROM E01_PRODUCTO WHERE precio > 500 AND stock >400;
-- 11. Listar los clientes cuyo apellido sea “Rose” o “Allen”.
 SELECT nro_cliente, nombre, apellido FROM E01_CLIENTE WHERE (apellido LIKE'Rose') OR (apellido LIKE 'Allen');
 -- 12. Mostrar los clientes cuyo nombre contenga la letra a en cualquier 
-- posición. 
SELECT nro_cliente, apellido, nombre FROM e01_cliente WHERE nombre LIKE 'a%';
-- 13 Listar los productos cuyo precio esté entre 200 y 600.
SELECT * FROM E01_PRODUCTO WHERE precio BETWEEN 200 AND 600;
-- 14. Mostrar los productos que tengan un stock menor a 100.
SELECT * FROM E01_PRODUCTO WHERE stock <100;
-- 15. Listar todos los clientes cuya dirección contenga la palabra Avenida. 
SELECT * FROM E01_CLIENTE WHERE direccion LIKE '%Avenida%';
-- 16. Mostrar los productos que tengan en el campo descripcion la 
-- palabra Nulla. 
SELECT * FROM E01_PRODUCTO WHERE descripcion LIKE '%Nulla%';
-- 17. Obtener todos los productos con precio menor a 300 o stock mayor 
-- a 900.
SELECT * FROM E01_PRODUCTO WHERE precio < 300 AND stock > 900;
-- 18. Listar los clientes cuyo campo activo sea igual a 0, 50 o 100. 
SELECT * FROM E01_CLIENTE WHERE activo IN (0, 50, 100);
-- 19. Mostrar los productos cuya marca termine con la palabra Company.
SELECT * FROM E01_PRODUCTO WHERE marca LIKE '%Company';
-- 20. Listar los clientes cuyo nombre empiece con “C” y su activo sea 
-- mayor a 80.
SELECT * FROM E01_CLIENTE WHERE nombre LIKE 'C%' AND activo >80;

