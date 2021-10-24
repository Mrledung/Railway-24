DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;

 -- create table department
DROP TABLE IF EXISTS department;
CREATE TABLE department (
		department_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		department_name		VARCHAR(50) NOT NULL UNIQUE KEY 
 );
 
 -- create table position
DROP TABLE IF EXISTS position;
CREATE TABLE position (
		position_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		position_name		ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE KEY
 );
 
 -- create table account
DROP TABLE IF EXISTS account;
CREATE TABLE account (
		account_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		email				VARCHAR(50) UNIQUE KEY NOT NULL,
		username			VARCHAR(20) UNIQUE KEY NOT NULL,
		full_name			VARCHAR(50) NOT NULL,
		department_id		TINYINT UNSIGNED NOT NULL,
		position_id			TINYINT UNSIGNED NOT NULL,
		create_date			DATETIME DEFAULT NOW(),
		FOREIGN KEY			(department_id) REFERENCES department (department_id),
		FOREIGN KEY			(position_id) REFERENCES position (position_id)
);

 -- create table gruop
 DROP TABLE IF EXISTS gruop;
CREATE TABLE gruop(
		gruop_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		gruop_name			VARCHAR(20) NOT NULL UNIQUE ,
		creator_id			TINYINT UNSIGNED UNIQUE KEY,
		create_date			DATETIME DEFAULT NOW(),
        FOREIGN KEY         (creator_id) REFERENCES department(department_id)
);

 -- create table gruop_account
 DROP TABLE IF EXISTS gruop_account;
CREATE TABLE gruop_account(
		gruop_id			TINYINT UNSIGNED NOT NULL,
		account_id			TINYINT UNSIGNED NOT NULL,
		create_date			DATETIME DEFAULT NOW(),
		PRIMARY KEY         (gruop_id, account_id)
);

-- create type_question
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question(
		type_id				INT PRIMARY KEY AUTO_INCREMENT,
		type_name			ENUM('essay', 'multiple-choice')
);

 -- create table category_question
 DROP TABLE IF EXISTS category;
CREATE TABLE category_question(
		category_id			INT PRIMARY KEY AUTO_INCREMENT,
		category_name		VARCHAR(50)
);

 -- create table question
 DROP TABLE IF EXISTS question;
CREATE TABLE question(
		question_id			INT PRIMARY KEY AUTO_INCREMENT,
		content				VARCHAR(1000),
		category_id			INT NOT NULL,
		type_id				INT NOT NULL,
		creator_id			TINYINT UNIQUE KEY,
		create_date			DATETIME DEFAULT NOW(),
		FOREIGN KEY         (category_id) REFERENCES category_question(category_id),
		FOREIGN KEY         (type_id) REFERENCES type_question(type_id)
);

 -- create table answer
 DROP TABLE IF EXISTS answer;
CREATE TABLE answer(
		answer_id			INT PRIMARY KEY AUTO_INCREMENT,
		content				VARCHAR(1000),
		question_id			INT NOT NULL,
		iscorrect			ENUM('T', 'F') NOT NULL
);

 -- create table exam
 DROP TABLE IF EXISTS exam;
CREATE TABLE exam(
		exam_id				TINYINT PRIMARY KEY AUTO_INCREMENT,
		co_de				VARCHAR(15) NOT NULL,
		title				VARCHAR(1000),
		category_id			INT NOT NULL,
		duration			TINYINT UNSIGNED NOT NULL,
		creator_id			TINYINT UNSIGNED NOT NULL,
		create_date			DATETIME DEFAULT NOW()
	);
    
 -- create table exam_question
 DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question(
		exam_id				TINYINT NOT NULL,
		question_id			INT NOT NULL,
		FOREIGN KEY(exam_id) REFERENCES exam (exam_id),
		FOREIGN KEY(question_id) REFERENCES question(question_id)
);