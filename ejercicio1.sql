use actividades;

-- 1.1 

SELECT 
    nombre
FROM
    articulos;


-- 1.2

SELECT 
    nombre, precio
FROM
    articulos;


-- 1.3

SELECT 
    nombre, precio
FROM
    articulos
WHERE
    precio <= 200;


-- 1.4

SELECT 
    nombre, precio
FROM
    articulos
WHERE
    precio <= 200 AND precio >= 60;


-- 1.4

SELECT 
    nombre, precio
FROM
    articulos
WHERE
    precio BETWEEN 60 AND 200;


-- 1.5

SELECT 
    nombre, (precio * 166.386)
FROM
    articulos;


-- 1.6

SELECT 
    avg(precio)
FROM
    articulos;


-- 1.7

SELECT 
    avg(precio) 
FROM
    articulos
WHERE
	fabricante = 2;


-- 1.8

SELECT 
    count(*) 
FROM
    articulos
WHERE
	precio = 180;


-- 1.9

SELECT 
    nombre, precio
FROM
    articulos
WHERE
    precio >= 180
ORDER BY precio DESC;


-- 1.10

SELECT 
    a.*, f.nombre
FROM
    articulos AS a
        INNER JOIN
    fabricantes AS f ON a.fabricante = f.codigo;


-- 1.11

SELECT 
    a.nombre, a.precio, f.nombre as "Nombre fabricante"
FROM
    articulos AS a
        INNER JOIN
    fabricantes AS f ON a.fabricante = f.codigo;


-- 1.12

SELECT 
    AVG(a.precio) AS 'PRECIO MEDIO', a.FABRICANTE
FROM
    articulos AS a
GROUP BY codigo;


-- 1.13

SELECT 
    AVG(a.precio) AS 'PRECIO MEDIO', f.NOMBRE
FROM
    articulos AS a
        INNER JOIN
    fabricantes AS f ON a.fabricante = f.codigo
GROUP BY a.codigo;


-- 1.14

SELECT 
    AVG(a.precio) AS 'PRECIO MEDIO', f.NOMBRE
FROM
    articulos AS a
        INNER JOIN
    fabricantes AS f ON a.fabricante = f.codigo
GROUP BY f.NOMBRE
HAVING avg(a.precio) >= 150;


-- 1.15

SELECT 
    a.precio, a.NOMBRE
FROM
    articulos AS a
ORDER BY a.PRECIO ASC
LIMIT 1;


-- 1.16

SELECT 
    a.precio, a.nombre, f.nombre
FROM
    articulos AS a
        INNER JOIN
    fabricantes AS f ON a.fabricante = f.codigo
WHERE
    a.precio = (SELECT 
            MAX(precio)
        FROM
            articulos
        WHERE
            fabricante = f.codigo);


-- 1.17

SELECT 
    a.precio, a.nombre, f.nombre
FROM
    articulos AS a
        INNER JOIN
    fabricantes AS f ON a.fabricante = f.codigo
WHERE
    a.precio = (SELECT 
            MAX(precio)
        FROM
            articulos
        WHERE
            fabricante = f.codigo);


-- 1.18

SELECT * FROM articulos;
UPDATE articulos 
SET 
    nombre = 'Impresora Laser'
WHERE
    codigo = 8;


-- 1.19

SELECT * FROM articulos;
UPDATE articulos
SET precio = (precio*0.9);



-- 1.20

SELECT * FROM articulos;
UPDATE articulos
SET precio = (precio - 10)
WHERE precio >= 120;
