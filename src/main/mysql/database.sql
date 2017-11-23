CREATE DATABASE  IF NOT EXISTS `db`;

USE `db`;

/* drop tables in order*/

DROP TABLE IF EXISTS `build_ram`;
DROP TABLE IF EXISTS `build_storage`;
DROP TABLE IF EXISTS `post_build`;
DROP TABLE IF EXISTS `comment`;
DROP TABLE IF EXISTS `post`;
DROP TABLE IF EXISTS `build`;
DROP TABLE IF EXISTS `user`;

DROP TABLE IF EXISTS `component`;
DROP TABLE IF EXISTS `cpu`;
DROP TABLE IF EXISTS `motherboard`;
DROP TABLE IF EXISTS `gpu`;
DROP TABLE IF EXISTS `psu`;
DROP TABLE IF EXISTS `ram`;
DROP TABLE IF EXISTS `storage`;
DROP TABLE IF EXISTS `cooler`;
DROP TABLE IF EXISTS `computer_case`;

/* create blog tables */

CREATE TABLE `user` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `current_build_id` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `user_id` INT NOT NULL,
  `title` TEXT NOT NULL,
  `body` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (user_id) REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comment` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  `body` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (user_id) REFERENCES user(id),
  FOREIGN KEY (post_id) REFERENCES post(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* PC Component tables */

CREATE TABLE `component` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cpu` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `cores` INT NOT NULL,
  `clock_speed` DECIMAL(3,2) NOT NULL,
  `TDP` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `motherboard` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `form_factor` VARCHAR(255) NOT NULL,
  `socket` VARCHAR(255) NOT NULL,
  `ram_slots` INT NOT NULL,
  `ram_max` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gpu` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `series` VARCHAR(255) NOT NULL,
  `chipset` VARCHAR(255) NOT NULL,
  `memory` INT NOT NULL,
  `core_clock` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `psu` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `series` VARCHAR(255) NOT NULL,
  `form_factor` VARCHAR(255) NOT NULL,
  `watts` VARCHAR(255) NOT NULL,
  `efficiency` VARCHAR(255) NOT NULL,
  `modular` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ram` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `size` INT NOT NULL,
  `module` VARCHAR(255) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  `speed` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `storage` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  `form` VARCHAR(255) NOT NULL,
  `series` VARCHAR(255) NOT NULL,
  `capacity` VARCHAR(255) NOT NULL,
  `cache` VARCHAR(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cooler` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `rpm` VARCHAR(255) NOT NULL,
  `noise` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `computer_case` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  `psu_included` VARCHAR(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* PC build tables */

CREATE TABLE `build` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `user_id` INT NOT NULL,
  `name` TEXT NOT NULL,
  `cpu_id` INT,
  `motherboard_id` INT,
  `gpu_id` INT,
  `psu_id` INT,
  `cooler_id` INT,
  `computer_case_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (user_id) REFERENCES user(id),
  FOREIGN KEY (cpu_id) REFERENCES cpu(id),
  FOREIGN KEY (motherboard_id) REFERENCES motherboard(id),
  FOREIGN KEY (gpu_id) REFERENCES gpu(id),
  FOREIGN KEY (psu_id) REFERENCES psu(id),
  FOREIGN KEY (cooler_id) REFERENCES cooler(id),
  FOREIGN KEY (computer_case_id) REFERENCES computer_case(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `user`
ADD FOREIGN KEY (current_build_id) REFERENCES build(id);

CREATE TABLE `post_build` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `post_id` INT NOT NULL,
  `build_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (post_id) REFERENCES post(id),
  FOREIGN KEY (build_id) REFERENCES build(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `build_ram` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `build_id` INT NOT NULL,
  `ram_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (build_id) REFERENCES build(id),
  FOREIGN KEY (ram_id) REFERENCES ram(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `build_storage` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `build_id` INT NOT NULL,
  `storage_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (build_id) REFERENCES build(id),
  FOREIGN KEY (storage_id) REFERENCES storage(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;