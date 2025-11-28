
-- ---------------------------------------------------------------
-- TRIGGER: tr_prevenir_duplicados
-- OBJETIVO:
--     Evita que un cliente se inscriba dos veces a la misma clase.
--
-- POR QUÉ EXISTE:
--     Garantiza la integridad del negocio asegurando que un cliente
--     no pueda generar inscripciones duplicadas.
--
-- CÓMO FUNCIONA:
--     Antes de insertar un registro en la tabla "inscripciones",
--     el trigger verifica si ya existe una inscripción con el mismo
--     cliente_id y clase_id. Si existe, interrumpe la operación y 
--     lanza un error personalizado con SQLSTATE 45000.
--
-- CÓMO SE USA:
--     Se activa automáticamente cuando se ejecuta:
--         INSERT INTO inscripciones (...)
--     No requiere acciones adicionales por parte del usuario.
-- ---------------------------------------------------------------

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
	DELIMITER ;

-- ---------------------------------------------------------------
-- FUNCIÓN: f_edad_cliente
-- OBJETIVO:
--     Calcular la edad actual de un cliente a partir de su fecha
--     de nacimiento almacenada en la tabla "clientes".
--
-- POR QUÉ EXISTE:
--     Permite obtener la edad de un cliente sin repetir lógica en
--     consultas. Centraliza el cálculo y garantiza precisión y consistencia.
--
-- CÓMO FUNCIONA:
--     Utiliza TIMESTAMPDIFF para calcular los años entre 
--     fecha_nacimiento y la fecha actual (CURDATE()).
--
-- CÓMO SE USA:
--     SELECT f_edad_cliente(5);
--     Retorna un número entero con la edad del cliente.
-- ---------------------------------------------------------------
      
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

-- ---------------------------------------------------------------
-- FUNCIÓN: fn_total_pagado
-- OBJETIVO:
--     Calcular el total de dinero pagado por un cliente.
--
-- POR QUÉ EXISTE:
--     Muchas consultas del sistema requieren conocer cuánto ha pagado
--     un cliente (para reportes, deudas, historial, etc). Centralizar
--     este cálculo evita duplicar lógica y posibles errores.
--
-- CÓMO FUNCIONA:
--     Suma todos los pagos asociados a un cliente en la tabla "pagos".
--     Si el cliente no tiene pagos, retorna 0 mediante COALESCE.
--
-- CÓMO SE USA:
--     SELECT fn_total_pagado(8);
--     Devuelve un DECIMAL(10,2) con el total abonado.
-- ---------------------------------------------------------------
  
DELIMITER $$

CREATE FUNCTION fn_total_pagado(p_cliente_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE v_total DECIMAL(10,2);
			
            SELECT coalesce(sum(monto),0) into v_total
            FROM pagos
            where cliente_id = p_cliente_id;        
           
RETURN v_total ;
END $$
DELIMITER ;


select fn_total_pagado(8)

-- ---------------------------------------------------------------
-- PROCEDIMIENTO: sp_inscribir_cliente
-- OBJETIVO:
--     Inscribir un cliente a una clase de forma segura,
--     evitando duplicados y registrando la fecha de inscripción.
--
-- POR QUÉ EXISTE:
--     Permite encapsular todo el proceso de inscripción en una
--     sola operación controlada, reduciendo errores y asegurando
--     que el sistema siempre valide antes de insertar.
--
-- CÓMO FUNCIONA:
--     1. Verifica si el cliente ya está inscrito a la clase.
--        - Si ya está inscrito: lanza un error con SQLSTATE 45000.
--     2. Si pasa la validación, inserta la inscripción con la fecha actual.
--
-- CÓMO SE USA:
--     CALL sp_inscribir_cliente(1, 8);
--     Inserta una inscripción si es válida o lanza un error si no lo es.
-- ---------------------------------------------------------------
	
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
