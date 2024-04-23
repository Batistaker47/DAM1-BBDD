--
-- PROCEDURES DE LA TABLA MOVIMIENTOS
--

-- 1) FILTRADO
drop procedure if exists m_todos_filtrado;
delimiter $$
  create procedure m_todos_filtrado(in _filtro varchar(50))
	begin
		SELECT * FROM movimientos WHERE
        (m_id LIKE concat('%',_filtro,'%')) OR
		(m_c_num_cta LIKE concat('%',_filtro,'%')) OR 
        (m_fecha LIKE concat('%',_filtro,'%')) OR 
        (m_importe LIKE concat('%',_filtro,'%')) OR 
        (m_concepto LIKE concat('%',_filtro,'%'))
        order by m_fecha;
	end $$
    delimiter ;
    

-- 2) FILTRADO POR ID

drop procedure if exists m_todos_por_id;
delimiter $$
  create procedure m_todos_por_id(in _id int)
	begin
		SELECT * FROM movimientos WHERE m_id = _id
        order by m_fecha;
	end $$
delimiter ;
    
    
    -- 3) INSERTAR
    
drop procedure if exists m_insertar;
delimiter $$
	create procedure m_insertar(in _idCuenta int, in _importe decimal(10,2), in _concepto varchar(50))
    begin
    INSERT INTO movimientos VALUES
	(null, _idCuenta, current_date(), _importe, _concepto);
    SELECT last_insert_id() AS id_insertado;
    end $$
    delimiter ;
    
-- 4) UPDATE
    
drop procedure if exists m_modificar;
delimiter $$
create procedure m_modificar(in _importe decimal(10,2), in _concepto varchar(50), in _id int)
    begin
		UPDATE movimientos SET
        m_importe = _importe,
        m_concepto = _concepto
        WHERE 
        m_id = _id;
    end $$
    delimiter ;

-- 5) DELETE 

drop procedure if exists m_borrar;
delimiter $$
CREATE PROCEDURE m_borrar(in _id int)
begin
	DELETE FROM movimientos WHERE m_id = _id;
end $$
delimiter ;

-- 6) Movimientos mayores de X

drop procedure if exists m_mayor;
delimiter $$
  create procedure m_mayor(in _cantidad decimal(10,2))
	begin
		SELECT * FROM movimientos WHERE m_importe > _cantidad
        order by m_fecha;
	end $$
    delimiter ;
    
-- 7) Movimientos entre fechas

drop procedure if exists m_mvtos_entre_fechas
delimiter $$
create procedure m_mvtos_entre_fechas(in _cuenta int, in _desde datetime, in _hasta datetime)
begin
	SELECT * FROM movimientos 
    WHERE
    m_c_num_cta = _cuenta AND
    m_fecha >= _desde AND m_fecha < _hasta;
end $$
delimiter ;

CALL m_insertar(1,100,"INGRESO");
SELECT * FROM movimientos;
SELECT * FROM cuentas;
DELETE FROM movimientos;
    