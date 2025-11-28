
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

