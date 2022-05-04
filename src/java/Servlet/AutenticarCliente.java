/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import administrativo.Producto;
import administrativo.Usuario;
import gestion.GestionUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AutenticarCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Usuario us = new Usuario(username, password);
        GestionUsuario gu = new GestionUsuario();
        HttpSession sesion = request.getSession(true);
        out.println("<p>Entro a usuario" + username + " " + password + "</p>");
        if (gu.loginUsuario(username, password) != null) {
            Usuario user = gu.loginUsuario(username, password);
            out.println("<p>Entro a usuario</p>" + user.getUsuario() + user.getRango() + user.getCorreo());
            if (user.getRango() == 1) {
                sesion.setAttribute("id", user.getId());
                sesion.setAttribute("username", username);
                sesion.setAttribute("correo", user.getCorreo());
                sesion.setAttribute("rango", user.getRango());
                sesion.setAttribute("cart",new ArrayList<Producto>());
                response.sendRedirect("./productos.jsp");
            } else {
                out.println("<p>no Entro a rango</p>" + user.getUsuario() + user.getRango());
                response.sendRedirect("index.jsp");
            }
        } else {
            out.println("null");
            response.sendRedirect("index.jsp");
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
