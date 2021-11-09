USE testing_system_assignment;


-- Question 1 : Không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước.( hiểu là create_date nhập vào nếu có giá trị là trc thời gian hiện tại 1 năm thì sẽ không được)

DROP TRIGGER IF EXISTS can_not_insert_into_group_if_createdate_is_now_interval_1year;
delimiter $$
CREATE TRIGGER can_not_insert_into_group_if_createdate_is_now_interval_1year
BEFORE INSERT ON gruop
FOR EACH ROW
BEGIN

IF NEW.create_date < subdate(now(),INTERVAL 1 YEAR) THEN 
SIGNAL SQLSTATE '12345'						-- có nghĩa là :không cho INSERT
SET MESSAGE_TEXT = ' can not insert data';		

END IF;

END $$
DELIMITER ;

-- use 
INSERT INTO gruop ( gruop_name 	,creator_id		,create_date)
VALUES 				('abcd'			,1				,'2019-10-25');

-- Question 2: viết trigger không cho phép người dùng thêm bất kỳ user nào vào department 'Sale' nữa
				-- khi thêm thì hiện ra thông báo 'department "Sale" can not add more user'
-- TH insert
DROP TRIGGER IF EXISTS  can_not_insert_more_user_into_deparment_sale ;
DELIMITER $$
CREATE TRIGGER  	can_not_insert_more_user_into_deparment_sale
BEFORE INSERT ON 	account
FOR EACH ROW
	BEGIN
			IF 		NEW.department_id =1
            THEN 
					SIGNAL SQLSTATE '12345'						
					SET MESSAGE_TEXT = 'department "Sale" can not add more user';
			END IF ;
	END $$
DELIMITER ;	
-- TH update

DROP TRIGGER IF EXISTS  can_not_update_user_on_deparment_sale ;
DELIMITER $$
CREATE TRIGGER  	can_not_update_user_on_deparment_sale
BEFORE UPDATE ON 	account
FOR EACH ROW
	BEGIN
			IF 		NEW.department_id =1
            THEN 
					SIGNAL SQLSTATE '12345'						
					SET MESSAGE_TEXT = 'department "Sale" can not add more user';
			END IF ;
	END $$
DELIMITER ;	
-- use
INSERT INTO account (email,username,full_name,department_id,position_id)
VALUES				('ledung@gmail.com','ledung','le tri dung',1,1);

UPDATE  account
SET department_id = 1
WHERE department_id = 3;

-- Question 3 : Cấu hình 1 gruop có nhiều nhất 5 user

DROP TRIGGER IF EXISTS  can_not_insert_user_into_the_group_if_more_than_5user ;
DELIMITER $$
CREATE TRIGGER  	can_not_insert_user_into_the_group_if_more_than_5user
BEFORE INSERT ON 	gruop_account
FOR EACH ROW
	BEGIN
    -- tìm ra những group có thành viên >5
			-- SELECT gruop_id,count(account_id)
            -- from	gruop_account
            -- GROUP BY gruop_id
            -- having count(account_id) >5
          
            
			IF 		NEW.gruop_id IN (	SELECT g.gruop_id
										FROM	gruop_account g
										GROUP BY g.gruop_id
										HAVING COUNT(g.account_id) >=5
									)
            THEN 
					SIGNAL SQLSTATE '12345'
					SET MESSAGE_TEXT = 'can not insert into this gruop because total user have been more than 5 ';
			END IF ;
	END $$
DELIMITER ;

-- use 
insert into 	gruop_account (gruop_id		,account_id)
values						  (2				,3		);

-- Question 4 : cấu hình 1 bài thi có nhiều nhất 10 câu hỏi 
INSERT INTO question (content	,category_id,type_id,creator_id)
VALUES				('1+3'		,1			,1		,2			);

INSERT INTO exam_question (exam_id	,question_id)
VALUES						(1		,2),
							(1		,3),
							(1		,4),
							(1		,5),
							(1		,6),
							(1		,7),
							(1		,8),
							(1		,9),
							(1		,10),
							(1		,11);

DROP TRIGGER IF EXISTS can_not_insert_question_into_the_exam_if_more_than_10qest;
DELIMITER $$
CREATE TRIGGER can_not_insert_question_into_the_exam_if_more_than_10qest
BEFORE INSERT ON exam_question
FOR EACH ROW
	BEGIN
		IF	NEW.exam_id IN ( SELECT exam_id
							FROM exam_question
                            GROUP BY exam_id
                            HAVING COUNT(question_id)>= 10
							) THEN
		
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = 'can not insert into this exam because total question have been more than 10 ';
		END IF ;
	END $$
    DELIMITER ;
							
-- user
INSERT INTO exam_question (exam_id	,question_id)
VALUES						(1		,13);

-- Question 5 : tạo trigger không cho phép người dùng xóa tài khoản có email là admin@gmail.com ( đây là tài khoản admin , không cho phép user xóa),
				-- còn lại cái tài khoản khác thì sẽ cho phép người dùng xóa và xóa tất cả cả các thông tin liên quan đến user đó
                
INSERT INTO ACCOUNT ( email				,username	,full_name		,department_id	,position_id)
VALUES				('admin@gmail.com'	,'admin'	, 'ad min'		,1				,1			);

DROP TRIGGER IF EXISTS can_not_delete_account_of_admin;
DELIMITER $$
CREATE TRIGGER can_not_delete_account_of_admin
BEFORE DELETE ON ACCOUNT
FOR EACH ROW
BEGIN
	IF 	OLD.email='admin@gmail.com' THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'đây là tài khoản admin , không cho phép user xóa ';
	END IF ;
END $$
DELIMITER ;

-- use
DELETE 
FROM 	account 
WHERE	account_id=11;

-- Question 6: không sử dung cấu hình default cho field department_id của table account, 
			-- hãy tạo trigger cho phép người dùng khi tạo account không điền vào department_id thì sẽ được phân vào phòng 'waiting room'
            
INSERT INTO department(department_name)
VALUES					('waiting room');

DROP TRIGGER IF EXISTS when_create_account_if_department_is_null_auto_into_waitingroom;
DELIMITER $$
CREATE TRIGGER when_create_account_if_department_is_null_auto_into_waitingroom
BEFORE INSERT ON ACCOUNT
FOR EACH ROW
BEGIN
	IF 	NEW.department_id IS NULL THEN
		SET NEW.department_id = 11 ;
	END IF ;
END $$
DELIMITER ;

-- use
INSERT INTO ACCOUNT ( email				,username	,full_name		,position_id)
VALUES				('vuba@gmail.com'	,'vuba'	, 'vũ bá'			,1			);
-- cach 2

DROP TRIGGER IF EXISTS when_create_account_if_department_is_null_auto_into_waitingroom;
DELIMITER $$
CREATE TRIGGER when_create_account_if_department_is_null_auto_into_waitingroom
BEFORE INSERT ON ACCOUNT
FOR EACH ROW
BEGIN
	DECLARE v_waiting_room TINYINT;
    SELECT department_id INTO v_waiting_room
    FROM 	department
    WHERE 	department_name= 'waiting room';
    
	IF 	NEW.department_id IS NULL THEN
		SET NEW.department_id = v_waiting_room ;
	END IF ;
END $$
DELIMITER ;

-- use
INSERT INTO ACCOUNT ( email				,username	,full_name		,position_id)
VALUES				('vuba@gmail.com'	,'vuba'	, 'vũ bá'			,1			);

-- Question 7: cấu hình 1 bài thi(exam_question) chỉ cho phép user tạo tối đa 4 answer cho mối question, trong đó có tối đa 2 đáp án đúng.

-- TH1: create by UPDATE 
DROP TRIGGER IF EXISTS can_not_create_by_update_examquestion;
DELIMITER $$
CREATE TRIGGER can_not_create_by_update_examquestion
BEFORE UPDATE on exam_question
FOR EACH ROW 
BEGIN
	DECLARE v_count_answer TINYINT;
	DECLARE v_count_iscorrect_T TINYINT;
    
    SELECT 		count(answer_id) INTO v_count_answer
    FROM 		answer
    WHERE 	question_id = NEW.question_id
    GROUP BY 	question_id;
    
    SELECT 	count(iscorrect) INTO v_count_iscorrect_T
    FROM	answer
    WHERE	iscorrect ='T' AND question_id = NEW.question_id
     GROUP BY 	question_id;
     
	IF	(v_count_answer >4) AND (v_count_iscorrect_T >2) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'can not update exam ';
	END IF ;
                

END$$
DELIMITER ;

-- use
UPDATE 	exam_question
SET 	question_id =2
WHERE 	question_id =4;

-- TH2: create new 

DROP TRIGGER IF EXISTS can_not_create_insert_new_examquestion;
DELIMITER $$
CREATE TRIGGER can_not_create_insert_new_examquestion
BEFORE INSERT on exam_question
FOR EACH ROW 
BEGIN
	DECLARE v_count_answer TINYINT;
	DECLARE v_count_iscorrect_T TINYINT;
    
    SELECT count(answer_id) INTO v_count_answer
    FROM answer
    WHERE question_id = NEW.question_id;
    
    SELECT 	count(iscorrect) INTO v_count_iscorrect_T
    FROM	answer
    WHERE	iscorrect ='T' AND question_id = NEW.question_id;
    
	IF	(v_count_answer >4) AND (v_count_iscorrect_T >2) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'can not create exam ';
	END IF ;
                

END$$
DELIMITER ;

-- use
INSERT INTO	 exam_question (exam_id,question_id)
VALUES						(12,	2			);

-- Question 8: Viết trigger sửa lại dữ liệu cho đúng
				-- nếu người dùng nhập vào gender là nam, nữ, chưa xác định 
                -- thì đổi lại thành 				 M  ,F  ,U
DROP TRIGGER IF EXISTS repair_gender;
DELIMITER $$
CREATE TRIGGER repair_gender
BEFORE INSERT on account
FOR EACH ROW 
BEGIN
	
	IF		NEW.gender='nam' THEN SET NEW.gender='M';
	ELSEIF	NEW.gender='nữ' THEN SET NEW.gender='F';
	ELSEIF 	NEW.gender='chưa xác định ' THEN SET NEW.gender='U';
	END IF ;
                

END$$
DELIMITER ;

-- use

INSERT INTO account			(email,						username,			full_name,		gender,	department_id,	position_id, create_date)
VALUES						('letribao@gmail.com'		,'tri_bao'			,'Lê Trí Bảo'	,'nam'		,'1'			,'1'		, '2020-09-20');
                
-- Question 9: viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày

DROP TRIGGER IF EXISTS can_not_delete_exam;
DELIMITER $$
CREATE TRIGGER can_not_delete_exam
BEFORE DELETE ON exam
FOR EACH ROW 
BEGIN
	
	IF		(OLD.create_date > (SELECT subdate(now(),INTERVAL 2 DAY))) THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = 'can not delete exam ';
	
	END IF ;
                

END$$
DELIMITER ;

-- use
DELETE  FROM exam
WHERE exam_id = 1;


-- Question 10: viết trigger chỉ cho phép người dùng update , delete các question khi các question đó chưa nằm trong exam nào

-- TH delete
DROP TRIGGER IF EXISTS can_not_delete_question;
DELIMITER $$
CREATE TRIGGER can_not_delete_question
BEFORE DELETE ON question
FOR EACH ROW 
BEGIN
	
	IF		OLD.question_id IN (SELECT q.question_id 
								FROM question q
								JOIN exam_question eq ON q.question_id=eq.question_id
								) THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = 'can not delete this question ';
	
	END IF ;
                

END$$
DELIMITER ;

-- use
DELETE FROM question
WHERE question_id =4;

-- TH UPDATE

-- TH delete
DROP TRIGGER IF EXISTS can_not_update_question;
DELIMITER $$
CREATE TRIGGER can_not_update_question
BEFORE UPDATE ON question
FOR EACH ROW 
BEGIN
	
	IF		NEW.question_id IN (SELECT  DISTINCT question_id 
								FROM exam_question 
								) THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = 'can not update this question ';
	
	END IF ;
                

END$$
DELIMITER ;

-- use
UPDATE  question 
SET type_id =2
WHERE question_id =1;

-- Question 12 : Lấy ra thông tin exam trong đó :
												-- duaration <=30 thì đổi thành giá trị ' short time' 
                                                -- 30< duration <=60 thì đổi thành giá trị ' medium time'
                                                -- duration > 60 thì đổi thành giá trị ' long time'
                                                
SELECT exam_id,title,duration, (CASE
									WHEN duration <=30 THEN ' short time' 
                                    WHEN 30< duration <=60 THEN ' medium time'
                                    WHEN duration > 60 THEN ' long time'
                               
							END ) AS note
FROM exam ;

-- Question 13 : thống kê số lượng account trong mối group và in ra thêm 1 cột nữa có tên là the_number_user_account mà mang giá trị được qui định như sau :
				-- nếu số lượng user trong gruop <=5 thì có giá trị là few
                -- nếu số lượng user trong gruop <=20 và >5  thì có giá trị là normal
                -- nếu số lượng user trong gruop >20 thì có giá trị là higher
                
SELECT a.gruop_id, count(account_id), (CASE 
											WHEN 	count(b.account_id)<=1 THEN 'few'
                                            WHEN 	((count(b.account_id)<=2) AND (count(b.account_id)>1)) THEN 'normal'
											WHEN 	count(b.account_id)>2 THEN 'higher'
                                            
										END) AS the_number_user_account
FROM gruop a
LEFT JOIN gruop_account b  ON a.gruop_id=b.gruop_id
GROUP BY a.gruop_id
;

-- Question 14 : thống kê mỗi phòng ban có bao nhiêu user, nếu phòng ban nào không có user thì sẽ thay đổi giá trị 0 thành 'Không có User'

SELECT d.*, (CASE
					WHEN COUNT(a.account_id)=0 THEN 'Không có User'
					ELSE COUNT(a.account_id)
			END ) AS count_user 
FROM department d
LEFT JOIN ACCOUNT a ON a.department_id=d.department_id
GROUP BY d.department_id
;

