--
-- TRIGEGRS
--

-- AfterInsert 

drop trigger if exists trigger_mvto_aI;
CREATE TRIGGER trigger_mvto_aI AFTER INSERT ON movimientos
FOR EACH ROW 
UPDATE cuentas SET
	c_saldo = c_saldo + NEW.m_importe
WHERE 
	c_num_cta = NEW.m_c_num_cta;


-- BeforeUpdate

drop trigger if exists trigger_mvto_bu;
CREATE TRIGGER trigger_mvto_bu BEFORE UPDATE ON movimientos
FOR EACH ROW
UPDATE cuentas SET
c_saldo = (c_saldo - OLD.m_importe + NEW.m_importe)
WHERE 
c_num_cta = OLD.m_c_num_cta;

-- BeforeDelete 
drop trigger if exists trigger_mvto_bd;
CREATE TRIGGER trigger_mvto_bd BEFORE DELETE ON movimientos
FOR EACH ROW
UPDATE cuentas SET
c_saldo = c_saldo - OLD.m_importe
WHERE 
c_num_cta = OLD.m_c_num_cta;
