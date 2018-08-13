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
SELECT pro.id_producto as id_producto, 
	pro.nombre as producto, 
  lot.id_lote as id_lote, 
  lab.id_laboratorio as id_lab
FROM producto pro
INNER JOIN lote lot ON pro.id_producto = lot.id_producto
INNER JOIN medicamentos med ON pro.id_producto = med.id_producto
INNER JOIN laboratorio lab  ON med.id_laboratorio = lab.id_laboratorio
GROUP BY pro.id_producto
ORDER BY pro.id_producto;

/*Tabla Dimension: Laboratorio*/
SELECT lab.id_laboratorio as id_lab, 
	lab.nombre_laboratorio as laboratorio
FROM laboratorio lab
GROUP BY lab.id_laboratorio
ORDER BY lab.id_laboratorio;

/*Tabla Dimension: Lote*/
SELECT lot.id_lote as id_lote, 
	lot.lote as lote
FROM lote lot 
GROUP BY lot.id_lote
ORDER BY lot.id_lote;


/*Tabla Principal: Inventario*/
SELECT 
FROM
INNER JOIN 
INNER JOIN  
GROUP BY
ORDER BY

