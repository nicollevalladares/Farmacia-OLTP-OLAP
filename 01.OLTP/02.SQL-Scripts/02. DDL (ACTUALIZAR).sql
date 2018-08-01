CREATE DATABASE Farmacia
GO
USE Farmacia
GO

-- Tabla categoria_producto
CREATE TABLE categoria_producto (
  id_categoria INT NOT NULL PRIMARY KEY,
  categoria VARCHAR(45) NULL DEFAULT NULL,
)
-- Tabla persona
CREATE TABLE persona (
  id_persona INT NOT NULL PRIMARY KEY,
  primer_nombre VARCHAR(50) NOT NULL,
  segundo_nombre VARCHAR(50) NULL DEFAULT NULL,
  primer_apellido VARCHAR(50) NOT NULL,
  segundo_apellido VARCHAR(50) NULL DEFAULT NULL,
  genero VARCHAR(1) NOT NULL,
  direccion VARCHAR(50) NULL,
  correo_electronico VARCHAR(50) NULL DEFAULT NULL,
)
-- Tabla cliente
CREATE TABLE cliente (
  id_cliente INT NOT NULL PRIMARY KEY,
  id_persona INT NOT NULL,
  fecha_registro DATE NOT NULL,
  CONSTRAINT fk_Cliente_Persona1 FOREIGN KEY (id_persona) REFERENCES persona (id_persona)
)
-- Tabla descuento
CREATE TABLE descuento (
  id_descuento INT NOT NULL PRIMARY KEY,
  descripcion VARCHAR(45) NOT NULL,
  valor FLOAT NOT NULL,
  estado VARCHAR(1) NOT NULL,
)
-- Tabla empleado
CREATE TABLE empleado (
  id_empleado INT NOT NULL PRIMARY KEY,
  fecha_nombramiento DATE NULL DEFAULT NULL,
  id_persona INT NOT NULL,
  contrasena VARCHAR(512) NOT NULL,
  foto_url VARCHAR(100) NULL,
  estado VARCHAR(1) NOT NULL,
  CONSTRAINT fk_empleado_persona1 FOREIGN KEY (id_persona) REFERENCES persona (id_persona)
)
-- Tabla pais
CREATE TABLE pais (
  id_pais INT NOT NULL PRIMARY KEY,
  pais VARCHAR(50) NOT NULL,
  codigo_area VARCHAR(50) NOT NULL,
)
-- Tabla departamento
CREATE TABLE departamento (
  id_departamento INT NOT NULL PRIMARY KEY,
  departamento VARCHAR(100) NULL,
  id_pais INT NOT NULL,
  CONSTRAINT fk_departamento_pais1 FOREIGN KEY (id_pais) REFERENCES pais (id_pais)
)
-- Tabla ciudad
CREATE TABLE ciudad (
  id_ciudad INT NOT NULL PRIMARY KEY,
  ciudad VARCHAR(100) NOT NULL,
  id_departamento INT NOT NULL,
  CONSTRAINT fk_ciudad_departamento1 FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento)
)
-- Tabla sucursal
CREATE TABLE sucursal (
  id_sucursal INT NOT NULL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(250) NOT NULL,
  id_ciudad INT NOT NULL,
  CONSTRAINT fk_sucursal_ciudad1 FOREIGN KEY (id_ciudad) REFERENCES ciudad (id_ciudad)
)
-- Tabla estante
CREATE TABLE estante (
  id_estante INT NOT NULL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  id_sucursal INT NOT NULL,
  tipo_estante VARCHAR(1) NOT NULL,
  CONSTRAINT fk_Estante_Sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal)
)
-- Tabla forma_pago
CREATE TABLE forma_pago (
  id_forma_pago INT NOT NULL PRIMARY KEY,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  estado VARCHAR(45) NULL DEFAULT NULL,
)
-- Tabla factura
CREATE TABLE factura (
  id_factura INT NOT NULL PRIMARY KEY,
  fecha DATE NULL DEFAULT NULL,
  costo_total FLOAT NOT NULL,
  observacion VARCHAR(250) NULL DEFAULT NULL,
  id_empleado INT NOT NULL,
  id_cliente INT NOT NULL,
  id_forma_pago INT NOT NULL,
  CONSTRAINT FK_empleadofac1 FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
  CONSTRAINT fk_Factura_Cliente1 FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
  CONSTRAINT fk_Factura_FormaPago1 FOREIGN KEY (id_forma_pago) REFERENCES forma_pago (id_forma_pago)
)
-- Tabla descuento_factura
CREATE TABLE descuento_factura (
  id_descuento INT NOT NULL,
  id_factura INT NOT NULL,
  CONSTRAINT fk_FacturaDescuento_Descuento1 FOREIGN KEY (id_descuento) REFERENCES descuento (id_descuento),
  CONSTRAINT fk_FacturaDescuento_Factura1 FOREIGN KEY (id_factura) REFERENCES factura (id_factura)
)
-- Tabla presentacion
CREATE TABLE presentacion (
  id_presentacion INT NOT NULL PRIMARY KEY,
  presentacion VARCHAR(50) NOT NULL,
)
-- Tabla impuesto
CREATE TABLE impuesto (
  id_impuesto INT NOT NULL PRIMARY KEY,
  impuesto VARCHAR(45) NOT NULL,
  valor FLOAT NOT NULL,
  estado VARCHAR(45) NOT NULL,
  fecha_inicio DATE NOT NULL,
)
-- Tabla producto
CREATE TABLE producto (
  id_producto INT NOT NULL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  id_categoria INT NOT NULL,
  id_presentacion INT NOT NULL,
  id_impuesto INT NOT NULL,
  CONSTRAINT fk_Producto_CategoriaProducto1 FOREIGN KEY (id_categoria) REFERENCES categoria_producto (id_categoria),
  CONSTRAINT fk_producto_presentacion1 FOREIGN KEY (id_presentacion) REFERENCES presentacion (id_presentacion),
  CONSTRAINT fk_producto_impuesto1 FOREIGN KEY (id_impuesto) REFERENCES impuesto (id_impuesto)
)
-- Tabla lote
CREATE TABLE lote (
  id_lote INT NOT NULL PRIMARY KEY,
  id_producto INT NOT NULL,
  lote VARCHAR(100) NOT NULL,
  precio_costo FLOAT NOT NULL,
  precio_venta FLOAT NOT NULL,
  fecha_elaboracion DATE NOT NULL,
  fecha_vecimiento DATE NOT NULL,
  CONSTRAINT fk_lote_producto1 FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
)
-- Tabla detalle_factura
CREATE TABLE detalle_factura (
  id_factura INT NOT NULL,
  cantidad INT NOT NULL,
  id_lote INT NOT NULL,
  CONSTRAINT fk_FacturaDetalle_Factura1 FOREIGN KEY (id_factura) REFERENCES factura (id_factura),
  CONSTRAINT fk_detalle_factura_lote1 FOREIGN KEY (id_lote) REFERENCES lote (id_lote)
)
-- Tabla laboratorio
CREATE TABLE laboratorio (
  id_laboratorio INT NOT NULL PRIMARY KEY,
  nombre_laboratorio VARCHAR(255) NOT NULL,
)
-- Tabla medicamentos
CREATE TABLE medicamentos (
  id_medicamento INT NOT NULL PRIMARY KEY,
  id_laboratorio INT NOT NULL,
  id_producto INT NOT NULL,
  CONSTRAINT fk_Medicamentos_Laboratorio1 FOREIGN KEY (id_laboratorio) REFERENCES laboratorio (id_laboratorio),
  CONSTRAINT fk_medicamentos_producto1 FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
)
-- Tabla tipo_movimiento_producto
CREATE TABLE tipo_movimiento_producto (
  id_tipo_movimiento INT NOT NULL PRIMARY KEY,
  descripcion VARCHAR(50) NOT NULL,
)
-- Tabla movimiento_producto
CREATE TABLE movimiento_producto (
  id_movimiento INT NOT NULL PRIMARY KEY,
  fecha DATE NOT NULL,
  id_tipo_movimiento INT NOT NULL,
  id_empleado INT NOT NULL,
  id_estante_origen INT NOT NULL,
  id_estante_destino INT NOT NULL,
  CONSTRAINT fk_movimiento_producto_tipo_movimiento1 FOREIGN KEY (id_tipo_movimiento) REFERENCES tipo_movimiento_producto (id_tipo_movimiento),
  CONSTRAINT fk_movimiento_producto_empleado1 FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado),
  CONSTRAINT fk_movimiento_producto_estante1 FOREIGN KEY (id_estante_origen) REFERENCES estante (id_estante),
  CONSTRAINT fk_movimiento_producto_estante2 FOREIGN KEY (id_estante_destino) REFERENCES estante (id_estante)
)
-- Tabla telefono
CREATE TABLE telefono (
  id_telefono INT NOT NULL PRIMARY KEY,
  telefono VARCHAR(50) NOT NULL,
  id_pais INT NOT NULL,
  CONSTRAINT fk_telefono_pais1 FOREIGN KEY (id_pais) REFERENCES pais (id_pais)
)
-- Tabla telefono_persona
CREATE TABLE telefono_persona (
  id_persona INT NOT NULL,
  id_telefono INT NOT NULL,
  CONSTRAINT fk_persona_por_telefono_persona1 FOREIGN KEY (id_persona) REFERENCES persona (id_persona),
  CONSTRAINT fk_persona_por_telefono_telefono1 FOREIGN KEY (id_telefono) REFERENCES telefono (id_telefono)
)
-- Tabla telefono_sucursal
CREATE TABLE telefono_sucursal (
  id_sucursal INT NOT NULL,
  id_telefono INT NOT NULL,
  CONSTRAINT fk_sucursal_por_telefono_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal),
  CONSTRAINT fk_sucursal_por_telefono_telefono1 FOREIGN KEY (id_telefono) REFERENCES telefono (id_telefono)
)
-- Tabla detalle_movimiento
CREATE TABLE detalle_movimiento (
  id_movimiento INT NOT NULL,
  cantidad INT NOT NULL,
  id_lote INT NOT NULL,
  CONSTRAINT fk_producto_por_movimiento_producto_movimiento_producto1 FOREIGN KEY (id_movimiento) REFERENCES movimiento_producto (id_movimiento),
  CONSTRAINT fk_detalle_movimiento_lote1 FOREIGN KEY (id_lote) REFERENCES lote (id_lote)
)
-- Tabla lote_estante
CREATE TABLE lote_estante (
  id_estante INT NOT NULL,
  id_lote INT NOT NULL,
  cantidad INT NOT NULL,
  CONSTRAINT fk_estante_has_lote_estante1 FOREIGN KEY (id_estante) REFERENCES estante (id_estante),
  CONSTRAINT fk_estante_has_lote_lote1 FOREIGN KEY (id_lote) REFERENCES lote (id_lote)
)
