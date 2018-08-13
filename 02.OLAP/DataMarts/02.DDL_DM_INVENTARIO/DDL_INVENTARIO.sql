
CREATE TABLE DIM_TIEMPO_INVENTARIO (
	id_tiempo INT NOT NULL,
	dia 			INT NOT NULL,
	semana 		INT NOT NULL,
	mes 			INT NOT NULL,
	trimestre INT NOT NULL,
	anio 			INT NOT NULL,
	fecha_inv INT NOT NULL,
 	CONSTRAINT tiempoPK PRIMARY KEY(id_tiempo)
);

CREATE TABLE DIM_LUGAR_INVENTARIO (
	id_lugar 			INT NOT NULL,
	pais 					VARCHAR(255) NOT NULL,
	ciudad 				VARCHAR(255) NOT NULL,
	departamento 	VARCHAR(255) NOT NULL,
	sucursal 			VARCHAR(255) NOT NULL,
	CONSTRAINT lugarPK PRIMARY KEY(id_lugar)
);

CREATE TABLE DIM_LAB_INVENTARIO (
	id_lab 			INT NOT NULL,
	laboratorio VARCHAR(255) NOT NULL,
	CONSTRAINT labPK PRIMARY KEY(id_lab)
);

CREATE TABLE DIM_LOTE_INVENTARIO (
	id_lote INT NOT NULL,
	lote 		VARCHAR(255),
	CONSTRAINT lotePK PRIMARY KEY(id_lote)
);

CREATE TABLE DIM_PRODUCTO_INVENTARIO (
	id_producto INT NOT NULL,
	producto 		VARCHAR(255) NOT NULL,
	id_lab 			INT NOT NULL,
	id_lote 		INT NOT NULL,
	CONSTRAINT productoPK PRIMARY KEY(id_producto),
	CONSTRAINT labFK FOREIGN KEY(id_lab) REFERENCES DIM_LAB_INVENTARIO(id_lab),
	CONSTRAINT loteFK FOREIGN KEY(id_lote) REFERENCES DIM_LOTE_INVENTARIO(id_lote)
);

-- Tabla Principal
CREATE TABLE HECHOS_INVENTARIO (
	id_inventario INT NOT NULL,
	id_tiempo 		INT NOT NULL,
	id_lugar 			INT NOT NULL,
	id_producto 	INT NOT NULL,
	cantidad 			INT NOT NULL,
	CONSTRAINT inventarioPK PRIMARY KEY(id_inventario),
	CONSTRAINT tiempoFK FOREIGN KEY(id_tiempo) REFERENCES DIM_TIEMPO_INVENTARIO(id_tiempo),
	CONSTRAINT lugarFK FOREIGN KEY(id_lugar) REFERENCES DIM_LUGAR_INVENTARIO(id_lugar),
	CONSTRAINT productoFK FOREIGN KEY(id_producto) REFERENCES DIM_PRODUCTO_INVENTARIO(id_producto)
);
