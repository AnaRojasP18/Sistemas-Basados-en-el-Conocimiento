(defrule oferta-iphone15-banamex
    (orden (productos ?p) (metodo-pago tarjeta))
    (test (member$ (smartphone (marca apple) (modelo iPhone15) ?c ?p) ?p))
    (test (member$ (tarjeta (banco banamex) (tipo visa) ?e) ?p))
    =>
    (assert (oferta "24 meses sin intereses")))

(defrule oferta-samsung-note12-liverpool
    (orden (productos ?p) (metodo-pago tarjeta))
    (test (member$ (smartphone (marca samsung) (modelo Note12) ?c ?p) ?p))
    (test (member$ (tarjeta (banco liverpool) (tipo visa) ?e) ?p))
    =>
    (assert (oferta "12 meses sin intereses")))

(defrule oferta-macbookair-iphone15-contado
    (orden (productos ?p) (metodo-pago contado))
    (test (member$ (smartphone (marca apple) (modelo iPhone15) ?c ?p) ?p))
    (test (member$ (computador (marca apple) (modelo MacBookAir) ?c ?p) ?p))
    =>
    (bind ?total 0)
    (foreach ?producto ?p
        (if (eq (getf ?producto 0) smartphone)
            then (bind ?total (+ ?total (getf ?producto precio))))
        (if (eq (getf ?producto 0) computador)
            then (bind ?total (+ ?total (getf ?producto precio)))))
    (bind ?vales (div ?total 1000))
    (assert (vale (valor (* ?vales 100)))))

(defrule descuento-accesorios-smartphone
    (orden (productos ?p))
    (test (member$ (smartphone ?marca ?modelo ?color ?p) ?p))
    =>
    (assert (accesorio (tipo funda) (precio 500) (descuento 0.15)))
    (assert (accesorio (tipo mica) (precio 300) (descuento 0.15))))

(defrule segmentar-cliente-mayorista
    (cliente (nombre ?nombre) (tipo mayorista))
    =>
    (assert (segmento mayorista)))

(defrule segmentar-cliente-menudista
    (cliente (nombre ?nombre) (tipo menudista))
    =>
    (assert (segmento menudista)))


; Reglas adicionales
(defrule oferta-macbookair-liverpool
    (orden (productos ?p) (metodo-pago tarjeta))
    (test (member$ (computador (marca apple) (modelo MacBookAir) ?c ?p) ?p))
    (test (member$ (tarjeta (banco liverpool) (tipo visa) ?e) ?p))
    =>
    (assert (oferta "18 meses sin intereses")))

(defrule oferta-vale-por-compra
    (orden (productos ?p))
    (test (member$ (smartphone ?marca ?modelo ?color ?p) ?p))
    =>
    (assert (vale (valor 200))))

(defrule oferta-tarjeta-bbva
    (orden (productos ?p) (metodo-pago tarjeta))
    (test (member$ (tarjeta (banco bbva) (tipo visa) ?e) ?p))
    =>
    (assert (oferta "10% de descuento en la primera compra")))

(defrule oferta-accesorio-funda
    (orden (productos ?p))
    (test (member$ (accesorio (tipo funda) (precio ?precio) (descuento ?descuento) ?p) ?p))
    =>
    (assert (oferta "15% de descuento en fundas")))

(defrule oferta-accesorio-mica
    (orden (productos ?p))
    (test (member$ (accesorio (tipo mica) (precio ?precio) (descuento ?descuento) ?p) ?p))
    =>
    (assert (oferta "15% de descuento en micas")))