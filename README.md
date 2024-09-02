# Bc---Gestion-y-Control-de-inventarios
pequeña base de datos para Gestion y Control de inventarios

# CASO PRACTICO MODELAMIENTO DE GESTION Y CONTROL DE INVENTARIOS

##Contexto:

Una empresa llamada SupplyChainCo gestiona varios almacenes distribuidos en diferentes ubicaciones geográficas. La empresa trabaja con múltiples proveedores para obtener los productos que vende a sus clientes. Además, SupplyChainCo necesita controlar el inventario en tiempo real, registrar los movimientos de productos entre almacenes, y gestionar pedidos de clientes y órdenes de compra a proveedores.
Requerimientos del Sistema:

    ###Almacenes:
        La empresa tiene múltiples almacenes. Cada almacén tiene un identificador único, una ubicación, y una capacidad de almacenamiento.

    ###Productos:
        La empresa maneja diversos productos. Cada producto tiene un identificador único, nombre, descripción, categoría, y un precio unitario.

    ###Proveedores:
        Los productos son suministrados por varios proveedores. Cada proveedor tiene un identificador único, nombre, contacto y país de origen.

    ###Inventarios:
        Se debe controlar la cantidad de cada producto en cada almacén. Esto implica conocer las existencias actuales, los movimientos de entrada (compra a proveedores) y salida (venta a clientes) de productos.

    ###Movimientos de Inventario:
        Se deben registrar todos los movimientos de inventario, ya sea por compra, venta, o transferencia entre almacenes. Cada movimiento tiene un identificador único, fecha, tipo de movimiento (entrada o salida), cantidad, y almacén origen/destino.

    ###Pedidos de Clientes:
        Los clientes realizan pedidos que incluyen uno o varios productos. Cada pedido tiene un identificador único, fecha, cliente, y estado del pedido (pendiente, procesado, enviado).

    ###Órdenes de Compra:
        La empresa realiza órdenes de compra a los proveedores. Cada orden de compra tiene un identificador único, fecha, proveedor, y estado de la orden (pendiente, recibida, cancelada).

    ###Clientes:
        La empresa vende sus productos a clientes. Cada cliente tiene un identificador único, nombre, dirección, y contacto.

##Preguntas Clave que Puede Responder el Modelo:

    ¿Cuáles son los niveles de inventario actuales para cada producto en cada almacén?
    ¿Qué productos se han movido entre almacenes en el último mes?
    ¿Qué pedidos de clientes están pendientes de ser enviados?
    ¿Cuáles son las órdenes de compra pendientes con cada proveedor?
    ¿Qué cantidad de productos ha sido vendida en un período específico?
