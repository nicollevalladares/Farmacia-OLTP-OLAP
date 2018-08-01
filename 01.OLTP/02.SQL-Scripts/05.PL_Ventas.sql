USE Farmacia;
GO
DECLARE
  @i INT = 1, @j INT = 1,
  @qt_item INT = 3, @sucursal INT, @help INT,
	@cant INT, @lote INT, @estante INT, @qt_compra INT;
BEGIN
  DELETE FROM detalle_factura;
	WHILE @i <= 1000--1000
	BEGIN
		SELECT @sucursal = id_sucursal FROM sucursal
		WHERE id_sucursal = ROUND(RAND()*(
		SELECT max(id_sucursal) from sucursal
		),0);
		SET @qt_item = 1 + ROUND(RAND()*3,0);
		SET @j=1;
		WHILE @j <= @qt_item 
		BEGIN
			WITH vista AS(
				SELECT le.*, ROW_NUMBER() OVER (ORDER by le.id_estante ASC) as fila FROM lote_estante le
				INNER JOIN estante e ON le.id_estante = e.id_estante
				INNER JOIN sucursal s ON s.id_sucursal = e.id_sucursal
				WHERE s.id_sucursal = @sucursal AND le.cantidad >0
			)SELECT @estante = id_estante,@lote = id_lote, @cant = cantidad FROM vista WHERE fila = ROUND(RAND() * (
				SELECT max(fila) FROM vista
			),0);
			IF @cant > 1
        SET @qt_compra = ROUND(@cant /4 * RAND(), 0) + 1;
      ELSE
        SET @qt_compra = 1;

      UPDATE lote_estante SET cantidad = cantidad - @qt_compra
			WHERE id_estante = @estante AND id_lote= @lote;

      INSERT INTO detalle_factura (id_factura, cantidad, id_lote)
      VALUES(@i, @qt_compra, @lote);
      PRINT CONCAT(@i, ' ',@qt_compra, ' ',@lote);
      SET	@j = @j + 1;
		END ;
		SET	@i = @i + 1;
	END
END