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