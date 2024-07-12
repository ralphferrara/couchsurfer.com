CREATE TABLE `media` (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `fid_user` int(11) DEFAULT NULL,
  `fid_area` int(11) DEFAULT NULL,
  `fid_folder` int(11) DEFAULT NULL,
  `media_status` varchar(6) DEFAULT 'QUE',
  `media_type` varchar(6) DEFAULT NULL,
  `media_area` varchar(6) DEFAULT NULL,
  `media_timestamp` timestamp NULL DEFAULT current_timestamp(),
  `media_meta` text DEFAULT NULL,
  `media_error` varchar(128) DEFAULT 'MEROK',
  PRIMARY KEY (`id_media`),
  KEY `fid_user` (`fid_user`),
  KEY `fid_area` (`fid_area`),
  KEY `fid_folder` (`fid_folder`),
  KEY `media_status` (`media_status`),
  KEY `media_type` (`media_type`),
  KEY `media_area` (`media_area`),
  KEY `media_timestamp` (`media_timestamp`),a
  KEY `media_timestamp_desc` (`media_timestamp` DESC),
  KEY `media_error` (`media_error`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
