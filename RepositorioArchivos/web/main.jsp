<%@page import="ModeloDAO.CuentaProfesorDAO"%>
<%@page import="Modelo.CuentaProfesor"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Archivo"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ArchivoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal - Repositorio ET N°35</title>
        <script src="js/opciones.js"></script>
        <link rel="stylesheet" href="css/style.css"/>

        <script>
            function confirmarAccion(event) {
                if (!window.confirm("¿Esta seguro de que quiere realizar esta accion?")) {
                    event.preventDefault(); // Evita que el enlace siga su curso
                }
            }
        </script>

        <link rel="shortcut icon" href="img/et35logo.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/9d2283b709.js" crossorigin="anonymous"></script>

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

        <div id="mensaje-positivo">
            <%
                session = request.getSession();
                String mensaje = (String) session.getAttribute("mensaje");
                if (mensaje != null) {
                    out.print(mensaje);
                    session.removeAttribute("mensaje"); // Limpiar el mensaje despuas de mostrarlo
                }
            %>
        </div>

        <div style="display: flex; justify-content: space-between">
            <div class="box-buscar">
                <h3>Buscar archivos</h3>

                <form action="Controlador" method="get">
                    <select id="especialidad" name="especialidad" onchange="actualizarAnio('especialidad', 'anio')">
                        <option value="Ciclo basico">Ciclo basico</option>
                        <option value="Automotores">Automotores</option>
                        <option value="Computacion">Computacion</option>
                        <option value="DOE">DOE</option>
                    </select>

                    <select id="anio" name="anio" onchange="actualizarMateria('especialidad', 'anio', 'materia')">
                    </select>

                    <select id="materia" name="materia">
                    </select>

                    <input type="submit" name="accion" value="Buscar">
                </form>
            </div>

            <div style="align-content: center">
                <a href="comunicacion.jsp" style="font-size: 25px;
                   text-decoration: none;
                   color: white;
                   font-weight: bold;
                   background: red;
                   padding: 10px 20px;
                   border-radius: 10px;">Comunicarse con regencia o taller (solo DOE)</a>
            </div>
        </div>

        <table class="table table-hover">
            <thead>
                <tr class="table-dark">
                    <th scope="col">ESPECIALIDAD</th>
                    <th scope="col">AÑO</th>
                    <th scope="col">MATERIA</th>
                    <th scope="col">NOMBRE ARCHIVO</th>
                    <th scope="col">NOMBRE PROFESOR/A</th>
                    <th scope="col">TIPO</th>
                    <th scope="col">PESO (MB)</th>
                    <th scope="col"></th>
                </tr>
            </thead>

            <%
                String especialidad = request.getParameter("especialidad");
                String anio = request.getParameter("anio");
                String materia = request.getParameter("materia");

                ArchivoDAO dao = new ArchivoDAO();
                List<Archivo> list = dao.listar(especialidad, anio, materia);
                Iterator<Archivo> iter = list.iterator();
                Archivo arch = null;

                while (iter.hasNext()) {

                    arch = iter.next();
            %>

            <tbody>
                <tr>
                    <td><%= arch.getEspecialidad()%></td>
                    <td><%= arch.getAnio()%></td>
                    <td><%= arch.getMateria()%></td>
                    <td><%= arch.getNombre_archivo()%></td>
                    <td><%= arch.getUsuario_profe()%></td>
                    <td><%= arch.getTipo()%></td>
                    <td><%= String.format("%.2f", arch.getPeso() / 1000000f)%></td>
                    <td class="botones">
                        <a id="btn-descarga" href="Controlador?accion=descargar&ID=<%= arch.getId()%>"><i class="fa-solid fa-download fa-xl" style="color: white;"></i></a>
                            <%
                                CuentaProfesor us = (CuentaProfesor) session.getAttribute("profesor");

                                if (us.getUsuario().equals(arch.getUsuario_profe())) {
                            %> 
                        <a id="btn-edit" href="Controlador?accion=editar&ID=<%= arch.getId()%>"><i class="fa-solid fa-pencil fa-xl"></i></a>
                        <a id="btn-borrar" href="Controlador?accion=eliminar&ID=<%= arch.getId()%>" onclick="confirmarAccion(event)"><i class="fa-solid fa-trash fa-xl"></i></a>
                            <%}%>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>

        <div class="div-agregar">
            <div class="box-agregar">
                <h2>Agregar archivo</h2>
                <form action="Controlador" method="post" enctype="multipart/form-data">
                    <div id="css-alineados">
                        <div id="css-especialidad">
                            <label>Especialidad:</label>
                            <select id="addEspecialidad" name="txtEspecialidad" onchange="actualizarAnio('addEspecialidad', 'addAnio')">
                                <option value="Ciclo basico">Ciclo basico</option>
                                <option value="Automotores">Automotores</option>
                                <option value="Computacion">Computacion</option>
                                <option value="DOE">DOE</option>
                            </select>
                        </div>
                        <br>
                        <div id="css-anio">
                            <label>Año:</label>
                            <select id="addAnio" name="txtAnio" onchange="actualizarMateria('addEspecialidad', 'addAnio', 'addMateria')">

                            </select>
                        </div>
                        <br>
                        <div id="css-materia">
                            <label>Materia:</label>
                            <select id="addMateria" name="txtMateria">

                            </select>
                        </div>
                    </div>
                    <br>
                    <div id="css-alineados2">
                        <div id="css-archivo">
                            <label>Archivo:</label>
                            <input type="file" required name="file">
                        </div>
                        <br>
                    </div>

                    <input type="submit" name="accion" id="agregar" onclick="confirmarAccion(event)" value="Agregar"> 
                </form>
            </div>

            <div class="avisos">
                <h2 class="titulo-color">Avisos para un correcto funcionamiento</h2>

                <ul>
                    <li>No se pueden agregar archivos cuyo peso es mayor a 50MB.</li>
                    <li>El nombre del archivo no debe exceder los 100 caracteres.</li>
                    <li>Evitar agregar archivos que lleguen al límite ya que ralentiza el rendimiento de la aplicación.</li>
                    <li>Siempre constatar de lo que se está descargando.</li>
                </ul>
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
        <script src="js/opciones.js"></script>
    </body>
</html>