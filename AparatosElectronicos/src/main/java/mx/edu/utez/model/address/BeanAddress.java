package mx.edu.utez.model.address;

public class BeanAddress {
    private int idAddress;
    private String calle;
    private String colonia;
    private int codigoPostal;
    private String estado;
    private String pais;

    public BeanAddress() {
    }

    public BeanAddress(int idAddress, String calle, String colonia, int codigoPostal, String estado, String pais) {
        this.idAddress = idAddress;
        this.calle = calle;
        this.colonia = colonia;
        this.codigoPostal = codigoPostal;
        this.estado = estado;
        this.pais = pais;
    }

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public int getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(int codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
}
