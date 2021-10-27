DROP DATABASE IF EXISTS extra_assignment_3;
CREATE DATABASE		extra_assignment_3;
USE extra_assignment_3;

-- EXERCISE 1: TIẾP TỤC VỚI DATABASE QUẢN LÝ FRESHER


DROP TABLE IF EXISTS fresher_training_managenment;
CREATE TABLE fresher_training_managenment(
	trainee_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name			VARCHAR(50) NOT NULL,
    VTI_account			VARCHAR(50)	NOT NULL UNIQUE,
    brith_day			DATE NOT NULL,
    gender				ENUM('male', 'female', 'unknown') NOT NULL,
    et_IQ				TINYINT NOT NULL CHECK(0< et_IQ <=20),
    et_english			TINYINT	NOT NULL CHECK(0< et_english <=50),
    et_gmath			TINYINT	NOT NULL CHECK(0< et_gmath <=20),
    training_class		VARCHAR(50),
    evaluation_notes	TEXT
);

-- QUESTION 1: Thêm ít nhất 10 bản ghi vào table

INSERT INTO fresher_training_managenment   (full_name			,VTI_account		,brith_day		,gender				,et_IQ		,et_english	,et_gmath		,training_class)
VALUES										('Tom John'			,'tomppro2000'		,'2000-10-22'		,'male'			,8			,5			,10		,  'Railway21'),
											('Acacia Alice'		,'tAcaciro2000'		,'1987-11-03'		,'female'		,19			,40			,2		,  'Railway22'),
                                            ('CeHebe a Anne'	,'toHebe 000'		,'2003-12-28'		,'female'		,6			,45			,15		,  'Railway21'),
                                            ('Hebe Bush'		,'tHebe o2000'		,'2008-01-22'		,'unknown'		,16			,5			,11		,  'Railway22'),
                                            ('Gwyneth Frank'	,'yneto2000'		,'2007-04-10'		,'male'			,10			,4			,5		,  'Railway21'),
                                            ('Halcyon Henry'	,'talcyoro2000'		,'2019-03-15'		,'male'			,18			,41			,3		,  'Railway23'),
                                            ('Helga George'		,'toeor00'			,'1990-12-18'		,'male'			,2			,4			,8		,  'Railway24'),
                                            ('Isolde Elizabeth'	,'tlizo2000'		,'1995-04-08'		,'male'			,19			,41			,9		,  'Railway24'),
                                            ('Jezebel Helen'	,'Jezebelppro2000'	,'1991-03-03'		,'female'		,5			,20			,17		,  'Railway24'),
                                            ('Ernesta James '	,'tornes2000'		,'1986-09-11'		,'male'			,15			,40			,12		,  'Railway24'),
                                            ('Eudora Jane '		,'toudor'			,'1981-11-09'		,'male'			,4			,40			,7		,  'Railway24'),
                                            ('Ceridwen Joan '	,'tomeridwe'		,'2015-10-09'		,'unknown'		,16			,10			,6		,  'Railway24'),
                                            ('Ciara Richard '	,'toichar2000'		,'2008-11-22'		,'male'			,18			,49			,13		,  'Railway24')
;     


-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,nhóm chúng thành các tháng sinh khác nhau

              SELECT	full_name, brith_day
              FROM		fresher_training_managenment
              GROUP BY	brith_day
 --             HAVING	brith_day=(WHERE LIKE() -- ko hieu
 ;
 
 -- QUESTION 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:tên, tuổi, các thông tin cơ bản như đã được định nghĩa trong table
 
 SELECT 	*
 FROM 		fresher_training_managenment
 WHERE		LENGTH(full_name) = (SELECT  MAX(LENGTH(full_name)) FROM fresher_training_managenment)
 ;
 
 -- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
				-- những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
				-- ET_IQ + ET_Gmath>=20
				--  ET_IQ>=8
				--  ET_Gmath>=8
				--  ET_English>=18
                
SELECT *
FROM   	 	fresher_training_managenment
WHERE		(et_IQ + et_gmath)>=20 AND et_IQ>=8 AND et_english>=18 AND et_gmath >=8
;

-- Question 5: xóa thực tập sinh có TraineeID = 3

DELETE 
FROM 		fresher_training_managenment
WHERE		trainee_id= 3
;

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "'Railway22'". Hãy cập nhật thông tin vào database
 
 UPDATE		fresher_training_managenment
 SET		training_class='Railway22'
 WHERE		trainee_id	= 5
 ;
 
              
              
		
              





