<%@page import="ModeloDAO.CuentaProfesorDAO"%>
<%@page import="Modelo.CuentaProfesor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesion - Repositorio ET N°35</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css"/>

        <link rel="shortcut icon" href="img/et35logo.png"/>
    </head>
    <body>
        <nav>
            <h1>REPOSITORIO DE ARCHIVOS</h1>
        </nav>

        <div id="centrado">
            <div class="box-ingresar">
                <h2 class="titulo">Iniciar sesion</h2>

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

                <form action="<%= request.getContextPath()%>/Validar" method="get">
                    <label class="label">Usuario</label> <br>
                    <input class="label" type="text" required name="txtUser"> <br>
                    <label class="label">Correo electronico</label> <br>
                    <input class="label" type="email" required name="txtEmail"> <br>
                    <label class="label">Clave</label> <br>
                    <input class="label" type="password" required name="txtPass"> <br> <br>

                    <input class="label" id="agregar" type="submit" name="accion" value="Ingresar">
                </form>
            </div>
        </div>
    </body>
</html>
