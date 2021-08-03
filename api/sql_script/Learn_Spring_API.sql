# Created_by: Hieu_iceTea
# Created_at: 10:00 2021-08-03
# Updated_at: 10:15 2021-08-03

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                           Create DataBase                                           #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# SET @DATABASE_Name = 'Learn_Spring_API';

# Create DataBase >> (Lúc nhập dữ liệu để deploy thì bỏ 2 dòng tạo DB này, nhớ đổi tên DB nữa nhé)
DROP DATABASE IF EXISTS `Learn_Spring_API`;
CREATE DATABASE IF NOT EXISTS `Learn_Spring_API` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `Learn_Spring_API`;

SET time_zone = '+07:00';
ALTER DATABASE `Learn_Spring_API` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

# SET SQL_MODE = 'ALLOW_INVALID_DATES';

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                            Create Tables                                            #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Create Table users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users`
(
    `id`                  INT AUTO_INCREMENT,

    `restaurant_id`       INT UNSIGNED,

    `username`            VARCHAR(64) UNIQUE           NOT NULL,
    `email`               VARCHAR(64) UNIQUE           NOT NULL,
    `password`            VARCHAR(128)                 NOT NULL,

    `email_verified_at`   DATETIME,
    `verification_code`   VARCHAR(8)     DEFAULT NULL,
    `reset_password_code` VARCHAR(16)    DEFAULT NULL,
    `remember_token`      VARCHAR(128)   DEFAULT NULL,

    `image`               VARCHAR(128),
    `gender`              BOOLEAN,
    `name`                VARCHAR(64),
    `phone`               VARCHAR(16),
    `address`             VARCHAR(128),

    `wage`                DECIMAL(16, 2) DEFAULT 0     NOT NULL,

    `enabled`             BOOLEAN        DEFAULT FALSE NOT NULL,

    `created_by`          NVARCHAR(32)   DEFAULT 'Hieu_iceTea',
    `created_at`          TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32)   DEFAULT NULL,
    `updated_at`          TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    `version`             INT            DEFAULT 1,
    `deleted`             BOOLEAN        DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;


# Create Table authorities
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE IF NOT EXISTS `authorities`
(
    `id`         INT AUTO_INCREMENT,

    `username`   VARCHAR(64)  NOT NULL,
    `authority`  VARCHAR(128) NOT NULL,

    `created_by` NVARCHAR(32) DEFAULT 'Hieu_iceTea',
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by` NVARCHAR(32) DEFAULT NULL,
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`    INT          DEFAULT 1,
    `deleted`    BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;


# Create Table employees
DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees`
(
    `id`         INT AUTO_INCREMENT,

    `first_name` VARCHAR(64),
    `last_name`  VARCHAR(64),
    `email`      VARCHAR(128),

    `created_by` NVARCHAR(32) DEFAULT 'Hieu_iceTea',
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by` NVARCHAR(32) DEFAULT NULL,
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`    INT          DEFAULT 1,
    `deleted`    BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                             Insert Data                                             #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Default password: 123456

INSERT INTO users (id, restaurant_id, username, email, password, email_verified_at, image, gender, name, phone, address, enabled)
VALUES
(2, NULL, 'Employee', 'Employee@codedy.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '1996-08-08', 'Employee.jpg', 1, 'Employee', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE),
(1, NULL, 'Manager', 'Manager@codedy.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'Manager.jpg', 2, 'Manager', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE),
(0, NULL, 'Admin', 'Admin@codedy.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'Admin.jpg', 1, 'Admin', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);


INSERT INTO authorities (username, authority)
VALUES
('Employee', 'ROLE_Employee'),
('Manager', 'ROLE_Manager'),
('Admin', 'ROLE_Admin');


INSERT INTO employees (id, first_name, last_name, email)
VALUES
(13, 'Nguyễn Đình', 'Hiếu', 'DinhHieu8896@gmail.com'),
(12, 'Đặng Kim', 'Thi', 'ThiDK@fpt.edu.vn'),
(11, 'Nguyễn Đình', 'Hiếu', 'HieuNDTH1908028@fpt.edu.vn'),
(10, 'Nông Phan Mạnh', 'Hùng', 'HungNPMTH1908050@fpt.edu.vn'),
(9, 'Vũ Quang', 'Huy', 'HuyVQTH1909003@fpt.edu.vn'),
(8, 'Nguyễn Trung', 'Anh', 'AnhNTTH1908059@fpt.edu.vn'),
(7, 'CODEDY', 'Customer', 'codedy.demo@gmail.com'),
(6, 'CODEDY', 'Staff C', 'staff_c.codedy@gmail.com'),
(5, 'CODEDY', 'Staff B', 'staff_b.codedy@gmail.com'),
(4, 'CODEDY', 'Staff A', 'staff_a.codedy@gmail.com'),
(3, 'CODEDY Admin', 'ReadOnly', 'admin_readOnly.codedy@gmail.com'),
(2, 'CODEDY', 'Admin', 'admin.codedy@gmail.com'),
(1, 'CODEDY', 'Host', 'host.codedy@gmail.com');
