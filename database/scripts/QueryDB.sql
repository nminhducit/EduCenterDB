
--Truy vấn tài khoản giáo viên với trạng thái hoạt động cụ thể
SELECT * FROM teacher_account
WHERE is_active = 1;
--Truy vấn tài khoản giáo viên được tạo trong một khoảng thời gian cụ thể
SELECT * FROM teacher_account
WHERE teacher_id IN (
    SELECT id FROM teacher
    WHERE date_birth BETWEEN '1980-01-01' AND '1990-12-31'
);
-- Truy vấn thông tin giáo viên theo thành phố hoặc số điện thoại
SELECT * FROM teacher
WHERE city = 'Hanoi' OR phone = '0905123456';

-- student
-- Truy vấn học sinh theo thành phố, hoặc ngày sinh nhật
SELECT * FROM student WHERE city = N'Hà Nội';
SELECT * FROM student WHERE date_birth BETWEEN '2000-01-01' AND '2000-12-31';
-- Truy vấn số lượng học sinh trong từng thành phố
SELECT city, COUNT(id) AS student_count FROM student GROUP BY city;

-- student_account
-- Truy vấn tài khoản học sinh với số dư lớn hơn một giá trị cụ thể
SELECT * FROM student_account WHERE balance > 5000;
-- Truy vấn tài khoản học sinh được tạo trong một khoảng thời gian cụ thể
SELECT * FROM student_account WHERE created_date BETWEEN '2024-01-01' AND '2024-12-31';
-- Truy vấn tài khoản học sinh được tạo từ ngày 7-6-2024 trở đi
SELECT * FROM student_account sa JOIN student s ON sa.student_id = s.id WHERE sa.created_date >= '2024-06-07'

-- class_student
-- Truy vấn số lượng học sinh trong từng lớp
SELECT class_id, COUNT(student_id) AS student_count FROM class_student GROUP BY class_id;
-- Truy vấn tất cả lớp mà học sinh đã tham gia
SELECT * FROM class_student WHERE student_id = 1;


--Truy vấn số lượng giáo viên theo từng thành phố
SELECT city, COUNT(*) as total_teachers
FROM teacher
GROUP BY city;


-- grade
-- Truy vấn điểm trung bình của tất cả học sinh
SELECT student_id, AVG(value) AS average_grade FROM grade GROUP BY student_id;
-- Truy vấn tất cả điểm của một học sinh cụ thể trong một khoảng thời gian
SELECT * FROM grade WHERE student_id = 1 AND exam_id IN (SELECT id FROM exam WHERE date BETWEEN '2024-01-01' AND '2024-12-31');

-- exam
-- Truy vấn tất cả kỳ thi diễn ra trong một khoảng thời gian cụ thể
SELECT * FROM exam WHERE date BETWEEN '2024-01-01' AND '2024-12-31';
-- Truy vấn số lượng kỳ thi của từng lớp học
SELECT class_id, COUNT(id) AS exam_count FROM exam GROUP BY class_id;

-- payment
-- Truy vấn tất cả giao dịch của một học sinh cụ thể
SELECT * FROM payment WHERE student_id = 1;
-- Truy vấn số tiền thanh toán theo từng phương thức thanh toán
SELECT status, SUM(amount) AS total_amount FROM payment GROUP BY status;


-- course
-- Lấy tất cả các khóa học theo cấp độ
SELECT c.*, l.name AS level_name FROM course c JOIN level l ON c.level_id = l.id;
-- Đếm số lượng khóa học theo cấp độ
SELECT l.name AS level_name, COUNT(c.id) AS course_count FROM course c JOIN level l ON c.level_id = l.id GROUP BY l.name;

-- course_material
-- Lấy tài liệu theo loại tài liệu
SELECT * FROM course_material WHERE material_type = N'Reference';
-- Lấy tài liệu được thêm vào trong khoảng thời gian
SELECT * FROM course_material WHERE date_add BETWEEN '2024-01-01' AND '2024-12-31';
