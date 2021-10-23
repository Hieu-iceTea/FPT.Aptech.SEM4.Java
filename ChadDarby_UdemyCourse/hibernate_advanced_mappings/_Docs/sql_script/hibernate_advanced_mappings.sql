
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                           Create DataBase                                           #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# SET @DATABASE_Name = 'hibernate_advanced_mappings';

DROP DATABASE IF EXISTS `hibernate_advanced_mappings`;
CREATE DATABASE IF NOT EXISTS `hibernate_advanced_mappings` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `hibernate_advanced_mappings`;

SET time_zone = '+07:00';
ALTER DATABASE `hibernate_advanced_mappings` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

# SET SQL_MODE = 'ALLOW_INVALID_DATES';

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                            Create Tables                                            #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Create Table users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users`
(
    `id`         INT AUTO_INCREMENT,

    `username`   VARCHAR(64) UNIQUE  NOT NULL,
    `email`      VARCHAR(128) UNIQUE NOT NULL,
    `password`   VARCHAR(64)         NOT NULL,

    `image`      VARCHAR(128),
    `gender`     int, #1 nam, 2 nữ
    `first_name` VARCHAR(64),
    `last_name`  VARCHAR(64),
    `phone`      VARCHAR(16),
    `address`    VARCHAR(128),
    `rate_avg`   double       default null,

    `active`     BOOLEAN      DEFAULT TRUE,

    `created_by` NVARCHAR(32) DEFAULT 'Codedy',
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by` NVARCHAR(32) DEFAULT 'Codedy',
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`    INT          DEFAULT 1,
    `deleted`    BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;


# Create Table authorities
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE IF NOT EXISTS `authorities`
(
    `id`         INT AUTO_INCREMENT,

    `username`   VARCHAR(64)  NOT NULL,
    `authority`  VARCHAR(128) NOT NULL,

    `created_by` NVARCHAR(32) DEFAULT 'Codedy',
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by` NVARCHAR(32) DEFAULT 'Codedy',
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`    INT          DEFAULT 1,
    `deleted`    BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                             Insert Data                                             #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Default password: 123456

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (1, 'Host', 'host.codedy@gmail.com', '$2y$10$oW..IGNT/CH2muKpN/8LAuNJ1ahnwLoyCBWRQyBj4p6ITOJFb.gs2','host.jpg', 1, 'CODEDY', 'Host', '032 87 99 000','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (2, 'Admin', 'admin.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','admin.jpg', 1, 'CODEDY', 'Admin', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (3, 'Member', 'admin_demo.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','admin_demo.jpg', 1, 'CODEDY', 'Admin Demo', '0868 6633 15','HN', FALSE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (4, 'Partner', 'staff_a.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','staff_a.jpg', 1, 'CODEDY', 'Staff A', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (5, 'Hung', 'staff_b.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','staff_b.jpg', 2, 'CODEDY', 'Staff B', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (6, 'Huy', 'codedy.demo@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','customer.jpg', 1, 'CODEDY', 'Customer', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (7, 'Hieu', 'AnhNTTH1908059@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','AnhNTTH1908059.jpg', 1, 'Nguyễn Trung', 'Anh', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (8, 'Hoa', 'HuyVQTH1909003@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','HuyVQTH1909003.jpg', 1, 'Vũ Quang', 'Huy', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (9, 'Vu', 'HungNPMTH1908050@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','HungNPMTH1908050.jpg', 1, 'Nông Phan Mạnh', 'Hùng', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (10, 'TrungAnh', 'HieuNDTH1908028@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','DinhHieu9999.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (11, 'ManhHung', 'ThiDK@fpt.edu.vn ', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','ManhHung.jpg', 2, 'Đặng Kim', 'Thi', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (12, 'Staff_C', 'staff_c.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','staff_c.jpg', 1, 'CODEDY', 'Staff C', '0868 6633 15','HN', TRUE);


INSERT INTO authorities (username, authority)
VALUES
('Admin', 'ROLE_ADMIN'),
('Member', 'ROLE_MEMBER'),
('Partner', 'ROLE_PARTNER'),
('Hung', 'ROLE_MEMBER'),
('Huy', 'ROLE_MEMBER'),
('Hieu', 'ROLE_PARTNER'),
('Vu', 'ROLE_MEMBER'),
('TrungAnh', 'ROLE_MEMBER'),
('Hoa', 'ROLE_PARTNER');
