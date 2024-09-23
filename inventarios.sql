create database control_inventarios;

use control_inventarios;


-- creando tabla almacenes
create table almacenes(
id_almacen int primary key identity(1,1),
planta varchar(50) unique not null,
direccion nvarchar(100) not null,
encargado varchar(100) not null)
;

-- creando tabla proveedores
create table proveedores(
id_proveedor int primary key identity(1,1),
name_proveedor varchar(100)  unique not null,
documento varchar(100) unique not null,
locacion nvarchar(100) not null,
pais varchar(50) not null,
phone varchar(50) not null,
correo varchar(50) not null
);


-- creando tabla categoria_productos
create table categoria_productos(
in_producto int primary key identity(1,1),
subcategoria varchar(100) not null,
categoria varchar(100)not null
);

-- creando tabla clientes
create table clientes(
id_cliente int primary key identity(1,1),
name_cliente varchar(150) not null,
documento varchar(100) unique not null,
direccion nvarchar(100) not null,
phone varchar(100) not null,
correo varchar(100)not null
);

-- creando tabla orden_compra
create table orden_compra(
id_oc int primary key identity(1,1),
proveedor_id int not null,
fecha_emision datetime not null,
fecha_entrega datetime not null,
estado varchar(50) not null,
foreign key (proveedor_id) references proveedores(id_proveedor)
);

-- creando tabla ubicacion detalle
create table ubicacion_detalle(
id_ubicacion int primary key identity(1,1),
sub_cat_ub varchar(50) not null,
cat_ub varchar(50)not null,
almacen_id int not null,
foreign key (almacen_id) references almacenes(id_almacen)
);


-- creando tabla producto
create table productos(
id_producto int primary key identity(1,1),
descripcion_producto varchar(200) not null,
umb varchar(50) not null,
producto_in int not null,
foreign key (producto_in) references categoria_productos(in_producto)
);

-- creando tabla detalle orden compras
-- Se establece una clave primaria compuesta en oc_id y producto_id para 
-- evitar duplicados de productos en una orden de compra.
create table detalle_oc(
oc_id int not null,
producto_id int not null,
umb varchar(50) not null,
cantidad_solicitada int not null,
cantidad_recibida int not null,
precio money not null,
foreign key (producto_id) references productos(id_producto),
foreign key (oc_id) references orden_compra(id_oc),
);

-- creando tabla stock fisico
-- Se establece una clave primaria compuesta en ubicacion_id y
-- producto_id para evitar duplicados en ubicaciones.
create table stock_fisico(
id_lote int primary key identity(1,1),
ubicacion varchar(10) not null,
ump_sup varchar(10) not null,
ump varchar(10) not null,
producto_id int not null,
cantidad int not null,
umb varchar(5) not null,
fecha_emision date,
fecha_caducidad date,
foreign key (producto_id) references productos(id_producto),
);

-- creando tabla pedido cliente
create table pedido_cliente(
id_pedido int primary key identity(1,1),
fecha_pedido datetime not null,
estado_pedido varchar(50) not null,
cliente_id int not null,
foreign key (cliente_id) references clientes(id_cliente),
);

-- creando tabla detalle pedido
-- Se establece una clave primaria compuesta en pedido_id y producto_id.
create table detalle_pedido(
pedido_id int not null,
producto_id int not null,
cantidad int not null,
umb varchar(50) not null,
precio money not null,
foreign key (pedido_id) references pedido_cliente(id_pedido),
foreign key (producto_id) references productos(id_producto)
);

-- creando tabla movimiento_stock
create table movimiento_stock(
id_movimiento int primary key identity(1,1),
tipo_movimiento varchar(100) not null,
lote_id int not null,
cantidad int not null,
umb varchar(50) not null,
fecha_movimiento datetime not null,
ubicacion_id int not null,
foreign key (ubicacion_id) references ubicacion_detalle(id_ubicacion),
foreign key (lote_id) references stock_fisico(id_lote)
)

use control_inventario;

select * from almacenes; 
