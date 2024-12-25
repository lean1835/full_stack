DROP DATABASE IF EXISTS lesson_02;
CREATE DATABASE lesson_02;
USE lesson_02;

-- Tạo bảng department
DROP TABLE IF EXISTS department;
CREATE TABLE department (
    department_id INT,
    department_name VARCHAR(50)
);
-- Thêm dữ liệu vào bảng
INSERT INTO department (department_id, department_name)
VALUES (1,"Giám đóc"),
	   (2,"Bảo vệ");
       
-- Hiển thị dữ liệu
TABLE department;       
-- Ràng buộc dữ liệu (Constraints)

-- NULL /NOT NULL

DROP TABLE IF EXISTS student;
CREATE TABLE student(
	email VARCHAR(50) NOT NULL-- ràng buộc k dc null
);
-- VD: Thêm student có email là NULL
INSERT INTO student(email) value(NULL);
-- Error Code: 1048. Column 'email' cannot be null	0.000 sec
TABLE student;
-- UNIQUE KEY : Duy nhất
DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
	phone CHAR(10) UNIQUE NOT NULL
);
-- VD: Thêm 2 customer có phone giống nhau
INSERT INTO customer(phone)
VALUE ("0987654321"),
	  ("0987654321");
-- Error Code: 1062. Duplicate entry '0987654321' for key 'customer.phone'

-- DEFAULT: Mặc định
DROP TABLE IF EXISTS answer;
CREATE TABLE answer(
	is_correct BOOLEAN DEFAULT FALSE,
    create_date DATE DEFAULT (CURRENT_DATE) -- giá trị mặc định sẽ auto hiển thị nếu ng dùng k truyền lạ    
);
-- VD: Thêm answer không truyền vào create_date
INSERT INTO answer(is_correct)
VALUE(TRUE); -- k có ô chứa dữ liệu của create_date
TABLE answer;

-- CHECK: KIỂM TRA
DROP TABLE IF EXISTS account;
CREATE TABLE account(
	age INT CHECK (age >=18)
);
-- VD: Thêm account có age=15
INSERT INTO account (age) VALUES (15);
-- => lỗi: Error Code: 3819. Check constraint 'account_chk_1' is violated.

-- PRIMARY KEY: Khóa chính
-- yêu cầu: unique + not null
-- 1. Một bảng có tối đa một quá chính
-- 2.Một khóa chính có một hoặc nhiều cột
-- AUTO_INCREMENT: Tự động tăng
-- VĐ: Khóa chính một cột
DROP TABLE IF EXISTS question;
CREATE TABLE question(
	question_id INT PRIMARY KEY AUTO_INCREMENT, -- là một khóa chính tự động tăng
    content VARCHAR(50)
);
-- VD: thêm 2 question
INSERT INTO question (content)
VALUES ("Câu hỏi MySQL"),
	("Câu hỏi JAVA");
TABLE question;
-- => nếu k truyền giá trị cho id với các thuộc tính kia thì nó sẽ tự tăng số 1,2,3,...

-- VD: Khóa chính 2 cột
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account(
	group_id INT,
    account_id INT,
    join_date DATE,
    PRIMARY KEY (group_id,account_id) -- gía trị phải là duy nhất: 1-1 có cột khác 1-1 là k dc nhưng 1-2 là dc
);

-- VD: Thêm 2 group account
INSERT INTO group_account (group_id, account_id, join_date)
VALUES (1, 1, "2023-06-19"),
       (1, 1, "2024-12-24");
-- => lỗi: Error Code: 1062. Duplicate entry '1-1' for key 'group_account.PRIMARY'


-- FOREIGN KEY: Khóa ngoại (khóa liên kết các bảng)
-- sự kiện: UPDATE, DELETE
-- Hành động: NO ACCTION(K cho phép xóa hoặc cập nhật ngọn) ,
-- SET DEFAULT (set lại giá trị theo một mặc định), 
-- SET NULL (thay thành null)
-- CASCADE (bố làm gì thì con đổi theo y hệt) (hay dùng)
DROP TABLE IF EXISTS department;
CREATE TABLE department(
	id INT PRIMARY KEY,  -- cột tham chiếu tới phải là khóa chính
    name VARCHAR(50)
);
DROP TABLE IF EXISTS account;
CREATE TABLE account(
	id INT,
    username VARCHAR(50),
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES department (id)
    ON UPDATE CASCADE ON DELETE CASCADE -- sử dụng cú pháp để theo
);

INSERT INTO department (id,name)
VALUES (1,"Giám đóc"),
	   (2,"Bảo vệ");
INSERT INTO account (id,username,department_id)
VALUES (1,"An.lv",3);
-- k trùng trong 2 id có sẫn kia => Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`lesson_02`.`account`, CONSTRAINT `account_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`))
-- => được:
INSERT INTO account (id,username,department_id)
VALUES (1,"An.lv",2);



















































