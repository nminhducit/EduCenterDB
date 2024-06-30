-- Mẫu dữ liệu cho bảng student
INSERT INTO student (id, date_birth, state, zip_code, street, city, first_name, last_name, email, phone) VALUES
(1, '2003-04-15', 'HN', '100000', 'Đường A', 'Hà Nội', 'Lê', 'Anh', 'leanh@gmail.com', '0901234561'),
(2, '2002-07-19', 'HCM', '700000', 'Đường B', 'TP.HCM', 'Nguyễn', 'Bình', 'nguyenbinh@gmail.com', '0901234562'),
(3, '2001-08-20', 'ĐN', '550000', 'Đường C', 'Đà Nẵng', 'Trần', 'Vân', 'tranvan@gmail.com', '0901234563'),
(4, '2000-10-30', 'HN', '100001', 'Đường D', 'Hà Nội', 'Phạm', 'Lan', 'phaml@gmail.com', '0901234564'),
(5, '2004-01-12', 'HCM', '700002', 'Đường E', 'TP.HCM', 'Bùi', 'Anh', 'buianh@gmail.com', '0901234565'),
(6, '2003-03-05', 'ĐN', '550001', 'Đường F', 'Đà Nẵng', 'Ngô', 'Dũng', 'ngodung@gmail.com', '0901234566'),
(7, '2002-05-22', 'HN', '100002', 'Đường G', 'Hà Nội', 'Hoàng', 'Hùng', 'hoanghung@gmail.com', '0901234567'),
(8, '2001-07-19', 'HCM', '700002', 'Đường H', 'TP.HCM', 'Trịnh', 'Vũ', 'trinhvu@gmail.com', '0901234568'),
(9, '2000-12-24', 'ĐN', '550002', 'Đường I', 'Đà Nẵng', 'Phan', 'Nam', 'phannam@gmail.com', '0901234569'),
(10, '2003-06-13', 'HN', '100003', 'Đường J', 'Hà Nội', 'Lý', 'Hiền', 'lyhien@gmail.com', '0901234570'),
-- Thêm các học viên khác từ 11 đến 80
(80, '2001-08-25', 'ĐN', '550079', 'Đường X', 'Đà Nẵng', 'Trần', 'Vũ', 'tranvu@gmail.com', '0901234640');

-- Mẫu dữ liệu cho bảng student_account
INSERT INTO student_account (id, student_id, login, password) VALUES
(1, 1, 'leanh123', '123456789'),
(2, 2, 'nguyenbinh', '123456789'),
(3, 3, 'tranvan', '123456789'),
(4, 4, 'phaml', '123456789'),
(5, 5, 'buianh', '123456789'),
(6, 6, 'ngodung', '123456789'),
(7, 7, 'hoanghung', '123456789'),
(8, 8, 'trinhvu', '123456789'),
(9, 9, 'phannam', '123456789'),
(10, 10, 'lyhien', '123456789'),
-- Thêm các tài khoản học viên khác từ 11 đến 80
(80, 80, 'tranvu', '123456789');

-- Mẫu dữ liệu cho bảng teacher
INSERT INTO teacher (id, first_name, last_name, email, phone, description, photo) VALUES
(1, 'Trần', 'Minh', 'tranminh@gmail.com', '0902234561', 'Chuyên ngành ngữ pháp', NULL),
(2, 'Phạm', 'Lan', 'phamlan@gmail.com', '0902234562', 'Chuyên ngành giao tiếp', NULL),
(3, 'Lê', 'Hùng', 'lehung@gmail.com', '0902234563', 'Chuyên ngành từ vựng', NULL),
(4, 'Nguyễn', 'Anh', 'nguyenanh@gmail.com', '0902234564', 'Chuyên ngành phát âm', NULL),
(5, 'Hoàng', 'Nam', 'hoangnam@gmail.com', '0902234565', 'Chuyên ngành luyện thi IELTS', NULL),
(6, 'Phan', 'Hải', 'phanhai@gmail.com', '0902234566', 'Chuyên ngành tiếng Anh thương mại', NULL),
(7, 'Bùi', 'Dương', 'buiduong@gmail.com', '0902234567', 'Chuyên ngành ngữ pháp nâng cao', NULL),
(8, 'Ngô', 'Trang', 'ngotrang@gmail.com', '0902234568', 'Chuyên ngành giao tiếp nâng cao', NULL),
(9, 'Trịnh', 'Sơn', 'trinhson@gmail.com', '0902234569', 'Chuyên ngành viết luận', NULL),
(10, 'Lý', 'Huệ', 'lyhue@gmail.com', '0902234570', 'Chuyên ngành tiếng Anh giao tiếp', NULL);

-- Mẫu dữ liệu cho bảng teacher_account
INSERT INTO teacher_account (id, teacher_id, login, password) VALUES
(1, 1, 'tranminh', 'teach123'),
(2, 2, 'phamlan', 'teach456'),
(3, 3, 'lehung', 'teach789'),
(4, 4, 'nguyenanh', 'teach012'),
(5, 5, 'hoangnam', 'teach345'),
(6, 6, 'phanhai', 'teach678'),
(7, 7, 'buiduong', 'teach901'),
(8, 8, 'ngotrang', 'teach234'),
(9, 9, 'trinhson', 'teach567'),
(10, 10, 'lyhue', 'teach890');

-- Mẫu dữ liệu cho bảng course
INSERT INTO course (id, name, description, language_id, level_id, category_id, lessons) VALUES
(1, 'English Grammar Basics', 'Ngữ pháp cơ bản', 1, 1, 1, 10),
(2, 'Advanced Conversation', 'Giao tiếp nâng cao', 1, 2, 2, 15),
(3, 'Vocabulary Building', 'Xây dựng từ vựng', 1, 3, 3, 12),
(4, 'English for Business', 'Tiếng Anh thương mại', 1, 2, 4, 20),
(5, 'IELTS Preparation', 'Luyện thi IELTS', 1, 3, 5, 25),
(6, 'Basic Listening Skills', 'Kỹ năng nghe cơ bản', 1, 1, 2, 8),
(7, 'Writing Techniques', 'Kỹ thuật viết', 1, 2, 3, 18),
(8, 'Pronunciation Improvement', 'Cải thiện phát âm', 1, 1, 2, 22),
(9, 'Reading Comprehension', 'Hiểu đọc', 1, 3, 4, 14),
(10, 'Business English Basics', 'Tiếng Anh thương mại cơ bản', 1, 2, 4, 16);

-- Mẫu dữ liệu cho bảng class
INSERT INTO class (id, name, start_date, end_date, teacher_id, course_id) VALUES
(1, 'Class 101', '2024-01-10', '2024-03-10', 1, 1),
(2, 'Class 102', '2024-02-15', '2024-04-15', 2, 2),
(3, 'Class 103', '2024-03-01', '2024-05-01', 3, 3),
(4, 'Class 104', '2024-04-20', '2024-06-20', 4, 4),
(5, 'Class 105', '2024-05-10', '2024-07-10', 5, 5),
(6, 'Class 106', '2024-05-25', '2024-07-25', 6, 6),
(7, 'Class 107', '2024-06-01', '2024-08-01', 7, 7),
(8, 'Class 108', '2024-06-15', '2024-08-15', 8, 8),
(9, 'Class 109', '2024-06-25', '2024-08-25', 9, 9),
(10, 'Class 110', '2024-07-01', '2024-09-01', 10, 10);

-- Mẫu dữ liệu cho bảng class_student
INSERT INTO class_student (id, class_id, student_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 7),
(8, 4, 8),
(9, 5, 9),
(10, 5, 10),
-- Thêm các học viên vào lớp khác từ 11 đến 80
(80, 10, 80);

-- Mẫu dữ liệu cho bảng exam
INSERT INTO exam (id, class_id, name, date) VALUES
(1, 1, 'Midterm', '2024-02-10'),
(2, 1, 'Final', '2024-03-05'),
(3, 2, 'Midterm', '2024-03-15'),
(4, 2, 'Final', '2024-04-10'),
(5, 3, 'Midterm', '2024-04-01'),
(6, 3, 'Final', '2024-05-01'),
(7, 4, 'Midterm', '2024-05-20'),
(8, 4, 'Final', '2024-06-20'),
(9, 5, 'Midterm', '2024-06-10'),
(10, 5, 'Final', '2024-07-10'),
-- Thêm các kỳ thi khác từ 11 đến 20
(20, 10, 'Final', '2024-09-01');

-- Mẫu dữ liệu cho bảng grade
INSERT INTO grade (id, student_id, exam_id, grade) VALUES
(2, 1, 2, 90),
(3, 2, 1, 88),
(4, 2, 2, 92),
(5, 3, 3, 80),
(6, 3, 4, 85),
(7, 4, 3, 78),
(8, 4, 4, 83),
(9, 5, 5, 91),
(10, 5, 6, 95),
-- Thêm các điểm khác từ 11 đến 80
(80, 80, 20, 70);

-- Mẫu dữ liệu cho bảng payment
INSERT INTO payment (id, payment_date, amount, status, student_id, class_id) VALUES
(1, '2024-01-15', 500000, 'Completed', 1, 1),
(2, '2024-02-20', 600000, 'Completed', 2, 2),
(3, '2024-03-25', 700000, 'Pending', 3, 3),
(4, '2024-04-30', 800000, 'Completed', 4, 4),
(5, '2024-05-05', 900000, 'Completed', 5, 5),
-- Thêm các thanh toán khác từ 6 đến 80
(80, '2024-08-20', 600000, 2, 'Pending', 80, 10);
