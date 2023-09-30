package com.medify.lab.controllers;

import com.medify.lab.models.entity.Cliente;
import com.medify.lab.services.ICliente;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class ClienteController {

    private final ICliente clienteService;

    public ClienteController(ICliente clienteService) {
        this.clienteService = clienteService;
    }

    @GetMapping("clientes")
    @ResponseStatus(HttpStatus.OK)
    public List<Cliente> get(){
        return clienteService.get();
    }

    @GetMapping("clientes/{id}")
    @ResponseStatus(HttpStatus.OK)
    public Cliente getById(@PathVariable Integer id){
        return clienteService.findById(id);
    }

    @PostMapping("clientes")
    @ResponseStatus(HttpStatus.CREATED)
    public Cliente create(@RequestBody Cliente cliente){
        return clienteService.save(cliente);
    }

    @PutMapping("clientes")
    @ResponseStatus(HttpStatus.CREATED)
    public Cliente update(@RequestBody Cliente cliente){
        return clienteService.save(cliente);
    }

    @DeleteMapping("clientes/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id){
        Cliente clienteDelete = clienteService.findById(id);
        clienteService.delete(clienteDelete);
    }
}