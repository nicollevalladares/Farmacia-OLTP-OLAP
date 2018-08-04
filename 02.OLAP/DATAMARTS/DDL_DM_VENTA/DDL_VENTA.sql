-- Generated by Oracle SQL Developer Data Modeler 4.1.0.866
--   at:        2018-08-04 14:30:21 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE DIM_CLIENTE
  (
    id_cliente INTEGER NOT NULL ,
    cliente    VARCHAR2 (255)
  ) ;
ALTER TABLE DIM_CLIENTE ADD CONSTRAINT DIM_CLIENTE_PK PRIMARY KEY ( id_cliente ) ;

CREATE TABLE DIM_EMPLEADO
  (
    id_empleado INTEGER NOT NULL ,
    empleado    VARCHAR2 (255)
  ) ;
ALTER TABLE DIM_EMPLEADO ADD CONSTRAINT DIM_EMPLEADO_PK PRIMARY KEY ( id_empleado ) ;

CREATE TABLE DIM_LAB
  (
    id_lab      INTEGER NOT NULL ,
    laboratorio VARCHAR2 (255)
  ) ;
ALTER TABLE DIM_LAB ADD CONSTRAINT DIM_LAB_PK PRIMARY KEY ( id_lab ) ;

CREATE TABLE DIM_LUGAR
  (
    id_lugar INTEGER NOT NULL ,
    pais     VARCHAR2 (255) ,
    sucursal VARCHAR2 (255) ,
    ciudad   VARCHAR2 (255)
  ) ;
ALTER TABLE DIM_LUGAR ADD CONSTRAINT DIM_LUGAR_PK PRIMARY KEY ( id_lugar ) ;

CREATE TABLE DIM_PRODUCTO
  (
    id_producto    INTEGER NOT NULL ,
    producto       VARCHAR2 (255) ,
    DIM_LAB_id_lab INTEGER NOT NULL
  ) ;
ALTER TABLE DIM_PRODUCTO ADD CONSTRAINT DIM_PRODUCTO_PK PRIMARY KEY ( id_producto ) ;

CREATE TABLE DIM_TIEMPO
  (
    id_tiempo INTEGER NOT NULL ,
    dia       INTEGER ,
    mes       INTEGER ,
    año       INTEGER ,
    trimestre INTEGER ,
    venta     INTEGER
  ) ;
ALTER TABLE DIM_TIEMPO ADD CONSTRAINT DIM_TIEMPO_PK PRIMARY KEY ( id_tiempo ) ;

CREATE TABLE HECHOS_VENTA
  (
    id_venta                 INTEGER NOT NULL ,
    total_vendido            NUMBER (7,2) ,
    cantidad                 INTEGER ,
    DIM_TIEMPO_id_tiempo     INTEGER NOT NULL ,
    DIM_LUGAR_id_lugar       INTEGER NOT NULL ,
    DIM_EMPLEADO_id_empleado INTEGER NOT NULL ,
    DIM_PRODUCTO_id_producto INTEGER NOT NULL ,
    DIM_CLIENTE_id_cliente   INTEGER NOT NULL
  ) ;
ALTER TABLE HECHOS_VENTA ADD CONSTRAINT HECHOS_VENTA_PK PRIMARY KEY ( id_venta ) ;

ALTER TABLE HECHOS_VENTA ADD CONSTRAINT DIM_CLIENTE_FK FOREIGN KEY ( DIM_CLIENTE_id_cliente ) REFERENCES DIM_CLIENTE ( id_cliente ) ;

ALTER TABLE HECHOS_VENTA ADD CONSTRAINT DIM_EMPLEADO_FK FOREIGN KEY ( DIM_EMPLEADO_id_empleado ) REFERENCES DIM_EMPLEADO ( id_empleado ) ;

ALTER TABLE DIM_PRODUCTO ADD CONSTRAINT DIM_LAB_FK FOREIGN KEY ( DIM_LAB_id_lab ) REFERENCES DIM_LAB ( id_lab ) ;

ALTER TABLE HECHOS_VENTA ADD CONSTRAINT DIM_LUGAR_FK FOREIGN KEY ( DIM_LUGAR_id_lugar ) REFERENCES DIM_LUGAR ( id_lugar ) ;

ALTER TABLE HECHOS_VENTA ADD CONSTRAINT DIM_PRODUCTO_FK FOREIGN KEY ( DIM_PRODUCTO_id_producto ) REFERENCES DIM_PRODUCTO ( id_producto ) ;

ALTER TABLE HECHOS_VENTA ADD CONSTRAINT DIM_TIEMPO_FK FOREIGN KEY ( DIM_TIEMPO_id_tiempo ) REFERENCES DIM_TIEMPO ( id_tiempo ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
