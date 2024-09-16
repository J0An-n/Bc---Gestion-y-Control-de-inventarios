create database control_inventario;

use control_inventario;

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

