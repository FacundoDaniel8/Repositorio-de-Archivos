<%@page import="Modelo.CuentaProfesor"%>
<%@page import="ModeloDAO.CuentaProfesorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiar clave - Repositorio ET N°35</title>

        <script src="https://kit.fontawesome.com/9d2283b709.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css"/>

        <link rel="shortcut icon" href="img/et35logo.png"/>
    </head>
    <body>
        <nav>
            <h1>REPOSITORIO DE ARCHIVOS</h1>

            <div id="cuenta">
                <div class="dropdown">
                    <a class="btn dropdown-toggle" id="nombre-cuenta" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                        ${profesor.getUsuario()}
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <form action="Controlador" method="get">
                            <li><button class="dropdown-item" name="accion" value="Cambiar clave">Cambiar clave</button></li>
                            <li><button class="dropdown-item" name="accion" value="Salir" href="#">Salir</button></li>
                        </form>
                    </ul>
                </div>

                <i id="icono" class="fa-solid fa-user"></i>
            </div>
        </nav>

        <br>

        <div id="centrado">
            <div class="box-cambiar">
                <h2 class="titulo">Cambiar clave</h2>
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

                <form action="<%= request.getContextPath()%>/Validar" method="get">
                    <label class="label">Ingrese la clave actual</label> <br>
                    <input class="label" type="password" required name="actualPass"> <br> <br>
                    <label class="label">Ingrese la nueva clave</label> <br>
                    <input class="label" type="password" required name="nuevaPass"> <br> <br>
                    <label class="label">Reingrese la nueva clave</label> <br>
                    <input class="label" type="password" required name="nuevaPass2"> <br> <br>

                    <a class="label" id="volver" href="<%= request.getContextPath()%>/Controlador?accion=listar">Volver</a>
                    <input class="label" id="agregar" type="submit" name="accion" value="Aplicar cambio">
                </form>

                <br>
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
