USE testing_system_assignment;


--------------------------------------------------  (SỬ DỤNG SUBQUERY HOẶC CTE)  --------------------------------------------------
-- QUESTION 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
				-- 1.cach thuong
DROP VIEW IF EXISTS ds_nv_phong_sale;
CREATE VIEW 	ds_nv_phong_sale AS
SELECT 	a.full_name, d.department_name
FROM 	account a
JOIN 	department d
ON 		d.department_id = a.department_id
WHERE 	d.department_name='Sale'
;
				-- 2.SỬ DỤNG SUBQUERY
DROP VIEW IF EXISTS ds_nv_phong_sale;
CREATE VIEW 	ds_nv_phong_sale AS
SELECT 	a.full_name,d.department_name
FROM 	account a
JOIN 	department d
ON 		d.department_id = a.department_id
WHERE 	a.department_id= ( SELECT 	dp.department_id 
							FROM 	department dp 
                            WHERE 	dp.department_name ='Sale'
						  )
;
                        
SELECT *
FROM 	ds_nv_phong_sale;

					-- 3.SỬ DỤNG  CTE

WITH	ds_nv_phong_sale AS
(SELECT 	a.full_name, d.department_name
FROM 	account a
JOIN 	department d
ON 		d.department_id = a.department_id
WHERE 	d.department_name='Sale'
)
SELECT	*
FROM	ds_nv_phong_sale
;


        
        
-- QUESTION 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất

				-- 1.SỬ DỤNG SUBQUERY
DROP VIEW IF EXISTS `thông tin các account tham gia vào nhiều group nhất`;
CREATE VIEW 	`thông tin các account tham gia vào nhiều group nhất` AS
SELECT 		a.*,COUNT(ga.gruop_id) AS SL_gruop_tham_gia
FROM 		account a
JOIN 		gruop_account ga
ON 			ga.account_id=a.account_id
GROUP BY 	a.username	
HAVING 		COUNT(ga.gruop_id)  = ( SELECT MAX(SL) FROM (	SELECT 		a1.account_id,a1.username,COUNT(ga1.gruop_id) AS SL
														FROM 		account a1
														JOIN 		gruop_account ga1
														ON 			ga1.account_id=a1.account_id
														GROUP BY 	a1.username	
													) AS SLL
								)
;
SELECT *
FROM `thông tin các account tham gia vào nhiều group nhất`;
					-- 2.SỬ DỤNG CTE
WITH	CTE_1 AS (
					SELECT 		a1.account_id,a1.username,COUNT(ga1.gruop_id) AS maxcount
														FROM 		account a1
														JOIN 		gruop_account ga1
														ON 			ga1.account_id=a1.account_id
														GROUP BY 	a1.username	
				)
SELECT 		a.*,COUNT(ga.gruop_id) AS SL_gruop_tham_gia
FROM 		account a
JOIN 		gruop_account ga
ON 			ga.account_id=a.account_id
GROUP BY 	a.username	
HAVING 		COUNT(ga.gruop_id)  = ( SELECT MAX(maxcount) FROM  CTE_1)
;



-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 18 từ được coi là quá dài) và xóa nó đi


DROP VIEW IF EXISTS cau_hoi_dai ;
CREATE VIEW 	cau_hoi_dai AS
SELECT 	question_id,content
FROM	question
WHERE	LENGTH(content)> 18
;

SELECT *
FROM cau_hoi_dai;

DELETE 
FROM cau_hoi_dai;

-- QUESTION 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

			-- 1.SỬ DỤNG SUBQUERY
DROP VIEW IF EXISTS department_max_accuont ;
CREATE VIEW 	department_max_accuont AS
SELECT	d.department_id,d.department_name,COUNT(a.account_id)
FROM	account a
JOIN	department d
ON		d.department_id=a.department_id
GROUP BY	d.department_id
HAVING	COUNT(a.account_id)=   ( SELECT	MAX(sl_nv) 
								FROM (SELECT	d1.department_id,d1.department_name,COUNT(a1.account_id) AS sl_nv
										FROM	account a1
										JOIN	department d1
										ON		d1.department_id=a1.department_id
										GROUP BY	d1.department_id) AS MAU
								)
;

SELECT *
FROM department_max_accuont;
					-- 2.SỬ DỤNG CTE
WITH	CTE_2 AS
			(SELECT	d1.department_id,d1.department_name,COUNT(a1.account_id) AS sl_nv
										FROM	account a1
										JOIN	department d1
										ON		d1.department_id=a1.department_id
										GROUP BY	d1.department_id
            )
SELECT	d.department_id,d.department_name,COUNT(a.account_id) AS SL_NV
FROM	account a
JOIN	department d
ON		d.department_id=a.department_id
GROUP BY	d.department_id
HAVING	COUNT(a.account_id)=   ( SELECT	MAX(sl_nv) 
								FROM	CTE_2
                                )
;
                    
-- QUESTION 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
DROP VIEW IF EXISTS cau_hoi_NGUYEN_tao ;
CREATE VIEW 	cau_hoi_NGUYEN_tao AS
SELECT 	q.question_id,q.content,q.creator_id,a.account_id,a.full_name
FROM	question q
JOIN	account a
ON		q.creator_id=a.account_id
WHERE	a.full_name LIKE('Nguyễn%')
;

SELECT	*
FROM	cau_hoi_NGUYEN_tao;





			
