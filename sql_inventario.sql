create database control_inventary;

use control_inventary;

go

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
locacion nvarchar(100) not null,
pais varchar(50) not null,
phone varchar(50) not null,
correo varchar(50) not null
);

-- creando tabla ubicacion detalle
create table ubicacion_detalle(
id_ubicacion int primary key identity(1,1),
sub_cat_ub varchar(50) not null,
cat_ub varchar(50)not null
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
name_cliente varchar(150) unique not null,
direccion nvarchar(100) not null,
phone varchar(100) not null,
correo varchar(100)not null
);

-- creando tabla orden_compra
create table orden_compra(
id_oc int primary key identity(1,1),
almacen_id int not null,
proveedor_id int not null,
fecha_emision datetime not null,
fecha_entrega datetime not null,
foreign key (almacen_id) references almacenes(id_almacen),
foreign key (proveedor_id) references proveedores(id_proveedor)
);

-- creando tabla producto
create table productos(
id_producto int primary key identity(1,1),
descripcion_producto varchar(200) not null,
umb varchar(50) not null,
producto_in int not null,
foreign key (producto_in) references categoria_productos(in_producto),
);

-- creando tabla detalle orden compras
create table detalle_oc(
oc_id int not null,
producto_id int not null,
umb varchar(50) not null,
cantidad_solicitada int not null,
cantidad_recibida int not null,
precio money not null,
foreign key (producto_id) references productos(id_producto),
foreign key (oc_id) references orden_compra(id_oc)
);
