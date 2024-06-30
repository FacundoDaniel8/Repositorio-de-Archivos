function actualizarAnio(IdEspecialidad, IdAnio) {
    var especialidad = document.getElementById(IdEspecialidad).value;
    var anioSelect = document.getElementById(IdAnio);

    // Limpiar las opciones del select de anio
    anioSelect.innerHTML = "";

    // Agregar opciones segun la especialidad seleccionada
    if (especialidad === "DOE"){
        
        agregarOpcion("1", anioSelect);
        agregarOpcion("2", anioSelect);
        agregarOpcion("3", anioSelect);
        agregarOpcion("4", anioSelect);
        agregarOpcion("5", anioSelect);
        agregarOpcion("6", anioSelect);
    } else if (especialidad === "Ciclo basico") {
        
        agregarOpcion("1", anioSelect);
        agregarOpcion("2", anioSelect);
    } else if (especialidad === "Automotores" || especialidad === "Computacion") {
        
        agregarOpcion("3", anioSelect);
        agregarOpcion("4", anioSelect);
        agregarOpcion("5", anioSelect);
        agregarOpcion("6", anioSelect);
    }
}

function actualizarMateria(IdEspecialidad, IdAnio, IdMateria) {
    var especialidad = document.getElementById(IdEspecialidad).value;
    var anioSelect = document.getElementById(IdAnio).value;
    var materiaSelect = document.getElementById(IdMateria);

    // Limpiar las opciones del select de materia
    materiaSelect.innerHTML = "";

    if (especialidad === "Ciclo basico" && (anioSelect === "1" || anioSelect === "2")) {

        agregarOpcion("Matematica", materiaSelect);
        agregarOpcion("Lengua y literatura", materiaSelect);
        agregarOpcion("Ingles", materiaSelect);
        agregarOpcion("Historia", materiaSelect);
        agregarOpcion("Geografia", materiaSelect);
        agregarOpcion("Ed. ciudadana", materiaSelect);
        agregarOpcion("Dibujo tecnico", materiaSelect);
        agregarOpcion("Biologia", materiaSelect);
        agregarOpcion("Ed. fisica", materiaSelect);
        if (anioSelect === "1") {
            agregarOpcion("Ed. Artistica", materiaSelect);
            agregarOpcion("Carpinteria", materiaSelect);
            agregarOpcion("Hojalateria", materiaSelect);
            agregarOpcion("Ajuste de banco", materiaSelect);
            agregarOpcion("Electricidad", materiaSelect);
        } else {
            agregarOpcion("Fisica", materiaSelect);
            agregarOpcion("Fundicion", materiaSelect);
            agregarOpcion("Automotores", materiaSelect);
            agregarOpcion("Espacio digital", materiaSelect);
            agregarOpcion("Soldadura", materiaSelect);
            
        }

    } else {

        if (especialidad === "Computacion") {

            if (anioSelect === "3") {

                agregarOpcion("Aleman", materiaSelect);
                agregarOpcion("Matematica", materiaSelect);
                agregarOpcion("Ed. fisica", materiaSelect);
                agregarOpcion("Ingles", materiaSelect);
                agregarOpcion("Historia", materiaSelect);
                agregarOpcion("Geografia", materiaSelect);
                agregarOpcion("Lengua y literatura", materiaSelect);
                agregarOpcion("Fisica", materiaSelect);
                agregarOpcion("Ed. ciudadana", materiaSelect);
                agregarOpcion("Dibujo tecnico", materiaSelect);
                agregarOpcion("Quimica", materiaSelect);
                agregarOpcion("Neumatica", materiaSelect);
                agregarOpcion("Maquinas y herramientas", materiaSelect);
                agregarOpcion("Rep. y mant. de eq. inf.", materiaSelect);
                agregarOpcion("Redes y comunicaciones", materiaSelect);
                agregarOpcion("Programacion", materiaSelect);

            } else if (anioSelect === "4") {

                agregarOpcion("Aleman", materiaSelect);
                agregarOpcion("Matematica", materiaSelect);
                agregarOpcion("Ed. fisica", materiaSelect);
                agregarOpcion("Ingles", materiaSelect);
                agregarOpcion("Historia", materiaSelect);
                agregarOpcion("Geografia", materiaSelect);
                agregarOpcion("Lengua y literatura", materiaSelect);
                agregarOpcion("Log. computacional", materiaSelect);
                agregarOpcion("Org. de las comp.", materiaSelect);
                agregarOpcion("Lab. algoritmos", materiaSelect);
                agregarOpcion("Base de datos", materiaSelect);
                agregarOpcion("Proyecto inf. I", materiaSelect);

            } else if (anioSelect === "5") {

                agregarOpcion("Aleman", materiaSelect);
                agregarOpcion("Matematica", materiaSelect);
                agregarOpcion("Ed. fisica", materiaSelect);
                agregarOpcion("Ingles", materiaSelect);
                agregarOpcion("Lengua y literatura", materiaSelect);
                agregarOpcion("Redes", materiaSelect);
                agregarOpcion("Economia", materiaSelect);
                agregarOpcion("Lab. POO", materiaSelect);
                agregarOpcion("Adm. y gest. BBDD", materiaSelect);
                agregarOpcion("Analisis de sist.", materiaSelect);
                agregarOpcion("Proyecto inf II", materiaSelect);

            } else if (anioSelect === "6") {

                agregarOpcion("Aleman", materiaSelect);
                agregarOpcion("Matematica", materiaSelect);
                agregarOpcion("Ed. fisica", materiaSelect);
                agregarOpcion("Ingles", materiaSelect);
                agregarOpcion("Ciudadania y trabajo", materiaSelect);
                agregarOpcion("Ciencia y tecnologia", materiaSelect);
                agregarOpcion("Gest. de proc. productivos", materiaSelect);
                agregarOpcion("Desarrollo de sistemas", materiaSelect);
                agregarOpcion("Programacion sobre redes", materiaSelect);
                agregarOpcion("Adm. de sist. y redes", materiaSelect);
                agregarOpcion("Practicas profesionalizantes", materiaSelect);
            }

        } else if (especialidad === "Automotores") {

            if (anioSelect === "3") {

                agregarOpcion("Aleman", materiaSelect);
                agregarOpcion("Ed. fisica", materiaSelect);
                agregarOpcion("Lengua y literatura", materiaSelect);
                agregarOpcion("Ingles", materiaSelect);
                agregarOpcion("Matematica", materiaSelect);
                agregarOpcion("Ed. ciudadana", materiaSelect);
                agregarOpcion("Historia", materiaSelect);
                agregarOpcion("Geografia", materiaSelect);
                agregarOpcion("Fisica", materiaSelect);
                agregarOpcion("Dibujo tecnico", materiaSelect);
                agregarOpcion("Quimica", materiaSelect);
                agregarOpcion("Tec. del control", materiaSelect);
                agregarOpcion("", materiaSelect);
                agregarOpcion("", materiaSelect);
                agregarOpcion("", materiaSelect);

            } else if (anioSelect === "4") {

                agregarOpcion("Aleman", materiaSelect);
                agregarOpcion("Ed. fisica", materiaSelect);
                agregarOpcion("Lengua y literatura", materiaSelect);
                agregarOpcion("Ingles", materiaSelect);
                agregarOpcion("Matematica", materiaSelect);
                agregarOpcion("Ciudadania y trabajo", materiaSelect);
                agregarOpcion("Mecanica", materiaSelect);
                agregarOpcion("Est. y resis. de materiales", materiaSelect);
                agregarOpcion("Electricidad del Automotor", materiaSelect);
                agregarOpcion("Mec. del automotor y fluidica", materiaSelect);
                agregarOpcion("Taller de automotores I", materiaSelect);

            } else if (anioSelect === "5") {

                agregarOpcion("Aleman", materiaSelect);
                agregarOpcion("Ed. fisica", materiaSelect);
                agregarOpcion("Lengua y literatura", materiaSelect);
                agregarOpcion("Ingles", materiaSelect);
                agregarOpcion("Matematica", materiaSelect);
                agregarOpcion("Elementos de maquinas", materiaSelect);
                agregarOpcion("Tec. de materiales", materiaSelect);
                agregarOpcion("Termodinamica", materiaSelect);
                agregarOpcion("Motores de comb. int.", materiaSelect);
                agregarOpcion("Elec. del automotor", materiaSelect);
                agregarOpcion("Din. del automotor", materiaSelect);
                agregarOpcion("Taller de automotores II", materiaSelect);

            } else if (anioSelect === "6") {

                agregarOpcion("Aleman", materiaSelect);
                agregarOpcion("Ed. fisica", materiaSelect);
                agregarOpcion("Ciencia y tecnologia", materiaSelect);
                agregarOpcion("Gest. de proc. productivos", materiaSelect);
                agregarOpcion("Economia", materiaSelect);
                agregarOpcion("Higiene y seguridad laboral", materiaSelect);
                agregarOpcion("Din. de los motores de comb. int.", materiaSelect);
                agregarOpcion("Lab. de ensayo de motores", materiaSelect);
                agregarOpcion("Diagnostico de sist. del automotor", materiaSelect);
                agregarOpcion("Calculo de est. y mec. del automotor", materiaSelect);
                agregarOpcion("Vehiculos especiales", materiaSelect);
                agregarOpcion("Taller de Automotores III", materiaSelect);
                agregarOpcion("Practicas profesionalizantes", materiaSelect);
            }
        } else if (especialidad === "DOE") {

            agregarOpcion("Psicologia", materiaSelect);
            agregarOpcion("Tutoria", materiaSelect);

        }
    }
}

function agregarOpcion(valor, select) {
    var opcion = document.createElement("option");
    opcion.text = valor;
    opcion.value = valor;
    select.add(opcion);
}

// Para buscar
actualizarAnio("especialidad", "anio");
actualizarMateria("especialidad", "anio", "materia");

// Para agregar
actualizarAnio("addEspecialidad", "addAnio");
actualizarMateria("addEspecialidad", "addAnio", "addMateria");

// Para actualizar
actualizarAnio("modiEspecialidad", "modiAnio");
actualizarMateria("modiEspecialidad", "modiAnio", "modiMateria");