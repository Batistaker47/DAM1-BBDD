-- Youtube La Tecnologia Avanza
/* CASE */
create database bd_procedimientos_almacenados_5;
use bd_procedimientos_almacenados_5;

/*
	Se utiliza cuando hay múltiples condiciones y remplaza a la estructuras if/elseif.

	Hay dos variantes con la estructura case. Veamos la primera:

	case [variable] 
		when [valor1] then [instrucciones1];
		when [valor2] then [instrucciones2];
		when [valor3] then [instrucciones3];
		....
		else [instrucciones]
	end case;

	La estructura case simple analiza condiciones

	case 
		when [condicióm] then [instrucciones1];
		when [condicióm] then [instrucciones2];
		when [condicióm] then [instrucciones3];
		....
		else [instrucciones]
	end case;

/*
	Confeccionar un procedimiento almacenado que le enviemos un entero comprendido entre 1 y 3. 
    El segundo parámetro debe retornar el tipo de medalla que representa dicho número, sabiendo que:
		1 - oro
		2 - plata
		3 - bronce
*/

drop procedure if exists pa_tipo_medalla;

delimiter //
create procedure pa_tipo_medalla(
  in puesto int,
  out tipo varchar(20))
begin
  case puesto
    when 1 then set tipo='oro'; 
    when 2 then set tipo='plata';
    when 3 then set tipo='bronce';
    else set tipo = "ERROR";
  end case;          
end //
delimiter ;

call pa_tipo_medalla(1,@ti);

select @ti;

call pa_tipo_medalla(2,@ti);
select @ti;
