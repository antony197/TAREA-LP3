package gestion;

import administrativo.Producto;
import administrativo.Usuario;
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

public class GestionProducto extends AbstractDB {

    public GestionProducto() {
        super();
    }

    public boolean crearProducto(Producto prod) {
        boolean flag = false;
        PreparedStatement pst = null;
        try {
            String sql = "call newProducto(?,?,?,?,?)";
            pst = this.conn.prepareStatement(sql);
            System.out.println(prod.getNombre());
            pst.setString(1, prod.getNombre());
            pst.setFloat(2, prod.getPrecioCompra());
            pst.setFloat(3, prod.getPrecioVenta());
            pst.setInt(4, prod.getExistencias());
            pst.setString(5, prod.getNombreFoto());

            if (pst.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    public void actualizarProducto(int id, int cantidad, float precio) {
        PreparedStatement pst = null;
        try {
            String sql = "call updateProductoCompra(?,?,?)";
            pst = this.conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setInt(2, cantidad);
            pst.setFloat(3, precio);
            pst.executeQuery();

        } catch (Exception E) {
            System.err.println(E.getMessage());
        }
    }

    public void restarExistencia(int id, int cantidad) {
        PreparedStatement pst = null;
        try {
            String sql = "call updateProductoVenta(?,?)";
            pst = this.conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setInt(2, cantidad);

            pst.executeQuery();

        } catch (Exception E) {
            System.err.println(E.getMessage());
        }
    }

    public void modificarProducto(int id, String nombre, float precio) {
        PreparedStatement pst = null;
        try {
            String sql = "call modificarProducto(?,?,?)";
            pst = this.conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setString(2, nombre);
            pst.setFloat(3, precio);

            pst.executeQuery();

        } catch (Exception E) {
            System.err.println(E.getMessage());
        }
    }
    public void deleteProducto(int id){
        PreparedStatement pst = null;
        try {
            String sql = "call deleteProducto(?)";
            pst = this.conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeQuery();
        } catch (Exception E) {
            System.err.println(E.getMessage());
        }
    }

    public ArrayList<Producto> getTodos() {
        ArrayList<Producto> productos = new ArrayList();

        try {
            Statement stmt = this.conn.createStatement();

            ResultSet res = stmt.executeQuery("call getAllProducts()");
            while (res.next()) {
                Producto prod = new Producto();
                prod.setId(res.getString("idProducto"));
                prod.setNombre(res.getString("nombre"));
                prod.setPrecioCompra(res.getFloat("precioCompra"));
                prod.setPrecioVenta(res.getFloat("precioVenta"));
                prod.setExistencias(res.getInt("existencias"));
                prod.setNombreFoto(res.getString("nombreFoto"));

                productos.add(prod);

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return productos;

    }

    public ArrayList<Producto> getBusqueda(String nombre) {
        ArrayList<Producto> productos = new ArrayList();

        try {
            ResultSet res;
            PreparedStatement stmt = this.conn.prepareStatement("call getBusqueda(?)");
            stmt.setString(1, nombre);

            res = stmt.executeQuery();
            while (res.next()) {
                Producto prod = new Producto();
                prod.setId(res.getString("idProducto"));
                prod.setNombre(res.getString("Nombre"));
                prod.setPrecioVenta(res.getFloat("precioVenta"));
                prod.setExistencias(res.getInt("Existencias"));
                prod.setNombreFoto(res.getString("nombreFoto"));
                
                productos.add(prod);
            }
            res.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return productos;
    }

    public void cierraConexion() {
        try {
            this.conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    //==========================================================================

    public Producto getProducto(int id) {
        Producto prod = new Producto();

        try {

            ResultSet res;
            PreparedStatement stmt = this.conn.prepareStatement("call getProducto(?)");
            stmt.setInt(1, id);

            res = stmt.executeQuery();
            while (res.next()) {

                prod.setId(res.getString("idProducto"));
                prod.setNombre(res.getString("Nombre"));
                prod.setPrecioVenta(res.getFloat("precioVenta"));
                prod.setExistencias(res.getInt("Existencias"));
                prod.setNombreFoto(res.getString("nombreFoto"));
            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return prod;

    }
}
