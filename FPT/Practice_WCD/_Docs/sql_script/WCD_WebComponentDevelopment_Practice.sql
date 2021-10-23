# Created_by: Hieu_iceTea
# Created_at: 15:00 2021-06-03
# Updated_at: 15:15 2021-06-03

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                           Create DataBase                                           #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

DROP DATABASE IF EXISTS `WCD_WebComponentDevelopment_Practice`;
CREATE DATABASE IF NOT EXISTS `WCD_WebComponentDevelopment_Practice` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `WCD_WebComponentDevelopment_Practice`;

SET time_zone = '+07:00';
ALTER DATABASE `WCD_WebComponentDevelopment_Practice` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

# SET SQL_MODE = 'ALLOW_INVALID_DATES';


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                            Create Tables                                            #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Create Table employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee`
(
    `id`         INT AUTO_INCREMENT,

    `full_name`  VARCHAR(64) NOT NULL,
    `birthday`   DATE NOT NULL,
    `address`    VARCHAR(64) NOT NULL,
    `position`   VARCHAR(64) NOT NULL,
    `department` VARCHAR(64) NOT NULL,

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


INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (15, 'Đặng Kim Thi', '1984-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Teacher', 'FPT Aptech');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (14, 'Hiếu iceTea', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Student', 'FPT Aptech');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (13, 'Nguyễn Đình Hiếu', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Student', 'FPT Aptech');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (12, 'Nông Phan Mạnh Hùng', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Student', 'FPT Aptech');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (11, 'Vũ Quang Huy', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Student', 'FPT Aptech');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (10, 'Nguyễn Trung Anh', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Student', 'FPT Aptech');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (9, 'Đỗ Thị Chan Hòa', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Student', 'FPT Aptech');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (8, 'Hà Văn Vũ', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Student', 'FPT Aptech');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (7, 'CODEDY Customer', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Manager', 'Codedy Techwiz');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (6, 'CODEDY Staff C', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Manager', 'Codedy Techwiz');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (5, 'CODEDY Staff B', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Manager', 'Codedy Techwiz');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (4, 'CODEDY Staff A', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Manager', 'Codedy Techwiz');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (3, 'CODEDY Admin Demo', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Manager', 'Codedy Techwiz');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (2, 'CODEDY Admin', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Manager', 'Codedy Techwiz');
INSERT INTO employee (id, full_name, birthday, address, position, department)
VALUE (1, 'CODEDY Host', '1996-08-08', '8, Ton That Thuyet, Ha Noi, Viet Nam', 'Manager', 'Codedy Techwiz');
