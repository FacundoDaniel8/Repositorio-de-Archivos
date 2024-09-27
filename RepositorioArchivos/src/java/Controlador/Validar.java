/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.CuentaProfesor;
import ModeloDAO.CuentaProfesorDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author w10
 */
@WebServlet(name = "Validar", urlPatterns = {"/Validar"})
public class Validar extends HttpServlet {

    CuentaProfesorDAO uDAO = new CuentaProfesorDAO();
    CuentaProfesor us = new CuentaProfesor();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        HttpSession session = request.getSession();

        if (accion.equalsIgnoreCase("Ingresar")) {
            String user = request.getParameter("txtUser");
            String pass = request.getParameter("txtPass");
            String email = request.getParameter("txtEmail");

            us = uDAO.validar(user, email, pass);

            if (us.getEmail() != null) {
                session.setAttribute("profesor", us);
                response.sendRedirect("Controlador?accion=listar");
            } else {
                session.setAttribute("mensaje", "Usuario, email, o clave incorrectos");
                response.sendRedirect("index.jsp");
            }

        } else if (accion.equalsIgnoreCase("Aplicar cambio")) {
            String actualPass = request.getParameter("actualPass");
            String nuevaPass = request.getParameter("nuevaPass");
            String nuevaPass2 = request.getParameter("nuevaPass2");

            us = (CuentaProfesor) session.getAttribute("profesor");

            if (us != null) {
                String claveEncriptada = uDAO.obtenerClaveEncriptada(actualPass);

                if (!claveEncriptada.equals(us.getClave()) && request.getParameter("actualPass") != null) {
                    session.setAttribute("mensaje", "ERROR: La clave actual no coincide con la recien ingresada");
                    response.sendRedirect(request.getContextPath() + "/cambiarClave.jsp");
                    return;
                }

                if (!nuevaPass.equals(nuevaPass2)) {
                    session.setAttribute("mensaje", "ERROR: Las nuevas claves no coinciden");
                    response.sendRedirect(request.getContextPath() + "/cambiarClave.jsp");
                    return;
                }

                if (!uDAO.verificarClave(nuevaPass)) {
                    session.setAttribute("mensaje", "ERROR: La nueva clave debe contener 8 o mas caracteres y al menos un numero");
                    response.sendRedirect(request.getContextPath() + "/cambiarClave.jsp");
                    return;
                }

                uDAO.cambiarClave(us.getUsuario(), nuevaPass, false);
                us.setClave(uDAO.obtenerClaveEncriptada(nuevaPass)); // Actualizar la clave en el objeto Usuario
                session.setAttribute("profesor", us);
                response.sendRedirect("Controlador?accion=listar");
            } else {
                session.setAttribute("mensaje", "Debe iniciar sesion para cambiar la clave.");
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }

        } else if (accion.equalsIgnoreCase("Cambiar")) {

            String email = request.getParameter("email_id");
            String nuevaPass = request.getParameter("nuevaPass");
            String nuevaPass2 = request.getParameter("nuevaPass2");

            if (!nuevaPass.equals(nuevaPass2)) {
                session.setAttribute("mensaje", "ERROR: Las nuevas claves no coinciden");
            }

            if (!uDAO.verificarClave(nuevaPass)) {
                session.setAttribute("mensaje", "ERROR: La nueva clave debe contener 8 o más caracteres y al menos un número");
            }

            // Recuperar al usuario mediante el correo electrónico
            CuentaProfesor profesor = uDAO.obtenerPorEmail(email);

            if (profesor != null) {
                uDAO.cambiarClave(email, nuevaPass, true); // Actualiza la contraseña por email
                session.setAttribute("profesor", profesor); // Actualiza el objeto profesor en la sesión
            } else {
                session.setAttribute("mensaje", "ERROR: El correo no corresponde a ningún usuario");
                response.sendRedirect(request.getContextPath() + "/enviarCodigo.jsp");
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
