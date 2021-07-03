# Created_by: Hieu_iceTea
# Created_at: 11:00 2021-07-03
# Updated_at: 13:00 2021-07-03

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                           Create DataBase                                           #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

DROP DATABASE IF EXISTS `IASF_Securing_Web_MySQL`;
CREATE DATABASE IF NOT EXISTS `IASF_Securing_Web_MySQL` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `IASF_Securing_Web_MySQL`;

SET time_zone = '+07:00';
ALTER DATABASE `IASF_Securing_Web_MySQL` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

# SET SQL_MODE = 'ALLOW_INVALID_DATES';


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                            Create Tables                                            #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

-- Default User Schema from documentation: https://docs.spring.io/spring-security/site/docs/current/reference/html5/#user-schema

# Create Table users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users`
(
    `id`       INT AUTO_INCREMENT,

    `username` VARCHAR(64)  NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    `enabled`  BOOLEAN      NOT NULL,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

# Create Table authorities
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE IF NOT EXISTS `authorities`
(
    `id`        INT AUTO_INCREMENT,

    `username`  VARCHAR(64) NOT NULL,
    `authority` VARCHAR(64) NOT NULL,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

#create unique index ix_auth_username on authorities (username, authority);


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                             Insert Data                                             #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Default passwords: 123456

-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: http://www.luv2code.com/generate-bcrypt-password
-- Other : https://bcrypt-generator.com

INSERT INTO users (username, password, enabled)
VALUES ('user', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', true),
       ('admin', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', true),
       ('Hieu_iceTea', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', true);

INSERT INTO authorities (username, authority)
VALUES ('user', 'ROLE_USER'),
       ('admin', 'ROLE_ADMIN'),
       ('Hieu_iceTea', 'ROLE_USER'),
       ('Hieu_iceTea', 'ROLE_ADMIN');