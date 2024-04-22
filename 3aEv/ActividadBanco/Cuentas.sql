--
-- PROCEDURES DE LA TABLA CUENTAS
--

-- 1) FILTRADO
drop procedure if exists cta_todas_filtrado;
delimiter $$
  create procedure cta_todas_filtrado(in _filtro varchar(50))
	begin
		SELECT * FROM cuentas WHERE 
		(c_num_cta LIKE concat('%',_filtro,'%')) OR 
        (c_nif LIKE concat('%',_filtro,'%')) OR 
        (c_titular LIKE concat('%',_filtro,'%')) OR 
        (c_fecha_creacion LIKE concat('%',_filtro,'%'))
        order by c_titular;
	end $$
    delimiter ;

-- 2) FILTRADO POR ID
    
drop procedure if exists cta_por_id;
delimiter $$
  create procedure cta_por_id(in _id int)
	begin
		SELECT * FROM cuentas WHERE c_num_cta = _id
        order by c_titular;
	end $$
delimiter ;
    
-- 3) INSERTAR
drop procedure if exists cta_insertar;
delimiter $$
	create procedure cta_insertar(in _nif varchar(9), in _titular varchar(50))
    begin
    INSERT INTO cuentas VALUES
	(null, _nif, _titular, current_date(), 0);
    SELECT last_insert_id() AS id_insertado;
    end $$
    delimiter ;
    
-- 4) UPDATE
    
drop procedure if exists cta_modificar;
delimiter $$
create procedure cta_modificar(in _nif varchar(9), in _titular varchar(50), in _fecha date, in _id int)
    begin
		UPDATE cuentas SET
        c_nif = _nif,
        c_titular = _titular,
        c_fecha_creacion = _fecha
        WHERE 
        c_num_cta = _id;
    end $$
    delimiter ;


-- 5) DELETE
drop procedure if exists cta_borrar;
delimiter $$
CREATE PROCEDURE cta_borrar(in _id int)
begin
	DELETE FROM cuentas WHERE c_num_cta = _id;
end $$
delimiter ;
    
    
-- 6) Saldos menores de X

drop procedure if exists cta_saldo_menor;
delimiter $$
  create procedure cta_saldo_menor(in _cantidad decimal(10,2))
	begin
		SELECT * FROM cuentas WHERE c_saldo < _cantidad
        order by c_titular;
	end $$
    delimiter ;
    
    
-- 7) Saldos mayores de X

drop procedure if exists cta_saldo_mayor;
delimiter $$
  create procedure cta_saldo_mayor(in _cantidad decimal(10,2))
	begin
		SELECT * FROM cuentas WHERE c_saldo > _cantidad
        order by c_titular;
	end $$
    delimiter ;
    

