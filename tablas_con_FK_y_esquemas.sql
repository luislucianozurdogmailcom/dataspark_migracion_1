CREATE SCHEMA staging;
USE staging;

CREATE TABLE `dl_listado_tickets` (
  `fecha_creacion` datetime DEFAULT NULL,
  `numero_incidente` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `duracion_dias` decimal(12,9) DEFAULT NULL,
  `servicio` varchar(255) DEFAULT NULL,
  `tipo_servicio` varchar(255) DEFAULT NULL,
  `prioridad` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `torre` varchar(255) DEFAULT NULL,
  `entorno` varchar(255) DEFAULT NULL,
  `estado_cumplimiento_sla` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE SCHEMA dataLake;
USE dataLake;

CREATE TABLE `entorno` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY `entorno_id_idx` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `estado` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY `estado_id_idx` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `estado_cumplimiento_sla` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY `estado_cumplimiento_sla_id_idx` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `prioridad` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY `prioridad_id_idx` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `servicio` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY `servicio_id_idx` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tipo_servicio` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY `tipo_servicio_id_idx` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `torre` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY `torre_id_idx` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ft_tickets` (
  `fecha_creacion` datetime DEFAULT NULL,
  `numero_incidente` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `duracion_dias` decimal(12,9) DEFAULT NULL,
  `id_servicio` int UNSIGNED NOT NULL,
  `id_tipo_servicio` int UNSIGNED NOT NULL,
  `id_prioridad` int UNSIGNED NOT NULL,
  `id_estado` int UNSIGNED NOT NULL,
  `id_torre` int UNSIGNED NOT NULL,
  `id_entorno` int UNSIGNED NOT NULL,
  `id_estado_cumplimiento_sla` int UNSIGNED NOT NULL,
  FOREIGN KEY (`id_servicio`) REFERENCES `servicio`(id),
  FOREIGN KEY (`id_tipo_servicio`) REFERENCES `tipo_servicio`(id),
  FOREIGN KEY (`id_prioridad`) REFERENCES `prioridad`(id),
  FOREIGN KEY (`id_estado`) REFERENCES `estado`(id),
  FOREIGN KEY (`id_torre`) REFERENCES `torre`(id),
  FOREIGN KEY (`id_entorno`) REFERENCES `entorno`(id),
  FOREIGN KEY (`id_estado_cumplimiento_sla`) REFERENCES `estado_cumplimiento_sla`(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;