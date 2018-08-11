
---------------------DATAMART  INVENTARIO-------------------------------------------
use DW_INVENTARIO;

create table DIM_TIEMPO_INVENTARIO(
	id_tiempo int identity(1,1) not null,
	mes int not null,
	año int not null,
	semestre int not null,	 
	trimestre int not null,
	constraint tiempoPK primary key(id_tiempo)
);

create table DIM_LOTE_INVENTARIO(
	id_lote int not null,
	lote varchar(100),
	constraint lotePK primary key(id_lote)
);

create table DIM_LAB_INVENTARIO(
	id_lab int not null,
	laboratorio varchar(255) not null,
	constraint labPK primary key(id_lab)
);

create table DIM_PRODUCTO_INVENTARIO(
	id_producto int not null,
	producto varchar(100) not null,
	id_lab int not null,
	id_lote int not null,
	constraint productoPK primary key(id_producto),
	constraint labFK foreign key(id_lab) references DIM_LAB_INVENTARIO(id_lab),
	constraint loteFK foreign key(id_lote) references DIM_LOTE_INVENTARIO(id_lote)
);

create table DIM_LUGAR_INVENTARIO(
	id_lugar int not null,
	pais varchar(50) not null,
	ciudad varchar(100) not null,
	sucursal varchar(50) not null,
	constraint lugarPK primary key(id_lugar)
);

create table HECHOS_INVENTARIO(
	cantidad int not null,
	id_producto int not null,
	id_tiempo int not null,
	id_lugar int not null,
	constraint productoFK foreign key(id_producto) references DIM_PRODUCTO_INVENTARIO(id_producto),
	constraint tiempoFK foreign key(id_tiempo) references DIM_TIEMPO_INVENTARIO(id_tiempo),
	constraint lugarFK foreign key(id_lugar) references DIM_LUGAR_INVENTARIO(id_lugar)
);


-----------------------------------DATAMART VENTA-----------------------------------------------------------

CREATE TABLE DIM_CLIENTE (
  id_cliente INTEGER NOT NULL ,
  cliente    VARCHAR2 (255)
);

ALTER TABLE DIM_CLIENTE_VENTA ADD CONSTRAINT DIM_CLIENTE_PK PRIMARY KEY ( id_cliente );

CREATE TABLE DIM_EMPLEADO_VENTA(
  id_empleado INTEGER NOT NULL ,
  empleado    VARCHAR2 (255)
);

ALTER TABLE DIM_EMPLEADO_VENTA ADD CONSTRAINT DIM_EMPLEADO_PK PRIMARY KEY ( id_empleado );

CREATE TABLE DIM_LAB_VENTA(
  id_lab      INTEGER NOT NULL ,
  laboratorio VARCHAR2 (255)
);

ALTER TABLE DIM_LAB_VENTA ADD CONSTRAINT DIM_LAB_PK PRIMARY KEY ( id_lab );

CREATE TABLE DIM_LUGA_VENTAR (
  id_lugar INTEGER NOT NULL ,
  pais     VARCHAR2 (255) ,
  sucursal VARCHAR2 (255) ,
  ciudad   VARCHAR2 (255)
);

ALTER TABLE DIM_LUGAR_VENTA ADD CONSTRAINT DIM_LUGAR_PK PRIMARY KEY ( id_lugar );

CREATE TABLE DIM_PRODUCTO_VENTA (
  id_producto    INTEGER NOT NULL ,
  producto       VARCHAR2 (255) ,
  DIM_LAB_id_lab INTEGER NOT NULL
);

ALTER TABLE DIM_PRODUCTO_VENTA ADD CONSTRAINT DIM_PRODUCTO_PK PRIMARY KEY ( id_producto );

CREATE TABLE DIM_TIEMPO_VENTA (
  id_tiempo INTEGER NOT NULL ,
  dia       INTEGER ,
  mes       INTEGER ,
  año       INTEGER ,
  trimestre INTEGER ,
  venta     INTEGER
);
ALTER TABLE DIM_TIEMPO_VENTA ADD CONSTRAINT DIM_TIEMPO_PK PRIMARY KEY ( id_tiempo );

CREATE TABLE HECHOS_VENTA (
  id_venta                 INTEGER NOT NULL ,
  total_vendido            NUMBER (7,2) ,
  cantidad                 INTEGER ,
  DIM_TIEMPO_id_tiempo     INTEGER NOT NULL ,
  DIM_LUGAR_id_lugar       INTEGER NOT NULL ,
  DIM_EMPLEADO_id_empleado INTEGER NOT NULL ,
  DIM_PRODUCTO_id_producto INTEGER NOT NULL ,
  DIM_CLIENTE_id_cliente   INTEGER NOT NULL
);

ALTER TABLE HECHOS_VENTA ADD CONSTRAINT HECHOS_VENTA_PK PRIMARY KEY ( id_venta );

ALTER TABLE HECHOS_VENTA ADD CONSTRAINT DIM_CLIENTE_FK FOREIGN KEY ( DIM_CLIENTE_id_cliente ) REFERENCES DIM_CLIENTE_VENTA ( id_cliente );

ALTER TABLE HECHOS_VENTA ADD CONSTRAINT DIM_EMPLEADO_FK FOREIGN KEY ( DIM_EMPLEADO_id_empleado ) REFERENCES DIM_EMPLEADO_VENTA ( id_empleado );

ALTER TABLE DIM_PRODUCTO_VENTA ADD CONSTRAINT DIM_LAB_FK FOREIGN KEY ( DIM_LAB_id_lab ) REFERENCES DIM_LAB_VENTA ( id_lab );

ALTER TABLE HECHOS_VENTA ADD CONSTRAINT DIM_LUGAR_FK FOREIGN KEY ( DIM_LUGAR_id_lugar ) REFERENCES DIM_LUGAR_VENTA ( id_lugar );

ALTER TABLE HECHOS_VENTA ADD CONSTRAINT DIM_PRODUCTO_FK FOREIGN KEY ( DIM_PRODUCTO_id_producto ) REFERENCES DIM_PRODUCTO_VENTA ( id_producto );

ALTER TABLE HECHOS_VENTA ADD CONSTRAINT DIM_TIEMPO_FK FOREIGN KEY ( DIM_TIEMPO_id_tiempo ) REFERENCES DIM_TIEMPO_VENTA ( id_tiempo );

