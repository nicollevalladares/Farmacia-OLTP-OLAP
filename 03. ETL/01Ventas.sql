/*Tabla Dimension: Lugar*/
SELECT s.id_sucursal as id_lugar, s.nombre as sucursal, c.ciudad, d.departamento, p.pais
FROM detalle_factura df
INNER JOIN factura f ON f.id_factura = df.id_factura
INNER JOIN sucursal s ON s.id_sucursal = f.id_sucursal
INNER JOIN ciudad c ON c.id_ciudad = s.id_ciudad
INNER JOIN departamento d ON d.id_departamento = c.id_departamento
INNER JOIN pais p ON p.id_pais = d.id_pais
GROUP BY s.id_sucursal, s.nombre, c.ciudad, d.departamento, p.pais
ORDER BY p.pais;

/*Tabla Dimension: Empleados*/
SELECT DISTINCT
e.id_empleado
,CONCAT(p.primer_nombre, ' ',p.segundo_nombre, ' ', p.primer_apellido, ' ',p.segundo_apellido) as empleado
FROM factura f
INNER JOIN empleado e
	ON e.id_empleado = f.id_empleado
INNER JOIN persona p
	ON p.id_persona = e.id_persona
;

/*Tabla Dimension: Producto*/
SELECT 
p.id_producto
,p.nombre as producto
,pre.presentacion
FROM detalle_factura df
INNER JOIN lote l ON l.id_lote = df.id_lote
INNER JOIN producto p ON p.id_producto = l.id_producto
INNER JOIN presentacion pre ON p.id_presentacion = pre.id_presentacion
GROUP BY p.id_producto,p.nombre,pre.presentacion
;

/*Tabla Dimension: Laboratorio*/
SELECT 
FROM
INNER JOIN 
INNER JOIN 
GROUP BY
ORDER BY 


/*Tabla Dimension: Tiempo*/
SELECT 
FROM
INNER JOIN 
INNER JOIN 
INNER JOIN 
INNER JOIN 
GROUP BY
ORDER BY 

/*Tabla Dimension: Cliente*/
SELECT 
FROM
INNER JOIN 
INNER JOIN 
INNER JOIN 
INNER JOIN 
GROUP BY
ORDER BY 
