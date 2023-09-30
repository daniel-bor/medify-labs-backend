package com.medify.lab.models.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "solicitudes")
public class Solicitud {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "tipo_soporte_id")
    private TipoSoporte tipoSoporte;

    private String no_soporte;
    private String descripcion;
    private LocalDateTime fecha_recepcion;

    @ManyToOne
    @JoinColumn(name = "estado_solicitud_id")
    private EstadoSolicitud estadoSolicitud;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;

    @OneToMany(mappedBy = "solicitud")
    private List<TrazabilidadSolicitud> trazabilidades;

    private String longitud;
    private String latitud;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion;
}