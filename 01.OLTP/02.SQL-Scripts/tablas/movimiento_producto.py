import random as rnd
import datetime

for i in range(1,5000+1):
  x = datetime.datetime(2000, 1, 1)
  y = datetime.datetime.now()
  fecha = x + datetime.timedelta( rnd.randint(0,(y - x).days) )
  fecha=fecha.strftime('%Y-%m-%d')
  id_movimiento = i
  id_tipo_movimiento = rnd.randint(1,3)
  id_empleado= rnd.randint(1,650)
  id_estante_origen = rnd.randint(1,1000)
  id_estante_destino = rnd.randint(1,1000)
  if id_tipo_movimiento == 1:
    id_estante_origen = 0
  elif id_tipo_movimiento == 3:
    id_estante_destino = -1

  a = "INSERT INTO movimiento (id_movimiento, fecha, id_tipo_movimiento, id_empleado, id_estante_origen, id_estante_destino) VALUES ("
  a += str(id_movimiento)+","
  a += "'"+fecha+"',"
  a += str(id_tipo_movimiento)+","
  a += str(id_empleado)+","
  a += str(id_estante_origen)+","
  a += str(id_estante_destino)
  a += ")"

  print a



# INSERT INTO estante (id_estante, nombre, id_sucursal, tipo_estante) VALUES (0, 'ABAST', 1, 'A');
# INSERT INTO estante (id_estante, nombre, id_sucursal, tipo_estante) VALUES (-1, 'VENCE', 1, 'V');