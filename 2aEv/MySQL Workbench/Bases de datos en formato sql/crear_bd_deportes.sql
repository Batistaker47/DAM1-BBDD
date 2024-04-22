#DROP SCHEMA deportes
CREATE SCHEMA deportes;
USE deportes;
CREATE TABLE deportes (
dep_id INT NOT NULL AUTO_INCREMENT,
dep_nombre VARCHAR(50) NOT NULL,
PRIMARY KEY (dep_id)
);
CREATE TABLE deportistas (
dta_id INT NOT NULL AUTO_INCREMENT,
dta_nombre VARCHAR(50) NOT NULL,
PRIMARY KEY (dta_id)
);
CREATE TABLE deportes_deportistas (
dd_dep_id INT NOT NULL,
dd_dta_id INT NOT NULL,
PRIMARY KEY (dd_dep_id,dd_dta_id),
FOREIGN KEY (dd_dep_id) REFERENCES deportes(dep_id),
FOREIGN KEY (dd_dta_id) REFERENCES deportistas(dta_id)
);