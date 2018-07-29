import random as rnd

f = open('lote.sql', 'r')
cant_lotes = len(f.readlines())
f.close()


for i in range(1,5000+1):
  id_movimiento = i
  for i in range(rnd.randint(1,4)):
    cantidad = rnd.randint(1, 20);
    id_lote = rnd.randint(1, cant_lotes);

    a = 'INSERT INTO detalle_movimiento (id_movimiento, cantidad, id_lote) VALUES('
    a += str(id_movimiento) + ','
    a += str(cantidad) + ','
    a += str(id_lote)
    a += ')'
    print a