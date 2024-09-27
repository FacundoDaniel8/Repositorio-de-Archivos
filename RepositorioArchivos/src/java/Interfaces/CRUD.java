package Interfaces;

import Modelo.Archivo;
import java.util.List;
import javax.servlet.http.Part;

public interface CRUD {
    
    public List listar(String especialidad, String anio, String materia);
    public Archivo list(int id);
    public boolean add(Archivo arch, Part filePart);
    public boolean edit(Archivo arch, Part filePart);
    public boolean eliminar(int id);
    public boolean descargar(int id);
}
