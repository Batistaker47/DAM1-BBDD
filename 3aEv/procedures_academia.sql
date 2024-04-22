CREATE DATABASE bd_actividad_procedures;
USE bd_actividad_procedures;

DROP TABLE if exists alumnos;
CREATE TABLE alumnos(
	al_id INT PRIMARY KEY AUTO_INCREMENT,
	al_nom VARCHAR(20) NOT NULL,
	al_ape VARCHAR(20) NOT NULL,
	al_fnac DATE,
	al_edad INT );
INSERT INTO alumnos VALUES (NULL,'Guillermo','Homet','1992-12-20',NULL);
INSERT INTO alumnos VALUES (NULL,'Marta','Ros','1993-01-21',NULL);
INSERT INTO alumnos VALUES (NULL,'Miguel','Rodríguez','1990-10-11',NULL);

DROP TABLE if exists profesores;
CREATE TABLE profesores(
	prof_id INT PRIMARY KEY AUTO_INCREMENT,
	prof_nom VARCHAR(20) NOT NULL,
	prof_ape VARCHAR(20) NOT NULL,
	prof_fnac DATE,
	prof_edad INT, 
    prof_horas_lectivas int);
INSERT INTO profesores VALUES (NULL,'Nuria','Ribas','1985-10-06',NULL, 36);
INSERT INTO profesores VALUES (NULL,'Carlos','Gómez','1978-06-14',NULL, 34);

--
-- Crea un procedimiento que busque alumnos filtrando por apellido (filtro_apellido)
--

drop procedure if exists alumnos_por_apellido;
delimiter $$
create procedure alumnos_por_apellido(in filtro_apellido varchar(20))
begin
	select * from alumnos where al_ape LIKE concat('%',filtro_apellido,'%') order by al_ape;
end $$
delimiter ;

call alumnos_por_apellido('r');

--
-- Crea un procedimiento que busque alumnos filtrando por apellido (filtro_apellido)
--

drop procedure if exists por_apellido;
delimiter $$
create procedure por_apellido(in filtro_apellido varchar(20), in tabla varchar(20))
begin
	if tabla = 'alumnos' then
	select * from alumnos where al_ape LIKE concat('%',filtro_apellido,'%') order by al_ape;
    else 
    select * from profesores where prof_ape LIKE concat('%',filtro_apellido,'%') order by prof_ape;
end if;
end $$
delimiter ;

call por_apellido('r','alumnos');

--
-- Crea un procedimiento que busque los profesores por nombre y apellidos, pero si uno de los filtros está vacío buscara por el otro, y si los dos son nulos dará error
--

drop procedure if exists por_nombre_y_apellido;
delimiter $$
create procedure por_nombre_y_apellido(in filtro_nombre varchar(20), in filtro_apellido varchar(20))
begin
 if filtro_apellido is null then
	select * from profesores where prof_nom LIKE concat('%',filtro_nombre,'%') order by prof_nom;
 elseif filtro_nombre is null then 
	select * from profesores where prof_ape LIKE concat('%',filtro_apellido,'%') order by prof_ape;
 elseif filtro_nombre is null AND filtro_apellido is null then
	Select "error";
 else
	select * from profesores where prof_ape LIKE concat('%',filtro_apellido,'%') AND prof_nom LIKE concat('%',filtro_nombre,'%') order by prof_ape;
end if;
end $$
delimiter ;

call por_nombre_y_apellido(null,null);