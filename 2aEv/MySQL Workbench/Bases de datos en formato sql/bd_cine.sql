CREATE SCHEMA bd_cine;
USE bd_cine;
DROP SCHEMA bd_cine;
CREATE TABLE Actores (
act_id INT UNSIGNED NOT NULL auto_increment,
act_nombre VARCHAR(50),
PRIMARY KEY(act_id));

CREATE TABLE Directores (
dir_id INT UNSIGNED NOT NULL auto_increment,
dir_nombre VARCHAR(50),
dir_nacimiento DATE,
PRIMARY KEY(dir_id));

CREATE TABLE Películas (
pel_id INT UNSIGNED NOT NULL auto_increment,
pel_nombre VARCHAR(50),
pel_estreno DATE,
pel_idioma VARCHAR(50),
pel_color BOOLEAN,
pel_pegi INT UNSIGNED,
pel_sinopsis TEXT,
pel_dir_id INT UNSIGNED NOT NULL,
PRIMARY KEY(pel_id),
FOREIGN KEY(pel_dir_id) REFERENCES Directores(dir_id));

CREATE TABLE Actores_Peliculas (
ap_act_id INT UNSIGNED NOT NULL,
ap_pel_id INT UNSIGNED NOT NULL,
ap_personaje VARCHAR(50),
PRIMARY KEY(ap_act_id,ap_pel_id),
FOREIGN KEY(ap_act_id) REFERENCES Actores(act_id),
FOREIGN KEY(ap_pel_id) REFERENCES Películas(pel_id)
);

CREATE TABLE Nacionalidades (
nac_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
nac_pais VARCHAR(50),
nac_pel_id INT UNSIGNED NOT NULL,
nac_act_id INT UNSIGNED NOT NULL,
nac_dir_id INT UNSIGNED NOT NULL,
PRIMARY KEY(nac_id),
FOREIGN KEY(nac_pel_id) REFERENCES Películas(pel_id),
FOREIGN KEY(nac_act_id) REFERENCES Actores(act_id),
FOREIGN KEY(nac_dir_id) REFERENCES Directores(dir_id));

DELIMITER $$
CREATE PROCEDURE Actores_f (IN _filtro VARCHAR(50))
SELECT * FROM actores WHERE act_nombre LIKE _filtro
$$
DELIMITER ;
