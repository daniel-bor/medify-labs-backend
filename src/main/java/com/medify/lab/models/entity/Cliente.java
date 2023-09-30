package com.medify.lab.models.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name = "clientes")
public class Cliente implements Serializable {
    @Id
    @Column(name = "usuario_id")
    private Integer UsuarioId;

    @Column(name = "nit")
    private String Nit;

    @Column(name = "profesion")
    private String Profesion;

    @Column(name = "fecha_creacion")
    private Date FechaCreacion;

    // Relación uno a muchos: Un cliente puede tener muchas solicitudes
    @OneToMany(mappedBy = "cliente")
    private List<Solicitud> solicitudes;
}