USE testing_system_assignment;


--  -------------------------------------*****------------------------------------------------------- ---

-- Question 1: Thêm ít nhất 10 record vào mỗi table

 


-- Question 2: lấy ra tất cả các phòng ban

SELECT 	*
FROM	department
;

-- Question 4: lấy ra thông tin account có full name dài nhất

SELECT * 
FROM	account
WHERE	LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM account)
;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3

SELECT *,MAX(LENGTH(full_name))
FROM account
WHERE department_id= 3;
															
-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019

SELECT			gruop_name,create_date
FROM			gruop
WHERE			create_date > 2020-12-20
;

-- Question 7: Lấy ra ID của question có >= 2 câu trả lời


SELECT 			question_id, COUNT(answer_id)
FROM 			answer 
GROUP BY 		question_id 
HAVING 			COUNT(answer_id) >= 2
;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
UPDATE 	exam
SET 	create_date ='2019-12-19'
WHERE 	exam_id =5;

SELECT		co_de,create_date
FROM		exam
WHERE	  (create_date < '2019-12-20') AND duration >= 60
;

-- Question 9: Lấy ra 5 group được tạo gần đây nhất

SELECT		*
FROM		gruop
ORDER BY	create_date DESC
LIMIT 5
;

-- Question 10: Đếm số nhân viên thuộc department có id = 2

SELECT 		*,account_id AS 'số nhân viên thuộc department có id = 2', COUNT(account_id) AS 'SL'
FROM		account
WHERE		department_id = 2
;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"

SELECT 			full_name
FROM			account
WHERE			full_name LIKE'D%o' 
;
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019

DELETE 
FROM 			exam
WHERE			create_date < '2019-12-20'
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








			
