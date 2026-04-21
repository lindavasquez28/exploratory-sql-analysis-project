-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
-- SELECT para traer las columnas y LIMIT para mostrar solo las primeras 10.
SELECT * FROM observations LIMIT 10;

-- MISSION 2
-- DISTINCT me ayuda a solo mostrar cada id de región una vez, aunque se repita
SELECT DISTINCT region_id FROM observations;

-- MISSION 3
-- Para contar cuántas especies unicas hay uso el parámetro COUNT() para contar filas y DISTINCT para mostrar cada especie una vez
SELECT COUNT(DISTINCT species_id) FROM observations;


-- MISSION 4
-- COUNT (*) cuenta las filas, WHERE filtra las filas donde region_id equivale a 2
SELECT COUNT(*) FROM observations WHERE region_id = 2;


-- MISSION 5
-- WHERE date filtra las filas por fecha
SELECT COUNT(*) FROM observations WHERE observation_date = '1998-08-08';


-- MISSION 6
-- GROUP BY me ayuda a organizar los datos por region y ORDER BY COUNT me ayuda a organizar esos conjuntos de datos de mayor a menor (más datos, menos datos), LIMIT 1 me muestra el conjunto con mas datos, es decir, más observaciones
SELECT region_id, COUNT(*) FROM observations GROUP BY region_id ORDER BY COUNT(*) DESC LIMIT 1;


-- MISSION 7
-- Uso LIMIT 5 para que me muestre los primeros 5 conjuntos de datos con mas observaciones
SELECT species_id, COUNT (*) FROM observations GROUP BY species_id ORDER BY COUNT(*) DESC LIMIT 5;


-- MISSION 8
-- Uso HAVING para filtrar despues de haber usado el COUNT
SELECT species_id, COUNT(*) FROM observations GROUP BY species_id HAVING COUNT (*) < 5;


-- MISSION 9
-- Ejercicio similar a los anteriores pero sin poner LIMIT, para que me muestre la lista completa
SELECT observer, COUNT(*) FROM observations GROUP BY observer ORDER BY COUNT(*) DESC;


-- MISSION 10
-- JOIN para cruzar las tablas y ON para indicar que region_id esta relacionado con la tabla regiones
SELECT regions.name, observations.* FROM observations JOIN regions ON observations.region_id = regions.id;


-- MISSION 11
-- Caso igual al anteior, pero en este caso la relacion esta entre el nombre cientifico de las especies y species_id
SELECT species.scientific_name, observations.* FROM observations JOIN species ON observations.species_id = species.id;


-- MISSION 12
-- Uso JOIN para unir las tablas y ON para indicar cómo se relacionan, en este caso por region_id. GROUP BY me permite agrupar los datos por región, y ORDER BY COUNT(*) los ordena de mayor a menor según la cantidad de registros.
SELECT region_id, species_id, COUNT(*) FROM observations GROUP BY region_id, species_id ORDER BY region_id, COUNT(*) DESC;