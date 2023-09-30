package com.medify.lab.models.dao;

import com.medify.lab.models.entity.Cliente;
import org.springframework.data.repository.CrudRepository;

public interface ClienteDao extends CrudRepository<Cliente,Integer> {


}
