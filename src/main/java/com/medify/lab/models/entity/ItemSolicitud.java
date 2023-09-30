package com.medify.lab.models.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "items_solicitud_analisis")
public class ItemSolicitud {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "solicitud_id")
    private Solicitud solicitud;

    @ManyToOne
    @JoinColumn(name = "item_id")
    private Item item;

    private String estado;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion;
}