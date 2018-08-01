import random as rnd

for i in range(1,2003+1):
  id_lab = rnd.randint(1,100)
  a = 'INSERT INTO medicamentos (id_medicamento, id_laboratorio, id_producto)'
  a += 'VALUES('+str(i)+','+str(id_lab)+','+str(i)+');'
  print a