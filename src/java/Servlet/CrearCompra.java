/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import administrativo.Compra;
import gestion.GestionCompra;
import gestion.GestionProducto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CrearCompra extends HttpServlet {

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
        GestionCompra gc = new GestionCompra();
        GestionProducto gp = new GestionProducto();
        Compra compra;
        int idproveedor = Integer.parseInt(request.getParameter("proveedores"));
        String cred = request.getParameter("credito");
        int credito = 0;
        int cantidadFactura = Integer.parseInt(request.getParameter("cantidadFactura"));
        String fecha = request.getParameter("fechacompra");
        float total = 0;
       /* if (cred == null) {
            credito = 0;
        } else {
            credito = 1;
        }*/
        
        for (int i = 1; i <= cantidadFactura; i++) {
            
            Float precio = Float.parseFloat(request.getParameter("precio" + i));
            int cantidad = Integer.parseInt(request.getParameter("cantidad" + i));
            int idproducto = Integer.parseInt(request.getParameter("id" + i));
            gp.actualizarProducto(idproducto, cantidad, precio);
            
            total += cantidad * precio;
            gc.ProveedorProducto(idproveedor, idproducto);
            
        }
        compra = new Compra(idproveedor, total, fecha, credito, 0);
        
        if (gc.crearCompra(compra)) {
            response.getWriter().print("La compra ha sida registrado correctamente");
            for (int i = 1; i <= cantidadFactura; i++) {
                
                Float precio = Float.parseFloat(request.getParameter("precio" + i));
                int cantidad = Integer.parseInt(request.getParameter("cantidad" + i));
                int idproducto = Integer.parseInt(request.getParameter("id" + i));
                
                gc.crearDetalles(gc.getLastCompra().getId(), idproducto, precio, cantidad);
                
            }
        } else {
            response.getWriter().print("El producto no ha sido registrado correctamente");
            
        }
        response.sendRedirect("facturaCompra.jsp?id=" + gc.getLastCompra().getId());
        response.getWriter().print("Asociado a la compra " + gc.getLastCompra().getId());
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
