<%@page import="Modelo.Archivo"%>
<%@page import="ModeloDAO.ArchivoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar archivo - Repositorio ET N°35</title>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js/opciones.js"></script>

        <script>
            function confirmarAccion(event) {
                if (!window.confirm("¿Esta seguro de que quiere realizar esta accion?")) {
                    event.preventDefault(); // Evita que el enlace siga su curso
                }
            }
        </script>

        <link rel="shortcut icon" href="img/et35logo.png"/>
        <script src="https://kit.fontawesome.com/9d2283b709.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <div>
            <%
                ArchivoDAO dao = new ArchivoDAO();
                int id = Integer.parseInt((String) request.getAttribute("idarch"));
                Archivo a = (Archivo) dao.list(id);
            %>
        </div>
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

        <div class="box-agregar">
            <h2 style="margin-bottom: 42px;">Modificar archivo</h2>

            <form action="<%= request.getContextPath()%>/Controlador" method="post" enctype="multipart/form-data">
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
                            <option>1</option>
                            <option>2</option>
                        </select>
                    </div>
                    <br>
                    <div id="css-materia">
                        <label>Materia:</label>
                        <select id="addMateria" name="txtMateria">
                            <option>Matematica</option>
                            <option>Lengua y literatura</option>
                            <option>Ingles</option>
                            <option>Historia</option>
                            <option>Geografia</option>
                            <option>Ed. ciudadana</option>
                            <option>Dibujo tecnico</option>
                            <option>Biologia</option>
                            <option>Ed. fisica</option>
                            <option>Ed. Artistica</option>
                            <option>Carpinteria</option>
                            <option>Hojalateria</option>
                            <option>Ajuste de banco</option>
                            <option>Electricidad</option>
                        </select>
                    </div>
                </div>
                <br>
                <div id="css-alineados2">
                    <div id="css-archivo">
                        <label>Archivo:</label>
                        <input type="file" required name="fileEdit">
                    </div>
                    <br>
                </div>

                <input type="hidden" name="txtNombreArchivo" value="<%= a.getNombre_archivo()%>">
                <input type="hidden" name="txtTipo" value="<%= a.getTipo()%>">
                <input type="hidden" name="txtid" value="<%= a.getId()%>">

                <div id="btn-volver-act">
                    <br> <input type="submit" id="agregar" onclick="confirmarAccion(event)" name="accion" value="Actualizar"> <br>
                    <br> <a id="volver" href="Controlador?accion=listar">Volver</a>
                </div>
            </form>
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