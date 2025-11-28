-- Mostrar los monitores que NO tienen clases asignadas.

select m.nombre, m.apellido
from monitores m
WHERE m.monitor_id NOT IN (
    SELECT DISTINCT monitor_id FROM clases WHERE monitor_id IS NOT NULL
);

-- Ver los clientes que NO tienen inscripciones.

SELECT c.nombre, c.apellido
FROM clientes c
LEFT JOIN inscripciones i USING (cliente_id)
WHERE i.cliente_id IS NULL;
