CREATE TABLE usuarios
(
    id               SERIAL PRIMARY KEY,
    nombre           VARCHAR(50)  NOT NULL,
    apellido         VARCHAR(50)  NOT NULL,
    direccion        VARCHAR(100) NOT NULL,
    cui              VARCHAR(13)  NOT NULL UNIQUE,
    telefono         VARCHAR(15)  NOT NULL,
    fecha_nacimiento DATE,
    email            VARCHAR(100) NOT NULL,
    password         VARCHAR(100) NOT NULL,
    remember_token VARCHAR(100),
    email_verified_at TIMESTAMP,
    estado           BOOLEAN   DEFAULT TRUE,
    fecha_creacion   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE encabezado_bitacora
(
    id                SERIAL PRIMARY KEY,
    ip_maquina        VARCHAR(50) NOT NULL,
    registro_id       INT         NOT NULL,
    nombre_tabla      VARCHAR(50) NOT NULL,
    tipo_de_operacion VARCHAR(50) NOT NULL,
    usuario_id        INT         NOT NULL,
    fecha_creacion    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE detalle_bitacora
(
    id             SERIAL PRIMARY KEY,
    encabezado_id  INT         NOT NULL,
    nombre_campo   VARCHAR(50) NOT NULL,
    valor_anterior VARCHAR(50) NOT NULL,
    valor_nuevo    VARCHAR(50) NOT NULL,

    FOREIGN KEY (encabezado_id) REFERENCES encabezado_bitacora (id)
);
CREATE TABLE tipo_soportes
(
    id                 SERIAL PRIMARY KEY,
    nombre             VARCHAR(50)  NOT NULL,
    descripcion        VARCHAR(100) NOT NULL,
    fecha_creacion     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP,
    creado_por         INT          NOT NULL,
    modificado_por     INT,
    estado             BOOLEAN   DEFAULT TRUE,
    FOREIGN KEY (creado_por) REFERENCES usuarios (id),
    FOREIGN KEY (modificado_por) REFERENCES usuarios (id)
);
CREATE TABLE tipo_examenes
(
    id                 SERIAL PRIMARY KEY,
    nombre             VARCHAR(50)  NOT NULL,
    descripcion        VARCHAR(100) NOT NULL,
    fecha_creacion     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP,
    creado_por         INT          NOT NULL,
    modificado_por     INT,
    estado             BOOLEAN   DEFAULT TRUE,
    FOREIGN KEY (creado_por) REFERENCES usuarios (id),
    FOREIGN KEY (modificado_por) REFERENCES usuarios (id)
);
CREATE TABLE unidad_medidas
(
    id                 SERIAL PRIMARY KEY,
    nombre             VARCHAR(50)  NOT NULL,
    descripcion        VARCHAR(100) NOT NULL,
    fecha_creacion     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP,
    creado_por         INT          NOT NULL,
    modificado_por     INT,
    estado             BOOLEAN   DEFAULT TRUE,
    FOREIGN KEY (creado_por) REFERENCES usuarios (id),
    FOREIGN KEY (modificado_por) REFERENCES usuarios (id)
);
CREATE TABLE items
(
    id                 SERIAL PRIMARY KEY,
    nombre             VARCHAR(50)  NOT NULL,
    descripcion        VARCHAR(100) NOT NULL,
    tipo_examen_id     INT          NOT NULL,
    fecha_creacion     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP,
    creado_por         INT          NOT NULL,
    modificado_por     INT,
    estado             BOOLEAN   DEFAULT TRUE,
    FOREIGN KEY (creado_por) REFERENCES usuarios (id),
    FOREIGN KEY (modificado_por) REFERENCES usuarios (id),
    FOREIGN KEY (tipo_examen_id) REFERENCES tipo_examenes (id)
);
CREATE TABLE tipo_muestra
(
    id                 SERIAL PRIMARY KEY,
    nombre             VARCHAR(50)  NOT NULL,
    descripcion        VARCHAR(100) NOT NULL,
    fecha_creacion     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP,
    creado_por         INT          NOT NULL,
    modificado_por     INT,
    estado             BOOLEAN   DEFAULT TRUE,
    FOREIGN KEY (creado_por) REFERENCES usuarios (id),
    FOREIGN KEY (modificado_por) REFERENCES usuarios (id)
);
CREATE TABLE estado_solicitudes
(
    id                 SERIAL PRIMARY KEY,
    nombre             VARCHAR(50)  NOT NULL,
    descripcion        VARCHAR(100) NOT NULL,
    fecha_creacion     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP,
    creado_por         INT          NOT NULL,
    modificado_por     INT,
    estado             BOOLEAN   DEFAULT TRUE,
    FOREIGN KEY (creado_por) REFERENCES usuarios (id),
    FOREIGN KEY (modificado_por) REFERENCES usuarios (id)
);
CREATE TABLE departamentos
(
    id                 SERIAL PRIMARY KEY,
    nombre             VARCHAR(50)  NOT NULL,
    descripcion        VARCHAR(100) NOT NULL,
    fecha_creacion     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP,
    creado_por         INT          NOT NULL,
    modificado_por     INT,
    estado             BOOLEAN   DEFAULT TRUE,
    FOREIGN KEY (creado_por) REFERENCES usuarios (id),
    FOREIGN KEY (modificado_por) REFERENCES usuarios (id)
);
CREATE TABLE tipo_documento_analisis
(
    id                 SERIAL PRIMARY KEY,
    nombre             VARCHAR(50)  NOT NULL,
    descripcion        VARCHAR(100) NOT NULL,
    fecha_creacion     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP,
    creado_por         INT          NOT NULL,
    modificado_por     INT,
    estado             BOOLEAN   DEFAULT TRUE,
    FOREIGN KEY (creado_por) REFERENCES usuarios (id),
    FOREIGN KEY (modificado_por) REFERENCES usuarios (id)
);
CREATE TABLE tipo_recipiente_muestra
(
    id                 SERIAL PRIMARY KEY,
    nombre             VARCHAR(50)  NOT NULL,
    descripcion        VARCHAR(100) NOT NULL,
    fecha_creacion     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP,
    creado_por         INT          NOT NULL,
    modificado_por     INT,
    estado             BOOLEAN   DEFAULT TRUE,
    FOREIGN KEY (creado_por) REFERENCES usuarios (id),
    FOREIGN KEY (modificado_por) REFERENCES usuarios (id)
);
CREATE TABLE roles
(
    id             SERIAL PRIMARY KEY,
    nombre         VARCHAR(50)  NOT NULL,
    descripcion    VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE empleados
(
    usuario_id     INT PRIMARY KEY NOT NULL,
    rol_id         INT             NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
    FOREIGN KEY (rol_id) REFERENCES roles (id)
);
CREATE TABLE clientes
(
    usuario_id     INT PRIMARY KEY NOT NULL,
    nit            VARCHAR(9)      NOT NULL UNIQUE,
    profesion      VARCHAR(50)     NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
);
CREATE TABLE solicitudes
(
    id                  SERIAL PRIMARY KEY,
    tipo_soporte_id     INT          NOT NULL,
    no_soporte          VARCHAR(50)  NOT NULL,
    descripcion         VARCHAR(100) NOT NULL,
    fecha_recepcion     DATE         NOT NULL,
    --estado_solicitud_id INT          NOT NULL,
    cliente_id          INT          NOT NULL,
    longitud            INT          NOT NULL,
    latitud             INT          NOT NULL,
    fecha_creacion      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (tipo_soporte_id) REFERENCES tipo_soportes (id),
    --FOREIGN KEY (estado_solicitud_id) REFERENCES estado_solicitudes (id),
    FOREIGN KEY (cliente_id) REFERENCES clientes (usuario_id)
);
CREATE TABLE muestras
(
    id                         SERIAL PRIMARY KEY,
    tipo_muestra_id            INT         NOT NULL,
    tipo_recipiente_muestra_id INT         NOT NULL,
    cantidad_unidades          INT         NOT NULL,
    unidad_medida_id           INT         NOT NULL,
    etiqueta                   VARCHAR(50) NOT NULL,
    solicitud_id               INT         NOT NULL,
    fecha_creacion             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dia_vencimiento            DATE        NOT NULL,
    estado                     BOOLEAN   DEFAULT TRUE,

    FOREIGN KEY (tipo_muestra_id) REFERENCES tipo_muestra (id),
    FOREIGN KEY (tipo_recipiente_muestra_id) REFERENCES tipo_recipiente_muestra (id),
    FOREIGN KEY (unidad_medida_id) REFERENCES unidad_medidas (id),
    FOREIGN KEY (solicitud_id) REFERENCES solicitudes (id)
);
CREATE TABLE documentos_analisis
(
    id                         SERIAL PRIMARY KEY,
    muestra_id                 INT          NOT NULL,
    tipo_documento_analisis_id INT          NOT NULL,
    conclusion                 VARCHAR(100) NOT NULL,
    fecha_creacion             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado                     BOOLEAN   DEFAULT TRUE,

    FOREIGN KEY (muestra_id) REFERENCES muestras (id),
    FOREIGN KEY (tipo_documento_analisis_id) REFERENCES tipo_documento_analisis (id)
);
CREATE TABLE usuario_asignaciones
(
    id                   SERIAL PRIMARY KEY,
    usuario_asignado_id  INT NOT NULL,
    usuario_asignador_id INT NOT NULL,
    solicitud_id         INT NOT NULL,
    fecha_creacion       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_asignado_id) REFERENCES usuarios (id),
    FOREIGN KEY (usuario_asignador_id) REFERENCES usuarios (id),
    FOREIGN KEY (solicitud_id) REFERENCES solicitudes (id)
);
CREATE TABLE items_muestras
(
    id             SERIAL PRIMARY KEY,
    id_item        INT NOT NULL,
    id_muestra     INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_item) REFERENCES items (id),
    FOREIGN KEY (id_muestra) REFERENCES muestras (id)
);
CREATE TABLE documentos
(
    id             SERIAL PRIMARY KEY,
    solicitud_id   INT          NOT NULL,
    observaciones  VARCHAR(100) NOT NULL,
    ruta           VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado         BOOLEAN   DEFAULT TRUE,

    FOREIGN KEY (solicitud_id) REFERENCES solicitudes (id)
);
CREATE TABLE trazabilidad_solicitudes
(
    id             SERIAL PRIMARY KEY,
    solicitud_id   INT          NOT NULL,
    estado_solicitud_id      INT          NOT NULL,
    observaciones  VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (solicitud_id) REFERENCES solicitudes (id),
    FOREIGN KEY (estado_solicitud_id) REFERENCES estado_solicitudes (id)
);

CREATE TABLE items_solicitud_analisis
(
    id             SERIAL PRIMARY KEY,
    solicitud_id   INT NOT NULL,
    item_id        INT NOT NULL,
    estado         BOOLEAN   DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (solicitud_id) REFERENCES solicitudes (id),
    FOREIGN KEY (item_id) REFERENCES items (id)
);