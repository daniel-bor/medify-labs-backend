package com.medify.lab.services.implement;

import com.medify.lab.models.dao.ClienteDao;
import com.medify.lab.models.entity.Cliente;
import com.medify.lab.services.ICliente;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ClienteImplement implements ICliente {
    private final ClienteDao _clienteDao;

    public ClienteImplement(ClienteDao clienteDao) {
        this._clienteDao = clienteDao;
    }

    @Transactional(readOnly = true)
    @Override
    public List<Cliente> get() {
        return (List<Cliente>) _clienteDao.findAll();
    }

    @Transactional
    @Override
    public Cliente save(Cliente cliente) {
        return _clienteDao.save(cliente);
    }

    @Transactional(readOnly = true)
    @Override
    public Cliente findById(Integer id) {
        return _clienteDao.findById(id).orElse(null);
    }

    @Transactional
    @Override
    public boolean delete(Cliente cliente) {
        return false;
    }
}