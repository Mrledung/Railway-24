DROP DATABASE IF EXISTS extra_assignment_4;
CREATE DATABASE extra_assignment_4;
USE extra_assignment_4;

-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	Department_Number		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Department_Name			VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS Employee_Table;
CREATE TABLE Employee_Table(
	Employee_Number			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Employee_Name			VARCHAR(50) NOT NULL,
    Department_Number		TINYINT UNSIGNED
);

DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE Employee_Skill_Table(
	Employee_Number			TINYINT UNSIGNED,
    Skill_Code				VARCHAR(50) NOT NULL,
    Date_Registered			DATE NOT NULL
);

-- Question 2: Thêm ít nhất 10 bản ghi vào table

INSERT INTO Department		(Department_Name)
VALUES						('Giám đốc'),
							('Thư ký'),
                            ('Nhân sự'),
                            ('Kỹ thuật'),
                            ('Sản xuất'),
                            ('Sale'),
                            ('Maketing'),
                            ('Đối ngoại'),
                            ('Bảo vệ'),
                            ('Tạp vụ')
;

INSERT INTO Employee_Table		(Employee_Name        ,Department_Number)
VALUES							('Lê văn An'			,1),
								('Phan văn Bình'		,4),
								('Trần văn Cần'			,4),
								('Nguyễn văn Dũng'		,4),	
								('Nguyễn thị Bích'		,4),
								('Lê thị tú Trinh'		,5),
								('Trần thị Kim Thoa'	,5),
								('Nguyễn Bá Duy'		,5),
								('Lâm Chấn Khang'		,5),
								('Võ minh Chiết'		,9)
;

INSERT INTO Employee_Skill_Table		(Employee_Number   ,Skill_Code	, Date_Registered)
VALUES									(1					,'CEO'		, '1999-11-11'),
										(1					,'JAVA'		, '1999-11-11'),
                                        (3					,'JAVA'		, '1999-11-11'),
                                        (4					,'JAVA'		, '1999-11-11'),
                                        (5					,'JAVA'		, '1999-11-11'),
                                        (1					,'PRODUCT'	, '1999-11-11'),
                                        (7					,'PRODUCT'	, '1999-11-11'),
                                        (8					,'PRODUCT'	, '1999-11-11'),
                                        (9					,'PRODUCT'	, '1999-11-11'),
                                        (10					,'PRODUCT'	, '1999-11-11')
;

-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java

SELECT  Employee_Name,Employee_Number
FROM	Employee_Table	

UNION 

SELECT  Employee_Number,Skill_Code
FROM	Employee_Skill_Table
WHERE	Skill_Code= 'JAVA'
;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT 		a.Department_Number,a.department_name,GROUP_CONCAT(Employee_Name)
FROM 		Department a
JOIN  		Employee_Table b
ON			a.Department_Number=b.Department_Number
GROUP BY 	b.Department_Number
HAVING 		COUNT(*) >3
;
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.Hướng dẫn: sử dụng GROUP BY

SELECT a.Department_Name,b.Department_Number, GROUP_CONCAT(Employee_Name)
FROM Department a
JOIN  Employee_Table b
ON		a.Department_Number=b.Department_Number
GROUP BY b.Department_Number
;

-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.Hướng dẫn: sử dụng DISTINCT



SELECT COUNT(*),GROUP_CONCAT(Employee_Number)
FROM Employee_Skill_Table
GROUP BY Skill_Code
