Use Farmacia;
GO
DECLARE
	@sucursal INT, @lote INT, @estante INT, @qt INT
DECLARE
 c_invent CURSOR FOR
 WITH inventario AS (
  SELECT dm.id_movimiento,dm.id_lote,m.id_estante_destino as id_estante,e.id_sucursal,dm.cantidad
  FROM movimiento_producto m
  INNER JOIN detalle_movimiento dm ON m.id_movimiento = dm.id_movimiento
  INNER JOIN estante e ON e.id_estante = m.id_estante_destino
  WHERE id_estante_destino != -1
 ) SELECT id_sucursal,id_lote,id_estante,SUM(cantidad) as cantidad
 FROM inventario
 GROUP BY id_sucursal,id_lote,id_estante
 ORDER BY id_sucursal, id_lote, id_estante
BEGIN
	DELETE FROM lote_estante;
	OPEN c_invent
	FETCH c_invent INTO @sucursal, @lote, @estante, @qt
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		INSERT INTO lote_estante (id_estante, id_lote, cantidad) 
		VALUES(@estante, @lote, @qt);
		FETCH c_invent INTO @sucursal, @lote, @estante, @qt
	END
	CLOSE c_invent
	DEALLOCATE c_invent
END
GO