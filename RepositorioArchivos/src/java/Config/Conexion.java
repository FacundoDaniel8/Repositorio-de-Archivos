package Config;

import java.sql.*;

public class Conexion {

    Connection con;

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/repositorio", "root", "");
        } catch (ClassNotFoundException e) {
            System.err.println("Error: No se encontró el driver JDBC: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error en la conexión SQL: " + e.getMessage());
        }
    }

    public Connection getConnection() {
        return con;
    }
}
