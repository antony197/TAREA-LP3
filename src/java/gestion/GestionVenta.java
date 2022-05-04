/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestion;

import administrativo.Compra;
import administrativo.Producto;
import administrativo.Usuario;
import administrativo.Venta;
import conexion.AbstractDB;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class GestionVenta extends AbstractDB {

    public GestionVenta() {
        super();
    }

    public boolean crearVenta(Venta venta) {
        boolean flag = false;
        PreparedStatement pst = null;
        try {
            String sql = "call newVenta(?,?,?,?,?)";
            pst = this.conn.prepareStatement(sql);

            pst.setInt(1, venta.getIdUsuario());
            pst.setFloat(2, venta.getTotal());
            pst.setString(3, venta.getFecha());
            pst.setInt(4, venta.getCredito());
            pst.setFloat(5, venta.getAbono());

            if (pst.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    public Venta getLastVenta() {
        Venta ven = new Venta();

        try {
            Statement stmt = this.conn.createStatement();

            ResultSet res = stmt.executeQuery("call getLastVenta()");
            while (res.next()) {

                ven.setId(res.getInt("idVENTA"));
                ven.setIdUsuario(res.getInt("idUsuario"));
                ven.setTotal(res.getFloat("Total"));
                ven.setFecha(res.getString("fecha"));
                ven.setCredito(res.getInt("credito"));
                ven.setAbono(res.getFloat("abono"));

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return ven;

    }

    public boolean crearDetalles(int idventa, int idproducto, float precio, int cantidad) {
        boolean flag = false;
        PreparedStatement pst = null;
        try {
            String sql = "call newVentaProducto(?,?,?,?)";
            pst = this.conn.prepareStatement(sql);

            pst.setInt(1, idventa);
            pst.setInt(2, idproducto);
            pst.setFloat(3, precio);
            pst.setInt(4, cantidad);

            pst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    public void ClienteProducto(int idcli, int idprod) {
        PreparedStatement pst = null;
        try {
            String sql = "call newClienteProducto(?,?)";
            pst = this.conn.prepareStatement(sql);
            pst.setInt(1, idcli);
            pst.setInt(2, idprod);
            pst.executeQuery();

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public ArrayList<Venta> getTodos(int id) {
        ArrayList<Venta> ventas = new ArrayList();

        try {

            ResultSet res;
            PreparedStatement stmt = this.conn.prepareStatement("call getVentas(?)");
            stmt.setInt(1, id);

            res = stmt.executeQuery();
            while (res.next()) {
                Venta ven = new Venta();
                ven.setId(res.getInt("idVENTA"));
                ven.setFecha(res.getString("fecha"));
                ven.setTotal(res.getFloat("total"));
                ventas.add(ven);

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return ventas;

    }

    public ArrayList<Venta> getTodosCredito(int id) {
        ArrayList<Venta> ventas = new ArrayList();

        try {

            ResultSet res;
            PreparedStatement stmt = this.conn.prepareStatement("call getVentasCredito(?)");
            stmt.setInt(1, id);
            

            res = stmt.executeQuery();
            while (res.next()) {
                Venta ven = new Venta();
                ven.setId(res.getInt("idVENTA"));
                ven.setFecha(res.getString("fecha"));
                ven.setTotal(res.getFloat("total"));
                ven.setAbono(res.getFloat("abono"));
                ventas.add(ven);

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return ventas;

    }

    public ArrayList<Producto> getProductosVenta(int id) {
        ArrayList<Producto> compras = new ArrayList();

        try {

            ResultSet res;
            PreparedStatement stmt = this.conn.prepareStatement("call getProductosVenta(?)");
            stmt.setInt(1, id);

            res = stmt.executeQuery();
            while (res.next()) {
                Producto prod = new Producto();
                prod.setNombre(res.getString("Nombre"));
                prod.setPrecioCompra(res.getFloat("precio"));
                prod.setExistencias(res.getInt("cantidad"));

                compras.add(prod);

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return compras;

    }

    public ArrayList<Venta> getVentaFecha(int id,String inicio, String fin) {
        ArrayList<Venta> compras = new ArrayList();

        try {

            ResultSet res;
            PreparedStatement stmt = this.conn.prepareStatement("call getFacturaFechaUsuario(?,?,?)");
            stmt.setInt(1, id);
            stmt.setString(2, inicio);
            stmt.setString(3, fin);
            res = stmt.executeQuery();
            while (res.next()) {
                Venta com = new Venta();
                com.setId(res.getInt("idVenta"));
                com.setFecha(res.getString("Fecha"));
                com.setTotal(res.getFloat("total"));

                compras.add(com);

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return compras;

    }

    public ArrayList<Venta> getVentaFechaCredito(int id,String inicio, String fin) {
       ArrayList<Venta> compras = new ArrayList();

        try {

            ResultSet res;
            PreparedStatement stmt = this.conn.prepareStatement("call getFacturaFechaUsuarioCredito(?,?,?)");
            stmt.setInt(1, id);
            stmt.setString(2, inicio);
            stmt.setString(3, fin);
            res = stmt.executeQuery();
            while (res.next()) {
                Venta com = new Venta();
                com.setId(res.getInt("idVenta"));
                com.setFecha(res.getString("Fecha"));
                com.setTotal(res.getFloat("total"));
                com.setAbono(res.getFloat("abono"));

                compras.add(com);

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return compras;

    }

    public Venta getVenta(int id) {

        Venta com   = null;
        try {
            ResultSet res;
            PreparedStatement stmt = this.conn.prepareStatement("call getVenta(?)");
            stmt.setInt(1, id);

            res = stmt.executeQuery();
            while (res.next()) {
                com = new Venta();
                com.setId(res.getInt("idVenta"));
                com.setFecha(res.getString("Fecha"));
                com.setTotal(res.getFloat("total"));
                com.setAbono(res.getFloat("abono"));
                com.setIdUsuario(res.getInt("idUsuario"));
                com.setCredito(res.getInt("credito"));

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);

        }

        return com;

    }

    public boolean pagaFactura(int id, float cantidad) {
        boolean flag = false;
        PreparedStatement pst = null;
        try {
            String sql = "call AbonaFacturaUsuario(?,?)";
            pst = this.conn.prepareStatement(sql);

            pst.setInt(1, id);
            pst.setFloat(2, cantidad);

            if (pst.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    public void cierraConexion() {
        try {
            this.conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    //==========================================================================

}
