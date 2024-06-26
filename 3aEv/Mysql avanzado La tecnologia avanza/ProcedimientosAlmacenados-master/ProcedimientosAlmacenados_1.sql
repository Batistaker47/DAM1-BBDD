-- Youtube La Tecnologia Avanza
create database bd_procedimientos_almacenados_1;
use bd_procedimientos_almacenados_1;
/*
Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".
*/
drop table if exists empleados;
 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos int,
  seccion varchar(20),
  primary key(documento)
 );

 insert into empleados values('22222222','Juan','Perez',300,2,'Personal');
 insert into empleados values('22333333','Luis','Lopez',300,0,'Personal');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

/*
	Cree un procedimiento almacenado llamado "pa_empleados_sueldo" que seleccione los nombres, 
	apellidos y sueldos de los empleados.
*/
 drop procedure if exists pa_empleados_sueldo;
 delimiter //
 create procedure pa_empleados_sueldo()
 begin
   select nombre,apellido,sueldo
     from empleados;
 end //
 delimiter ;

 call pa_empleados_sueldo();

/*
	Cree un procedimiento almacenado llamado "pa_empleados_hijos" que seleccione los nombres, 
	apellidos y cantidad de hijos de los empleados con hijos.
*/
 drop procedure if exists pa_empleados_hijos;
 delimiter //
 create procedure pa_empleados_hijos()
 begin
   select nombre,apellido,cantidadhijos
     from empleados
   where cantidadhijos>0;
 end //
 delimiter ;

call pa_empleados_hijos();