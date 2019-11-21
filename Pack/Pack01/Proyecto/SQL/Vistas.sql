--********************************************************
------------------------Vistas---------------------------
--********************************************************
Create or replace view total_factura as
Select num_fact,sum(precio_unitario*cantidad) as Suma
from factura_compra, esde
where factura_compra.num_fact = esde.factura_compra
group by num_fact;