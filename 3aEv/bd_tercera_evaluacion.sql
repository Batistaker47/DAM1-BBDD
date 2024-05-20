DROP DATABASE bd_tercera_evaluacion;
CREATE DATABASE bd_tercera_evaluacion;
USE bd_tercera_evaluacion;
CREATE TABLE coches (
coche_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
coche_marca VARCHAR(50),
coche_modelo VARCHAR(50),
coche_precio_dia FLOAT(10,2),
coche_stock INT
);
CREATE TABLE alquiler (
alq_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
alq_precio FLOAT(10,2),
alq_dias INT,
alq_coche_id INT NOT NULL,
FOREIGN KEY (alq_coche_id) REFERENCES coches(coche_id)
);

INSERT INTO coches VALUES
(null, "ferrari","testarrossa",20.5,1),
(null, "ferrari","rojo",28.5,1),
(null, "lamborghini","huracan",17.0,1),
(null, "audi","a3",11.5,6),
(null, "seat", "panda",7.5,11);

## Crear un procedimiento que seleccione todos los coches cuyo marca o modelo cumplan con un filtro dado. El filtro será un parámetro de entrada y debe buscar coincidencias parciales.
DROP procedure if exists coches_filtro;
 delimiter $$
 create procedure coches_filtro(IN _filtro VARCHAR(50))
 begin
   select *
     from 
		coches
   where 
		(coche_marca LIKE concat('%',_filtro,'%')) OR 
		(coche_modelo LIKE concat('%',_filtro,'%'))
	ORDER BY
		coche_precio_dia;
 end $$
 delimiter ;
CALL coches_filtro("civ");


## Crear un procedimiento que seleccione todos los coches cuyo precio por día esté entre dos cantidades dadas. Las cantidades serán parámetros de entrada.
DROP procedure if exists coches_por_precio;
 delimiter $$
 create procedure coches_por_precio(IN _desde FLOAT(10,2), IN _hasta FLOAT(10,2))
 begin
   select *
     from 
		coches
   where 
		coche_precio_dia >= _desde AND coche_precio_dia <= _hasta
        #coche_precio_dia BETWEEN _desde AND _hasta
	ORDER BY
		coche_precio_dia;
 end $$
 delimiter ;
CALL coches_por_precio(7.5,11.5);


## Crear un procedimiento que inserte un nuevo coche en la base de datos. Los datos del coche serán parámetros de entrada. 
## El stock debe inicializarse en 0 y debe devolver el ID del coche insertado.
DROP procedure if exists coches_insertar;
 delimiter $$
 create procedure coches_insertar(IN _marca VARCHAR(50), IN _modelo VARCHAR(50), IN _precio_dia FLOAT(10,2))
 begin
 INSERT INTO coches VALUES 
 (null, _marca, _modelo, _precio_dia, 0);
 SELECT last_insert_id() as id_insertado;
 end $$
 delimiter ;
CALL coches_insertar("honda","civic",4.7);


## Pregunta: Crear un procedimiento que modifique los datos de un coche dado su ID. 
## Los nuevos datos del coche serán parámetros de entrada. No se debe modificar el stock y debe devolver el número de registros modificados
DROP procedure if exists coches_modificar;
 delimiter $$
 create procedure coches_modificar(IN _marca VARCHAR(50), IN _modelo VARCHAR(50), IN _precio_dia FLOAT(10,2), IN _id INT)
 begin
 UPDATE coches SET 
	coche_marca = _marca,
    coche_modelo = _modelo,
    coche_precio_dia = _precio_dia
WHERE
	coche_id = _id;
 select row_count() as filas_modificadas;
 end $$
 delimiter ;
CALL coches_modificar("Honda","Civic",3.5,6);

## Crear un procedimiento que borre un coche dado su ID y devuelva el número de registros borrados.
DROP procedure if exists coches_borrar;
 delimiter $$
 create procedure coches_borrar(IN _id INT)
 begin
DELETE FROM coches
WHERE
	coche_id = _id;
 select row_count() as filas_eliminadas;
 end $$
 delimiter ;
CALL coches_borrar(6);


## Crear un trigger que al insertar un alquiler actualice el stock de coches.
DROP trigger if exists alquiler_ai;
 delimiter $$
 create trigger alquiler_ai AFTER INSERT ON alquiler
 FOR EACH ROW
 begin
UPDATE coches SET
 coche_stock = coche_stock - 1
 WHERE
 coche_id = NEW.alq_coche_id;
 end $$
 delimiter ;
 
 INSERT INTO alquiler VALUES
 (null, 100, 4,1);
 
 ## Crea un trigger que, al modificar un alquiler, actualice el stock de coches.
 DROP trigger if exists alquiler_bu;
 delimiter $$
 create trigger alquiler_bu BEFORE UPDATE ON alquiler
 FOR EACH ROW
 begin
UPDATE coches SET

 coche_stock = OLD.coche_stock + 1
 WHERE
 coche_id = NEW.alq_coche_id;
 end $$
 delimiter ;


