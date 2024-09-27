/* global emailjs */

function generarClave() {
    let clave = "";
    for (var i = 0; i < 6; i++) {
        var num = Math.floor(Math.random() * 10);
        clave = clave + num;
    }
    localStorage.setItem("codigoGenerado", clave);
    return clave;
}

let clave = localStorage.getItem("codigoGenerado") || generarClave(); // Solo genera una nueva clave si no existe una

function sendMail() {
    let parms = {
        num_code: clave,
        email_id: document.getElementById("email_id").value
    };

    emailjs.send("service_688tyoc", "template_rq4e0ur", parms).then((response) => {
        console.log('Correo enviado con éxito:', response);
    });
}

function compararClaves() {
    let claveUsuario = document.getElementById("claveIngresada").value;
    let claveGenerada = localStorage.getItem("codigoGenerado");

    if (claveUsuario === claveGenerada) {
        alert("La clave es correcta");
        localStorage.removeItem("codigoGenerado");

        // Mostrar los campos de nueva contraseña
        document.getElementById("nuevaClave").style.display = "block";
    } else {
        alert("La clave no es correcta");
    }
}