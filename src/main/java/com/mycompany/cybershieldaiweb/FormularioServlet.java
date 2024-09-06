/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.cybershieldaiweb;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet que maneja el procesamiento del formulario de inicio de sesión.
 * Redirige al usuario a la página correspondiente en función de la autenticación.
 *
 * @author jjer
 */
@WebServlet("/procesarFormulario") // Ruta URL donde se mapea este servlet
        
      public class FormularioServlet extends HttpServlet {
    // Credenciales válidas (hard-coded para simplicidad)
    private static final String USUARIO_VALIDO = "jessica@gmail.com";
    private static final String CLAVE_VALIDA = "12345678";
 /**
     * Maneja las solicitudes GET redirigiendo al usuario al formulario de inicio de sesión.
     *
     * @param request  El objeto HttpServletRequest que contiene la solicitud del cliente
     * @param response El objeto HttpServletResponse que contiene la respuesta del servlet
     * @throws ServletException Si ocurre un error específico del servlet
     * @throws IOException Si ocurre un error de entrada/salida
     */
    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirige a la página de inicio de sesión (index.html) cuando se accede a través de GET
        response.sendRedirect("index.html");
    }

    /**
     * Maneja las solicitudes POST procesando los datos del formulario de inicio de sesión.
     * 
     * @param request  El objeto HttpServletRequest que contiene la solicitud del cliente
     * @param response El objeto HttpServletResponse que contiene la respuesta del servlet
     * @throws ServletException Si ocurre un error específico del servlet
     * @throws IOException Si ocurre un error de entrada/salida
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera los parámetros 'usuario' y 'clave' del formulario
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        
        // Verifica si las credenciales proporcionadas son correctas
        if (USUARIO_VALIDO.equals(usuario) && CLAVE_VALIDA.equals(clave)) {
            // Si las credenciales son correctas, redirige a la página 'bienvenido.jsp'
            request.getRequestDispatcher("bienvenido.jsp").forward(request, response);

        } else {
            // Si las credenciales son incorrectas, establece un mensaje de error y redirige a 'error.jsp'
            request.setAttribute("error", "Usuario o Clave incorrectos"); // Mensaje de error a mostrar
            request.setAttribute ("errorExist", true); // Indica que hay un error presente
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }
}