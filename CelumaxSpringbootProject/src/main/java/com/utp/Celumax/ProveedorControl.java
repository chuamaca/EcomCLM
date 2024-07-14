package com.utp.Celumax;

import com.utp.Celumax.modelo.Proveedor;
import com.utp.Celumax.modelo.ProveedorInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/")
public class ProveedorControl {

    @Autowired
    private ProveedorInterface servicio;

    @GetMapping("/listar")
    public String listado(Model modelo, @Param("palabra") String palabra) {
        if (palabra != null && !palabra.isEmpty()) {
            modelo.addAttribute("proveedores", servicio.findByNombreContaining(palabra));
        } else {
            modelo.addAttribute("proveedores", servicio.findAll());
        }

        double sm = 0;
        for (Proveedor proveedor : servicio.findAll()) {
            sm += proveedor.total();
        }
        modelo.addAttribute("totales", sm);

        return "index";
    }

    @GetMapping("/new")
    public String nuevo(Model modelo) {
        modelo.addAttribute("persona", new Proveedor());
        modelo.addAttribute("titulo", "Nuevo Registro");
        return "pagina1";
    }

    @PostMapping("/save")
    public String graba(Model modelo, @ModelAttribute("persona") Proveedor ep) {
        servicio.save(ep);
        return "redirect:/listar";
    }

    @GetMapping("/editar/{id}")
    public String editar(@PathVariable int id, Model modelo) {
        Optional<Proveedor> persona = servicio.findById(id);
        if (persona.isPresent()) {
            modelo.addAttribute("titulo", "Formulario Editar");
            modelo.addAttribute("persona", persona.get());
            return "pagina1";
        } else {
            
            return "redirect:/listar"; 
        }
    }

    @GetMapping("/eliminar/{id}")
    public String eliminar(@PathVariable int id) {
        servicio.deleteById(id);
        return "redirect:/listar";
    }
}
