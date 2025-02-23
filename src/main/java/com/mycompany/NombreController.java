package com.mycompany;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class NombreController {

    @GetMapping("/nombre")
    public String obtenerNombre() {
        return "Ricardo Andrés Villamizar Méndez"; // Reemplaza con tu nombre real
    }
}
