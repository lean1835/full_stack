
-- Xoa database neu ton tai
DROP DATABASE IF EXISTS lesson_01;

-- Hien thi danh sach database
SHOW DATABASES;

-- Tao database
CREATE DATABASE lesson_01;

-- Chon database muon thao tac
USE lesson_01;

-- Kiểu dữ liệu
-- Số nguyên:
-- TINYINT   : 1 byte
-- SMALLINT  : 2 byte
-- MEDIUMINT : 3 byte
-- INT       : 4 byte
-- BIGINT    : 8 byte
-- Số thực:
-- FLOAT     : 4 byte
-- DOUBLE    : 8 byte
--  Chuoi (xau ky tu):
-- CHAR
-- VARCHAR
-- Thoi gian: 
-- DATE 	: yyyy-MM-dd (2024-01-29)
-- TIME		: hh:mm:ss (20:05:18)
-- DATETIME :yyyy-MM-dd hh:mm:ss (2024-01-29 20:05:18)) 
-- Logic: 
-- BOOLEAN (TRUE hoac FALSE)
-- ENUM: la cac gia tri huu han
-- cu phap: ENUM("MALE","FEMALE")

-- Tao table:
CREATE TABLE customer(
	id INT UNSIGNED,
    name VARCHAR(50),
    birthdate DATE,
    gender ENUM("MALE","FEMALE"),
    active BOOLEAN
);

-- Xoa table neu ton tai
DROP TABLE IF EXISTS customer;

-- Hien thi danh sach table dang thao tac
SHOW TABLES;

-- Mo ta table
DESCRIBE customer;

-- DDL table
SHOW CREATE TABLE customer;

