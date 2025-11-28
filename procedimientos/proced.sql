
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

