create database bd_prueba;
USE bd_prueba;

## PROCEDURE PARA EL CALCULO DEL FACTORIAL DE UN NÚMERO
delimiter $$
CREATE PROCEDURE factorial (numero int)
begin
	declare resultado int default 1;
    while numero > 1 do
    set resultado = resultado * numero;
    set numero = numero -1;
    end while;
    select resultado;
end $$
delimiter ;

CALL factorial(3);

CREATE TABLE datos(
datos_id int auto_increment PRIMARY KEY,
datos_texto varchar(50)
);

## PROCEDURE PARA INSERTAR REGISTROS
drop procedure insertar_datos;
delimiter $$
CREATE PROCEDURE insertar_datos (cantidad int)
begin
	declare contador int default 1;
    while contador <= cantidad do
		INSERT INTO datos VALUES
        (null, concat("Registro número ", contador));
        set contador = contador + 1;
    end while;
    select contador -1 as filas_insertadas;
end $$
delimiter ;

##
### TRANSACCIONES
##

START transaction;
CALL insertar_datos(10);
rollback;

START transaction;
CALL insertar_datos(10);
commit;
truncate datos;

## PROCEDURE DE TRANSACCIONES

delimiter $$

CREATE PROCEDURE transaccion (numero int)
begin
	declare contador int default 1;
    while contador <= numero do
		if (contador = 100) then
		INSERT INTO datos VALUES
        (concat("Registro número ", contador));
        else 
        INSERT INTO datos VALUES
        (null, concat("Registro número ", contador));
        end if;
        set contador = contador + 1;
    end while;
    select contador -1 as filas_insertadas;
end $$
delimiter ;

START transaction;
CALL transaccion(200);
rollback;


CREATE TABLE productos(
prod_id int auto_increment PRIMARY KEY,
prod_nombre varchar(50)
);

INSERT INTO productos VALUES
(null, "p1"),
(null, "p2"),
(null, "p3"),
(null, "p4"),
(null, "p5");

drop procedure insertar_datos_random;

delimiter $$
CREATE PROCEDURE insertar_datos_random (cantidad int)
begin
	declare contador int default 1;
    declare nombre varchar(50);
    while contador <= cantidad do
		SELECT prod_nombre INTO nombre FROM productos ORDER BY rand() limit 1;
		INSERT INTO datos VALUES
        (null, nombre, floor(rand()*20) + 1);
        set contador = contador + 1;
    end while;
    select contador -1 as filas_insertadas;
end $$
delimiter ;

CALL insertar_datos_random(10);

drop table datos;
CREATE TABLE `datos` (
  `datos_id` int NOT NULL AUTO_INCREMENT,
  `datos_texto` varchar(50) DEFAULT NULL,
  `datos_cantidad` int,
  PRIMARY KEY (`datos_id`)
  );