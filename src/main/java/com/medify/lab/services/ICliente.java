package com.medify.lab.services;

import com.medify.lab.models.entity.Cliente;

import java.util.List;

public interface ICliente {
    List<Cliente> get();
    Cliente save(Cliente cliente);
    Cliente findById(Integer id);
    boolean delete(Cliente cliente);
}
