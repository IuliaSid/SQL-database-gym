-- Obtener todos los clientes ordenados por apellido.
select nombre, apellido
from clientes 
order by apellido; 
 
-- Ver los pagos hechos por un cliente específico. 
select nombre, apellido, fecha_pago, monto
from pagos p 
join clientes c using(cliente_id)
where cliente_id = 1;

-- Listar clases junto con el monitor responsable.
select m.nombre, m.apellido, c.nombre_clase
from monitores m 
Join clases c using(monitor_id);

-- Ver las clases a las que está inscrito por lo menos un cliente.
select c.clase_id, c.nombre_clase, count(i.cliente_id) as inscritos
from clases c
join inscripciones i using(clase_id)
group by c.clase_id, c.nombre_clase;
                         

-- Mostrar los clientes que han realizado más de 1 pago.
select c.nombre, count(*) as pago
from pagos p
join clientes c using (cliente_id)
group by c.cliente_id, c.nombre
having count(*) > 1;

-- Obtener qué cuota (mensual, trimestral…) se ha pagado más veces.
select cuota_id, c.frecuencia, count(*) as veces
from cuotas c
join pagos using (cuota_id)
group by c.cuota_id, frecuencia;

-- Mostrar las clases con más de 2 clientes inscritos.

select c.nombre_clase, count(*) as inscritos
from inscripciones i
join clases c using (clase_id)
group by c.clase_id, c.nombre_clase
having count(*) > 2;


