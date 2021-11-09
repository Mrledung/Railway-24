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
    Department_Number		TINYINT UNSIGNED,
    FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number)
);


DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE Employee_Skill_Table(
	Employee_Number			TINYINT UNSIGNED,
    Skill_Code				VARCHAR(50) NOT NULL,
    Date_Registered			DATE NOT NULL ,
    FOREIGN KEY (Employee_Number) REFERENCES Employee_Table(Employee_Number)
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
VALUES									(1					,'CEO'		, '2020-11-11'),
										(1					,'JAVA'		, '1997-11-11'),
                                        (3					,'JAVA'		, '1998-11-11'),
                                        (4					,'JAVA'		, '1999-11-11'),
                                        (5					,'JAVA'		, '2000-11-11'),
                                        (1					,'PRODUCT'	, '1999-11-11'),
                                        (7					,'PRODUCT'	, '1999-12-11'),
                                        (8					,'PRODUCT'	, '1999-10-11'),
                                        (9					,'PRODUCT'	, '1999-11-12'),
                                        (10					,'PRODUCT'	, '1999-11-13')
;

-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java

SELECT  e.Employee_Number,e.Employee_Name,ek.Skill_Code
FROM	Employee_Skill_Table ek
JOIN 	employee_table e ON e.Employee_Number = ek.Employee_Number
WHERE	ek.Skill_Code= 'JAVA'
;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT 		d.*,COUNT(e.Employee_Number) AS SL_NV
FROM 		Department d
JOIN  		Employee_Table e
ON			e.Department_Number=d.Department_Number
GROUP BY 	d.Department_Number
HAVING 		COUNT(e.Employee_Number) >3
;
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.Hướng dẫn: sử dụng GROUP BY

SELECT	 d.*, GROUP_CONCAT(e.Employee_Name)
FROM 	Department d
JOIN  	Employee_Table e
ON		d.Department_Number=e.Department_Number
GROUP BY d.Department_Number
;

-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.Hướng dẫn: sử dụng DISTINCT

SELECT ek.Employee_Number,e.Employee_Name, GROUP_CONCAT(ek.Skill_Code)
FROM Employee_Skill_Table ek
JOIN employee_table e ON ek.Employee_Number=e.Employee_Number
GROUP BY ek.Employee_Number
HAVING count(ek.Skill_Code) >1;
