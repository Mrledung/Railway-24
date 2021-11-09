DROP DATABASE IF EXISTS testing_system_assignment;
CREATE DATABASE testing_system_assignment;
USE testing_system_assignment;

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
		creator_id			TINYINT UNSIGNED ,
		create_date			DATETIME DEFAULT NOW(),
        FOREIGN KEY         (creator_id) REFERENCES account(account_id)
);

 -- create table gruop_account
 DROP TABLE IF EXISTS gruop_account;
CREATE TABLE gruop_account(
		gruop_id			TINYINT UNSIGNED ,
		account_id			TINYINT UNSIGNED NOT NULL,
		create_date			DATETIME DEFAULT NOW(),
		FOREIGN KEY         (account_id) REFERENCES account(account_id),
        FOREIGN KEY         (gruop_id) REFERENCES gruop(gruop_id)
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
		content				TEXT,
		category_id			INT NOT NULL,
		type_id				INT NOT NULL,
		creator_id			TINYINT UNSIGNED,
		create_date			DATETIME DEFAULT NOW(),
		FOREIGN KEY         (category_id) REFERENCES category_question(category_id),
		FOREIGN KEY         (type_id) REFERENCES type_question(type_id),
        CONSTRAINT fk_qest_acc FOREIGN KEY (creator_id) REFERENCES account(account_id)
);

 -- create table answer
 DROP TABLE IF EXISTS answer;
CREATE TABLE answer(
		answer_id			INT PRIMARY KEY AUTO_INCREMENT,
		content				TEXT,
		question_id			INT NOT NULL,
		iscorrect			ENUM('T', 'F') NOT NULL,
        FOREIGN KEY         (question_id) REFERENCES question(question_id)
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
		create_date			DATETIME DEFAULT NOW(),
		CONSTRAINT fk_ex_cate FOREIGN KEY (category_id) REFERENCES category_question(category_id),
        CONSTRAINT fk_ex_acc FOREIGN KEY (creator_id) REFERENCES  account(account_id)
	);
    
 -- create table exam_question
 DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question(
		exam_id				TINYINT NOT NULL,
		question_id			INT NOT NULL,
		FOREIGN KEY(exam_id) REFERENCES exam (exam_id),
		CONSTRAINT fk_eqest_qest FOREIGN KEY(question_id) REFERENCES question(question_id)
);

-- insert values into  department table
 
INSERT INTO department		(department_name)
VALUES						('Sale'),
							('Maketing'),
							('Kế toán'),
							('Công đoàn'),
							('phòng IT'),
							('Nhân sự'),
							('Bảo trì'),
							('Bảo vệ'),
							('Giám đốc'),
							('Thư ký')
;


-- insert values into position table

INSERT INTO position		(position_name)
VALUES						('Dev'),
							('Scrum Master'),
							('Test'),
							('PM')
;

 -- insert values into account table
 
INSERT INTO account			(email,						username,			full_name,			department_id,	position_id,create_date)
VALUES						('levanAn@gmail.com'		,'le_An'			,'Lê văn An'			,'1'			,'1'	,'2019-08-05'),
							('phanvanBinh@gmail.com'	,'phan_Binh'		,'Phan văn Bình'		,'1'			,'2'	,'2020-08-05'),
							('tranvanCan@gmail.com'		,'tran_Can'			,'Trần văn Cần'			,'1'			,'3'	,'2021-08-05'),
							('nguyenvanDung@gmail.com'	,'nguyen_Dung'		,'Nguyễn văn Dũng'		,'1'			,'4'	,'2018-08-05'),
							('nguyenngocbich@gmail.com'	,'nguyen_Bich'		,'Nguyễn thị Bích'		,'6'			,'4'	,'2017-08-05'),
							('lethitutrinh@gmail.com'	,'le_tutrinh'		,'Lê thị tú Trinh'		,'6'			,'3'	,'2016-08-05'),
							('tranthikimthoa@gmail.com'	,'tran_kimthoa'		,'Trần thị Kim Thoa'	,'7'			,'2'	,'2015-08-05'),
							('nguyenbaduy@gmail.com'	,'nguyen_duy'		,'Nguyễn Bá Duy'		,'8'			,'1'	,'2014-08-05'),
							('lamchankhang@gmail.com'	,'lam_chankhang'	,'Lâm Chấn Khang'		,'3'			,'2'	,'2013-08-05'),
							('vominhchiet@gmail.com'	,'vo_minh'			,'Võ minh Chiết'		,'10'			,'3'	,'2012-08-05')
;

 -- insert values into gruop table
 
INSERT INTO gruop			(gruop_name,							creator_id,		create_date	)
VALUES						('kỹ thuật'								,'4'			,'2020-08-05'),
							('năng động'							,'5'			,'2016-08-05'),
							('thể thao'								,'1'			,'2009-08-05'),
							('du lịch'								,'1'			,'2020-08-05'),
							('bán hàng'								,'1'			,'2012-08-05'),
							('chăm sóc khách hàng'					,'9'			,'2020-08-05'),
							('làm đẹp'								,'8'			,'2010-08-05'),
							('học ngoại ngữ'						,'1'			,'2017-08-05'),
							('hội đồng quản trị'					,'2'			,'2015-08-05'),
							('kế toán tổng hợp'						,'5'			,'2020-08-05')
;

 -- insert values into gruop_account table
 
INSERT INTO gruop_account	(gruop_id,				account_id)
VALUES						('1'						,'1'),
							('2'						,'1'),
							('3'						,'1'),
                            ('4'						,'4'),
                            ('6'						,'5'),
                            ('7'						,'6'),
                            ('8'						,'7'),
                            ('9'						,'7'),
                            ('2'						,'4'),
                            ('2'						,'7')
;

 -- insert values into type_question table
 
INSERT INTO type_question	(type_name)
VALUES						('essay'),
							('multiple-choice')
;

 -- insert values into category_question table
 
INSERT INTO category_question				(category_name)
VALUES										('toán'),
											('lý'),
											('hóa'),
											('văn'),
											('sử'),
											('địa'),
											('anh văn'),
											('pháp văn'),
											('trung văn'),
											('nga văn')
;

 -- insert values into question table
 
INSERT INTO question			(content			,category_id	,type_id	,creator_id)
VALUES							('cau hoi ve toan'		,1				,'1'		,1			),
								('cau hoi ve ly'		,2				,'2'		,2			),
                                ('cau hoi ve hoa'		,3				,'2'		,2			),
                                ('cau hoi ve van'		,4				,'1'		,4			),
                                ('cau hoi ve su'		,5				,'2'		,5			),
                                ('cau hoi ve dia'		,6				,'1'		,6			),
                                ('cau hoi ve anh van'	,7				,'2'		,7			),
                                ('cau hoi ve trung van'	,9				,'2'		,5			),
                                ('cau hoi ve phap van'	,8				,'2'		,9			),
                                ('cau hoi ve nga van'	,10				,'2'		,1			)
;

 -- insert values into answer table
 

INSERT INTO answer				(content			,question_id		,iscorrect)
VALUES							('cau tra loi 2-1'	,2					,'T'		),
                                ('cau tra loi 2-1'	,2					,'F'		),
                                ('cau tra loi 3-1'	,3					,'F'		),
                                ('cau tra loi 4-1'	,4					,'F'		),
								('cau tra loi 5-1'	,5					,'F'		),								
								('cau tra loi 6-1'	,5					,'T'		),							
								('cau tra loi 7-1'	,7					,'T'		),							
								('cau tra loi 8-1'	,8					,'T'		),							
								('cau tra loi 9-1'	,9					,'F'		),							
								('cau tra loi 10-1'	,10					,'F'		)							
;

 -- insert values into exam table
 
INSERT INTO exam				(co_de			,title					,category_id	,duration	,creator_id)
VALUES							('TOAN2021'		,'de thi chuyen toan'		,1				,120		,1),
								('LY2021'		,'de thi chuyen ly'			,1				,60			,5),
								('HOA2021'		,'de thi chuyen hoa'		,1				,120		,1),
								('VAN2021'		,'de thi chuyen van'		,1				,120		,7),
								('SU2021'		,'de thi chuyen su'			,1				,60			,9),
								('DIA2021'		,'de thi chuyen dia'		,1				,120		,1),
								('ANHVAN2021'	,'de thi chuyen anh van'	,1				,120		,8),
								('PHAP2021'		,'de thi chuyen phan van'	,1				,60			,1),
								('TRUNG2021'	,'de thi chuyen trung van'	,1				,120		,2),
								('NGA2021'		,'de thi chuyen nga van'	,1				,120		,4)
;

 -- insert values into exam_question table
 
INSERT INTO exam_question		(exam_id		,question_id)
VALUES							(1				,1			),
								(2				,2			),
								(3				,3			),
								(4				,4			),
								(5				,5			),
								(6				,6			),
								(7				,7			),
								(8				,8			),
								(9				,9			),
								(10				,10			)
;