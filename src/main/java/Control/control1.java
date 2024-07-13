package Control;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import java.io.Serializable;
import DAO.*;
import Beans.*;
import java.util.*;
import javax.annotation.PostConstruct;
import javax.faces.model.SelectItem;

@ManagedBean
@ViewScoped
public class control1 implements Serializable {


    private String nombre;
    private double total;
    private String texto;
    private String Idesp;

    List<SelectItem> lisCat;//ASIGNAR PARA COMBOS
    MCategoria cat;
    
     private List<MProducto> lisproduct;

    private int CantDesa;
    private int CantAPO;
    
    private int SumaProductos;
    private double SumaPrecio;

    @PostConstruct //anotacion que se ejecuta cunado la pagina asociada se carge    
    public void init() {

        lisCat = new ArrayList();

        for (MCategoria x : new Negocio().LisCategoria()) {
            SelectItem sle = new SelectItem(x.getIdCategoria(), x.getNombre());
            lisCat.add(sle);
        }

    }

    public List<SelectItem> getLisCat() {
        return lisCat;
    }

    public void setLisCat(List<SelectItem> lisCat) {
        this.lisCat = lisCat;
    }

    public void filtraProduc() {
        lisproduct = new Negocio().LisCategoriaProducto(cat.getIdCategoria());
        SumaPrecio = 0;
        SumaProductos = 0;
        for (MProducto x : lisproduct) {
            
            SumaPrecio+=x.getPrecioVenta();
            SumaProductos+=x.getStock();
            
        }
    }
    
    

    public control1() {
        texto = "";
      
        cat= new MCategoria();
    }

    public List<MProducto> getLisproduct() {
        return lisproduct;
    }

    public void setLisproduct(List<MProducto> lisproduct) {
        this.lisproduct = lisproduct;
    }

   

    

 

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getIdesp() {
        return Idesp;
    }

    public void setIdesp(String Idesp) {
        this.Idesp = Idesp;
    }


 


  
    
   
   
    public MCategoria getCat() {
        return cat;
    }

    public int getSumaProductos() {
        return SumaProductos;
    }

    public void setSumaProductos(int SumaProductos) {
        this.SumaProductos = SumaProductos;
    }

    public double getSumaPrecio() {
        return SumaPrecio;
    }

    public void setSumaPrecio(double SumaPrecio) {
        this.SumaPrecio = SumaPrecio;
    }

    
    
    public void setCat(MCategoria cat) {
        this.cat = cat;
    }

}
