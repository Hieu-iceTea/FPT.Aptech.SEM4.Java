# Created_by: Hieu_iceTea
# Created_at: 03:00 2021-05-29
# Updated_at: 16:30 2021-05-29

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                           Create DataBase                                           #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

DROP DATABASE IF EXISTS `WCD_WebComponentDevelopment`;
CREATE DATABASE IF NOT EXISTS `WCD_WebComponentDevelopment` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `WCD_WebComponentDevelopment`;

SET time_zone = '+07:00';
ALTER DATABASE `WCD_WebComponentDevelopment` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

# SET SQL_MODE = 'ALLOW_INVALID_DATES';


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                            Create Tables                                            #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Create Table user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user`
(
    `id`                  INT AUTO_INCREMENT,

    `username`           VARCHAR(64) UNIQUE NOT NULL,
    `email`               VARCHAR(64) UNIQUE NOT NULL,
    `password`            VARCHAR(128)       NOT NULL,
    `level`               TINYINT UNSIGNED   NOT NULL,

    `image`               VARCHAR(128),
    `gender`              BOOLEAN,
    `firstname`          VARCHAR(64),
    `lastname`           VARCHAR(64),
    `phone`               VARCHAR(16),
    `address`             VARCHAR(128),

    `active`              BOOLEAN      DEFAULT FALSE,

    `created_by`          NVARCHAR(32) DEFAULT 'Hieu_iceTea',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;



# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                             Insert Data                                             #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Default password: 123456

INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (15, 'ThiDK', 'ThiDK@fpt.edu.vn ', '123456', 4, 'ThiDK.jpg', 2, 'Đặng Kim', 'Thi', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (14, 'Hieu_iceTea', 'DinhHieu8896@gmail.com', '123456', 4, 'Hieu_iceTea.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (13, 'DinhHieu8896', 'HieuNDTH1908028@fpt.edu.vn', '123456', 4, 'DinhHieu8896.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (12, 'HungNPMTH1908050', 'HungNPMTH1908050@fpt.edu.vn', '123456', 4, 'HungNPMTH1908050.jpg', 1, 'Nông Phan Mạnh', 'Hùng', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (11, 'HuyVQTH1909003', 'HuyVQTH1909003@fpt.edu.vn', '123456', 4, 'HuyVQTH1909003.jpg', 1, 'Vũ Quang', 'Huy', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (10, 'AnhNTTH1908059', 'AnhNTTH1908059@fpt.edu.vn', '123456', 4, 'AnhNTTH1908059.jpg', 1, 'Nguyễn Trung', 'Anh', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (9, 'HoaDTCTH1909001', 'HoaDTCTH1909001@fpt.edu.vn', '123456', 4, 'HoaDTCTH1909001.jpg', 1, 'Đỗ Thị Chan', 'Hòa', '098 115 9826', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (8, 'VuHVTH1908054', 'VuHVTH1908054@fpt.edu.vn', '123456', 4, 'VuHVTH1908054.jpg', 1, 'Hà Văn', 'Vũ', '082 589 4329', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (7, 'Customer', 'codedy.demo@gmail.com', '123456', 4, 'customer.jpg', 1, 'CODEDY', 'Customer', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (6, 'Staff_C', 'staff_c.codedy@gmail.com', '123456', 3, 'staff_c.jpg', 1, 'CODEDY', 'Staff C', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (5, 'Staff_B', 'staff_b.codedy@gmail.com', '123456', 3, 'staff_b.jpg', 2, 'CODEDY', 'Staff B', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (4, 'Staff_A', 'staff_a.codedy@gmail.com', '123456', 3, 'staff_a.jpg', 1, 'CODEDY', 'Staff A', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (3, 'Admin_Demo', 'admin_demo.codedy@gmail.com', '123456', 2, 'admin_demo.jpg', 1, 'CODEDY', 'Admin Demo', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', FALSE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (2, 'Admin', 'admin.codedy@gmail.com', '123456', 2, 'admin.jpg', 1, 'CODEDY', 'Admin', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (1, 'Host', 'host.codedy@gmail.com', '123456', 1, 'host.jpg', 1, 'CODEDY', 'Host', '032 87 99 000', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
