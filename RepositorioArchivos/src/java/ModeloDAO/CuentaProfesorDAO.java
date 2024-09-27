package ModeloDAO;

import Config.Conexion;
import Modelo.CuentaProfesor;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

/**
 *
 * @author w10
 */
public class CuentaProfesorDAO {

    private final Conexion cn = new Conexion();
    private PreparedStatement ps;
    private ResultSet rs;

    public CuentaProfesor validar(String usuarioBuscar, String emailBuscar, String claveBuscar) {

        CuentaProfesor us = new CuentaProfesor();

        String sql = "select * from profesor where usuario=? and email=? and clave=?";

        Connection con = cn.getConnection();

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, usuarioBuscar);
            ps.setString(2, emailBuscar);
            ps.setString(3, obtenerClaveEncriptada(claveBuscar));
            rs = ps.executeQuery();

            while (rs.next()) {

                us.setCodigo(rs.getInt("cod_profesor"));
                us.setUsuario(rs.getString("usuario"));
                us.setEmail(rs.getString("email"));
                us.setClave(rs.getString("clave"));
            }

        } catch (SQLException e) {

        }

        return us;
    }

    public void cambiarClave(String usuarioBuscar, String nuevaClave, boolean esCorreo) {
        String sqlUsuario = "UPDATE profesor SET clave = ? WHERE usuario = ?";
        String sqlCorreo = "UPDATE profesor SET clave = ? WHERE email = ?";

        Connection con = cn.getConnection();

        try {
            if (!esCorreo) {
                ps = con.prepareStatement(sqlUsuario);
                ps.setString(2, usuarioBuscar); // Actualizar clave por usuario
            } else {
                ps = con.prepareStatement(sqlCorreo);
                ps.setString(2, usuarioBuscar); // Actualizar clave por correo
            }
            ps.setString(1, obtenerClaveEncriptada(nuevaClave));
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String obtenerClaveEncriptada(String clave) {

        String textoBase64 = "";

        try {

            MessageDigest almacen = MessageDigest.getInstance("MD5");
            byte[] infoCifrada = almacen.digest(clave.getBytes());
            textoBase64 = Base64.getEncoder().encodeToString(infoCifrada);

        } catch (NoSuchAlgorithmException e) {

        }

        return textoBase64;
    }

    public boolean verificarClave(String clave) {

        boolean cumple = true;
        boolean tieneNumero = false;
        char[] numeros = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};
        int i = 0, j = 0;

        if (clave.length() > 8) {

            do {
                do {
                    if (clave.charAt(i) == numeros[j]) {

                        tieneNumero = true;
                    }
                    j++;

                } while (j < numeros.length && !tieneNumero);

                i++;
                j = 0;

            } while (!tieneNumero && i < clave.length());

            if (!tieneNumero) {

                cumple = false;
            }

        } else {

            cumple = false;
        }

        return cumple;
    }

    public CuentaProfesor obtenerPorEmail(String email) {
        CuentaProfesor profesor = null;
        String sql = "SELECT * FROM profesor WHERE email = ?";

        try {
            Connection con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                profesor = new CuentaProfesor();
                profesor.setCodigo(rs.getInt("cod_profesor"));
                profesor.setUsuario(rs.getString("usuario"));
                profesor.setEmail(rs.getString("email"));
                profesor.setClave(rs.getString("clave"));
            }
        } catch (SQLException e) {
        }

        return profesor;
    }

}
