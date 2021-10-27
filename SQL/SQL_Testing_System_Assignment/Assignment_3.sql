DROP DATABASE IF EXISTS testing_system_assignment_3;
CREATE DATABASE testing_system_assignment_3;
USE testing_system_assignment_3;

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
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
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
 
INSERT INTO account			(email,						username,			full_name,			department_id,	position_id)
VALUES						('levanAn@gmail.com'		,'le_An'			,'Lê văn An'			,'1'			,'1'		),
							('phanvanBinh@gmail.com'	,'phan_Binh'		,'Phan văn Bình'		,'1'			,'2'		),
							('tranvanCan@gmail.com'		,'tran_Can'			,'Trần văn Cần'			,'1'			,'3'		),
							('nguyenvanDung@gmail.com'	,'nguyen_Dung'		,'Nguyễn văn Dũng'		,'1'			,'4'		),
							('nguyenngocbich@gmail.com'	,'nguyen_Bich'		,'Nguyễn thị Bích'		,'6'			,'4'	),
							('lethitutrinh@gmail.com'	,'le_tutrinh'		,'Lê thị tú Trinh'		,'6'			,'3'		),
							('tranthikimthoa@gmail.com'	,'tran_kimthoa'		,'Trần thị Kim Thoa'	,'7'			,'2'		),
							('nguyenbaduy@gmail.com'	,'nguyen_duy'		,'Nguyễn Bá Duy'		,'8'			,'1'		),
							('lamchankhang@gmail.com'	,'lam_chankhang'	,'Lâm Chấn Khang'		,'3'			,'2'		),
							('vominhchiet@gmail.com'	,'vo_minh'			,'Võ minh Chiết'		,'10'			,'3'		)
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
                                ('cau hoi ve hoa'		,3				,'2'		,3			),
                                ('cau hoi ve van'		,4				,'1'		,4			),
                                ('cau hoi ve su'		,5				,'2'		,5			),
                                ('cau hoi ve dia'		,6				,'1'		,6			),
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
								(3				,3			),
								(4				,4			),
								(5				,5			),
								(6				,6			),
								(7				,7			),
								(8				,8			),
								(9				,9			),
								(10				,10			)
;


-- Question 2: lấy ra tất cả các phòng ban

SELECT 	department_name
FROM	department
;

-- Question 4: lấy ra thông tin account có full name dài nhất

SELECT * 
FROM	account
WHERE	LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM account)
;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3

SELECT 	* 
FROM			account
WHERE			department_id= 3  AND LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM account )
;


-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019

SELECT			gruop_name, COUNT(gruop_name)
FROM			gruop
GROUP BY		gruop_name
HAVING			COUNT(create_date) < 2020-12-20
;

-- Question 7: Lấy ra ID của question có >= 2 câu trả lời


SELECT 			question_id, COUNT(question_id)
FROM 			answer 
GROUP BY 		question_id 
HAVING 			COUNT(question_id) >= 2
;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019

SELECT		co_de
FROM		exam
WHERE	 duration >= 60 AND create_date < 2019-12-20
;

-- Question 9: Lấy ra 5 group được tạo gần đây nhất

SELECT		*
FROM		gruop
ORDER BY	create_date DESC
LIMIT 5
;

-- Question 10: Đếm số nhân viên thuộc department có id = 2

SELECT 		account_id AS 'số nhân viên thuộc department có id = 2', COUNT(account_id) AS 'SL'
FROM		account
GROUP BY	department_id
HAVING		department_id = 2
;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"

SELECT 			full_name
FROM			account
WHERE			full_name LIKE'D%o' 
;
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019

DELETE 
FROM 			exam
WHERE			create_date < 2019-12-20
;

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"

DELETE
FROM 			question
WHERE			content LIKE 'câu hỏi%'
;

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn

UPDATE		account
SET			full_name = 'Nguyễn Bá Lộc ',
			email =	'loc.nguyenba@vti.com.vn'
WHERE		account_id = 5
;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4

UPDATE 		gruop_account
SET			gruop_id = 4
WHERE		account_id = 5
;








			
