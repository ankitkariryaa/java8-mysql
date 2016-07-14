# CREATE TABLE `user`
# (
#  `id`                INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
#  `username`          VARCHAR(255), # e-mail address
#  `password`          VARCHAR(255),
#  `is_developer`      BOOLEAN                  DEFAULT FALSE,
#  `is_active`         BOOLEAN                  DEFAULT FALSE,
#  `is_administrator`  BOOLEAN                  DEFAULT FALSE,
#  `sex`               INT                      DEFAULT 0, # 0 = female, 1 = male
#  `registration_date` DATETIME        NOT NULL
# )
#  ENGINE = InnoDB
#  DEFAULT CHARSET = utf8;

# CREATE UNIQUE INDEX `username_idx` ON `user` (`username`);

CREATE TABLE `admin__users`
(
  `id`                  VARCHAR(255) PRIMARY KEY NOT NULL,
  `content_class_name`  TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `admin__users_parameters` (
  `id`          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `entry_id`  VARCHAR(255),
  `param_name`  TEXT,
  `param_value` TEXT,
  FOREIGN KEY (`entry_id`) REFERENCES `admin__users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mining__data`
(
  `id`                  VARCHAR(255) PRIMARY KEY NOT NULL,
  `content_class_name`  TEXT
);

CREATE TABLE `mining__data_parameters` (
  `id`          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `entry_id`  VARCHAR(255),
  `param_name`  TEXT,
  `param_value` TEXT,
  FOREIGN KEY (`entry_id`) REFERENCES `mining__data` (`id`)
);

CREATE TABLE `mining__mining_systems`
(
  `id`                  VARCHAR(255) PRIMARY KEY NOT NULL,
  `content_class_name`  TEXT
);

CREATE TABLE `mining__mining_systems_parameters` (
  `id`          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `entry_id`  VARCHAR(255),
  `param_name`  TEXT,
  `param_value` TEXT,
  FOREIGN KEY (`entry_id`) REFERENCES `mining__mining_systems` (`id`)
);

CREATE TABLE `content__pages`
(
  `id`                  VARCHAR(255) PRIMARY KEY NOT NULL,
  `content_class_name`  TEXT
);

CREATE TABLE `content__pages_parameters` (
  `id`          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `entry_id`  VARCHAR(255),
  `param_name`  TEXT,
  `param_value` TEXT,
  FOREIGN KEY (`entry_id`) REFERENCES `content__pages` (`id`)
);

CREATE TABLE `content__frames`
(
  `id`                  VARCHAR(255) PRIMARY KEY NOT NULL,
  `content_class_name`  TEXT
);

CREATE TABLE `content__frames_parameters` (
  `id`          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `entry_id`  VARCHAR(255),
  `param_name`  TEXT,
  `param_value` TEXT,
  FOREIGN KEY (`entry_id`) REFERENCES `content__frames` (`id`)
);

CREATE TABLE `content__demos`
(
  `id`                  VARCHAR(255) PRIMARY KEY NOT NULL,
  `content_class_name`  TEXT
);

CREATE TABLE `content__demos_parameters` (
  `id`          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `entry_id`  VARCHAR(255),
  `param_name`  TEXT,
  `param_value` TEXT,
  FOREIGN KEY (`entry_id`) REFERENCES `content__demos` (`id`)
);
