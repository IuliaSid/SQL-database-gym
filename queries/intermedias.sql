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


-- Listar clientes nacidos después de 1990 y a qué clases están apuntados.

select cli.nombre, cli.apellido, cli.fecha_nacimiento, c.nombre_clase
from inscripciones
join clases c using (clase_id)
join clientes cli using (cliente_id)
where YEAR(fecha_nacimiento) > 1990;
