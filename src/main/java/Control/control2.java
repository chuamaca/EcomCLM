package Control;

import Beans.MCategoria;
import Beans.MProducto;
import DAO.DCategoria;
import DAO.DProducto;
import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;
import java.io.Serializable;
import java.util.List;

@Named
@RequestScoped
public class control2 implements Serializable {

    private List<MCategoria> categorias;
    private MCategoria categoriaSeleccionada;
    private List<MProducto> productos;

    @Inject
    private DCategoria daoCategoria;

    @Inject
    private DProducto daoProducto;

    @PostConstruct
    public void init() {
        categorias = daoCategoria.obtenerTodasCategorias();
        if (!categorias.isEmpty()) {
            categoriaSeleccionada = categorias.get(0);
            actualizarProductos();
        }
    }

    public void actualizarProductos() {
        if (categoriaSeleccionada != null) {
            productos = daoProducto.obtenerProductosPorCategoria(categoriaSeleccionada.getIdCategoria());
        } else {
            productos = null; 
        }
    }

    public List<MCategoria> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<MCategoria> categorias) {
        this.categorias = categorias;
    }

    public MCategoria getCategoriaSeleccionada() {
        return categoriaSeleccionada;
    }

    public void setCategoriaSeleccionada(MCategoria categoriaSeleccionada) {
        this.categoriaSeleccionada = categoriaSeleccionada;
    }

    public List<MProducto> getProductos() {
        return productos;
    }

    public void setProductos(List<MProducto> productos) {
        this.productos = productos;
    }
}
