/*Tabla Dimension: Lote*/
SELECT lot.id_lote as id_lote, lot.lote as lote
FROM lote lot 
GROUP BY lot.id_lote
ORDER BY lot.id_lote

/*Tabla Dimension: Producto*/
SELECT pro.id_producto as id_producto, pro.nombre as producto, 
  lot.id_lote as id_lote, lab.id_laboratorio as id_lab
FROM producto pro
INNER JOIN lote lot ON pro.id_producto = lot.id_producto
INNER JOIN medicamentos med ON pro.id_producto = med.id_producto
INNER JOIN laboratorio lab  ON med.id_laboratorio = lab.id_laboratorio
GROUP BY pro.id_producto
ORDER BY pro.id_producto

/*Tabla Dimension: Laboratorio*/
SELECT lab.id_laboratorio as id_lab, lab.nombre_laboratorio as laboratorio
FROM laboratorio lab
GROUP BY lab.id_laboratorio
ORDER BY lab.id_laboratorio

/*Tabla Dimension: Lugar*/
SELECT ???? as id_lugar, pai.pais as pais, ciu.ciudad as ciudad, 
  suc.id_sucursal as sucursal
FROM sucursal suc
INNER JOIN ciudad ciu ON suc.id_ciudad = ciu.id_ciudad
INNER JOIN departamento dep ON ciu.id_departamento = dep.id_departamento 
INNER JOIN pais pai ON dep.id_pais = pai.id_pais
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
