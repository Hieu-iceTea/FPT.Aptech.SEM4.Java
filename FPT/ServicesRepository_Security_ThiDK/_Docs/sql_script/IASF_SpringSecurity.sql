# Created_by: Hieu_iceTea
# Created_at: 15:00 2021-06-03
# Updated_at: 15:15 2021-06-03

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                           Create DataBase                                           #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

DROP DATABASE IF EXISTS `IASF_SpringSecurity`;
CREATE DATABASE IF NOT EXISTS `IASF_SpringSecurity` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `IASF_SpringSecurity`;

SET time_zone = '+07:00';
ALTER DATABASE `IASF_SpringSecurity` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

# SET SQL_MODE = 'ALLOW_INVALID_DATES';


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                            Create Tables                                            #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Create Table users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users`
(
    `id`     INT AUTO_INCREMENT,

    username CHAR(64)   NOT NULL,
    password CHAR(128)  NOT NULL,

    enabled  TINYINT(1) NOT NULL,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

# Create Table authorities
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE IF NOT EXISTS `authorities`
(
    `id`      INT AUTO_INCREMENT,

    username  CHAR(64) NOT NULL,
    authority CHAR(64) NOT NULL,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                             Insert Data                                             #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Default passwords: 123456

-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: http://www.luv2code.com/generate-bcrypt-password

INSERT INTO users (username, password, enabled)
VALUE ('hieu_iceTea', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', 1);
INSERT INTO users (username, password, enabled)
VALUE ('admin', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', 1);
INSERT INTO users (username, password, enabled)
VALUE ('manager', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', 1);
INSERT INTO users (username, password, enabled)
VALUE ('employee', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', 1);


INSERT INTO authorities (username, authority)
VALUE ('hieu_iceTea', 'ROLE_ADMIN');
INSERT INTO authorities (username, authority)
VALUE ('hieu_iceTea', 'ROLE_MANAGER');
INSERT INTO authorities (username, authority)
VALUE ('hieu_iceTea', 'ROLE_EMPLOYEE');
INSERT INTO authorities (username, authority)
VALUE ('admin', 'ROLE_ADMIN');
INSERT INTO authorities (username, authority)
VALUE ('manager', 'ROLE_MANAGER');
INSERT INTO authorities (username, authority)
VALUE ('employee', 'ROLE_EMPLOYEE');
