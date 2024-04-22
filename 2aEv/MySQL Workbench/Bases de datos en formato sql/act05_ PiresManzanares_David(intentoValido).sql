#Apartado 1 de la actividad
CREATE SCHEMA bd_arte;
USE bd_arte;
CREATE TABLE pintores (
pint_id INT NOT NULL AUTO_INCREMENT,
pint_nombre VARCHAR(50) NOT NULL,
PRIMARY KEY(pint_id)
);
CREATE TABLE cuadros (
cuadro_id INT NOT NULL AUTO_INCREMENT,
cuadro_titulo VARCHAR(80) NOT NULL,
cuadro_precio DECIMAL(10,2) NOT NULL,
cuadro_pint_id INT NOT NULL,
PRIMARY KEY(cuadro_id),
FOREIGN KEY(cuadro_pint_id) REFERENCES pintores(pint_id)
);
CREATE TABLE salas (
sala_id INT NOT NULL AUTO_INCREMENT,
sala_nombre VARCHAR(50) NOT NULL UNIQUE,
sala_direccion VARCHAR(100) NOT NULL,
sala_localidad VARCHAR(50) NOT NULL,
sala_cp VARCHAR(50) NOT NULL,
sala_provincia VARCHAR(50) NOT NULL,
PRIMARY KEY(sala_id)
);

ALTER TABLE cuadros ADD COLUMN cuadro_sala_id INT NOT NULL;
ALTER TABLE cuadros ADD FOREIGN KEY (cuadro_sala_id) REFERENCES salas(sala_id);

#Apartado 2 de la actividad
INSERT INTO pintores VALUES
(null, "Goya"),
(null, "Velazquez"),
(null, "Rembrandt"),
(null, "Picasso");

INSERT INTO salas VALUES
(null,"sala1","C/iriarte","madrid","28028","Madrid"),
(null,"sala2","C/Julian Camarillo","madrid","28380","Madrid"),
(null,"sala3","C/explanada","alicante","250000","alicante"),
(null,"sala4","C/mayor","illescas","28028","Madrid");

INSERT INTO cuadros VALUES
(null, "Las Meninas",100000, 1 , 3),
(null, "cuadro2", 3000000, 2, 4),
(null, "cuadro3", 100, 2, 2),
(null, "retrato", 250000, 3, 2);

INSERT INTO cuadros VALUES
(null, "cuadroErroneo",100000, 1 , 6);

#Apartado 3 de la actividad
DESCRIBE TABLE pintores;
DESCRIBE TABLE cuadros;
DESCRIBE TABLE salas;
SHOW TABLES;

#Apartado 4 de la actividad.
SELECT *
FROM pintores
ORDER BY pint_nombre;

SELECT *
FROM cuadros
ORDER BY cuadro_titulo;

SELECT *
FROM salas
ORDER BY sala_nombre;


#Apartado 5 de la actividad
SELECT pint_nombre, cuadro_titulo, cuadro_precio, sala_nombre, sala_direccion, sala_localidad, sala_cp, sala_provincia
FROM
pintores, cuadros, salas
WHERE
pint_id = cuadro_pint_id AND
sala_id = cuadro_sala_id;



