# Created_by: Hieu_iceTea
# Created_at: 15:00 2021-06-03
# Updated_at: 15:15 2021-06-03

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                           Create DataBase                                           #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

DROP DATABASE IF EXISTS `Practice_IASF`;
CREATE DATABASE IF NOT EXISTS `Practice_IASF` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `Practice_IASF`;

SET time_zone = '+07:00';
ALTER DATABASE `Practice_IASF` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

# SET SQL_MODE = 'ALLOW_INVALID_DATES';


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                            Create Tables                                            #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Create Table user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user`
(
    `id`         INT AUTO_INCREMENT,

    `full_name`  VARCHAR(64) NOT NULL,
    `age`        INT         NOT NULL,
    `salary`     INT         NOT NULL,

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


INSERT INTO user (id, full_name, age, salary)
VALUE (15, 'Đặng Kim Thi', 35, 120000);
INSERT INTO user (id, full_name, age, salary)
VALUE (14, 'Hiếu iceTea', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (13, 'Nguyễn Đình Hiếu', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (12, 'Nông Phan Mạnh Hùng', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (11, 'Vũ Quang Huy', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (10, 'Nguyễn Trung Anh', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (9, 'Đỗ Thị Chan Hòa', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (8, 'Hà Văn Vũ', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (7, 'CODEDY Customer', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (6, 'CODEDY Staff C', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (5, 'CODEDY Staff B', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (4, 'CODEDY Staff A', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (3, 'CODEDY Admin Demo', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (2, 'CODEDY Admin', 25, 70000);
INSERT INTO user (id, full_name, age, salary)
VALUE (1, 'CODEDY Host', 25, 70000);
