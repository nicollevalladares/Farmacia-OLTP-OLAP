/*Tabla Dimension: Lote*/
SELECT lot.id_lote as id_lote, lot.lote as lote
FROM lote lot 
GROUP BY lot.id_lote
ORDER BY lot.id_lote

/*Tabla Dimension: Producto*/
SELECT pro.id_producto as id_producto, pro.nombre as producto, 
lot.id_lote as id_lote, lab.id_laboratorio as id_lab
FROM producto pro
INNER JOIN lote lot ON 
INNER JOIN medicamentos med ON
INNER JOIN laboratorio lab ON
INNER JOIN 
GROUP BY
ORDER BY 

/*Tabla Dimension: Laboratorio*/
SELECT lab.id_laboratorio as id_lab, lab.nombre_laboratorio as Laboratorio
FROM laboratorio lab
GROUP BY lab.id_laboratorio
ORDER BY lab.id_laboratorio

/*Tabla Dimension: Lugar*/
SELECT ???? as id_lugar, pai.pais as pais, ciu.ciudad as ciudad, suc.id_sucursal as sucursal
FROM sucursal suc
INNER JOIN 
INNER JOIN 
INNER JOIN 
INNER JOIN 
GROUP BY
ORDER BY 

/*Tabla Dimension: Tiempo*/
SELECT as id_tiempo, as mes, as año, as semestre, as trimestre
FROM
INNER JOIN 
INNER JOIN 
INNER JOIN 
INNER JOIN 
GROUP BY
ORDER BY 
