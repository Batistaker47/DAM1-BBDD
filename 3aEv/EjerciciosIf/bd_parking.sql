create database bd_parking;
use bd_parking;

drop table if exists vehiculos;

create table vehiculos(
  matricula varchar(10) not null,
  tipo varchar(10),
  horallegada time not null,
  horasalida time,
  primary key(matricula,horallegada)
 );

 insert into vehiculos values
	('M-1215-BC','automóvil','8:30','9:40'),
	('1234 BCD','automóvil','8:45','15:10'),
   	('B-8675-ZX','automóvil','9:30','18:40'),
	('M-3467-VM','automóvil','15:30',null),
	('BI-3434-ZZ','moto','19:45',null),
	('7890 BCD','auto','20:30','21:00');

#Muestre la matricula, la hora de llegada y de salida de todos los vehículos, mas una columna que 
#calcule la cantidad de horas que estuvo cada vehículo en el parking, sin considerar los que aún no se 
#retiraron del parking:

select matricula, horallegada, horasalida, left(timediff(horasalida, horallegada),2) as horas_de_estancia
from vehiculos 
where horasalida is not null;

#Se cobra 1€ por hora, pero si un vehículo permanece en el parking 4 horas, se le cobran 3€, es decir, no se 
#le cobra la cuarta hora; si está 8 horas, se cobran 6€, y así sucesivamente. 
#Muestre la matricula, la hora de llegada y de salida de todos los vehículos, más una columna que calcule 
#la cantidad de horas que estuvo cada vehículo en el parking (sin considerar los que aún no salieron) 
#y otra columna utilizando "if" que muestre la cantidad de horas gratis:

SELECT matricula, horallegada, horasalida, left(timediff(horasalida, horallegada),2) as horas_de_estancia, if(hour(timediff(horasalida, horallegada)) div 4 > 0 , hour(timediff(horasalida, horallegada)) div 4,0) as horas_gratis
from vehiculos 
where horasalida is not null;