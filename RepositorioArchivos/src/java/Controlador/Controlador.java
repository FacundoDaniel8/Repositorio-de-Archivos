package Controlador;

import Modelo.Archivo;
import Modelo.CuentaProfesor;
import ModeloDAO.ArchivoDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/Controlador")
@MultipartConfig
public class Controlador extends HttpServlet {

    Archivo a = new Archivo();
    ArchivoDAO dao = new ArchivoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        CuentaProfesor usuario = (CuentaProfesor) session.getAttribute("profesor");
        RequestDispatcher rd;
        
        String action = request.getParameter("accion");

        if (usuario == null) {
            // Si alguien quiere entrar al main sin la cuenta, no puede
            response.sendRedirect("index.jsp");
            return;
        }

        if (action.equalsIgnoreCase("listar") || action.equalsIgnoreCase("Buscar")) {
            
            rd = request.getRequestDispatcher("main.jsp");
            rd.forward(request, response);

        } else if (action.equalsIgnoreCase("editar")) {

            request.setAttribute("idarch", request.getParameter("ID"));
            
            rd = request.getRequestDispatcher("edit.jsp");
            rd.forward(request, response);

        } else if (action.equalsIgnoreCase("Cambiar clave")) {
            
            rd = request.getRequestDispatcher("cambiarClave.jsp");
            rd.forward(request, response);

        } else if (action.equalsIgnoreCase("Salir")) {
            
            session.invalidate();
            
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

        } else if (action.equalsIgnoreCase("eliminar")) {

            int id = Integer.parseInt(request.getParameter("ID"));
            a.setId(id);
            dao.eliminar(id);
            session.setAttribute("mensaje", "El archivo fue eliminado con exito");
            
            rd = request.getRequestDispatcher("main.jsp");
            rd.forward(request, response);
            
        } else if (action.equalsIgnoreCase("descargar")) {

            int id = Integer.parseInt(request.getParameter("ID"));
            a.setId(id);
            dao.descargar(id, response);
            
            rd = request.getRequestDispatcher("main.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("accion");

        HttpSession session = request.getSession(false);
        CuentaProfesor usuario = (CuentaProfesor) session.getAttribute("profesor");
        RequestDispatcher rd;
        
        if (action.equalsIgnoreCase("Agregar")) {
            
            Part filePart = request.getPart("file");

            String especialidad = request.getParameter("txtEspecialidad");
            String anio = request.getParameter("txtAnio");
            String materia = request.getParameter("txtMateria");
            String nombre_arch = filePart.getSubmittedFileName();
            String usuario_profe = usuario.getUsuario();
            String tipo = "";
            long peso = filePart.getSize();
            int cod_profesor = usuario.getCodigo();

            int i = nombre_arch.lastIndexOf('.');
            if (i > 0) {
                tipo = nombre_arch.substring(i + 1);
            }

            tipo = verTipo(tipo);

            a.setEspecialidad(especialidad);
            a.setAnio(anio);
            a.setMateria(materia);
            a.setNombre_archivo(nombre_arch);
            a.setUsuario_profe(usuario_profe);
            a.setTipo(tipo);
            a.setPeso(peso);
            a.setCod_profesor(cod_profesor);

            if (a != null) {

                dao.add(a, filePart);
                session.setAttribute("mensaje", "El archivo fue agregado con exito");
            }

        } 
        
        if (action.equalsIgnoreCase("Actualizar")) {

            Part filePart = request.getPart("fileEdit");
            
            int id = Integer.parseInt(request.getParameter("txtid"));
            String especialidad = request.getParameter("txtEspecialidad");
            String anio = request.getParameter("txtAnio");
            String materia = request.getParameter("txtMateria");
            String nombre_arch = filePart.getSubmittedFileName();
            String usuario_profe = usuario.getUsuario();
            String tipo = "";
            long peso = filePart.getSize();
            int cod_profesor = usuario.getCodigo();

            int i = nombre_arch.lastIndexOf('.');
            if (i > 0) {
                tipo = nombre_arch.substring(i + 1);
            }

            tipo = verTipo(tipo);

            a.setId(id);
            a.setEspecialidad(especialidad);
            a.setAnio(anio);
            a.setMateria(materia);
            a.setNombre_archivo(nombre_arch);
            a.setUsuario_profe(usuario_profe);
            a.setTipo(tipo);
            a.setPeso(peso);
            a.setCod_profesor(cod_profesor);

            if (a != null) {

                dao.edit(a, filePart);
                session.setAttribute("mensaje", "El archivo fue editado con exito");
            }
        }
        rd = request.getRequestDispatcher("main.jsp");
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public String verTipo(String tipo) {

        tipo = tipo.toLowerCase();
        
        switch (tipo) {

            case "doc":
            case "docx":
            case "txt":
            case "gdoc":
            case "pdf":
                tipo = "Documento de texto";
                break;

            case "xls":
            case "xlsx":
            case "csv":
                tipo = "Hoja de calculo";
                break;

            case "pps":
            case "ppt":
            case "pptx":
                tipo = "Presentacion";
                break;
            
            case "exe":
                tipo = "Ejecutable";
                break;

            case "jpg":
            case "gif":
            case "bmp":
            case "png":
            case "tif":
            case "svg":
                tipo = "Imagen";
                break;

            case "avi":
            case "mp4":
            case "mpeg":
            case "mwv":
            case "mov":
                tipo = "Video";
                break;

            case "mp3":
            case "wav":
            case "wma":
                tipo = "Audio de voz";
                break;

            case "zip":
            case "rar":
            case "tar":
                tipo = "Comprimido";
                break;

            default:
                tipo = "Desconocido";
                break;
        }

        return tipo;
    }

}