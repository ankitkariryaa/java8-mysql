
CREATE TABLE IF NOT EXISTS `admin__options` (
  `id` varchar(255) NOT NULL,
  `content_class_name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


LOCK TABLES `admin__options` WRITE;
INSERT INTO `admin__options` (`id`, `content_class_name`) VALUES ('PageContainer','de.unibonn.creedo.ui.core.DefaultPageContainerOptions');
UNLOCK TABLES;

CREATE TABLE IF NOT EXISTS `admin__options_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` varchar(255) DEFAULT NULL,
  `param_name` text,
  `param_value` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  CONSTRAINT `admin__options_parameters_ibfk_1` FOREIGN KEY (`entry_id`) REFERENCES `admin__options` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;


LOCK TABLES `admin__options_parameters` WRITE;
INSERT INTO `admin__options_parameters` (`entry_id`, `param_name`, `param_value`) VALUES ('PageContainer','Primary logo','Optional[creedo_logo_horizontal_nomargin.png]'),('PageContainer','Primary logo link','https://bitbucket.org/realKD/creedo'),('PageContainer','Secondary logo','Optional.empty'),('PageContainer','Secondary logo link','');
UNLOCK TABLES;
