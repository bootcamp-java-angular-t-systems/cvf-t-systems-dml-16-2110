use actividades;

-- 2.1 

SELECT 
    apellidos
FROM
    empleados;


-- 2.2

SELECT DISTINCT
    apellidos
FROM
    empleados;


-- 2.3

SELECT 
    *
FROM
    empleados
WHERE
    APELLIDOS LIKE 'Smith';


-- 2.4

SELECT 
    *
FROM
    empleados
WHERE
    APELLIDOS LIKE 'Smith' 
    OR APELLIDOS LIKE 'Rogers';


-- 2.5

SELECT 
    *
FROM
    empleados
WHERE
	DEPARTAMENTO = 14;


-- 2.6

SELECT 
    *
FROM
    empleados
WHERE
    DEPARTAMENTO = 14 OR DEPARTAMENTO = 77;


-- 2.7

SELECT 
    *
FROM
    empleados
WHERE
    APELLIDOS LIKE 'P%';


-- 2.8

SELECT 
    SUM(PRESUPUESTO) as "Suma presupuestos"
FROM
    departamentos;


-- 2.9

SELECT 
    COUNT(e.nombre) AS 'Suma empleados', d.nombre
FROM
    empleados AS e
        INNER JOIN
    departamentos AS d ON e.DEPARTAMENTO = d.CODIGO
GROUP BY DEPARTAMENTO;


-- 2.10

SELECT 
    e.*, d.nombre as "NOMBRE DEPARTAMENTO"
FROM
    empleados AS e
        INNER JOIN
    departamentos AS d ON e.DEPARTAMENTO = d.CODIGO;


-- 2.11

SELECT 
    e.DNI, e.NOMBRE, e.APELLIDOS, d.nombre as "NOMBRE DEPARTAMENTO", d.PRESUPUESTO as "PRESUPUESTO DEPARTAMENTO"
FROM
    empleados AS e
        INNER JOIN
    departamentos AS d ON e.DEPARTAMENTO = d.CODIGO;


-- 2.12

SELECT 
    e.DNI, e.NOMBRE, e.APELLIDOS, d.nombre as "NOMBRE DEPARTAMENTO", d.PRESUPUESTO as "PRESUPUESTO DEPARTAMENTO"
FROM
    empleados AS e
        INNER JOIN
    departamentos AS d ON e.DEPARTAMENTO = d.CODIGO
    WHERE d.PRESUPUESTO > 60000;


-- 2.13

SELECT *
FROM departamentos
WHERE PRESUPUESTO > (
    SELECT AVG(PRESUPUESTO)
    FROM departamentos
);


-- 2.14

SELECT 
    d.nombre
FROM
    empleados AS e
        INNER JOIN
    departamentos AS d ON e.DEPARTAMENTO = d.CODIGO
GROUP BY DEPARTAMENTO
HAVING COUNT(e.nombre) > 2;


-- 2.15

INSERT INTO departamentos (CODIGO, NOMBRE, PRESUPUESTO)
VALUES (11, 'Calidad', 40000);
INSERT INTO empleados (DNI, NOMBRE, APELLIDOS, DEPARTAMENTO)
VALUES (89267109, 'Esther', 'Vázquez', 11);


-- 2.16

UPDATE departamentos 
SET 
    presupuesto = (presupuesto * 0.9);


-- 2.17

UPDATE empleados
SET 
    departamento = 14
WHERE 
	departamento = 77;


-- 2.18

DELETE FROM empleados
WHERE departamento = 14;


-- 2.19

DELETE FROM empleados 
WHERE
    DEPARTAMENTO IN (SELECT 
        CODIGO
    FROM
        departamentos
    
    WHERE
        PRESUPUESTO > 60000);


-- 2.20

DELETE FROM empleados;

