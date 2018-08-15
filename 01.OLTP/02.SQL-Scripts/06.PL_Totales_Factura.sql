GO
DECLARE
  @factura INT, @total FLOAT
DECLARE
  c_totales CURSOR FOR
  WITH subtotales AS(
  SELECT
    id_factura, cantidad, df. id_lote, cantidad * precio_venta as sub_total
  FROM detalle_factura df
  INNER JOIN lote l
    ON df.id_lote = l.id_lote
  )SELECT id_factura, SUM(sub_total) as total
  FROM subtotales
  GROUP BY id_factura
  ORDER BY id_factura;
BEGIN
  OPEN c_totales;
  FETCH c_totales INTO @factura, @total
  WHILE (@@FETCH_STATUS = 0)
  BEGIN
    UPDATE factura SET costo_total = @total WHERE id_factura = @factura;
    FETCH c_totales INTO @factura, @total
  END
  CLOSE c_totales
  DEALLOCATE c_totales
END
GO