package mx.edu.utez.model.electronicDevices;

import mx.edu.utez.model.address.BeanAddress;

public class BeanElectronicDevices {
    private int id;
    private String nombre;
    private BeanAddress addressId;
    private String fechaRegistro;
    private int status;

    public BeanElectronicDevices() {
    }

    public BeanElectronicDevices(int id, String nombre, BeanAddress addressId, String fechaRegistro, int status) {
        this.id = id;
        this.nombre = nombre;
        this.addressId = addressId;
        this.fechaRegistro = fechaRegistro;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;

    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public BeanAddress getAddressId() {
        return addressId;
    }

    public void setAddressId(BeanAddress addressId) {
        this.addressId = addressId;
    }

    public String getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(String fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
