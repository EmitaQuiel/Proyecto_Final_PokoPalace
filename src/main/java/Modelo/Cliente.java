package Modelo;

//        Objeto que representa un cliente el cual guarda sus atributos

public class Cliente {

    private int id_Cliente;
    private String cedula;
    private String nombre;
    private String apellidos;
    private String telefono;
    private String direccion;
    private String provincia;
    private String canton;
    private String distrito;
    private String email;
    
    public Cliente() {
    }

//    Esto es un constructor el cual inicializa los atributos del objeto despues de proporcionarle los valores.
    
    public Cliente(int id_Cliente, String cedula, String nombre, String apellidos, String telefono, String direccion, String provincia, String canton, String distrito, String email) {
        this.id_Cliente = id_Cliente;
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.direccion = direccion;
        this.provincia = provincia;
        this.canton = canton;
        this.distrito = distrito;
        this.email = email;
    }

    public int getId_Cliente() {
        return id_Cliente;
    }

    public void setId_Cliente(int id_Cliente) {
        this.id_Cliente = id_Cliente;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getCanton() {
        return canton;
    }

    public void setCanton(String canton) {
        this.canton = canton;
    }

    public String getDistrito() {
        return distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
