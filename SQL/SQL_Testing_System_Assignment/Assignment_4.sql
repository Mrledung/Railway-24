USE testing_system_assignment;

 

-- EXERCISE 1: JOIN -------------------------------------
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

SELECT 		a.full_name,a.department_id,d.department_name
FROM 		department d
JOIN 		account a
ON 			d.department_id=a.department_id
;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
 SELECT 		*
 FROM 			account
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
 SELECT 		d.*,COUNT(a.department_id) AS 'số nv'
 FROM 			department d
 JOIN 			account a
 ON 			a.department_id=d.department_id
 GROUP BY		d.department_id
 HAVING 		COUNT(a.department_id)>=3
 ;
 
 -- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
 
 SELECT 		q.question_id,q.content,COUNT(eqest.question_id) AS ' số lần được sd'
 FROM 			question q	
 JOIN 			exam_question eqest
 ON 			q.question_id=eqest.question_id
 GROUP BY		q.question_id
 ORDER BY 		COUNT(eqest.question_id) DESC
 LIMIT 1
 ;
 -- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
 
SELECT 		c.category_id,c.category_name,COUNT(q.question_id)AS 'số lần sử dụng'
FROM 		category_question c	
JOIN 		question q
ON 			q.category_id=c.category_id
GROUP BY	(c.category_id) 
 ;
 
 -- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
 
 SELECT 		q.question_id,q.content,COUNT(e.question_id) AS 'số lần xh trong đè thi'
FROM 			question q	
 JOIN 			exam_question e
 ON 			q.question_id=e.question_id
 GROUP BY		(q.question_id) 
 ;
 
 -- Question 8: Lấy ra Question có nhiều câu trả lời nhất
 SELECT 		q.question_id,q.content, count(a.answer_id) AS COUNT_answer
 FROM 			answer a
 JOIN 			question q
 ON 			a.question_id = q.question_id
GROUP BY 		q.question_id
HAVING 			COUNT(q.question_id) =  (
												SELECT MAX(dem) 
												FROM	(	SELECT  count(answer_id) AS dem 
															FROM 	answer 																										
															GROUP BY question_id
														)	AS count
												);
 

-- Question 9: Thống kê số lượng account trong mỗi group

SELECT 				gruop_id,COUNT(account_id) so_luong_account 
FROM 				gruop_account
GROUP BY 			gruop_id
ORDER BY 			so_luong_account DESC
;

-- Question 10: Tìm chức vụ có ít người nhất

SELECT 				p.position_id,p.position_name,COUNT(a.account_id) 
FROM				position p
JOIN				account a
ON	 				a.position_id=p.position_id
GROUP BY 			p.position_id
HAVING				COUNT(a.account_id) =	(	SELECT 	MIN(SL_NV) 
												FROM 	(	SELECT 		COUNT(account_id) AS SL_NV
															FROM		account																									
															GROUP BY 	position_id) AS D
											)
;
                                                                
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT 	d.*,a.department_id, p.position_name, count(p.position_name) 
FROM 	department d
LEFT JOIN 	account a ON a.department_id = d.department_id
JOIN 	position p ON a.position_id = p.position_id
GROUP BY 	d.department_id, p.position_id
;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...

SELECT		q.question_id,q.content,c.category_name,t.type_name,a.full_name,q.create_date
FROM		 question q
LEFT JOIN	category_question c ON q.category_id=c.category_id
JOIN		type_question t ON t.type_id=q.type_id
JOIN		account a ON q.creator_id=a.account_id
;
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT t.type_name,COUNT(q.content)
FROM		 question q
JOIN		type_question t ON t.type_id=q.type_id
GROUP BY 	t.type_name
HAVING		COUNT(q.content)
;

-- Question 14:Lấy ra group không có account nào

SELECT 		g.gruop_id,g.gruop_name
FROM		gruop g
LEFT JOIN 	gruop_account ga ON ga.gruop_id = g.gruop_id
WHERE		ga.gruop_id IS NULL
;

-- Question 15: Lấy ra group không có account nào

SELECT 		g.gruop_id,g.gruop_name
FROM		gruop_account ga 
RIGHT JOIN	gruop g ON ga.gruop_id = g.gruop_id
WHERE		ga.gruop_id IS NULL
;

-- Question 16: Lấy ra question không có answer nào

SELECT 	q.question_id,q.content
FROM 	question q
LEFT JOIN answer a ON q.question_id=a.question_id
WHERE	 a.question_id IS NULL
;

									-- EXERCISE 2: UNION
			-- QUESTION 17:
            
			-- a) Lấy các account thuộc nhóm thứ 1

SELECT 		g.gruop_id,a.*
FROM 		gruop_account g
JOIN 		account a
ON 			a.account_id = g.account_id
WHERE 		g.gruop_id = 1
;
			-- b) Lấy các account thuộc nhóm thứ 2
            
SELECT 		g.gruop_id,a.*
FROM 		gruop_account g
JOIN 		account a
ON 			a.account_id = g.account_id
WHERE 		g.gruop_id = 2
;
			-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
            
SELECT 		g.gruop_id,a.*
FROM 		gruop_account g
JOIN 		account a
ON 			a.account_id = g.account_id
WHERE 		g.gruop_id = 1

UNION

SELECT 		g.gruop_id,a.*
FROM 		gruop_account g
JOIN 		account a
ON 			a.account_id = g.account_id
WHERE 		g.gruop_id = 2
;

				-- Question 18:
			-- a) Lấy các group có lớn hơn 1 thành viên
SELECT 		gruop_id,COUNT(account_id) SL_thanh_vien
FROM 		gruop_account
GROUP BY 	gruop_id
HAVING 		COUNT(account_id)>1
;

			-- b) Lấy các group có nhỏ hơn 7 thành viên
            
SELECT 		gruop_id,COUNT(account_id) SL_thanh_vien
FROM 		gruop_account
GROUP BY 	gruop_id
HAVING 		COUNT(account_id)<7
;

			-- c) Ghép 2 kết quả từ câu a) và câu b)
            
SELECT 		gruop_id,COUNT(account_id) SL_thanh_vien
FROM 		gruop_account
GROUP BY 	gruop_id
HAVING 		COUNT(account_id)>1

UNION ALL

SELECT 		gruop_id,COUNT(account_id) SL_thanh_vien
FROM 		gruop_account
GROUP BY 	gruop_id
HAVING 		COUNT(account_id)<7
;


