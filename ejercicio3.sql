use actividades;

-- 3.1 

SELECT 
    *
FROM
    almacenes;


-- 3.2

SELECT 
    *
FROM
    cajas
WHERE
    valor > 150;


-- 3.3

SELECT 
    contenido, NUMREFERENCIA
FROM
    cajas;


-- 3.4

SELECT 
    avg(valor)
FROM
    cajas;


-- 3.5

SELECT 
    AVG(valor), ALMACEN
FROM
    cajas
GROUP BY ALMACEN;


-- 3.6

SELECT 
    ALMACEN
FROM
    cajas
GROUP BY ALMACEN
HAVING AVG(valor) > 150;


-- 3.7

SELECT 
    c.NUMREFERENCIA, a.LUGAR
FROM
    cajas AS c
        INNER JOIN
    almacenes AS a ON a.codigo = c.ALMACEN;



-- 3.8

SELECT 
    COUNT(c.NUMREFERENCIA) AS 'NUMERO CAJAS',
    a.CODIGO AS 'CODIGO ALMACEN'
FROM
    cajas AS c
        INNER JOIN
    almacenes AS a ON a.codigo = c.ALMACEN
GROUP BY a.CODIGO;


-- 3.9

SELECT CODIGO
FROM almacenes as a
WHERE CAPACIDAD < (
	SELECT COUNT(*)
	FROM cajas as c
	WHERE c.ALMACEN = a.CODIGO
);


-- 3.10

SELECT 
    c.NUMREFERENCIA, a.LUGAR
FROM
    cajas AS c
        INNER JOIN
    almacenes AS a ON a.codigo = c.ALMACEN
WHERE
    a.LUGAR LIKE 'Bilbao';


-- 3.11

INSERT INTO almacenes (CODIGO, LUGAR, CAPACIDAD) VALUES (6, 'Barcelona', 3);


-- 3.12

INSERT INTO cajas (NUMREFERENCIA, CONTENIDO, VALOR, ALMACEN) VALUES ('H5RT', 'Papel', 200, 2);


-- 3.13

UPDATE cajas SET VALOR = VALOR * 0.85;


-- 3.14

UPDATE cajas as c
JOIN (SELECT AVG(VALOR) as valor_medio FROM cajas) as subquery
SET c.VALOR = c.VALOR * 0.80
WHERE c.VALOR > subquery.valor_medio;


-- 3.15

DELETE FROM cajas WHERE VALOR < 100;


-- 3.16

SET @subconsulta = 
		(SELECT CODIGO
		FROM almacenes as a
		WHERE CAPACIDAD < (
			SELECT COUNT(*)
			FROM cajas as c
			WHERE c.ALMACEN = a.CODIGO
		));

DELETE FROM cajas
WHERE ALMACEN IN (@subconsulta);


