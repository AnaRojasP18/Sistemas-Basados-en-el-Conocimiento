(defglobal ?*respuesta* = nil)

(deffunction leer-respuesta ()
    (printout t "Respuesta (si/no): ")
    (bind ?*respuesta* (read))
    (return (or (eq ?*respuesta* si) (eq ?*respuesta* SI))))

(defrule inicio
    =>
    (printout t "¿Tienes algún signo o síntoma de alguna enfermedad?: ")
    (if (leer-respuesta) then
        (assert (sintoma true))
    else
        (assert (sintoma false))
    )
)

(defrule sintoma_no
    (sintoma false)
    =>
    (printout t "Diagnóstico: No presenta síntomas." crlf)
)

(defrule sintoma_si
    (sintoma true)
    =>
    (printout t "¿Pérdida de peso y frecuencia urinaria?: ")
    (bind ?respuesta1 (leer-respuesta))
    (printout t "¿Cansancio y hormigueo en manos?: ")
    (bind ?respuesta2 (leer-respuesta))
    (if (and ?respuesta1 ?respuesta2) then
        (assert (diagnostico diabetes))
    else
        (if (or ?respuesta1 ?respuesta2) then
            (assert (probable diabetes))
        else
            (assert (descartar diabetes))
        )
    )
)

(defrule diagnostico_diabetes
    (diagnostico diabetes)
    =>
    (printout t "Diagnóstico: Diabetes" crlf)
)

(defrule probable_diabetes
    (probable diabetes)
    =>
    (printout t "Diagnóstico: PROBABLE Diabetes" crlf)
)

(defrule descartar_diabetes
    (descartar diabetes)
    =>
    (printout t "¿Presión elevada y frecuencia cardíaca aumentada?: ")
    (bind ?respuesta1 (leer-respuesta))
    (printout t "¿Dolor de cabeza y visión borrosa?: ")
    (bind ?respuesta2 (leer-respuesta))
    (if (and ?respuesta1 ?respuesta2) then
        (assert (diagnostico hipertension))
    else
        (if (or ?respuesta1 ?respuesta2) then
            (assert (probable hipertension))
        else
            (assert (descartar hipertension))
        )
    )
)

(defrule diagnostico_hipertension
    (diagnostico hipertension)
    =>
    (printout t "Diagnóstico: Hipertensión" crlf)
)

(defrule probable_hipertension
    (probable hipertension)
    =>
    (printout t "Diagnóstico: PROBABLE Hipertensión" crlf)
)

(defrule descartar_hipertension
    (descartar hipertension)
    =>
    (printout t "¿Cambios en personalidad y desorientación?: ")
    (bind ?respuesta1 (leer-respuesta))
    (printout t "¿Dificultad para hacer acciones cotidianas y pérdida de memoria?: ")
    (bind ?respuesta2 (leer-respuesta))
    (if (and ?respuesta1 ?respuesta2) then
        (assert (diagnostico alzheimer))
    else
        (if (or ?respuesta1 ?respuesta2) then
            (assert (probable alzheimer))
        else
            (assert (descartar alzheimer))
        )
    )
)

(defrule diagnostico_alzheimer
    (diagnostico alzheimer)
    =>
    (printout t "Diagnóstico: Alzheimer" crlf)
)

(defrule probable_alzheimer
    (probable alzheimer)
    =>
    (printout t "Diagnóstico: PROBABLE Alzheimer" crlf)
)

(defrule descartar_alzheimer
    (descartar alzheimer)
    =>
    (printout t "¿Opresión en el pecho y sibilancias?: ")
    (bind ?respuesta1 (leer-respuesta))
    (printout t "¿Tos persistente y dificultad para respirar?: ")
    (bind ?respuesta2 (leer-respuesta))
    (if (and ?respuesta1 ?respuesta2) then
        (assert (diagnostico asma))
    else
        (if (or ?respuesta1 ?respuesta2) then
            (assert (probable asma))
        else
            (assert (descartar asma))
        )
    )
)

(defrule diagnostico_asma
    (diagnostico asma)
    =>
    (printout t "Diagnóstico: Asma" crlf)
)

(defrule probable_asma
    (probable asma)
    =>
    (printout t "Diagnóstico: PROBABLE Asma" crlf)
)

(defrule descartar_asma
    (descartar asma)
    =>
    (printout t "¿Hinchazón en articulaciones y deformidad articular?: ")
    (bind ?respuesta1 (leer-respuesta))
    (printout t "¿Dolor articular y rigidez matutina?: ")
    (bind ?respuesta2 (leer-respuesta))
    (if (and ?respuesta1 ?respuesta2) then
        (assert (diagnostico artritis))
    else
        (if (or ?respuesta1 ?respuesta2) then
            (assert (probable artritis))
        else
            (assert (descartar artritis))
        )
    )
)

(defrule diagnostico_artritis
    (diagnostico artritis)
    =>
    (printout t "Diagnóstico: Artritis" crlf)
)

(defrule probable_artritis
    (probable artritis)
    =>
    (printout t "Diagnóstico: PROBABLE Artritis" crlf)
)

(defrule descartar_artritis
    (descartar artritis)
    =>
    (printout t "¿Piel seca y pelo quebradizo?: ")
    (bind ?respuesta1 (leer-respuesta))
    (printout t "¿Fatiga y aumento de peso?: ")
    (bind ?respuesta2 (leer-respuesta))
    (if (and ?respuesta1 ?respuesta2) then
        (assert (diagnostico hipotiroidismo))
    else
        (if (or ?respuesta1 ?respuesta2) then
            (assert (probable hipotiroidismo))
        else
            (assert (descartar hipotiroidismo))
        )
    )
)

(defrule diagnostico_hipotiroidismo
    (diagnostico hipotiroidismo)
    =>
    (printout t "Diagnóstico: Hipotiroidismo" crlf)
)

(defrule probable_hipotiroidismo
    (probable hipotiroidismo)
    =>
    (printout t "Diagnóstico: PROBABLE Hipotiroidismo" crlf)
)

(defrule descartar_hipotiroidismo
    (descartar hipotiroidismo)
    =>
    (printout t "El diagnóstico es que no presenta ningún signo o síntoma de: Diabetes, Hipertensión, Alzheimer, Asma, Artritis o Hipotiroidismo." crlf)
)
