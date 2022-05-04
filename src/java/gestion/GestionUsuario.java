/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestion;

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

public class GestionUsuario extends AbstractDB {

    public GestionUsuario() {
        super();
    }

    public boolean crearUsuario(Usuario us) {
        boolean flag = false;
        PreparedStatement pst = null;
        try {
            String sql = "call newUser(?,?,?,?,?,?,?)";
            pst = this.conn.prepareStatement(sql);
            pst.setString(1, us.getId());
            pst.setString(2, us.getNombre());
            pst.setString(3, us.getApellido());
            pst.setString(4, us.getUsuario());
            pst.setString(5, us.getPassword());
            pst.setString(6, us.getCorreo());
            pst.setInt(7, us.getRango());

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

    

    public Usuario loginUsuario(String usuario, String pass) {
        Usuario user = null;
        

        try {
            ResultSet res;
            PreparedStatement stmt = this.conn.prepareStatement("call autenticar(?,?)");
            stmt.setString(1, usuario);
            stmt.setString(2, pass);

            res = stmt.executeQuery();
            while (res.next()) {
                user = new Usuario();
                user.setId(res.getString("idUsuario"));
                user.setNombre(res.getString("nombre"));
                user.setApellido("apellido");
                user.setUsuario(res.getString("usuario"));
                user.setPassword(res.getString("password"));
                user.setCorreo(res.getString("correo"));
                user.setRango(res.getInt("rango"));

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
           

        }
        return user;
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
