/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package administrativo;

public class Usuario {

    private String id;
    private String nombre;
    private String apellido;
    private String usuario;
    private String password;
    private String correo;
    private int rango;

    public Usuario() {
        this.nombre = "";
        this.apellido = "";
        this.usuario = "";
        this.password = "";
        this.correo = "";
        this.rango = 0;
        this.id = "";

    }

    public Usuario(String id ,String nombre, String apellido, String user, String pass, String correo, int rango) {
        this.id=id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.usuario = user;
        this.password = pass;
        this.correo = correo;
        this.rango = rango;

    }

    public Usuario(String id, String user, String pass, String correo, int rango) {
        this.id = id;
        this.usuario = user;
        this.password = pass;
        this.correo = correo;
        this.rango = rango;

    }

    public Usuario(String user, String password) {
        this.usuario = user;
        this.password = password;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getRango() {
        return rango;
    }

    public void setRango(int rango) {
        this.rango = rango;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    

}
