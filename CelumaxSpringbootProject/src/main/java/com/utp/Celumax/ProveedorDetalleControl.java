package com.utp.Celumax;

import com.utp.Celumax.modelo.ProveedorDetalle;
import com.utp.Celumax.modelo.ProveedorDetalleInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/detalle")
public class ProveedorDetalleControl {

    @Autowired
    private ProveedorDetalleInterface servicio;

    @GetMapping("/listar")
    public String listado(Model modelo, @Param("palabra") String palabra) {
        if (palabra != null && !palabra.isEmpty()) {
            modelo.addAttribute("proveedorDetalles", servicio.findByNombreContaining(palabra));
        } else {
            modelo.addAttribute("proveedorDetalles", servicio.findAll());
        }
        return "index2";
    }

    @GetMapping("/new")
    public String nuevo(Model modelo) {
        modelo.addAttribute("persona", new ProveedorDetalle());
        modelo.addAttribute("titulo", "Nuevo Registro");
        return "pagina2";
    }

    @PostMapping("/save")
    public String graba(@ModelAttribute("proveedorDetalle") ProveedorDetalle ep) {
        servicio.save(ep);
        return "redirect:/detalle/listar";
    }

    @GetMapping("/editar/{id}")
    public String editar(@PathVariable int id, Model modelo) {
        Optional<ProveedorDetalle> persona = servicio.findById(id);
        if (persona.isPresent()) {
            modelo.addAttribute("titulo", "Formulario Editar");
            modelo.addAttribute("persona", persona.get());
            return "pagina2";
        } else {
            return "redirect:/detalle/listar";
        }
    }

    @GetMapping("/eliminar/{id}")
    public String eliminar(@PathVariable int id) {
        servicio.deleteById(id);
        return "redirect:/detalle/listar";
    }
}
