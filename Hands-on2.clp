(deftemplate enfermedad
    (slot id)
    (slot nombre)
    (multislot signos)
    (multislot sintomas))

(assert (enfermedad (id 1) (nombre "Diabetes") (signos perdida-de-peso frecuencia-urinaria) (sintomas cansancio hormigueo-en-manos)))

(assert (enfermedad (id 2) (nombre "Hipertension") (signos presion-elevada frecuencia-cardiaca-aumentada) (sintomas dolor-de-cabeza vision-borrosa)))

(assert (enfermedad (id 3) (nombre "Alzheimer") (signos cambios-en-personalidad desorientacion) (sintomas dificultad-para-hacer-acciones perdida-de-memoria)))

(assert (enfermedad (id 4) (nombre "Asma") (signos opresion-en-pecho sibilancias) (sintomas tos-persistente dificultad-para-respirar)))

(assert (enfermedad (id 5) (nombre "Artritis") (signos hinchazon-en-articulaciones deformidad-articular) (sintomas dolor-articular rigidez-matutina)))

(assert (enfermedad (id 6) (nombre "Hipotiroidismo") (signos piel-seca pelo-quebradizo) (sintomas fatiga aumento-de-peso)))


(defrule consultar-enfermedad
    (declare (salience 10))
    (enfermedad (id ?id) (nombre ?nombre) (signos $?signos) (sintomas $?sintomas))
    =>
    (printout t "Enfermedad ID: " ?id " - Nombre: " ?nombre " - Signos: " ?signos " - Síntomas: " ?sintomas crlf)
)


(defrule consultar-signos
    (declare (salience 9))
    (enfermedad (id ?id) (signos $?signos))
    =>
    (printout t "Enfermedad ID: " ?id " - Signos: " ?signos crlf)
)

(defrule consultar-sintomas
    (declare (salience 8))
    (enfermedad (id ?id) (sintomas $?sintomas))
    =>
    (printout t "Enfermedad ID: " ?id " - Síntomas: " ?sintomas crlf)
)

(defrule eliminar-enfermedad
    (declare (salience 11))
    ?enf <- (enfermedad (id 1)) ; Cambia el identificador 1 por el que desees eliminar
    =>
    (retract ?enf)
    (printout t "Enfermedad con ID " 1 " eliminada." crlf)
)

