/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package administrativo;

public class Producto {

    private String id;
    private String nombre;
    private float precioCompra;
    private float precioVenta;
    private int existencias;
    private String nombreFoto;

    public Producto() {
        this.nombre = "";
        this.id = "";
        this.precioCompra = 0;
        this.precioVenta = 0;
        this.existencias = 0;
        this.nombreFoto = "";

    }

    public Producto(String id, String nombre, float precioCompra, float precioVenta, int existencias, String nombreFoto) {
        this.id = id;
        this.nombre = nombre;
        this.precioCompra = precioCompra;
        this.precioVenta = precioVenta;
        this.existencias = existencias;
        this.nombreFoto = nombreFoto;
    }
    public Producto( String nombre, float precioCompra, float precioVenta, int existencias, String nombreFoto) {
       
        this.nombre = nombre;
        this.precioCompra = precioCompra;
        this.precioVenta = precioVenta;
        this.existencias = existencias;
        this.nombreFoto = nombreFoto;
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

    public float getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(float precioCompra) {
        this.precioCompra = precioCompra;
    }

    public float getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(float precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int getExistencias() {
        return existencias;
    }

    public void setExistencias(int existencias) {
        this.existencias = existencias;
    }

    public String getNombreFoto() {
        return nombreFoto;
    }

    public void setNombreFoto(String nombreFoto) {
        this.nombreFoto = nombreFoto;
    }
    

}
