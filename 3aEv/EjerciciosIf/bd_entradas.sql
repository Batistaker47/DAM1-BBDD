create database bd_entradas;
use bd_entradas;

create table entradas(
  sala tinyint unsigned,
  fecha date,
  hora time,
  capacidad smallint unsigned,
  entradasvendidas smallint unsigned,
  primary key(sala,fecha,hora)
 );

insert into entradas values
	(1,'2006-05-10','20:00',300,50),
	(1,'2006-05-10','23:00',300,250),
	(2,'2006-05-10','20:00',400,350),
	(2,'2006-05-11','20:00',400,380),
	(2,'2006-05-11','23:00',400,400),
	(3,'2006-05-12','20:00',350,350),
	(3,'2006-05-12','22:30',350,100),
	(4,'2006-05-12','20:00',250,0);

#Muestre todos los registros y un mensaje si las entradas para una función están agotadas o las disponibles
SELECT e.*, if(entradasvendidas >= capacidad, "agotadas", " ") as entradas FROM entradas as e;

#Muestre todos los datos de las funciones que tienen vendidas entradas y muestre un mensaje si se 
#vendió más o menos de la mitad de la capacidad de la sala

SELECT e.*, if(entradasvendidas >= capacidad div 2, "no se puede hacer guarradas, demasiado lleno","manitas en la ultima fila") as vendida_la_mitad FROM entradas as e WHERE entradasvendidas > 0;


