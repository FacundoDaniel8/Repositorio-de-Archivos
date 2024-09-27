<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="shortcut icon" href="img/et35logo.png"/>

        <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>

        <script type="text/javascript">
            emailjs.init('9t1R1R8tFRkdgbNp4')
        </script>

        <title>Enviar Correo - Repositorio ET N°35</title>
    </head>
    <body>
        <nav>
            <h1>REPOSITORIO DE ARCHIVOS</h1>
        </nav>

        <div id="centrado">
            <div class="box-ingresar">
                <h2 class="titulo">Enviar correo a regencia</h2>

                <div id="mensaje-negativo">
                    <%
                        session = request.getSession();
                        String mensaje = (String) session.getAttribute("mensaje");
                        if (mensaje != null) {
                            out.print(mensaje);
                            session.removeAttribute("mensaje"); // Limpiar el mensaje despues de mostrarlo
                        }
                    %>
                </div>

                <form id="form">
                    <div class="field">
                        <label class="label" for="from_name">Emisor/a</label> <br>
                        <input class="label" type="text" name="from_name" id="from_name" value="${profesor.getUsuario()}" readonly> <br> <br>
                    </div>
                    <div class="field">
                        <label class="label" for="to_email">Destinatario/a</label> <br>
                        <!--En value hay que poner el mail de regencia-->
                        <input class="label" type="text" name="to_email" id="to_email" value=""> <br> <br>
                    </div>
                    <div class="field">
                        <label class="label" for="message">Mensaje</label> <br>
                        <textarea style="width: 100%;" class="label" type="text" name="message" id="message"> </textarea> <br> <br>
                    </div>
                    
                    <a style="font-size: 25px" href="main.jsp">Volver</a> <br> <br>

                    <input type="submit" id="button" class="label" value="Enviar correo" >
                </form>
            </div>
        </div>



        <footer>
            <p>© 2024 Iuliano Facundo, Guiterrez Pablo, Medina Lucas, Mateo Tiago, Gadea Alan. <br> Todos los derechos reservados.</p>
            <div class="footer-logo">
                <img src="img/et35logo.png" alt="et35logo"/>
                <p>Esc. Tec. N°35 D.E. 18 "Ing. E. Latzina"</p>
            </div>
        </footer>

        <script src="js/comunicacion.js"></script>
    </body>
</html>
