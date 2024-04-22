#DROP SCHEMA deportes;
CREATE SCHEMA deportes;
USE deportes;
CREATE TABLE IF NOT EXISTS deportes (
dep_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
dep_nombre VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (dep_id)
);
CREATE TABLE  IF NOT EXISTS deportistas (
dta_id INT NOT NULL AUTO_INCREMENT,
dta_nombre VARCHAR(50) NOT NULL,
dta_apellidos VARCHAR(50) NOT NULL,
PRIMARY KEY (dta_id)
);
CREATE TABLE deportes_deportistas (
dd_dep_id INT UNSIGNED  NOT NULL,
dd_dta_id INT NOT NULL,
PRIMARY KEY (dd_dep_id,dd_dta_id),
FOREIGN KEY (dd_dep_id) REFERENCES deportes(dep_id),
FOREIGN KEY (dd_dta_id) REFERENCES deportistas(dta_id)
);

#PRUEBA DE UNIQUE
#INSERT INTO deportes VALUES (null,"Futbol");
INSERT INTO deportes VALUES
(null,"Futbol"), (null,"Baloncesto"), (null,"Golf");

INSERT INTO deportistas VALUES
(null,"David","Pires"), (null,"Lucía","Sánchez"), (null,"Alex","Sugimoto");

SELECT * FROM deportes;
SELECT * FROM deportistas;
SELECT * FROM deportes_deportistas;

INSERT INTO deportes_deportistas VALUES
(1,1),(1,2),(2,1),(2,3),(3,1),(3,3);

# Para cada deporte, que deportistas lo practican
SELECT dep_nombre, dta_nombre FROM deportes, deportistas, deportes_deportistas WHERE dep_id = dd_dep_id AND dta_id = dd_dta_id;

# Para cada deportista. que deportes practican
SELECT dta_nombre, dep_nombre FROM deportes, deportistas, deportes_deportistas WHERE dep_id = dd_dep_id AND dta_id = dd_dta_id;


# BUSQUEDAS
# CUANTOS DEPORTES HACE CADA DEPORTISTA
SELECT dta_nombre, COUNT(dd_dep_id) AS DEPORTES
FROM 
	deportistas, deportes_deportistas
WHERE
	dta_id = dd_dta_id
GROUP BY 
	dta_nombre;
    
# CUANTOS DEPORTES HACE DAVID
SELECT dta_nombre, COUNT(dd_dep_id) AS DEPORTES
FROM 
	deportistas, deportes_deportistas
WHERE
	dta_id = dd_dta_id AND dta_nombre = "David"
GROUP BY 
	dta_nombre;

ALTER TABLE deportistas ADD COLUMN dta_edad INT unsigned NOT NULL;
UPDATE deportistas SET dta_edad = 26 WHERE dta_nombre = "David";
UPDATE deportistas SET dta_edad = 25 WHERE dta_nombre = "Lucía";
UPDATE deportistas SET dta_edad = 23 WHERE dta_nombre = "Alex";


ALTER TABLE deportes_deportistas ADD COLUMN dd_valoracion INT unsigned NOT NULL;

UPDATE deportes_deportistas SET 
	dd_valoracion = 100 WHERE dd_dta_id = 1 AND dd_dep_id = 1;