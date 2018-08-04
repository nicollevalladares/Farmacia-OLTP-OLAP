use DW_INVENTARIO;

create table DIM_TIEMPO(
	id_tiempo int identity(1,1) not null,
	mes int not null,
	año int not null,
	semestre int not null,	 
	trimestre int not null,
	constraint tiempoPK primary key(id_tiempo)
);

create table DIM_LOTE(
	id_lote int not null,
	lote varchar(100),
	constraint lotePK primary key(id_lote)
);

create table DIM_LAB(
	id_lab int not null,
	laboratorio varchar(255) not null,
	constraint labPK primary key(id_lab)
);

create table DIM_PRODUCTO(
	id_producto int not null,
	producto varchar(100) not null,
	id_lab int not null,
	id_lote int not null,
	constraint productoPK primary key(id_producto),
	constraint labFK foreign key(id_lab) references DIM_LAB(id_lab),
	constraint loteFK foreign key(id_lote) references DIM_LOTE(id_lote)
);

create table DIM_LUGAR(
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
	constraint productoFK foreign key(id_producto) references DIM_PRODUCTO(id_producto),
	constraint tiempoFK foreign key(id_tiempo) references DIM_TIEMPO(id_tiempo),
	constraint lugarFK foreign key(id_lugar) references DIM_LUGAR(id_lugar)
);
