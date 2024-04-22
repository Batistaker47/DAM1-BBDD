CREATE SCHEMA bd_personas;
USE bd_personas;
CREATE TABLE personas (
per_id INT NOT NULL AUTO_INCREMENT,
per_nombre VARCHAR(50),
PRIMARY KEY (per_id)
);
CREATE TABLE hobby (
hb_id INT NOT NULL AUTO_INCREMENT,
hb_nombre VARCHAR(50),
PRIMARY KEY (hb_id)
);
CREATE TABLE personas_hobby (
ph_per_id INT NOT NULL,
ph_hb_id INT NOT NULL,
PRIMARY KEY (ph_per_id,ph_hb_id),
FOREIGN KEY (ph_per_id) REFERENCES personas(per_id),
FOREIGN KEY (ph_hb_id) REFERENCES hobby(hb_id)
);
INSERT INTO personas (per_nombre) VALUES ("Pepe"),("Juan"),("David"),("Alex");
INSERT INTO hobby (hb_nombre) VALUES ("Futbol"),("Lectura"),("Pintura"),("Running");
INSERT INTO personas_hobby VALUES 
(1,3), (2,2), (4,1), (2,3), (4,2), (4,4), (3,1);

SELECT * FROM personas;
SELECT * FROM hobby;
SELECT * FROM personas_hobby;

SELECT p.per_nombre, h.hb_nombre
FROM
personas as p, hobby as h, personas_hobby as pb
WHERE
p.per_id = pb.ph_per_id AND h.hb_id = pb.ph_hb_id
ORDER BY p.per_nombre;

SELECT per_nombre FROM personas 
WHERE
	per_nombre REGEXP 'a.$';
    
SELECT per_nombre AS Nombre, COUNT(hb_nombre) AS HOBBYS FROM personas, hobby, personas_hobby
WHERE
	per_nombre REGEXP '^A' AND per_id = ph_per_id AND hb_id = ph_hb_id;
    

    
