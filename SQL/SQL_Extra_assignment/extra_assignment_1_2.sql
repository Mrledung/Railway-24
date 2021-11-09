DROP DATABASE IF EXISTS extra_assignment;
CREATE DATABASE		extra_assignment;
USE extra_assignment;

-- EXERCISE 1:DESIGN A TABLE

-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu

DROP TABLE IF EXISTS fresher_training_managenment;
CREATE TABLE fresher_training_managenment(
	trainee_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name			VARCHAR(50) NOT NULL,
    brith_day			DATE NOT NULL,
    gender				ENUM('male', 'female', 'unknow'),
    et_IQ				TINYINT NOT NULL CHECK(0< et_IQ <=20),
    et_english			TINYINT	NOT NULL CHECK(0< et_english <=50),
    training_class		VARCHAR(50),
    evaluation_notes	TEXT
);

-- Question 2: thêm trường VTI_Account với điều kiện not null & unique

DROP TABLE IF EXISTS fresher_training_managenment;
CREATE TABLE fresher_training_managenment(
	trainee_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name			VARCHAR(50) NOT NULL,
    brith_day			DATE NOT NULL,
    gender				ENUM('male', 'female', 'unknow'),
    et_IQ				TINYINT NOT NULL CHECK(0< et_IQ <=20),
    et_english			TINYINT	NOT NULL CHECK(0< et_english <=50),
    training_class		VARCHAR(50),
    evaluation_notes	TEXT,
    VTI_account			VARCHAR(50)	NOT NULL UNIQUE
);

-- EXERCISE 2: DATA TYPES
DROP TABLE IF EXISTS EXERCISE_2;
CREATE TABLE EXERCISE_2(
		ID				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Name			VARCHAR(100),
        code			CHAR(5) CHECK(code=5),
        ModifiedDate	DATETIME DEFAULT NOW()
);


-- EXERCISE 3: DATA TYPES(2)
DROP TABLE IF EXISTS EXERCISE_3;
CREATE TABLE EXERCISE_3(
		ID				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Name			VARCHAR(100),
        BirthDate		DATE NOT NULL,
        Gender			 ENUM('0', '1','Unknow'), -- 0: male, 1: female, Null: unknow
        IsDeletedFlag	ENUM('0','1') -- 0: hoạt động, 1: xóa
);





