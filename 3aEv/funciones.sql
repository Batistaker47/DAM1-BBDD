-- Crear proedure que declare 2 variables y las sume
use world;
drop procedure if exists suma;
delimiter $$
create procedure suma()
begin
	declare num1 int default 33;
    declare num2 int default 14;
    declare suma int;
    set suma = num1 + num2;
    select concat(num1, ' + ',num2, ' = ', suma) as OPERACION;
end $$
delimiter ;

call suma();

drop function if exists dia_español;
delimiter $$
create function dia_español(dia_ingles varchar(50))
returns varchar(50)
deterministic
begin
	declare dia varchar(50);
	case (dia_ingles)
		WHEN  'monday' then SET dia="lunes";
        WHEN  'tuesday' then SET dia="martes";
        WHEN  'wednesay' then SET dia= "miercoles";
        WHEN  'thursday' then SET dia="jueves";
        WHEN  'friday' then SET dia= "viernes";
        WHEN  'saturday' then SET dia= "sabado";
        WHEN  'sunday' then SET dia="domingo";
		else SET dia="error";
	end case;
    return dia;
end $$
delimiter ;

SELECT dia_español('monday') as fecha;

--
-- Hacer una función al que le enviemos un entero comprendido entre 1 y 3. El segundo parámetro debe retornar el tipo de medalla que corresponde a cada número. Oro plata y bronce 
--

drop function if exists medallas;
delimiter $$
create function medallas(numero int)
returns varchar(50)
deterministic
begin
	declare tipo_medalla varchar(50);
    case (numero)
		WHEN 1 then SET tipo_medalla = "Real Madrid";
        WHEN 2 then SET tipo_medalla = "Atleti";
        WHEN 3 then SET tipo_medalla = "Barsa";
	else SET tipo_medalla = "Alavés";
    end case;
    return tipo_medalla;
end $$
delimiter ;

-- MISMO EJERCICIO PERO CON UNA PROCEDURE

drop procedure if exists medallas2;
delimiter $$
create procedure medallas2( in numero int)
begin
	declare tipo_medalla varchar(50);
    if numero = 1 then SET tipo_medalla = "oro";
    elseif numero = 2 then SET tipo_medalla = "plata";
	elseif numero = 3 then SET tipo_medalla = "bronce";
    else SET tipo_medalla = "error";
	end if;
    select tipo_medalla;
end $$
delimiter ;

call medallas2(2);
    

-- whiles

drop procedure if exists bucle_while;

delimiter $$
create procedure bucle_while(num int)
begin
	declare cont int default 1;
    declare respuesta varchar(100) default 'Numeros';
    while cont <= num do
		set respuesta = concat(respuesta, ',', cont);
		set cont = cont + 1;
	end while;
    select respuesta;
end $$
delimiter ;
call bucle_while(20);
