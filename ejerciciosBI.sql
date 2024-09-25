
use control_inventarios;

select * from almacenes;
select * from clientes;
select * from detalle_oc;
select * from detalle_pedido;
select * from stock_fisico;
select * from productos;
select * from detalle_pedido;

-- monto total por orden de compra
select oc_id, SUM(precio) as "Monto Total" from detalle_oc
group by oc_id;



-- mostrar los subtotales de productos segun orden de compra
select d.oc_id, p.id_producto, p.descripcion_producto, SUM(d.precio) as "Monto Total" from detalle_oc d
left join productos p 
on p.id_producto = d.producto_id
group by
    p.id_producto, 
    p.descripcion_producto, 
    d.oc_id
having SUM(precio)>0;






--promedio del monto total por detalle de pedido
select pedido_id p, avg(precio) as "Monto Total" from detalle_pedido
group by pedido_id;

-- numero de clientes:
select count(distinct name_cliente) as "clientes" from clientes;







-- mostrar los subtotales de productos segun orden de compra
select d.oc_id, p.id_producto, p.descripcion_producto, SUM(d.precio) as "Monto Total" from detalle_oc d
left join productos p 
on p.id_producto = d.producto_id
group by
    p.id_producto, 
    p.descripcion_producto, 
    d.oc_id
having SUM(precio)>0;






select * from productos;
select * from detalle_pedido;







-- mostrar los subtotales de productos segun pedido
select pd.pedido_id, p.id_producto, p.descripcion_producto, SUM(pd.precio) as "Monto Total" from detalle_pedido pd
left join productos p 
on p.id_producto = pd.producto_id
group by
    p.id_producto, 
    p.descripcion_producto, 
    pd.pedido_id
having SUM(precio)>0;

-- valorizado de inventario con su respectivo fecha de entrada
select * from stock_fisico;
select * from detalle_oc;
select * from productos;

select 
dt.producto_id, 
p.descripcion_producto, 
SUM(sf.cantidad * dt.precio / NULLIF(dt.cantidad_recibida, 0)) AS "Valorizado",
sf.fecha_emision as "Fecha de Entrada"

from detalle_oc dt
inner join productos p on p.id_producto = dt.producto_id
inner join stock_fisico sf on sf.producto_id = p.id_producto

group by dt.producto_id, p.descripcion_producto, sf.fecha_emision
having SUM(sf.cantidad * dt.precio / NULLIF(dt.cantidad_recibida, 0)) > 0;
;
