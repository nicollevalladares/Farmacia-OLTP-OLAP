/*Tabla Dimension: Tiempo*/
SELECT CONVERT (DATE, fecha) fecha
	DATEPART (YEAR, fecha) año,
	DATEPART (QUARTER, fecha) trimestre,  
	DATEPART (MONTH, fecha) mes, 
	DATEPART (WEEK, fecha) semana, 
	DATENAME (WEEKDAY, fecha) dia_semana, 
	ROW_NUMBER () OVER (ORDER BY fecha ASC) id_tiempo
FROM factura fac
INNER JOIN detalle_factura defa ON fac.id_factura = defa.id_factura
INNER JOIN lote lot ON defa.id_lote = lot.id_lote
INNER JOIN producto pro ON lot.id_producto = pro.id_producto
GROUP BY fac.id_factura,
	pro.id_producto,
	lug.id_lugar,
	fac.fecha,
	CONVERT (DATE, fecha),
	DATEPART (YEAR, fecha),
	DATEPART (QUARTER, fecha),
	DATEPART (MONTH, fecha),
	DATEPART (WEEK, fecha),
	DATENAME (WEEKDAY, fecha);

/*Tabla Dimension: Lugar*/
SELECT s.id_sucursal as id_lugar, 
	p.pais as pais
	c.ciudad as ciudad, 
	d.departamento as departamento, 
	s.nombre as sucursal, 
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
ORDER BY p.pais;

/*Tabla Dimension: Producto*/
SELECT p.id_producto
	,p.nombre as producto
	,pre.presentacion
FROM detalle_factura df
INNER JOIN lote l ON l.id_lote = df.id_lote
INNER JOIN producto p ON p.id_producto = l.id_producto
INNER JOIN presentacion pre ON p.id_presentacion = pre.id_presentacion
GROUP BY p.id_producto,p.nombre,pre.presentacion
;

/*Tabla Dimension: Laboratorio*/
SELECT lab.id_laboratorio as id_lab, 
	lab.nombre_laboratorio as laboratorio
FROM laboratorio lab
GROUP BY lab.id_laboratorio
ORDER BY lab.id_laboratorio;

/*Tabla Dimension: Cliente*/
SELECT cli.id_cliente as id_cliente,
	CONCAT(per.primer_nombre, ' ', per.segundo_nombre, ' ', per.primer_apellido, ' ', per.segundo_apellido) as cliente
FROM factura fac
INNER JOIN cliente cli ON fac.id_cliente = cli.id_cliente
INNER JOIN persona per ON cli.id_persona = per.id_persona
GROUP BY
ORDER BY 

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

/*Tabla Principal: Venta*/
SELECT 
FROM
INNER JOIN 
INNER JOIN  
GROUP BY
ORDER BY

