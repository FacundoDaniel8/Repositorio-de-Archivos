package Modelo;

/**
 *
 * @author w10
 */
public class CuentaProfesor {
    
    private int codigo;
    private String usuario;
    private String email;
    private String clave;

    public CuentaProfesor(){
        
        
    }

    public CuentaProfesor(int codigo, String usuario, String email, String clave) {
        this.codigo = codigo;
        this.usuario = usuario;
        this.email = email;
        this.clave = clave;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
}
