
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

