/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package administrativo;

public class Venta {

    private int id;
    private int idUsuario;
    private float total;
    private String fecha;
    private int credito;
    private float abono;

    public Venta() {
        this.id = 0;
        this.idUsuario = 0;
        this.total = 0;
        this.fecha = "";
        this.credito = -1;
        this.abono = 0;

    }

    public Venta(int id, int idUsuario, float total, String fecha, int credito, float abono) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.total = total;
        this.fecha = fecha;
        this.credito = credito;
        this.abono = abono;
    }

    public Venta(int idUsuario, float total, String fecha, int credito, float abono) {

        this.idUsuario = idUsuario;
        this.total = total;
        this.fecha = fecha;
        this.credito = credito;
        this.abono = abono;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getCredito() {
        return credito;
    }

    public void setCredito(int credito) {
        this.credito = credito;
    }

    public float getAbono() {
        return abono;
    }

    public void setAbono(float abono) {
        this.abono = abono;
    }
    
    

}
