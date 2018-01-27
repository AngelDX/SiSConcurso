-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-01-2018 a las 15:46:15
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbconcurso`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `id` int(11) NOT NULL COMMENT 'Identificador del acceso',
  `usuario_id` int(11) NOT NULL COMMENT 'Identificador del usuario que accede',
  `tipo_acceso` int(1) NOT NULL DEFAULT '1' COMMENT 'Tipo de acceso (entrata o salida)',
  `ip` varchar(45) DEFAULT NULL COMMENT 'Dirección IP del usuario que ingresa',
  `acceso_at` datetime DEFAULT NULL COMMENT 'Fecha de registro del acceso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que registra los accesos de los usuarios al sistema';

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`id`, `usuario_id`, `tipo_acceso`, `ip`, `acceso_at`) VALUES
(1, 2, 1, '127.0.0.1', '2018-01-27 07:32:52'),
(2, 2, 2, '127.0.0.1', '2018-01-27 07:38:10'),
(3, 2, 1, '127.0.0.1', '2018-01-27 07:38:17'),
(4, 2, 1, '127.0.0.1', '2018-01-27 09:11:03'),
(5, 2, 1, '127.0.0.1', '2018-01-27 09:42:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `backup`
--

CREATE TABLE `backup` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `denominacion` varchar(200) NOT NULL,
  `tamano` varchar(45) DEFAULT NULL,
  `archivo` varchar(45) NOT NULL,
  `backup_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las copias de seguridad del sistema';

--
-- Volcado de datos para la tabla `backup`
--

INSERT INTO `backup` (`id`, `usuario_id`, `denominacion`, `tamano`, `archivo`, `backup_at`) VALUES
(1, 2, 'DBKM Inicial', '3,44 KB', 'backup-1.sql.gz', '2014-01-01 00:00:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

CREATE TABLE `estado_usuario` (
  `id` int(11) NOT NULL COMMENT 'Identificador del estado del usuario',
  `usuario_id` int(11) NOT NULL COMMENT 'Identificador del usuario',
  `estado_usuario` int(11) NOT NULL COMMENT 'Código del estado del usuario',
  `descripcion` varchar(100) NOT NULL COMMENT 'Motivo del cambio de estado',
  `estado_usuario_at` datetime DEFAULT NULL COMMENT 'Fecha del cambio de estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los estados de los usuarios';

--
-- Volcado de datos para la tabla `estado_usuario`
--

INSERT INTO `estado_usuario` (`id`, `usuario_id`, `estado_usuario`, `descripcion`, `estado_usuario_at`) VALUES
(1, 1, 2, 'Bloqueado por ser un usuario sin privilegios', '2014-01-01 00:00:01'),
(2, 2, 1, 'Activo por ser el Super Usuario del sistema', '2014-01-01 00:00:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL COMMENT 'Identificador del menú',
  `menu_id` int(11) DEFAULT NULL COMMENT 'Identificador del menú padre',
  `recurso_id` int(11) DEFAULT NULL COMMENT 'Identificador del recurso',
  `menu` varchar(45) NOT NULL COMMENT 'Texto a mostrar del menú',
  `url` varchar(60) DEFAULT NULL COMMENT 'Url del menú',
  `posicion` int(11) DEFAULT '0' COMMENT 'Posisión dentro de otros items',
  `icono` varchar(45) DEFAULT NULL COMMENT 'Icono a mostrar ',
  `activo` int(1) NOT NULL DEFAULT '1' COMMENT 'Menú activo o inactivo',
  `visibilidad` int(1) NOT NULL DEFAULT '1' COMMENT 'Indica si el menú se muestra en el backend o en el frontend',
  `custom` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los menú para los usuarios';

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `menu_id`, `recurso_id`, `menu`, `url`, `posicion`, `icono`, `activo`, `visibilidad`, `custom`) VALUES
(1, NULL, NULL, 'Dashboard', '#', 10, 'fa-home', 1, 1, NULL),
(2, 1, 2, 'Dashboard', 'dashboard/', 11, 'fa-home', 1, 1, NULL),
(3, NULL, NULL, 'Sistema', '#', 900, 'fa-cogs', 1, 1, NULL),
(4, 3, 4, 'Accesos', 'sistema/accesos/listar/', 901, 'fa-exchange', 1, 1, NULL),
(5, 3, 5, 'Auditorías', 'sistema/auditorias/', 902, 'fa-eye', 1, 1, NULL),
(6, 3, 6, 'Backups', 'sistema/backups/listar/', 903, 'fa-hdd-o', 1, 1, NULL),
(7, 3, 7, 'Mantenimiento', 'sistema/mantenimiento/', 904, 'fa-bolt', 1, 1, NULL),
(8, 3, 8, 'Menús', 'sistema/menus/listar/', 905, 'fa-list', 1, 1, NULL),
(9, 3, 9, 'Perfiles', 'sistema/perfiles/listar/', 906, 'fa-group', 1, 1, NULL),
(10, 3, 10, 'Permisos', 'sistema/permisos/listar/', 907, 'fa-magic', 1, 1, NULL),
(11, 3, 11, 'Recursos', 'sistema/recursos/listar/', 908, 'fa-lock', 1, 1, NULL),
(12, 3, 12, 'Usuarios', 'sistema/usuarios/listar/', 909, 'fa-user', 1, 1, NULL),
(13, 3, 13, 'Visor de sucesos', 'sistema/sucesos/listar/', 910, 'fa-filter', 1, 1, NULL),
(14, 3, 14, 'Sistema', 'sistema/configuracion/', 911, 'fa-wrench', 1, 1, NULL),
(15, NULL, NULL, 'Concurso', '#', 1000, 'fa-university', 1, 1, 0),
(16, 15, 15, 'Elencos', 'concurso/elenco/', 1, 'fa-users', 1, 1, 0),
(17, 15, 16, 'Calificación', 'concurso/calificacion/', 2, 'fa-sort-amount-asc', 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id` int(2) NOT NULL COMMENT 'Identificador del perfil',
  `perfil` varchar(45) NOT NULL COMMENT 'Nombre del perfil',
  `estado` int(1) NOT NULL DEFAULT '1' COMMENT 'Indica si el perfil esta activo o inactivo',
  `plantilla` varchar(45) DEFAULT 'default' COMMENT 'Plantilla para usar en el sitema',
  `perfil_at` datetime DEFAULT NULL COMMENT 'Fecha de registro del perfil'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los grupos de los usuarios';

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `perfil`, `estado`, `plantilla`, `perfil_at`) VALUES
(1, 'Super Usuario', 1, 'default', '2014-01-01 00:00:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso`
--

CREATE TABLE `recurso` (
  `id` int(11) NOT NULL COMMENT 'Identificador del recurso',
  `modulo` varchar(45) DEFAULT NULL COMMENT 'Nombre del módulo',
  `controlador` varchar(45) DEFAULT NULL COMMENT 'Nombre del controlador',
  `accion` varchar(45) DEFAULT NULL COMMENT 'Nombre de la acción',
  `recurso` varchar(100) DEFAULT NULL COMMENT 'Nombre del recurso',
  `descripcion` text NOT NULL COMMENT 'Descripción del recurso',
  `activo` int(1) NOT NULL DEFAULT '1' COMMENT 'Estado del recurso',
  `custom` int(1) DEFAULT '1',
  `recurso_at` datetime DEFAULT NULL COMMENT 'Fecha de registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los recursos a los que acceden los usuarios';

--
-- Volcado de datos para la tabla `recurso`
--

INSERT INTO `recurso` (`id`, `modulo`, `controlador`, `accion`, `recurso`, `descripcion`, `activo`, `custom`, `recurso_at`) VALUES
(1, '*', 'NULL', 'NULL', '*', 'Comodín para la administración total (usar con cuidado)', 1, NULL, '2014-01-01 00:00:01'),
(2, 'dashboard', '*', '*', 'dashboard/*/*', 'Página principal del sistema', 1, NULL, '2014-01-01 00:00:01'),
(3, 'sistema', 'mi_cuenta', '*', 'sistema/mi_cuenta/*', 'Gestión de la cuenta del usuario logueado', 1, NULL, '2014-01-01 00:00:01'),
(4, 'sistema', 'accesos', '*', 'sistema/accesos/*', 'Submódulo para la gestión de ingresos al sistema', 1, NULL, '2014-01-01 00:00:01'),
(5, 'sistema', 'auditorias', '*', 'sistema/auditorias/*', 'Submódulo para el control de las acciones de los usuarios', 1, NULL, '2014-01-01 00:00:01'),
(6, 'sistema', 'backups', '*', 'sistema/backups/*', 'Submódulo para la gestión de las copias de seguridad', 1, NULL, '2014-01-01 00:00:01'),
(7, 'sistema', 'mantenimiento', '*', 'sistema/mantenimiento/*', 'Submódulo para el mantenimiento de las tablas', 1, NULL, '2014-01-01 00:00:01'),
(8, 'sistema', 'menus', '*', 'sistema/menus/*', 'Submódulo del sistema para la creación de menús', 1, NULL, '2014-01-01 00:00:01'),
(9, 'sistema', 'perfiles', '*', 'sistema/perfiles/*', 'Submódulo del sistema para los perfiles de usuarios', 1, NULL, '2014-01-01 00:00:01'),
(10, 'sistema', 'permisos', '*', 'sistema/permisos/*', 'Submódulo del sistema para asignar recursos a los perfiles', 1, NULL, '2014-01-01 00:00:01'),
(11, 'sistema', 'recursos', '*', 'sistema/recursos/*', 'Submódulo del sistema para la gestión de los recursos', 1, NULL, '2014-01-01 00:00:01'),
(12, 'sistema', 'usuarios', '*', 'sistema/usuarios/*', 'Submódulo para la administración de los usuarios del sistema', 1, NULL, '2014-01-01 00:00:01'),
(13, 'sistema', 'sucesos', '*', 'sistema/sucesos/*', 'Submódulo para el listado de los logs del sistema', 1, NULL, '2014-01-01 00:00:01'),
(14, 'sistema', 'configuracion', '*', 'sistema/configuracion/*', 'Submódulo para la configuración de la aplicación (.ini)', 1, NULL, '2014-01-01 00:00:01'),
(15, 'concurso', 'elenco', '*', 'concurso/elenco/*', 'submodulo de elencos', 1, 0, '2018-01-27 08:19:49'),
(16, 'concurso', 'calificacion', '*', 'concurso/calificacion/*', 'SubModulo de calificacion', 1, 0, '2018-01-27 09:15:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso_perfil`
--

CREATE TABLE `recurso_perfil` (
  `id` int(11) NOT NULL,
  `recurso_id` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  `recurso_perfil_at` datetime DEFAULT NULL,
  `recurso_perfil_in` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los recursos del usuario en el sistema segun su perfl';

--
-- Volcado de datos para la tabla `recurso_perfil`
--

INSERT INTO `recurso_perfil` (`id`, `recurso_id`, `perfil_id`, `recurso_perfil_at`, `recurso_perfil_in`) VALUES
(1, 1, 1, '2014-01-01 00:00:01', NULL),
(2, 2, 2, '2014-03-31 23:35:39', NULL),
(3, 2, 3, '2014-03-31 23:39:29', NULL),
(4, 3, 3, '2014-03-31 23:39:29', NULL),
(5, 3, 2, '2014-03-31 23:45:17', NULL),
(6, 2, 4, '2014-03-31 23:59:48', NULL),
(7, 3, 4, '2014-03-31 23:59:48', NULL),
(8, 2, 5, '2014-04-01 00:01:25', NULL),
(9, 3, 5, '2014-04-01 00:01:25', NULL),
(10, 2, 6, '2014-04-01 00:01:44', NULL),
(11, 3, 6, '2014-04-01 00:01:44', NULL),
(12, 2, 7, '2014-04-01 00:02:28', NULL),
(13, 3, 7, '2014-04-01 00:02:28', NULL),
(14, 2, 8, '2014-04-01 00:02:56', NULL),
(15, 3, 8, '2014-04-01 00:02:56', NULL),
(16, 2, 9, '2014-04-01 00:03:33', NULL),
(17, 3, 9, '2014-04-01 00:03:33', NULL),
(18, 2, 10, '2014-04-01 00:10:55', NULL),
(19, 3, 10, '2014-04-01 00:10:55', NULL),
(20, 2, 11, '2014-04-01 00:12:48', NULL),
(21, 3, 11, '2014-04-01 00:12:48', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL COMMENT 'Identificador del usuario',
  `nombre` varchar(70) NOT NULL COMMENT 'Nombre del Usuario',
  `apellido` varchar(70) NOT NULL COMMENT 'Apellido del usuario',
  `login` varchar(45) NOT NULL COMMENT 'Nombre de usuario',
  `password` varchar(45) NOT NULL COMMENT 'Contraseña de acceso al sistea',
  `perfil_id` int(2) NOT NULL COMMENT 'Identificador del perfil',
  `email` varchar(45) DEFAULT NULL COMMENT 'Dirección del correo electónico',
  `tema` varchar(45) DEFAULT 'default' COMMENT 'Tema aplicable para la interfaz',
  `app_ajax` int(1) DEFAULT '1' COMMENT 'Indica si la app se trabaja con ajax o peticiones normales',
  `datagrid` int(11) DEFAULT '30' COMMENT 'Datos por página en los datagrid',
  `fotografia` varchar(45) DEFAULT 'default.png',
  `pool` varchar(45) DEFAULT NULL,
  `usuario_at` datetime DEFAULT NULL COMMENT 'Fecha de registro',
  `usuario_in` datetime DEFAULT NULL COMMENT 'Fecha de la última modificación'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los usuarios';

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `login`, `password`, `perfil_id`, `email`, `tema`, `app_ajax`, `datagrid`, `fotografia`, `pool`, `usuario_at`, `usuario_in`) VALUES
(1, 'Cronjob', 'System', 'cronjob', '963db57a0088931e0e3627b1e73e6eb5', 1, NULL, 'default', 1, 30, 'default.png', NULL, '2013-01-01 00:00:01', NULL),
(2, 'Angel  Rosendo', 'Condori Coaquira', 'admin', '5d8e90bf3b8dd93d3e18f9a6a60c937a02a82721', 1, 'angel.condori@gmail.com', 'default', 1, 30, 'default.png', NULL, '2013-01-01 00:00:01', '2018-01-27 09:45:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xcalificacion`
--

CREATE TABLE `xcalificacion` (
  `id` int(10) NOT NULL,
  `elenco_id` int(10) NOT NULL,
  `jurado` varchar(50) NOT NULL,
  `puntaje` double(10,2) NOT NULL,
  `condicion` varchar(10) NOT NULL,
  `calificacion_in` datetime DEFAULT NULL,
  `calificacion_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xdetevento`
--

CREATE TABLE `xdetevento` (
  `id` int(10) NOT NULL,
  `elenco_id` int(10) NOT NULL,
  `evento_id` int(10) NOT NULL,
  `promedio` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xelenco`
--

CREATE TABLE `xelenco` (
  `id` int(10) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `representante` varchar(40) DEFAULT NULL,
  `numcontacto` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `xelenco`
--

INSERT INTO `xelenco` (`id`, `nombre`, `representante`, `numcontacto`) VALUES
(1, 'qwewqe', 'ddddd', '4444'),
(2, 'ertretret', 'dsdsssss', '555');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xevento`
--

CREATE TABLE `xevento` (
  `id` int(10) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `lugar` varchar(100) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `xevento`
--

INSERT INTO `xevento` (`id`, `nombre`, `descripcion`, `lugar`, `fecha`) VALUES
(1, 'CONCURSO DE ELENCOS', NULL, 'COLISEO CERRADO', '2018-01-27');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acceso_usuario_idx` (`usuario_id`);

--
-- Indices de la tabla `backup`
--
ALTER TABLE `backup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_backup_usuario_idx` (`usuario_id`);

--
-- Indices de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estado_usuario_usuario_idx` (`usuario_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_menu_recurso_idx` (`recurso_id`),
  ADD KEY `fk_menu_menu_idx` (`menu_id`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recurso_perfil`
--
ALTER TABLE `recurso_perfil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_recurso_perfil_recurso_idx` (`recurso_id`),
  ADD KEY `fk_recurso_perfil_perfil_idx` (`perfil_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_perfil_idx` (`perfil_id`);

--
-- Indices de la tabla `xcalificacion`
--
ALTER TABLE `xcalificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `xdetevento`
--
ALTER TABLE `xdetevento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `xelenco`
--
ALTER TABLE `xelenco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `xevento`
--
ALTER TABLE `xevento`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del acceso', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `backup`
--
ALTER TABLE `backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del estado del usuario', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del menú', AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del perfil', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `recurso`
--
ALTER TABLE `recurso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del recurso', AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `recurso_perfil`
--
ALTER TABLE `recurso_perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del usuario', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `xelenco`
--
ALTER TABLE `xelenco`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `xevento`
--
ALTER TABLE `xevento`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `fk_acceso_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `backup`
--
ALTER TABLE `backup`
  ADD CONSTRAINT `fk_backup_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  ADD CONSTRAINT `fk_estado_usuario_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menu_recurso` FOREIGN KEY (`recurso_id`) REFERENCES `recurso` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `recurso_perfil`
--
ALTER TABLE `recurso_perfil`
  ADD CONSTRAINT `fk_recurso_perfil_perfil` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recurso_perfil_recurso` FOREIGN KEY (`recurso_id`) REFERENCES `recurso` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_perfil` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
