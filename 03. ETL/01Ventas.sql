/*Tabla Dimension: Tiempo*/
SELECT DISTINCT
	ROW_NUMBER () OVER (ORDER BY fecha ASC) id_tiempo
	,DATENAME (WEEKDAY, fecha) dia_semana
	,DATEPART (WEEK, fecha) semana
	,DATEPART (MONTH, fecha) mes
	,DATEPART (QUARTER, fecha) trimestre
	,DATEPART (YEAR, fecha) año
	,CONVERT (DATE, fecha) fecha_venta
FROM factura fac
GROUP BY
	CONVERT (DATE, fecha),
	DATEPART (YEAR, fecha),
	DATEPART (QUARTER, fecha),
	DATEPART (MONTH, fecha),
	DATEPART (WEEK, fecha),
	DATENAME (WEEKDAY, fecha)
;

/*Tabla Dimension: Lugar*/
SELECT
	s.id_sucursal as id_lugar, 
	p.pais as pais,
	c.ciudad as ciudad, 
	d.departamento as departamento, 
	s.nombre as sucursal
FROM detalle_factura df
INNER JOIN factura f ON f.id_factura = df.id_factura
INNER JOIN sucursal s ON s.id_sucursal = f.id_sucursal
INNER JOIN ciudad c ON c.id_ciudad = s.id_ciudad
INNER JOIN departamento d ON d.id_departamento = c.id_departamento
INNER JOIN pais p ON p.id_pais = d.id_pais
GROUP BY s.id_sucursal, 
	s.nombre, 
	c.ciudad, 
	d.departamento, 
	p.pais
;

/*Tabla Dimension: Producto*/
SELECT p.id_producto
	,p.nombre as producto
	,pre.presentacion
	,m.id_laboratorio
FROM detalle_factura df
INNER JOIN lote l ON l.id_lote = df.id_lote
INNER JOIN producto p ON p.id_producto = l.id_producto
INNER JOIN medicamentos m ON m.id_producto = p.id_producto
INNER JOIN presentacion pre ON p.id_presentacion = pre.id_presentacion
GROUP BY p.id_producto,p.nombre,pre.presentacion,m.id_laboratorio
;

/*Tabla Dimension: Laboratorio*/
SELECT lab.id_laboratorio as id_lab, 
	lab.nombre_laboratorio as laboratorio
FROM laboratorio lab
GROUP BY lab.id_laboratorio, lab.nombre_laboratorio
ORDER BY lab.id_laboratorio;

/*Tabla Dimension: Cliente*/
SELECT DISTINCT
	cli.id_cliente as id_cliente,
	CONCAT(per.primer_nombre, ' ', per.segundo_nombre, ' ', per.primer_apellido, ' ', per.segundo_apellido) as cliente
FROM factura fac
INNER JOIN cliente cli ON fac.id_cliente = cli.id_cliente
INNER JOIN persona per ON cli.id_persona = per.id_persona
;

/*Tabla Dimension: Empleados*/
SELECT DISTINCT
e.id_empleado
, CONCAT(p.primer_nombre, ' ',p.segundo_nombre, ' ', p.primer_apellido, ' ',p.segundo_apellido) as empleado
FROM factura f
INNER JOIN empleado e
	ON e.id_empleado = f.id_empleado
INNER JOIN persona p
	ON p.id_persona = e.id_persona
;

/*Tabla Principal: Hechos Venta*/
SELECT 
 t.id_tiempo,
 f.fecha, f.id_factura,
 f.id_sucursal as id_lugar,
 f.id_empleado,f.id_cliente,p.id_producto,df.cantidad,
 l.precio_venta * df.cantidad as total_vendido
FROM detalle_factura df
INNER JOIN factura f ON df.id_factura = f.id_factura
INNER JOIN (SELECT ROW_NUMBER() OVER(ORDER BY fecha ASC) as id_tiempo, ft.fecha FROM factura ft GROUP BY ft.fecha) t ON f.fecha = t.fecha
INNER JOIN lote l ON df.id_lote = l.id_lote
INNER JOIN producto p ON p.id_producto = l.id_producto
;


