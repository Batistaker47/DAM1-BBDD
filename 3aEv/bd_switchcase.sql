create database bd_prueba;
use bd_prueba;

create table alumnos(
  id int not null auto_increment primary key,
  nombre varchar(30),
  promedio decimal(4,2)
);

insert into alumnos values 
(null,'Perez Luis',8.5),
(null,'Garcia Ana',7.0),
(null,'Ludueña Juan',9.6),
(null,'Moreno Gabriela',4.8),
(null,'Morales Hugo',3.2),
(null,'Gomez Susana',6.4),
(null,'Negativo',-2),
(null,'Mas de 10',11);

 create table visitas (
  numero int unsigned auto_increment,
  nombre varchar(30) not null,
  mail varchar(50),
  fecha date,
  primary key(numero)
);

 insert into visitas (nombre,mail,fecha) values
  ('Ana Maria Lopez','AnaMaria@hotmail.com','2006-02-10'),
  ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','2006-05-10'),
  ('Juan José','JuanJosePerez@hotmail.com','2006-06-11'),
  ('Fabiola Martinez','MartinezFabiola@hotmail.com','2006-10-12'),
  ('Luisa Martinez','Martinezluisa@hotmail.com','2006-09-12'),
  ('Pepe','PepePerez@hotmail.com','2006-09-12'),
  ('Eva Ruiz','evaruiz@hotmail.com','2006-09-15'),
  ('Paco','paco@hotmail.com','2006-09-15');

SELECT promedio,
	case
		WHEN promedio >=0 AND promedio <5 then "Suspenso"
        WHEN promedio >=5 AND promedio <7 then "Aprobado"
        WHEN promedio >=7 AND promedio <9 then "Notable"
        WHEN promedio >9 AND promedio <=10 then "Sobresaliente"
		else "error"
	end as Nota
FROM alumnos;

SELECT nombre,fecha, dayname(fecha),
	case dayname(fecha)
		WHEN "Monday" THEN "Lunes"
        WHEN "Tuesday" THEN "Martes"
        WHEN "Wednesday" THEN "Miércoles"
        WHEN "Thursday" THEN "Jueves"
        WHEN "Friday" THEN "Viernes"
        WHEN "Saturday" THEN "Sábado"
        WHEN "Sunday" THEN "Domingo"
		else "error"
	end as Fecha_español
FROM visitas;

SELECT nombre,fecha, monthname(fecha),
	case monthname(fecha)
		WHEN "January" THEN "Enero"
        WHEN "February" THEN "Febrero"
        WHEN "March" THEN "Marzo"
        WHEN "April" THEN "Abril"
        WHEN "May" THEN "Mayo"
        WHEN "June" THEN "Junio"
        WHEN "July" THEN "Julio"
		WHEN "August" THEN "Agosto"
        WHEN "September" THEN "Septiembre"
        WHEN "October" THEN "Octubre"
        WHEN "November" THEN "Noviembre"
        WHEN "December" THEN "Diciembre"
		else "error"
	end as Fecha_español
FROM visitas;

SELECT nombre, fecha, month(fecha),
	case
		WHEN month(fecha) = 1 OR month(fecha) = 2 OR month(fecha) = 3 OR month(fecha) = 4 THEN "1er Cuatrimestre" 
        WHEN month(fecha) = 5 OR month(fecha) = 6 OR month(fecha) = 7 OR month(fecha) = 8 THEN "2º Cuatrimestre" 
        WHEN month(fecha) = 9 OR month(fecha) = 10 OR month(fecha) = 11 OR month(fecha) = 12 THEN "3er Cuatrimestre" 
		else "error"
	end as Fecha_español
FROM visitas;



