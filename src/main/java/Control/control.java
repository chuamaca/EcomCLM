package Control;

import DAO.DCategoria;
import Beans.MCategoria;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@ViewScoped

public class control implements Serializable {
    private MCategoria categoria;
    private List<MCategoria> categorias;
    private DCategoria dao;

    @PostConstruct
    public void init() {
        categoria = new MCategoria();
        dao = new DCategoria();
        listarCategorias();
    }

    public void listarCategorias() {
        categorias = dao.obtenerCategorias();
    }

    public void guardar() {
    try {
        if (categoria.getFechaCrea() == null) {
            categoria.setFechaCrea(new Date());
        }
        
        dao.insertarCategoria(categoria);
        limpiar();
        listarCategorias();
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Categoría guardada con éxito", ""));
    } catch (Exception e) {
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error al guardar la categoría", e.getMessage()));
    }
}

    public void actualizar() {
        try {
            dao.actualizarCategoria(categoria);
            limpiar();
            listarCategorias();
            FacesContext context = FacesContext.getCurrentInstance();
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Categoría actualizada con éxito", ""));
        } catch (Exception e) {
            FacesContext context = FacesContext.getCurrentInstance();
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error al actualizar la categoría", e.getMessage()));
        }
    }

    public void eliminar(MCategoria cat) {
        dao.eliminarCategoria(cat.getIdCategoria());
        listarCategorias();
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Categoria eliminada con éxito", ""));
    }

    public void limpiar() {
        categoria = new MCategoria();
    }

    public MCategoria getCategoria() {
        return categoria;
    }

    public void setCategoria(MCategoria categoria) {
        this.categoria = categoria;
    }

    public List<MCategoria> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<MCategoria> categorias) {
        this.categorias = categorias;
    }
}
