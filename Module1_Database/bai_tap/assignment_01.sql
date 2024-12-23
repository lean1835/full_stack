DROP DATABASE IF EXISTS assignment_01;
CREATE DATABASE assignment_01;
USE assignment_01;

-- 1.Tao bang department
DROP TABLE IF EXISTS department;
CREATE TABLE department(
	department_id INT,
    department_name VARCHAR(50)
);

-- 2.Tao bang position
DROP TABLE IF EXISTS position;
CREATE TABLE `position`(
	position_id INT,
    position_name ENUM("Dev","Test","Scrum Master","PM")
);

-- 3.Tao bang account
DROP TABLE IF EXISTS account;
CREATE TABLE account(
	account_id INT,
    email VARCHAR(50),
    username VARCHAR(50),
    full_name VARCHAR(50),
	department_id INT,
    position_id INT,
    create_date DATE
    
);

-- 4.Tao bang group
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
	group_id INT,
    group_name VARCHAR(50),
    creator_id INT,
    create_date DATE
);

-- 5.Tao bang group account
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account (
	group_id INT,
    account_id INT,
    join_date DATE
);

-- 6.Tao bang type question
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question (
	type_id INT,
    type_name ENUM("Essay","Multiple-choice")
);

-- 7.Tao bang CategoryQuestion
DROP TABLE IF EXISTS category_question;
CREATE TABLE category_question (
	category_id INT,
    catagory_name ENUM("Java",".NET","SQL","Postman","Ruby")
);

-- 8.Tao bang Question
DROP TABLE IF EXISTS question;
CREATE TABLE question (
	question_id INT,
    content VARCHAR(50),
    category_id INT,
    type_id INT,
    creator_id INT,
    create_date DATE
);

-- 9.Tao bang Answer
DROP TABLE IF EXISTS answer;
CREATE TABLE answer (
	answer_id INT,
    content VARCHAR(50),
    question_id INT,
    is_correct BOOLEAN
);

-- 10.Tao bang Exam
DROP TABLE IF EXISTS exam;
CREATE TABLE exam (
	exam_id INT,
    code INT,
    title VARCHAR(50),
    category_id INT,
    duration DATE,
    creator_id INT,
    create_date DATE
);

-- 11.Tao bang exam question
DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question(
	exam_id INT,
    question_id INT
);
