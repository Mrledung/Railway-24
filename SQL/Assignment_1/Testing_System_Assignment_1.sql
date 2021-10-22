CREATE DATABASE testing_system;
USE testing_system;

CREATE TABLE department (
		department_id		INT,
		department_name		VARCHAR(20)
		);

CREATE TABLE position (
		position_id			INT,
		position_name		VARCHAR(20)
		);

CREATE TABLE account (
		account_id			INT,
		email				VARCHAR(50),
		username			VARCHAR(20),
		fullname			VARCHAR(20),
		department_id		INT,
		position_id			INT,
		creatdate			DATE
		);

CREATE TABLE gruop (
		gruop_id			INT,
		gruop_name			VARCHAR(20),
		creator_id			INT,
		creatdate			DATE
		);
		
CREATE TABLE gruop_account (
		gruop_id			INT,
		account_id			INT,
		join_date			DATE
		);
DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;
 -- create table department
CREATE TABLE department (
		department_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		department_name		VARCHAR(50)
 );
 -- create table position
CREATE TABLE position (
		position_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		position_name		ENUM('Dev', 'Test', 'Scrum Master', 'PM')
 );
 -- create table account
CREATE TABLE account(
		account_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		email				VARCHAR(50) UNIQUE KEY,
		username			VARCHAR(20) UNIQUE KEY,
		full_name			VARCHAR(50),
		department_id		TINYINT,
		position_id			TINYINT,
		create_date			DATE,
		FOREIGN KEY(department_id) REFERENCES department(department_id),
		FOREIGN KEY(position_id) REFERENCES position (position_id)
);
 -- create table gruop
CREATE TABLE gruop(
		gruop_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		gruop_name			VARCHAR(20),
		creator_id			TINYINT UNIQUE KEY,
		create_date			DATE
);
 -- create table gruop_account
CREATE TABLE gruop_account(
		gruop_id			TINYINT,
		account_id			TINYINT,
		create_date			DATE,
		FOREIGN KEY(gruop_id) REFERENCES gruop(gruop_id),
		FOREIGN KEY(account_id) REFERENCES account(account_id)
);
-- create type_question;
CREATE TABLE type_question(
		type_id				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		type_name			ENUM('essay', 'multiple-choice')
);
 -- create table category_question
CREATE TABLE category_question(
		category_id			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		category_name		VARCHAR(50)
);
 -- create table question
CREATE TABLE question(
		question_id			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		content				VARCHAR(1000),
		category_id			INT,
		type_id				INT,
		creator_id			TINYINT UNIQUE KEY,
		create_date			DATE,
		FOREIGN KEY(category_id) REFERENCES category_question(category_id),
		FOREIGN KEY(type_id) REFERENCES type_question(type_id)
);
 -- create table answer
CREATE TABLE answer(
		answer_id			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		content				VARCHAR(1000),
		question_id			INT,
		iscorrect			ENUM('đúng', 'sai') NOT NULL
);
 -- create table exam
CREATE TABLE exam(
		exam_id				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		co_de				VARCHAR(15) NOT NULL,
		title				VARCHAR(1000),
		category_id			INT,
		duration			DATETIME,
		creator_id			TINYINT UNSIGNED,
		create_date			DATE
	);
 -- create table exam_question
CREATE TABLE exam_question(
		exam_id				TINYINT,
		question_id			INT,
		FOREIGN KEY(exam_id) REFERENCES exam (exam_id),
		FOREIGN KEY(question_id) REFERENCES question(question_id)
);
