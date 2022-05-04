/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package administrativo;

public class Compra {

    private int id;
    private int idproveedor;
    private float total;
    private String fecha;
    private int credito;
    private float abono;

    public Compra() {
        this.id = 0;
        this.idproveedor = 0;
        this.total = 0;
        this.fecha = "";
        this.credito = -1;
        this.abono = 0;

    }

    public Compra(int id, int idproveedor, float total, String fecha, int credito, float abono) {
        this.id = id;
        this.idproveedor = idproveedor;
        this.total = total;
        this.fecha = fecha;
        this.credito = credito;
        this.abono = abono;
    }

    public Compra(int idproveedor, float total, String fecha, int credito, float abono) {

        this.idproveedor = idproveedor;
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

    public int getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(int idproveedor) {
        this.idproveedor = idproveedor;
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
