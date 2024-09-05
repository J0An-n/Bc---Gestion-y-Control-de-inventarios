# Bc---ALMACENES: CONTROL DE INVENTARIOS
pequeña base de datos para Gestion y Control de inventarios

# CASO PRÁCTICO MODELAMIENTO DE CONTROL DE INVENTARIOS

## Contexto:

Una cadena de almacenes llamada "Almacenes Global" cuenta con varios establecimientos distribuidos en diferentes ciudades. Cada almacén 
maneja un inventario independiente, pero la empresa desea tener un control centralizado de todos los productos, su disponibilidad y la 
rotación de inventarios. El sistema debe permitir la gestión de productos, seguimiento de stock, y control de movimientos (entradas y 
salidas) de inventario.

Requerimientos del Sistema:

    Almacenes:
        La empresa tiene varios almacenes, cada uno ubicado en una ciudad diferente.
        Cada almacén tiene un código único, nombre, dirección, y un encargado.

    Productos:
        Los productos tienen un código único, nombre, descripción, y unidad de medida (ej. piezas, cajas, litros).
        Cada producto puede estar presente en uno o varios almacenes, con un stock determinado en cada uno.

    Movimientos de Inventario:
        Los movimientos de inventario se registran como entradas o salidas. Cada movimiento tiene un identificador único,
        fecha y hora, tipo de movimiento (entrada o salida), cantidad, y almacén correspondiente. Es necesario registrar 
        el producto involucrado y, en el caso de salidas, el motivo (venta, traspaso, pérdida, etc.).

    Proveedores:
        Los productos provienen de distintos proveedores. Cada proveedor tiene un identificador único, nombre, y contacto.

    Órdenes de Compra:
        Las órdenes de compra se realizan a los proveedores y están asociadas a un almacén.
        Cada orden de compra tiene un identificador único, fecha de emisión, fecha de entrega, proveedor, y productos 
        solicitados con sus cantidades respectivas.

    Clientes:
        La empresa vende sus productos a clientes. Cada cliente tiene un identificador único, nombre, dirección y contacto.

    Pedidos de Clientes:
        Los clientes realizan pedidos que incluyen uno o varios productos. Cada pedido tiene un identificador único, fecha,
        cliente, y estado del pedido (pendiente, procesado, enviado).

## Reportes :
        La empresa necesita reportes sobre:
        Stock actual por almacén.
        Movimientos de inventario por período (por producto, almacén, tipo de movimiento).
        Historial de órdenes de compra y su cumplimiento.

## Objetivo : 
        Implementar un sistema que permita a "Almacenes Global" gestionar eficientemente su inventario a 
        través de múltiples almacenes, con la capacidad de realizar un seguimiento detallado de los 
        productos, sus movimientos y la relación con proveedores.







