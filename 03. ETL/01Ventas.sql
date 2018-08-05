/*Tabla dimension: lugar*/
SELECT s.id_sucursal as id_lugar, s.nombre as sucursal, c.ciudad, d.departamento, p.pais
FROM detalle_factura df
INNER JOIN factura f ON f.id_factura = df.id_factura
INNER JOIN sucursal s ON s.id_sucursal = f.id_sucursal
INNER JOIN ciudad c ON c.id_ciudad = s.id_ciudad
INNER JOIN departamento d ON d.id_departamento = c.id_departamento
INNER JOIN pais p ON p.id_pais = d.id_pais
GROUP BY s.id_sucursal, s.nombre, c.ciudad,d.departamento ,p.pais
ORDER BY p.pais;