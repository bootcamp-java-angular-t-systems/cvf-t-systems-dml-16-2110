use actividades;

-- 4.1 

SELECT nombre FROM peliculas;


-- 4.2 

SELECT DISTINCT CALIFICACIONEDAD FROM peliculas;


-- 4.3

SELECT * FROM peliculas WHERE CALIFICACIONEDAD IS NULL;


-- 4.4

SELECT * FROM salas WHERE PELICULA IS NULL;


-- 4.5

SELECT 
    s.CODIGO, s.NOMBRE, p.*
FROM
    salas as s
LEFT JOIN
	peliculas as p
ON s.PELICULA = p.CODIGO;


-- 4.6

SELECT 
    p.*, s.nombre as "NOMBRE SALA", s.CODIGO AS "CODIGO SALA" 
FROM
    peliculas AS p
        LEFT JOIN
    salas AS s ON p.CODIGO = s.PELICULA;


-- 4.7

SELECT 
    p.*, s.nombre as "NOMBRE SALA", s.CODIGO AS "CODIGO SALA" 
FROM
    peliculas AS p
        LEFT JOIN
    salas AS s ON p.CODIGO = s.PELICULA
WHERE s.CODIGO IS NULL;


-- 4.8

INSERT INTO peliculas (CODIGO, NOMBRE, CALIFICACIONEDAD) VALUES (11, 'Uno, Dos, Tres', 'PG');


-- 4.9

UPDATE peliculas
SET 
    CALIFICACIONEDAD = 'PG-13'
WHERE 
	CALIFICACIONEDAD IS NULL;


-- 4.10

SET @subconsulta = 
(	SELECT DISTINCT s.codigo
    FROM salas AS s
    JOIN peliculas AS p 
    ON p.codigo = s.PELICULA
    WHERE p.CALIFICACIONEDAD = 'G' );

DELETE FROM salas
WHERE codigo IN (@subconsulta);
