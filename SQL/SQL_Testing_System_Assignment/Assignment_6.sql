USE testing_system_assignment;

 

-- QUESTION 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS nhan_vien_phong_ban;
DELIMITER $$
CREATE PROCEDURE nhan_vien_phong_ban (IN in_department_name VARCHAR(50))
BEGIN
		SELECT 	a.full_name,d.department_name
		FROM 	department d JOIN account a ON a.department_id = d.department_id
		WHERE	d.department_name =in_department_name;
END $$
DELIMITER ;

CALL nhan_vien_phong_ban ('Sale');

				/*QUESTION 2: Tạo store để in ra số lượng account trong mỗi group*/
DROP PROCEDURE IF EXISTS group_of_members;  
 DELIMITER $$
CREATE PROCEDURE group_of_members ()
BEGIN         
		SELECT 		g.gruop_id ,COUNT(a.account_id) 
		FROM 		gruop_account g 
        LEFT JOIN 	account a ON g.account_id=a.account_id
		GROUP BY 	g.gruop_id ;
		
END $$
DELIMITER ;

CALL group_of_members();

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXISTS cau_hoi_thang;  
 DELIMITER $$
CREATE PROCEDURE cau_hoi_thang ()
BEGIN         
		SELECT 		t.*, COUNT(q.question_id)
		FROM		type_question t 
        LEFT JOIN question q ON q.type_id=t.type_id
		WHERE MONTH(q.create_date) = MONTH(now()) AND (YEAR(q.create_date) = YEAR(now()))
		GROUP BY 	t.type_id;
END$$
 DELIMITER ;
 
 CALL cau_hoi_thang ();
 
 -- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
 
DROP PROCEDURE IF EXISTS typeid_of_max_cuontquestion;  
 DELIMITER $$
CREATE PROCEDURE typeid_of_max_cuontquestion (OUT id_type INT(20))
BEGIN
		SELECT 	t.type_id INTO id_type
		FROM type_question t JOIN question q ON q.type_id=t.type_id
		GROUP BY t.type_id
		HAVING COUNT(q.question_id)= ( SELECT MAX(sl) FROM (
															SELECT 	t.type_name, COUNT(q.question_id) AS sl
															FROM type_question t JOIN question q ON q.type_id=t.type_id
															GROUP BY t.type_id
															) AS b1
									);
END$$
 DELIMITER ;
 set @id_type=0;
 CALL typeid_of_max_cuontquestion (@id_type);
 select  @id_type;

 
 
--  Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
select 	type_id,type_name
from	type_question
where	type_id=@id_type;

		 /* Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
			chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
			chuỗi của người dùng nhập vào*/
DROP PROCEDURE IF EXISTS groupname_fullname;  
 DELIMITER $$
CREATE PROCEDURE groupname_fullname (IN input_string VARCHAR(50) )
BEGIN        
			SELECT	g.gruop_name AS groupname_or_fullname
			FROM 	gruop g
            WHERE   g.gruop_name LIKE CONCAT('%',input_string,'%') 
      UNION  
            SELECT	a.username AS groupname_or_fullname
			FROM 	account a
            WHERE   a.username LIKE CONCAT('%',input_string,'%');	            			
END$$
DELIMITER ;

CALL groupname_fullname ('nguyen');

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:

				-- username sẽ giống email nhưng bỏ phần @..mail đi
				-- positionID: sẽ có default là developer
				-- departmentID: sẽ được cho vào 1 phòng chờ

				-- Sau đó in ra kết quả tạo thành công
                
INSERT INTO department (department_name)
VALUES					('phong cho');

DROP PROCEDURE IF EXISTS question7;  
 DELIMITER $$
CREATE PROCEDURE question7 (IN in_email VARCHAR(50) ,IN in_fullname VARCHAR(50))  
 BEGIN
		DECLARE v_fullname VARCHAR(50) DEFAULT SUBSTRING_INDEX(in_email, '@', 1);
		DECLARE v_department_id TINYINT UNSIGNED DEFAULT 0;
		DECLARE v_position_id TINYINT UNSIGNED DEFAULT 0;
        
		INSERT INTO  account 	(email		,	username   , full_name		, department_id,	position_id)
		VALUE					(in_email	,	v_fullname ,in_fullname		,v_department_id, 	v_position_id);
        
		SELECT  full_name INTO v_fullname
		FROM	account
		WHERE	email = in_email ;
        
        SELECT  department_id	INTO v_department_id	
		FROM	department
		WHERE department_name = 'phong cho' ;
        
        SELECT  position_id INTO v_position_id
		FROM	position
		WHERE position_name ='Dev' ;
       
END$$

 DELIMITER ;

call question7('letridung@gmail.com','le tri dung');



-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
            -- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
   DROP PROCEDURE IF EXISTS question8;  
 DELIMITER $$
CREATE PROCEDURE question8 (IN in_type_name ENUM('essay','multiple-choice'))  
 BEGIN  
	
		
				SELECT 	t.type_id,q.content,LENGTH(q.content)
				FROM 	type_question t
				JOIN question q ON t.type_id=q.type_id
                WHERE ( t.type_name =in_type_name) 
					AND 	LENGTH(q.content)	=	(
														Select MAX(LENGTH(qt.content)) 
                                                        From question qt 
                                                        JOIN type_question tq ON qt.type_id=tq.type_id
                                                        WHERE  tq.type_name = in_type_name 
													);
END$$
  
 DELIMITER ;

CALL question8('essay');


-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
 DROP PROCEDURE IF EXISTS delete_exam_from_inputID;  
 DELIMITER $$
CREATE PROCEDURE delete_exam_from_inputID (IN input_examid tinyint(20))  
BEGIN  
 
	DELETE FROM exam_question 
	WHERE exam_id = input_examid;

	DELETE FROM exam
	WHERE exam_id = input_examid;
END$$
 DELIMITER ;

CALL delete_exam_from_inputID(10);

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
				-- Sau đó in số lượng record (bản ghi) đã remove từ các table liên quan trong khi removing ()--> tạo bảng phụ
                
																
                                    
DROP PROCEDURE IF EXISTS delete_exam_created_3year_before;  
 DELIMITER $$
CREATE PROCEDURE delete_exam_created_3year_before ()  
BEGIN  
	-- lấy ra id của bài thi tạo cách đây 3 năm 
		SELECT count(eq.exam_id) AS total_record_of_deleted_from_exam ,count(e.exam_id) AS total_record_of_deleted_from_examquestion
		FROM exam e
		JOIN exam_question eq ON eq.exam_id=e.exam_id
		WHERE e.create_date > subdate(now(),INTERVAL 3 YEAR) ;
									--  liệt kê những exam tạo trc đay 3 năm với hàm SUBDATE , 
									-- trong đó  NOW() là thời điểm hiện tại , sau INTERVAL là đơn vị cần trừ ra từ mốc hiện tại

-- lệnh xóa bai thi trong baneg eq khi exam_Id tạo cách đây 3 năm
		DELETE FROM exam_question qe
		WHERE qe.exam_id  IN (SELECT  e.exam_id
							 FROM exam e
							 WHERE e.create_date > SUBDATE(NOW(),INTERVAL 3 YEAR)
							 );
-- lệnh xóa các exam tạo cách đây 3 năm     
		DELETE FROM exam
		WHERE create_date > SUBDATE(NOW(),INTERVAL 3 YEAR);
    
END$$
 DELIMITER ;
 
 CALL delete_exam_created_3year_before();
  -- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban và (sau đó) các account thuộc phòng ban đó sẽ được
																-- >> chuyển về phòng ban default là phòng ban chờ việc
DROP PROCEDURE IF EXISTS delete_deparment_if_insert_deparmentname;  
 DELIMITER $$
CREATE PROCEDURE delete_deparment_if_insert_deparmentname (IN input_department_name  VARCHAR (50) )  
 BEGIN    		
		DECLARE waitting_room_id TINYINT ;
		SELECT	d.department_id INTO waitting_room_id -- gọi ra id khi nhập vào tên phòng ban tương ứng
		FROM 	department d
		WHERE 	d.department_name = input_department_name ;
        
        UPDATE account a 
        SET 	a.department_id= 11 -- cập nhật lại id phòng ban trong bảng account tương ứng với 1 giá trị của biến trên 
        WHERE 	a.department_id= waitting_room_id;
        
        DELETE FROM department d -- xóa đi id cũ của phòng ban khi người dùng nhập tên tương ứng với 1 giá trị của biến
        WHERE 	d.department_id= waitting_room_id;
        
        
END$$
 DELIMITER ;
 
 CALL delete_deparment_if_insert_deparmentname('Sale');
 
 
 -- QUESTION 12: VIẾT STORE ĐỂ IN RA MỖI THÁNG CÓ BAO NHIÊU CÂU HỎI ĐƯỢC TẠO TRONG NĂM NAY
 
 -- xác định sl câu hỏi được tạo tương ứng với 1 giá trị create_date
		--  SELECT create_date,count(question_id) AS SL
		--  from 	question
		--  WHERE create_date ='2021-01-03 12:17:46';
 
 -- xác định tháng trong create_date 
		-- SELECT MONTH('2021-01-03 12:17:46')
        
DROP PROCEDURE IF EXISTS count_question_in_month;
DELIMITER $$
CREATE PROCEDURE count_question_in_month()
BEGIN
		WITH CTE_12Months AS (
										SELECT 1 AS MONTH
								UNION 	SELECT 2 AS MONTH
								UNION 	SELECT 3 AS MONTH
								UNION 	SELECT 4 AS MONTH
								UNION 	SELECT 5 AS MONTH
								UNION 	SELECT 6 AS MONTH
								UNION 	SELECT 7 AS MONTH
								UNION	SELECT 8 AS MONTH
								UNION 	SELECT 9 AS MONTH
								UNION 	SELECT 10 AS MONTH
								UNION 	SELECT 11 AS MONTH
								UNION 	SELECT 12 AS MONTH
							)
		SELECT 		M.MONTH, count(MONTH(q.create_date)) AS SL										-- lấy ra 2 cột tháng (1-12) và sl câu hỏi trong mỗi tháng
		FROM 		CTE_12Months m
		LEFT JOIN 	(SELECT * 																		-- vì có tháng ko có câu hỏi nên dùng left join 
					FROM question q 
					WHERE YEAR(q.create_date) = YEAR(now()) 										-- lọc lấy những bản ghi có câu hỏi tạo trong năm nay
					) Q
					
		ON m.MONTH = MONTH(Q.create_date)
		GROUP BY m.MONTH;																			-- GROUP BY m.MONTH kết hợp count(MONTH(q.create_date) để đếm những trường hợp trong 1 tháng có nhiều câu hỏi
END$$
DELIMITER ;


Call count_question_in_month();
 
-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
			-- (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")
DROP PROCEDURE IF EXISTS count_question_6in_month;
DELIMITER $$
CREATE PROCEDURE count_question_in_6month()
BEGIN
			WITH CTE_6month AS (
					SELECT MONTH(subdate(NOW(), INTERVAL 5 MONTH)) AS MONTH,YEAR(subdate(NOW(), INTERVAL 5 MONTH)) AS YEAR 
			union
					SELECT MONTH(subdate(NOW(), INTERVAL 4 MONTH)) AS MONTH,YEAR(subdate(NOW(), INTERVAL 4 MONTH)) AS YEAR 
			union
					SELECT MONTH(subdate(NOW(), INTERVAL 3 MONTH)) AS MONTH,YEAR(subdate(NOW(), INTERVAL 3 MONTH)) AS YEAR 
			union
					SELECT MONTH(subdate(NOW(), INTERVAL 2 MONTH)) AS MONTH,YEAR(subdate(NOW(), INTERVAL 2 MONTH)) AS YEAR 
			union
					SELECT MONTH(subdate(NOW(), INTERVAL 1 MONTH)) AS MONTH,YEAR(subdate(NOW(), INTERVAL 1 MONTH)) AS YEAR 
			union
					SELECT MONTH(subdate(NOW(), INTERVAL 0 MONTH)) AS MONTH,YEAR(subdate(NOW(), INTERVAL 0 MONTH)) AS YEAR 
								)
                    
			SELECT 		m.MONTH , count(Q.question_id)
			FROM 		CTE_6month m																						-- 6 tháng gần nhất
			LEFT JOIN (	SELECT * 																							-- các câu hỏi tạo trong 6 tháng gần nhất trong bảng question
						FROM 	question
						WHERE 	(MONTH(create_date) >= MONTH(subdate(NOW(), INTERVAL 5 MONTH))) 
								AND YEAR(create_date)>=YEAR(subdate(NOW(), INTERVAL 5 MONTH)) ) Q
			ON m.MONTH = MONTH(Q.create_date)
			GROUP BY  m.MONTH ;
 END$$
DELIMITER ;
                    
CALL     count_question_in_6month();     


						



