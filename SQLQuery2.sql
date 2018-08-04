SELECT (SELECT SUM(cantidad) FROM lote_estante) + 
(SELECT COALESCE(SUM(cantidad), 0) FROM detalle_factura)