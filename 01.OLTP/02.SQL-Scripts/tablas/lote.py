import random as rnd
import datetime

id_lote = 1
for i in range(1,2004):
  id_producto = i
  cantidad = rnd.randint(1,10)
  for j in range(1,cantidad):
    precio_costo = round(1000 * rnd.random(), 2)
    precio_venta = round((150 * rnd.random()) + precio_costo , 2)
    x = datetime.datetime(2000, 1, 1)
    y = datetime.datetime.now()
    fecha_elaboracion = x + datetime.timedelta( rnd.randint(0,(y - x).days) )
    fecha_vecimiento = fecha_elaboracion + datetime.timedelta(rnd.randint(365, 365*4))
    lote = fecha_elaboracion.strftime('LOT-%Y-%m-%d')
    fecha_elaboracion=fecha_elaboracion.strftime('%Y-%m-%d')
    fecha_vecimiento=fecha_vecimiento.strftime('%Y-%m-%d')
    #print id_lote,
    #print id_producto,
    #print lote,
    #print fecha_elaboracion,
    #print fecha_vecimiento,
    #print precio_costo,
    #print precio_venta
    
    a = 'INSERT INTO lote(id_lote,id_producto,lote,fecha_elaboracion,fecha_vecimiento,precio_costo,precio_venta) VALUES('
    a+=str(id_lote)+","
    a+=str(id_producto)+","
    a+="'"+lote+"'"+","
    a+="'"+fecha_elaboracion+"'"+","
    a+="'"+fecha_vecimiento+"'"+","
    a+=str(precio_costo)+","
    a+=str(precio_venta)
    a+= ')'

    print a

    id_lote+=1
