-- Youtube La Tecnologia Avanza
/* IF */
create database bd_procedimientos_almacenados_4;
use bd_procedimientos_almacenados_4;

/*
	La sintaxis de la estructura condicional if simple es:
	if [condición] then
		[instrucciones]
	end if;
    
	La sintaxis de la estructura condicional if compuesta es:
	if [condición] then
		[instrucciones]
	else
		[instrucciones]
	end if;
    
	La sintaxis de la estructura condicional if anidada es:
	if [condición] then
		[instrucciones]
	elseif [condición] then
		[instrucciones]
	elseif [condición] then
		[instrucciones]
	elseif [condición] then
		[instrucciones]
	......
	else
		[instrucciones]
	end if;
*/

/*
Crear un nuevo procedimiento almacenado que muestre el mayor de 3 enteros:
*/
drop procedure if exists pa_mayor3;

delimiter //
create procedure pa_mayor3(
  in valor1 int,
  in valor2 int,
  in valor3 int)
begin
  if valor1>valor2 and valor1>valor3 then
    select valor1;
  elseif valor2>valor3 then
    select valor2;
  else
    select valor3;
  end if;
end //
delimiter ;

call pa_mayor3(200, 40, 4000);

/*
	Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra los nombres de las provincias.
*/

 drop table if exists clientes;
 drop table if exists provincias;

 create table clientes (
  codigo int unsigned auto_increment,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(50),
  codigoprovincia tinyint unsigned,
  telefono varchar(11),
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into provincias (nombre) values('Madrid');
 insert into provincias (nombre) values('Soria');
 insert into provincias (nombre) values('Guadalajara');
 insert into provincias (nombre) values('Santander');

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Marcos', 'Colon 111', 'Alcobenda',1,'null');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Perez Ana', 'San Martin 222', 'Fuenlabrada',1,'4578585');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Garcia Juan', 'Rivadavia 333', 'Tres Cantos',1,'4578445');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Gómez Ana', 'Calle MAyor 22', 'Santillana del Mar',4,null);
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Pereyra Lucas', 'San Martin 555', 'Medinaceli',2,'4253685');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Gomez Ines', 'San Martin 666', 'Siguenza',3,'0345252525');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Torres Fabiola', 'Alem 777', 'La vega de Pas',4,'4554455');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Carlos', 'Irigoyen 888', 'Alcorcón',1,null);
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Ramos Betina', 'San Martin 999', 'San Pedro del Pinatar',4,'4223366');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Lucas', 'San Martin 1010', 'Laredo',4,'0457858745');

/*
	Crear un procedimiento almacenado que le enviemos como parámetro los nombres de dos provincias y 
	genere como resultado el nombre de la provincia que tiene más clientes y su cantidad, en caso de 
	tener la misma cantidad mostrar las dos provincias y la cantidad:
*/
drop procedure if exists pa_mas_clientes_provincias;

delimiter //
 create procedure pa_mas_clientes_provincias(
   in provincia1 varchar(20),
   in provincia2 varchar(20))
 begin
   declare canti1 int;
   declare canti2 int;
   select count(*) into canti1 from clientes as cli
     join provincias as pro 
     on pro.codigo=cli.codigoprovincia
     where pro.nombre=provincia1;
   select count(*) into canti2 from clientes as cli
     join provincias as pro 
     on pro.codigo=cli.codigoprovincia
     where pro.nombre=provincia2;     
   if canti1>canti2 then
     select provincia1,canti1;
   elseif canti2>canti1 then
     select provincia2,canti2;
   else
     select provincia1,provincia2,canti1;
   end if;  
 end //
 delimiter ;

call pa_mas_clientes_provincias('Madrid','Santander');