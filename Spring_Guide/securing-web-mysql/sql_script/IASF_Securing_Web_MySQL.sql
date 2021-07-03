# Created_by: Hieu_iceTea
# Created_at: 11:00 2021-07-03
# Updated_at: 11:00 2021-07-03

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
create table users
(
    username varchar(50) not null primary key,
    password varchar(50) not null,
    enabled boolean not null
);

create table authorities
(
    username varchar(50) not null,
    authority varchar(50) not null,
    constraint fk_authorities_users foreign key (username) references users (username)
);
create
    unique index ix_auth_username on authorities (username, authority);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                             Insert Data                                             #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Default passwords: 123456

-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: http://www.luv2code.com/generate-bcrypt-password

INSERT INTO users (username, password, enabled)
VALUES ('user', '123456', true);
INSERT INTO users (username, password, enabled)
VALUES ('admin', '123456', true);
INSERT INTO users (username, password, enabled)
VALUES ('Hieu_iceTea', '123456', true);

INSERT INTO authorities (username, authority)
VALUES ('user', 'ROLE_USER');
INSERT INTO authorities (username, authority)
VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO authorities (username, authority)
VALUES ('Hieu_iceTea', 'ROLE_USER');
INSERT INTO authorities (username, authority)
VALUES ('Hieu_iceTea', 'ROLE_ADMIN');