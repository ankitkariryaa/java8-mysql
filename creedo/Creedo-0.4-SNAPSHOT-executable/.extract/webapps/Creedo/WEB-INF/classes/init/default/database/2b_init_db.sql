
CREATE TABLE `study__sessions` (
  `id`    		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `study_name` 	TEXT,
  `user_id` 	VARCHAR(255),
  `task_name` 	TEXT,
  `system_name` TEXT,
  `end_time`	DATETIME,
  FOREIGN KEY (`user_id`) REFERENCES `admin__users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `study__task_session_results` (
  `id`              		INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `session_id`             	INT,
  `result_builder_content` 	TEXT,
  `seconds_in_session_until_saved` INT,
  FOREIGN KEY (`session_id`) REFERENCES `study__sessions` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
  
CREATE TABLE `study__result_ratings` (
  `id` 			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `study_name` 	TEXT,
  `user_id` 	VARCHAR(255),
  `result_id` 	INT,
  `metric` 		TEXT,
  `value` 		DOUBLE,
  FOREIGN KEY (`user_id`) REFERENCES `admin__users` (`id`),
  FOREIGN KEY (`result_id`) REFERENCES `study__task_session_results` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `content__study_designs`
(
  `id`                  VARCHAR(255) PRIMARY KEY NOT NULL,
  `content_class_name`  TEXT
);

CREATE TABLE `content__study_designs_parameters` (
  `id`          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `entry_id`  VARCHAR(255),
  `param_name`  TEXT,
  `param_value` TEXT,
  FOREIGN KEY (`entry_id`) REFERENCES `content__study_designs` (`id`)
);

CREATE TABLE `content__studies`
(
  `id`                  VARCHAR(255) PRIMARY KEY NOT NULL,
  `content_class_name`  TEXT
);

CREATE TABLE `content__studies_parameters` (
  `id`          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `entry_id`  VARCHAR(255),
  `param_name`  TEXT,
  `param_value` TEXT,
  FOREIGN KEY (`entry_id`) REFERENCES `content__studies` (`id`)
);

CREATE TABLE `content__study_system_specifications`
(
  `id`                  VARCHAR(255) PRIMARY KEY NOT NULL,
  `content_class_name`  TEXT
);

CREATE TABLE `content__study_system_specifications_parameters` (
  `id`          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `entry_id`  VARCHAR(255),
  `param_name`  TEXT,
  `param_value` TEXT,
  FOREIGN KEY (`entry_id`) REFERENCES `content__study_system_specifications` (`id`)
);

CREATE TABLE `content__study_task_specifications`
(
  `id`                  VARCHAR(255) PRIMARY KEY NOT NULL,
  `content_class_name`  TEXT
);

CREATE TABLE `content__study_task_specifications_parameters` (
  `id`          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `entry_id`  VARCHAR(255),
  `param_name`  TEXT,
  `param_value` TEXT,
  FOREIGN KEY (`entry_id`) REFERENCES `content__study_task_specifications` (`id`)
);

CREATE TABLE `content__study_evaluation_schemes`
(
  `id`                  VARCHAR(255) PRIMARY KEY NOT NULL,
  `content_class_name`  TEXT
);

CREATE TABLE `content__study_evaluation_schemes_parameters` (
  `id`          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `entry_id`  VARCHAR(255),
  `param_name`  TEXT,
  `param_value` TEXT,
  FOREIGN KEY (`entry_id`) REFERENCES `content__study_evaluation_schemes` (`id`)
);