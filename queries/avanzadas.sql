-- Antes de insertar en inscripciones, revisa si ese cliente ya está inscrito a esa clase.

DELIMITER $$

CREATE TRIGGER tr_prevenir_duplicados
BEFORE INSERT ON inscripciones
FOR EACH ROW
BEGIN
	IF EXISTS 	   ( SELECT 1
                     FROM inscripciones
                     WHERE cliente_id = new.cliente_id
                     AND clase_id = NEW.clase_id ) then
                     
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_text = 'Este cliente ya esta inscrito';
        
	END IF;
    END$$

-- Obtener la edad de un cliente
      
DELIMITER $$

CREATE FUNCTION f_edad_cliente (p_cliente_id INT)
RETURNS INT
DETERMINISTIC
BEGIN 
DECLARE v_edad INT;

       SELECT TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) into v_edad
       FROM clientes
       WHERE cliente_id = p_cliente_id;
       
RETURN v_edad ;
END $$
DELIMITER ;

select f_edad_cliente(5)

-- total pagado por un cliente
  
DELIMITER $$

CREATE FUNCTION fn_total_pagado(p_cliente_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE v_total DECIMAL(10,2);
			
            SELECT coalesce((monto),0) into v_total
            FROM pagos
            where cliente_id = p_cliente_id;        
           
RETURN v_total ;
END $$
DELIMITER ;


select fn_total_pagado(8)

-- Procedimiento: inscribir cliente
	
DELIMITER $$
CREATE PROCEDURE sp_inscribir_cliente ( IN p_cliente_id INT, IN p_clase_id INT)
BEGIN
		     IF EXISTS ( SELECT 1 
						FROM inscripciones
						where cliente_id = p_cliente_id and 
						clase_id = p_clase_id) then
                        
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'EL cliente ya esta inscrito.';
    END IF;
    
    INSERT INTO inscripciones (cliente_id, clase_id, fecha_inscripcion) VALUES (p_cliente_id, p_clase_id, curdate());    
    

END $$
DELIMITER ;

call sp_inscribir_cliente( 1,8)
