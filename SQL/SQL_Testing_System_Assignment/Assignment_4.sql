DROP DATABASE IF EXISTS testing_system_assignment_4;
CREATE DATABASE testing_system_assignment_4;
USE testing_system_assignment_4;

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
        FOREIGN KEY         (creator_id) REFERENCES department(department_id)
);

 -- create table gruop_account
 DROP TABLE IF EXISTS gruop_account;
CREATE TABLE gruop_account(
		gruop_id			TINYINT UNSIGNED NOT NULL,
		account_id			TINYINT UNSIGNED NOT NULL,
		create_date			DATETIME DEFAULT NOW(),
		FOREIGN KEY			(gruop_id) REFERENCES gruop(gruop_id),
        FOREIGN KEY			(account_id) REFERENCES account(account_id)
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


--  -------------------------------------*****------------------------------------------------------- ---

-- Question 1: Thêm ít nhất 10 record vào mỗi table

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
 
INSERT INTO account			(email,						username,			full_name,			department_id,	position_id, create_date)
VALUES						('levanAn@gmail.com'		,'le_An'			,'Lê văn An'			,'1'			,'1'		, '2020-09-20'),
							('phanvanBinh@gmail.com'	,'phan_Binh'		,'Phan văn Bình'		,'1'			,'2'		,'2020-09-20'),
							('tranvanCan@gmail.com'		,'tran_Can'			,'Trần văn Cần'			,'1'			,'3'		,'2020-09-20'),
							('nguyenvanDung@gmail.com'	,'nguyen_Dung'		,'Nguyễn văn Dũng'		,'1'			,'4'		,'2020-09-20'),
							('nguyenngocbich@gmail.com'	,'nguyen_Bich'		,'Nguyễn thị Bích'		,'6'			,'4'		,'2020-09-20'),
							('lethitutrinh@gmail.com'	,'le_tutrinh'		,'Lê thị tú Trinh'		,'6'			,'3'		,'2021-09-20'),
							('tranthikimthoa@gmail.com'	,'tran_kimthoa'		,'Trần thị Kim Thoa'	,'7'			,'2'		,'2019-09-20'),
							('nguyenbaduy@gmail.com'	,'nguyen_duy'		,'Nguyễn Bá Duy'		,'8'			,'1'		,'2019-09-20'),
							('lamchankhang@gmail.com'	,'lam_chankhang'	,'Lâm Chấn Khang'		,'3'			,'2'		,'2020-09-20'),
							('vominhchiet@gmail.com'	,'vo_minh'			,'Võ minh Chiết'		,'10'			,'3'		,'2020-09-20')
;

 -- insert values into gruop table
 
INSERT INTO gruop			(gruop_name,							creator_id)
VALUES						('kỹ thuật'								,'4'),
							('năng động'							,'5'),
							('thể thao'								,'1'),
							('du lịch'								,'1'),
							('bán hàng'								,'1'),
							('chăm sóc khách hàng'					,'9'),
							('làm đẹp'								,'8'),
							('học ngoại ngữ'						,'1'),
							('hội đồng quản trị'					,'2'),
							('kế toán tổng hợp'						,'5')
;

 -- insert values into gruop_account table
 
INSERT INTO gruop_account	(gruop_id,				account_id)
VALUES						('1'						,'1'),
							('1'						,'1'),
							('1'						,'1'),
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
                                ('cau hoi ve hoa'		,1				,'2'		,3			),
                                ('cau hoi ve van'		,1				,'1'		,4			),
                                ('cau hoi ve su'		,5				,'2'		,5			),
                                ('cau hoi ve dia'		,2				,'1'		,6			),
                                ('cau hoi ve anh van'	,7				,'2'		,7			),
                                ('cau hoi ve trung van'	,9				,'2'		,8			),
                                ('cau hoi ve phap van'	,8				,'2'		,9			),
                                ('cau hoi ve nga van'	,10				,'2'		,10			)
;

 -- insert values into answer table
 
 DELETE FROM answer;
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
								(3				,2			),
								(4				,4			),
								(5				,4			),
								(6				,4			),
								(7				,4			),
								(8				,8			),
								(9				,9			),
								(10				,10			)
;

-- EXERCISE 1: JOIN -------------------------------------
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

SELECT 		account.full_name,account.department_id,department.department_name
FROM 		department 
JOIN 		account 
ON 			department.department_id=account.department_id
;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
 SELECT 		b.full_name,b.department_id,a.department_name,b.create_date
 FROM 			department a
 JOIN 			account b
 ON 			a.department_id=b.department_id
 WHERE 			create_date > '2020-12-20'
 ;

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT 		b.full_name,a.position_name
 FROM 			position a
 JOIN 			account b
 ON 			a.position_id=b.position_id
 WHERE 			position_name = 'Dev'
 ;
 -- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
 SELECT a.department_name,COUNT(b.department_id) AS 'số nv', GROUP_CONCAT(b.full_name) AS 'các tv'
 FROM 			department a
 JOIN 			account b
 ON 			a.department_id=b.department_id
 GROUP BY		b.department_id
 HAVING 		COUNT(b.department_id)>=3
 ;
 
 -- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
 
 SELECT a.content,COUNT(*) AS ' số lần được sd'
 FROM 		question a	
 JOIN 			exam_question b
 ON 			a.question_id=b.question_id
 GROUP BY		b.question_id
 ORDER BY 		COUNT(b.question_id) DESC
 LIMIT 1
 ;
 -- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
 
 SELECT b.category_id,b.content,COUNT(b.category_id)AS 'số lần sử dụng'
FROM 		category_question a	
 JOIN 			question b
 ON 			a.category_id=b.category_id
 GROUP BY		(b.category_id) 
 ;
 
 -- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
 
 SELECT 		a.question_id,a.content,COUNT(b.question_id) AS 'số lần xh trong đè thi'
FROM 			question a	
 JOIN 			exam_question b
 ON 			a.question_id=b.question_id
 GROUP BY		(b.question_id) 
 
 ;
 
 -- Question 8: Lấy ra Question có nhiều câu trả lời nhất
 SELECT 		answer.question_id, count(answer.question_id) 
 FROM 			answer
 JOIN 			question
 ON 			answer.question_id = question.question_id
GROUP BY 		answer.question_id
HAVING 			COUNT(answer.question_id) =  (SELECT MAX(dem) FROM	(SELECT answer.question_id, count(answer.question_id) AS dem 
																		FROM answer
																		JOIN question
																		ON answer.question_id = question.question_id
																		GROUP BY answer.question_id) AS count);
    -- cach khac
SELECT 		a.question_id,a.content,count(b.question_id) 'so cau tra loi'
FROM 		question a
JOIN 		answer b
ON 			a.question_id=b.question_id
GROUP BY 	b.question_id
ORDER BY 	count(b.question_id) DESC
LIMIT 		2
;

-- Question 9: Thống kê số lượng account trong mỗi group

SELECT 				gruop_account.gruop_id,COUNT(gruop_account.account_id) so_luong_account 
FROM 				account  
JOIN 				gruop_account 
ON 					account.account_id =gruop_account.account_id
GROUP BY 			gruop_account.account_id
ORDER BY 			so_luong_account DESC
;

-- Question 10: Tìm chức vụ có ít người nhất

SELECT 				a.position_id,a.position_name,COUNT(b.position_id) 
FROM				position a
JOIN				account b
ON	 				a.position_id=b.position_id
GROUP BY 			b.position_id
HAVING				COUNT(b.position_id) = (SELECT MIN(SL_NV) FROM (SELECT 		a.position_id,a.position_name,COUNT(b.position_id) AS SL_NV
																FROM		position a
																JOIN		account b
																ON	 		a.position_id=b.position_id
																GROUP BY 	b.position_id) AS D);
                                                                
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT		a.department_id,a.department_name,COUNT(b.position_id)
FROM		account b
JOIN 		department a 	ON 	a.department_id=b.department_id
GROUP BY	b.department_id,b.position_id
JOIN		position c		ON b.position_id=c.position_id
GROUP BY	COUNT(b.position_id)
;










 