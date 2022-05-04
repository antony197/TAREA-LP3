/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestion;

import administrativo.Producto;
import administrativo.Proveedor;
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

public class GestionProveedor extends AbstractDB {

    public GestionProveedor() {
        super();
    }

    public boolean crearProveedor(Proveedor prov) {
        boolean flag = false;
        PreparedStatement pst = null;
        try {
            String sql = "call newProveedor(?)";
            pst = this.conn.prepareStatement(sql);
            
            pst.setString(1, prov.getNombre());
            

            if (pst.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            cierraConexion();
        }
        return flag;
    }

    public ArrayList<Proveedor> getTodos() {
        ArrayList<Proveedor> proveedores = new ArrayList();

        try {
            Statement stmt = this.conn.createStatement();

            ResultSet res = stmt.executeQuery("call getAllProveedores()");
            while (res.next()) {
                Proveedor prod = new Proveedor();
                prod.setId(res.getString("idProveedor"));
                prod.setNombre(res.getString("nombre"));
                

                proveedores.add(prod);
                

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return proveedores;

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
