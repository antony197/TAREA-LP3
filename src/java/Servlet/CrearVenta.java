/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import administrativo.Compra;
import administrativo.Producto;
import administrativo.Venta;
import gestion.GestionCompra;
import gestion.GestionProducto;
import gestion.GestionVenta;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CrearVenta extends HttpServlet {

    private Object session;

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
        GestionVenta gv = new GestionVenta();
        GestionProducto gp = new GestionProducto();
        HttpSession sesion = request.getSession(true);
        ArrayList<Producto> cart;
        cart = (ArrayList<Producto>) sesion.getAttribute("cart");
        Venta venta;
        int idUsuario = Integer.parseInt((String) sesion.getAttribute("id"));
        String cred = request.getParameter("credito");
        int credito = 0;
        int cantidadFactura = cart.size();
        String fecha = LocalDate.now().toString();
        float total = 0;
        /*if (cred == null) {
            credito = 0;
        } else {
            credito = 1;
        }*/
        if (cantidadFactura == 0) {
            response.getWriter().print("Seleccione al menos un producto");
            response.sendRedirect("carrito.jsp");
        } else {
            for (int i = 0; i < cantidadFactura; i++) {
                Float precio = cart.get(i).getPrecioVenta();
                int cantidad = cart.get(i).getExistencias();
                int idproducto = Integer.parseInt(cart.get(i).getId());
                gp.restarExistencia(idproducto, cantidad);

                total += cantidad * precio;
                gv.ClienteProducto(idUsuario, idproducto);
            }
            venta = new Venta(idUsuario, total, fecha, credito, 0);

            if (gv.crearVenta(venta)) {
                response.getWriter().print("La compra ha sida registrado correctamente");
                for (int i = 0; i < cantidadFactura; i++) {

                    Float precio = cart.get(i).getPrecioVenta();
                    int cantidad = cart.get(i).getExistencias();
                    int idproducto = Integer.parseInt(cart.get(i).getId());
                    gv.crearDetalles(gv.getLastVenta().getId(), idproducto, precio, cantidad);
                }
            } else {
                response.getWriter().print("El producto no ha sido registrado correctamente");
            }
       // response.sendRedirect("factura.jsp?id=" + gc.getLastCompra().getId());
            //response.getWriter().print("Asociado a la compra " + gc.getLastCompra().getId());
            cart.clear();
            sesion.setAttribute("cart", cart);
            response.sendRedirect("detalles_factura.jsp?id=" + gv.getLastVenta().getId());
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
