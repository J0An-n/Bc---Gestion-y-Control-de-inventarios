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
insert into almacenes (planta, direccion, encargado)
values 
	('Ate', 'Jirón Domingo Martínez Luján 502', 'ALFARO GUTIERREZ BORJA'),
	('Rimac', 'Avenida Venezuela - 704', 'RAMIRO RIOS RIMAC'),
	('Lima', 'Jr. Camaná 616. Cercado LIMA', 'STEVE ROGERS GRIMALDO'),
	('Jesús María', 'Av. Brasil Nº 515', 'SOFÍA GUTIERREZ SALVATORE'),
	('Villa El Salvador', 'Av. El sol del mas allá', 'WISPER MAMAMI QUISPE');

select * from categoria_productos; 
insert into categoria_productos(subcategoria, categoria)
values 
	('MAT. PRIMA','INSUMOS'),
	('ENVASE Y EMB.','INSUMOS'),
	('SUMINISTRO','INSUMOS'),
	('ELABORADO','PRODUCTO TERMINADO'),
	('REPUESTO','INSUMOS');

select * from clientes; 
insert into clientes(name_cliente, documento, direccion, phone, correo)
values 
	('BONIFACIO MANRIQUEZ CORDOBA','12345678','Calle las gardenias 123','987654321','bmc_123@gmail.com'),
	('ADOLFO CHUIMAN DEL CARPIO','23456789','Av. Argentina 145','998765432','acc_123@gmail.com'),
	('CARLOS ASTENGO CHUMPITAZ','34678965','Calle los Huracanes 258','998564321','cac_456@gmail.com'),
	('ROSA PASTEL DE LA CRUZ','14785236','Av. los Descalzos del país 159','999001231','rpastelc@gmail.com'),
	('PEDRO PICARDIO PERALTA','456369845','Calle Santo Toribio 12','991122336','ppicardiop@gmail.com');


select * from proveedores;
insert into proveedores(name_proveedor, documento, locacion, pais,phone, correo)
values 
	('SACAROSA SAC','2012345678','Calle las tulipanes 123','Perú','987654321','sacarosasac@gmail.com'),
	('PLASTIFARMA SA','2023456789','Av. Chile 145','Chile','998765432','plastifarmasa@gmail.com'),
	('REPUESTO EIRL','2034678965','Calle los Haycos 258','Argentina','998564321','repuestoeirl@gmail.com'),
	('ACIETILENO SA','2014785236','Av. piramide del sol 159','Perú','999001231','acietilenosa@gmail.com'),
	('SUMINDETRO SAC','20456369845','Calle rascacielo 12','Colombia','991122336','sumindetrosac@gmail.com');


select * from ubicacion_detalle;

insert into ubicacion_detalle(sub_cat_ub, cat_ub, almacen_id)
values 
	('UB_5RPISO1','REFRIGERADO','5'),
	('UB_5RPISO2','REFRIGERADO','5'),
	('UB_5GEN1','GENERAL','5'),
	('UB_5GEN2','GENERAL','5'),
	('UB_5APISO1','ANAQUEL','5'),
	('UB_6RPISO1','REFRIGERADO','6'),
	('UB_6RPISO2','REFRIGERADO','6'),
	('UB_6GEN1','GENERAL','6'),
	('UB_6GEN2','GENERAL','6'),
	('UB_6APISO1','ANAQUEL','6');

select * from pedido_cliente;
select * from clientes;

insert into pedido_cliente(fecha_pedido,estado_pedido,cliente_id)
values 
	('01/10/2024','PROCESANDO','2'),
	('02/10/2024','PROCESANDO','2'),
	('02/10/2024','PROCESANDO','3'),
	('02/10/2024','PROCESANDO','4'),
	('03/10/2024','PROCESANDO','3'),
	('03/10/2024','PROCESANDO','3'),
	('04/10/2024','PROCESANDO','2'),
	('04/10/2024','PROCESANDO','2'),
	('04/10/2024','PROCESANDO','5'),
	('04/10/2024','PROCESANDO','5');

select * from orden_compra;
select * from proveedores;
insert into orden_compra(proveedor_id,fecha_emision,fecha_entrega,estado)
values 
	('6','01/05/2024','01/04/2024',''),
	('6','01/05/2024','01/04/2024',''),
	('7','01/05/2024','01/04/2024',''),
	('7','01/05/2024','01/04/2024',''),
	('8','02/05/2024','01/04/2024',''),
	('8','02/05/2024','01/04/2024',''),
	('7','02/05/2024','01/04/2024',''),
	('7','02/05/2024','01/04/2024',''),
	('9','02/05/2024','01/04/2024',''),
	('9','02/05/2024','01/04/2024','');

select * from productos;
select * from categoria_productos;

insert into productos(descripcion_producto,umb,producto_in)
values 
	('POLIETIL PEAD','kg','1'),
	('COPOLIMERO','kg','1'),
	('COLORANTE MASTERBATCH','kg','1'),
	('PLATAFORMA CARTON 25.5x10cm','mll','2'),
	('ETIQ ADH REPELENTE DE INSECTOS 100ml','mll','2'),
	('GAS REFRIGERANTE R-410A','und','3'),
	('OXIGENO INDUSTRIAL','kg','3'),
	('FILTRO SUP.EXT. 24X24X2-35%','und','5'),
	('VALVULA EXPANSION TERMO RVE4C','und','5'),
	('BOLSA PEAD 28 pulg x 46 pulg x 33.02um','mll','2');


select * from productos;
select * from pedido_cliente;
select * from detalle_pedido;

insert into detalle_pedido(pedido_id,producto_id,cantidad ,umb ,precio)
values 
	('1','1','500','kg','3100'),
	('1','2','250','kg','1800'),
	('1','4','1','mll','126'),
	('1','10','2','mll','82.40'),
	('2','1','800','kg','4960'),
	('2','2','500','kg','3600'),
	('2','4','1','mll','252'),
	('2','10','5','mll','206'),
	('3','6','3','und','630'),
	('3','7','2','und','104');

select * from productos;
select * from orden_compra;
select * from detalle_oc;
select * from detalle_pedido;

insert into detalle_oc(oc_id,producto_id,umb,cantidad_recibida,cantidad_solicitada,precio)
values 
	('14','1','kg','1500','1500','9300'),
	('14','2','kg','1000','1000','7200'),
	('14','4','mll','10','10','1260'),
	('15','10','mll','10','10','412'),
	('15','6','und','9','9','1890'),
	('15','7','und','6','6','312'),
	('16','1','kg','1500','1500','9300'),
	('16','2','kg','1000','1000','7200'),
	('17','4','mll','10','10','1260'),
	('17','10','mll','10','10','412');

select * from ubicacion_detalle;
select * from productos;
select * from stock_fisico;

insert into stock_fisico(ubicacion,ump_sup,ump,producto_id,cantidad,umb,fecha_emision,fecha_caducidad)
values 
	('01','1000000001','1100000001','1','1500','kg','02/02/2024','02/02/2029'),
	('01','1000000002','1100000002','1','1500','kg','02/02/2024','02/02/2029'),
	('01','1000000003','1100000003','2','1000','kg','02/02/2024','02/02/2029'),
	('01','1000000004','1100000004','2','1000','kg','02/02/2024','02/02/2029'),
	('02','1000000005','1100000005','4','10','mll','02/02/2024','02/02/2029'),
	('02','1000000006','1100000006','4','10','mll','02/02/2024','02/02/2029'),
	('03','1000000007','1100000007','6','9','und','02/02/2024','02/02/2029'),
	('03','1000000008','1100000008','7','6','und','02/02/2024','02/02/2029'),
	('04','1000000009','1100000009','10','10','mll','02/02/2024','02/02/2029'),
	('04','1000000010','1100000010','10','10','mll','02/02/2024','02/02/2029');

select * from movimiento_stock;
select * from ubicacion_detalle;
select * from stock_fisico;

insert into movimiento_stock(tipo_movimiento,lote_id,cantidad,umb,fecha_movimiento,ubicacion_id)
values 
	('almacenado','1','1500','kg','2024-09-22','8'),
	('almacenado','1','1500','kg','2024-09-22','9'),
	('almacenado','2','1000','kg','2024-09-22','13'),
	('almacenado','2','1000','kg','2024-09-22','14'),
	('almacenado','7','9','und','2024-09-22','8');

