(deftemplate smartphone
    (slot marca)
    (slot modelo)
    (slot color)
    (slot precio))

(deftemplate computador
    (slot marca)
    (slot modelo)
    (slot color)
    (slot precio))

(deftemplate accesorio
    (slot tipo)
    (slot precio)
    (slot descuento))

(deftemplate cliente
    (slot nombre)
    (slot tipo))

(deftemplate orden
    (slot cliente)
    (multislot productos)
    (slot metodo-pago))

(deftemplate tarjeta
    (slot banco)
    (slot tipo)
    (slot expiracion))

(deftemplate vale
    (slot valor))

