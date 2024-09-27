package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUD;
import Modelo.Archivo;
import com.mysql.cj.jdbc.Blob;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class ArchivoDAO implements CRUD {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Archivo a = new Archivo();

    @Override
    public List listar(String especialidad, String anio, String materia) {

        ArrayList<Archivo> list = new ArrayList<>();
        String sql = "";

        if (especialidad != null && anio != null && materia != null) {

            sql = "select * from archivos where especialidad = '"
                    + especialidad + "' AND anio = '" + anio + "' AND materia = '" + materia + "'";

        } else {

            sql = "select * from archivos LIMIT 10";
        }

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                Archivo arch = new Archivo();
                arch.setId(rs.getInt("ID"));
                arch.setEspecialidad(rs.getString("especialidad"));
                arch.setAnio(rs.getString("anio"));
                arch.setMateria(rs.getString("materia"));
                arch.setNombre_archivo(rs.getString("nombre_archivo"));
                arch.setUsuario_profe(rs.getString("usuario_profesor"));
                arch.setTipo(rs.getString("tipo"));
                arch.setPeso(rs.getInt("peso_bytes"));

                list.add(arch);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    @Override
    public Archivo list(int id) {

        String sql = "select * from archivos where ID=" + id;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                a.setId(rs.getInt("ID"));
                a.setEspecialidad(rs.getString("especialidad"));
                a.setAnio(rs.getString("anio"));
                a.setMateria(rs.getString("materia"));
                a.setNombre_archivo(rs.getString("nombre_archivo"));
                a.setUsuario_profe(rs.getString("usuario_profesor"));
                a.setTipo(rs.getString("tipo"));
                a.setPeso(rs.getInt("peso_bytes"));
            }
        } catch (SQLException e) {
        }

        return a;
    }

    @Override
    public boolean add(Archivo arch, Part filePart) {
        String sql = "insert into archivos(especialidad, anio, materia, nombre_archivo, usuario_profesor, tipo, peso_bytes, cod_profesor, contenido) values (?,?,?,?,?,?,?,?,?)";

        try (InputStream fis = filePart.getInputStream()) {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, arch.getEspecialidad());
            ps.setString(2, arch.getAnio());
            ps.setString(3, arch.getMateria());
            ps.setString(4, arch.getNombre_archivo());
            ps.setString(5, arch.getUsuario_profe());
            ps.setString(6, arch.getTipo());
            ps.setLong(7, arch.getPeso());
            ps.setInt(8, arch.getCod_profesor());
            ps.setBinaryStream(9, fis, (int) filePart.getSize());
            ps.executeUpdate();
        } catch (SQLException | IOException e) {
            // Manejo de excepciones
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean edit(Archivo arch, Part filePart) {

        String sql = "UPDATE archivos SET especialidad=?, anio=?, materia=?, nombre_archivo=?, usuario_profesor=?, tipo=?, peso_bytes=?, cod_profesor=?, contenido=? WHERE ID=" + arch.getId();

        try (InputStream fis = filePart.getInputStream()) {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, arch.getEspecialidad());
            ps.setString(2, arch.getAnio());
            ps.setString(3, arch.getMateria());
            ps.setString(4, arch.getNombre_archivo());
            ps.setString(5, arch.getUsuario_profe());
            ps.setString(6, arch.getTipo());
            ps.setLong(7, arch.getPeso());
            ps.setInt(8, arch.getCod_profesor());
            ps.setBinaryStream(9, fis, (int) filePart.getSize());
            ps.executeUpdate();
        } catch (SQLException | IOException e) {
            // Manejo de excepciones
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean eliminar(int id) {

        String sql = "delete from archivos where ID=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
        }

        return true;
    }

    public boolean descargar(int id, HttpServletResponse response) throws IOException {
        String sql = "SELECT nombre_archivo, tipo, contenido FROM archivos WHERE id=? ";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                String fileName = rs.getString("nombre_archivo");
                String fileType = rs.getString("tipo");
                byte[] contenido = rs.getBytes("contenido");

                response.setContentType(fileType);
                response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                response.setContentLength(contenido.length);

                try (OutputStream out = response.getOutputStream()) {
                    out.write(contenido);
                    System.out.println("Archivo descargado correctamente");
                } catch (IOException e) {
                    System.out.println("Error al escribir archivo: " + e.getMessage());
                }
            }

        } catch (SQLException e) {
            // handle exception
        }

        return true;
    }

    @Override
    public boolean descargar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}