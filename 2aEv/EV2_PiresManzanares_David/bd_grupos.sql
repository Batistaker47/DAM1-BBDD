#---------------------APARTADO A--------------------------
CREATE SCHEMA bd_grupos;
USE bd_grupos;
CREATE TABLE IF NOT EXISTS grupos (
gr_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
gr_nombre VARCHAR(50),
gr_fechaCreacion DATE,
gr_fechaDisolucion DATE,
PRIMARY KEY(gr_id),
UNIQUE KEY(gr_nombre) 
);

CREATE TABLE IF NOT EXISTS géneros (
gen_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
gen_nombre VARCHAR(50),
PRIMARY KEY(gen_id),
UNIQUE KEY(gen_nombre)
);

CREATE TABLE IF NOT EXISTS músicos (
mus_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
mus_nombre VARCHAR(50),
mus_lugarNacimiento VARCHAR(50),
mus_fechaNacimiento DATE,
PRIMARY KEY(mus_id)
);

CREATE TABLE IF NOT EXISTS grupos_géneros (
gg_gr_id INT UNSIGNED NOT NULL,
gg_gen_id INT UNSIGNED NOT NULL,
PRIMARY KEY(gg_gr_id,gg_gen_id),
FOREIGN KEY(gg_gr_id) REFERENCES grupos(gr_id),
FOREIGN KEY(gg_gen_id) REFERENCES géneros(gen_id)
);

CREATE TABLE instrumentos (
inst_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
inst_nombre VARCHAR(50),
PRIMARY KEY(inst_id)
);

CREATE TABLE IF NOT EXISTS músicos_grupos (
mg_mus_id INT UNSIGNED NOT NULL,
mg_gr_id INT UNSIGNED NOT NULL,
mg_inst_id INT UNSIGNED NOT NULL,
PRIMARY KEY(mg_mus_id,mg_gr_id, mg_inst_id),
FOREIGN KEY(mg_mus_id) REFERENCES músicos(mus_id),
FOREIGN KEY(mg_gr_id) REFERENCES grupos(gr_id),
FOREIGN KEY(mg_inst_id) REFERENCES instrumentos(inst_id)
);

#---------------------APARTADO B--------------------------
INSERT INTO grupos VALUES
(null,"Izal", "2014-02-11","2022-06-01"),
(null,"Skape", "2001-08-19", null),
(null,"Marea", "2002-01-26", null);

INSERT INTO géneros VALUES 
(null, "Rock"),
(null, "Indie"),
(null, "Pop");

INSERT INTO músicos VALUES
(null, "Mikel Izal","San Sebastián","1985-11-14"),
(null, "Musico2","Madrid","1967-02-04"),
(null, "Musico3","Valencia","1990-05-01");

INSERT INTO grupos_géneros VALUES 
(1,2),
(2,1),
(3,3);

INSERT INTO instrumentos VALUES
(null,"Guitarra"),
(null,"Batería"),
(null,"Bajo");

INSERT INTO músicos_grupos VALUES 
(1,1,1),
(2,2,3),
(3,3,2);


#---------------------APARTADO C--------------------------
# C1)
# procedure para sacar toda la información de los grupos
DELIMITER $$
CREATE PROCEDURE grupos_todo()
SELECT * FROM grupos ORDER BY gr_nombre
$$
DELIMITER ;

# procedure para sacar toda la información de los grupos por id
DELIMITER $$
CREATE PROCEDURE grupos_todo_id(IN id INT)
SELECT * FROM grupos WHERE gr_id = id
$$
DELIMITER ;

# procedure para sacar insertar grupos
DELIMITER $$
CREATE PROCEDURE grupos_insertar (IN nombre VARCHAR(50), fecha_inicio DATE, fecha_disolucion DATE)
INSERT INTO grupos VALUES 
(null, nombre, fecha_inicio, fecha_disolucion)
$$
DELIMITER ;

# procedure para sacar cambiar la informacion de los grupos
DELIMITER $$
CREATE PROCEDURE grupos_modificar (IN nombre VARCHAR(50), creacion DATE, disolucion DATE)
UPDATE grupos SET 
gr_nombre = nombre,
gr_fechaCreacion = creacion,
gr_fechaDisolucion = disolucion
WHERE gr_id = id
$$
DELIMITER ;

# procedure para eliminar grupos
DELIMITER $$
CREATE PROCEDURE grupos_eliminar(IN id INT)
DELETE FROM grupos WHERE gr_id = id
$$
DELIMITER ;

#Consulta para obtener datos de todas las tablas
SELECT *
FROM
	grupos, grupos_géneros, géneros,instrumentos,músicos,músicos_grupos
WHERE
	gr_id = gg_gr_id AND
	gg_gen_id = gen_id AND
    mg_mus_id = mus_id AND
    mg_gr_id = gr_id AND
    mg_inst_id = inst_id
ORDER BY
	gr_nombre;
    
