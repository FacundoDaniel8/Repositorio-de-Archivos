<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recuperar clave - Repositorio ET N°35</title>
        <script src = "js/claves.js"></script>
        <link rel="stylesheet" href="css/style.css" type = "text/css">
        <script
            src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js">
        </script>
        <script>
            (function () {
                emailjs.init({
                    publicKey: "lzeDbs0Y91apIvcQn"
                });
            })();
        </script>

        <script src="https://kit.fontawesome.com/9d2283b709.js" crossorigin="anonymous"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css"/>

        <link rel="shortcut icon" href="img/et35logo.png"/>
    </head> 

    <body>

        <nav>
            <h1>REPOSITORIO DE ARCHIVOS</h1>
        </nav>

        <div id="centrado">
            <div class="box-ingresar" style="padding: 60px">
                <h2 class="titulo">Recuperar clave</h2>

                <div id="mensaje-negativo">
                    <%
                        session = request.getSession();
                        String mensaje = (String) session.getAttribute("mensaje");
                        if (mensaje != null) {
                            out.print(mensaje);
                            session.removeAttribute("mensaje"); // Limpiar el mensaje después de mostrarlo
                        }
                    %>
                </div>

                <br>

                <form method="get" action="Validar?accion=Cambiar">
                    <p style="font-size: 25px">Ingrese su correo electronico</p>
                    <div>
                        <input class="label" required type="text" id="email_id" name="email_id">
                        <input class="label" type="submit" onclick="sendMail()" value="Enviar correo"> <br> <br>
                    </div>

                    <p style="font-size: 25px">Ingrese la clave que recibio en su correo</p>
                    <div id="comparar">
                        <input class="label" type="text" id="claveIngresada" placeholder="" required>
                        <button class="label" type="button" onclick="compararClaves()">Comparar</button>
                    </div> <br>

                    <div id="nuevaClave" style="display: none;"> <!-- Este div estará oculto inicialmente -->
                        <label class="label">Ingrese la nueva clave</label> <br>
                        <input class="label" type="password" required name="nuevaPass"> <br> <br>
                        <label class="label">Reingrese la nueva clave</label> <br>
                        <input class="label" type="password" required name="nuevaPass2"> <br> <br>

                        <input class="label" id="agregar" type="submit" name="accion" value="Cambiar">
                    </div>
                </form>

                <a href="index.jsp">Volver</a>
            </div>
        </div>

        <footer>
            <p>© 2024 Iuliano Facundo, Guiterrez Pablo, Medina Lucas, Mateo Tiago, Gadea Alan. <br> Todos los derechos reservados.</p>
            <div class="footer-logo">
                <img src="img/et35logo.png" alt="et35logo"/>
                <p>Esc. Tec. N°35 D.E. 18 "Ing. E. Latzina"</p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    </body>
</html>