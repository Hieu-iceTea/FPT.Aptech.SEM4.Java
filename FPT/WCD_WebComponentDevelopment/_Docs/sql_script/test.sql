# 00. Tạo Tài khoản truy cập cơ sở dữ liệu (tùy chọn, nếu cần):
GRANT ALL PRIVILEGES ON *.* TO javauser@localhost
    IDENTIFIED BY 'javadude' WITH GRANT OPTION;

# 01. Tạo Cơ sở dữ liệu:
create database DatabaseName_Test;
use DatabaseName_Test;

# 02. Tạo Bảng:
create table TableName_Test (
    id int not null auto_increment primary key,
    foo varchar(25),
    bar int);

# 03. Nhập dữ liệu mẫu vào bảng vừa tạo:
insert into TableName_Test value (null, 'hello', 12345);
insert into TableName_Test value (null, 'welcome', 56789);
