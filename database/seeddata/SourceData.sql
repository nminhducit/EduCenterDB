﻿
INSERT INTO level (id, name)
VALUES
(1, '0-450'),
(2, '450-600'),
(3, '600-750');

INSERT INTO course (id, description, level_id)
VALUES
--Insert data into Writing
('W001', 'Writing', 1),
('W002', 'Writing', 2),
('W003', 'Writing', 3),
--Insert data into Reading
('R001', 'Reading', 1), 
('R002', 'Reading', 2), 
('R003', 'Reading', 3), 
--Insert data into Listening
('L001', 'Listening', 1),
('L002', 'Listening', 2),
('L003', 'Listening', 3),
--Insert data into Speaking
('S001', 'Speaking', 1),
('S002', 'Speaking', 2),
('S003', 'Speaking', 3);

-- Insert data into course_material with detailed descriptions
INSERT INTO course_material (id, course_id, description, material_type, material_url, date_add) VALUES
-- Writing Level 1
(1, 'W001', 'The Essential Guide to Writing: Exercises for Beginners', 'Exercises', 'http://educenterdb.com/writing/essential-guide-exercises-beginners', '2024-01-01'),
(2, 'W001', 'Fundamentals of Writing: Comprehensive Textbook for Level 1', 'Textbook', 'http://educenterdb.com/writing/fundamentals-textbook-level1', '2024-01-01'),
(3, 'W001', 'Mastering Grammar and Style: A Reference for Novice Writers', 'Reference', 'http://educenterdb.com/writing/mastering-grammar-style-reference', '2024-01-01'),
-- Writing Level 2
(4, 'W002', 'Advanced Writing Techniques: Exercises for Intermediate Learners', 'Exercises', 'http://educenterdb.com/writing/advanced-techniques-exercises-intermediate', '2024-01-02'),
(5, 'W002', 'Writing with Precision: A Detailed Textbook for Level 2', 'Textbook', 'http://educenterdb.com/writing/precision-textbook-level2', '2024-01-02'),
(6, 'W002', 'Crafting Effective Arguments: A Reference for Intermediate Writers', 'Reference', 'http://educenterdb.com/writing/effective-arguments-reference', '2024-01-02'),
-- Writing Level 3
(7, 'W003', 'Mastery in Writing: Challenging Exercises for Advanced Students', 'Exercises', 'http://educenterdb.com/writing/mastery-exercises-advanced', '2024-01-03'),
(8, 'W003', 'The Writer’s Handbook: Comprehensive Textbook for Level 3', 'Textbook', 'http://educenterdb.com/writing/handbook-textbook-level3', '2024-01-03'),
(9, 'W003', 'Writing Across Genres: An Advanced Reference Guide', 'Reference', 'http://educenterdb.com/writing/genres-reference-guide', '2024-01-03'),
-- Reading Level 1
(10, 'R001', 'Reading Fundamentals: Exercises to Improve Basic Skills', 'Exercises', 'http://educenterdb.com/reading/fundamentals-exercises-basic', '2024-01-04'),
(11, 'R001', 'Introduction to Reading: Foundational Textbook for Beginners', 'Textbook', 'http://educenterdb.com/reading/introduction-textbook-beginners', '2024-01-04'),
(12, 'R001', 'Understanding Narratives: A Beginner’s Reference Book', 'Reference', 'http://educenterdb.com/reading/understanding-narratives-reference', '2024-01-04'),
-- Reading Level 2
(13, 'R002', 'Intermediate Reading Practice: Exercises for Skill Enhancement', 'Exercises', 'http://educenterdb.com/reading/intermediate-practice-exercises', '2024-01-05'),
(14, 'R002', 'Exploring Literature: An Intermediate Textbook for Readers', 'Textbook', 'http://educenterdb.com/reading/exploring-literature-textbook', '2024-01-05'),
(15, 'R002', 'Critical Reading Skills: A Reference for Intermediate Learners', 'Reference', 'http://educenterdb.com/reading/critical-skills-reference', '2024-01-05'),
-- Reading Level 3
(16, 'R003', 'Advanced Reading Comprehension: Exercises for Proficient Readers', 'Exercises', 'http://educenterdb.com/reading/advanced-comprehension-exercises', '2024-01-06'),
(17, 'R003', 'Analyzing Texts: A Comprehensive Textbook for Advanced Readers', 'Textbook', 'http://educenterdb.com/reading/analyzing-texts-textbook', '2024-01-06'),
(18, 'R003', 'Interpreting Complex Narratives: An Advanced Reference Guide', 'Reference', 'http://educenterdb.com/reading/complex-narratives-reference', '2024-01-06'),
-- Listening Level 1
(19, 'L001', 'Listening Skills Development: Basic Exercises for Beginners', 'Exercises', 'http://educenterdb.com/listening/skills-development-exercises', '2024-01-07'),
(20, 'L001', 'Listening Essentials: A Textbook for Foundational Learning', 'Textbook', 'http://educenterdb.com/listening/essentials-textbook', '2024-01-07'),
(21, 'L001', 'Effective Listening Strategies: A Reference for Beginners', 'Reference', 'http://educenterdb.com/listening/effective-strategies-reference', '2024-01-07'),
-- Listening Level 2
(22, 'L002', 'Enhancing Listening Skills: Exercises for Intermediate Students', 'Exercises', 'http://educenterdb.com/listening/enhancing-skills-exercises', '2024-01-08'),
(23, 'L002', 'Listening in Context: An Intermediate Textbook for Skill Building', 'Textbook', 'http://educenterdb.com/listening/in-context-textbook', '2024-01-08'),
(24, 'L002', 'Advanced Listening Techniques: A Reference for Intermediate Learners', 'Reference', 'http://educenterdb.com/listening/advanced-techniques-reference', '2024-01-08'),
-- Listening Level 3
(25, 'L003', 'Proficient Listening Practice: Advanced Exercises for High-level Learners', 'Exercises', 'http://educenterdb.com/listening/proficient-practice-exercises', '2024-01-09'),
(26, 'L003', 'Mastering Listening Skills: Comprehensive Textbook for Advanced Students', 'Textbook', 'http://educenterdb.com/listening/mastering-skills-textbook', '2024-01-09'),
(27, 'L003', 'Strategies for Complex Auditory Processing: An Advanced Reference Guide', 'Reference', 'http://educenterdb.com/listening/complex-processing-reference', '2024-01-09'),
-- Speaking Level 1
(28, 'S001', 'Basic Speaking Skills: Exercises for Novice Speakers', 'Exercises', 'http://educenterdb.com/speaking/basic-skills-exercises', '2024-01-10'),
(29, 'S001', 'Introduction to Speaking: A Textbook for Beginners', 'Textbook', 'http://educenterdb.com/speaking/introduction-textbook', '2024-01-10'),
(30, 'S001', 'Effective Speaking Strategies: A Reference for New Learners', 'Reference', 'http://educenterdb.com/speaking/effective-strategies-reference', '2024-01-10'),
-- Speaking Level 2
(31, 'S002', 'Intermediate Speaking Practice: Skill-building Exercises', 'Exercises', 'http://educenterdb.com/speaking/intermediate-practice-exercises', '2024-01-11'),
(32, 'S002', 'Communicative Speaking: An Intermediate Textbook', 'Textbook', 'http://educenterdb.com/speaking/communicative-textbook', '2024-01-11'),
(33, 'S002', 'Advanced Communication Techniques: A Reference for Intermediate Speakers', 'Reference', 'http://educenterdb.com/speaking/communication-techniques-reference', '2024-01-11'),
-- Speaking Level 3
(34, 'S003', 'Fluency in Speaking: Advanced Exercises for Proficient Communicators', 'Exercises', 'http://educenterdb.com/speaking/fluency-exercises', '2024-01-12'),
(35, 'S003', 'Mastering Public Speaking: A Comprehensive Textbook for Advanced Levels', 'Textbook', 'http://educenterdb.com/speaking/public-speaking-textbook', '2024-01-12'),
(36, 'S003', 'Oratory Excellence: An Advanced Reference for Skilled Speakers', 'Reference', 'http://educenterdb.com/speaking/oratory-excellence-reference', '2024-01-12');


INSERT INTO teacher (id, first_name, last_name, description, date_birth, gender, email, phone, street, city, state, zip)
VALUES
(1, 'John', 'Doe', 'English Language Teacher', '1979-05-10', 'Male', 'john.doe@gmail.com', '0905123456', '123 Nguyen Du', 'Hanoi', 'HN', '100000'),
(2, 'Jane', 'Smith', 'English Language Teacher', '1982-11-23', 'Female', 'jane.smith@gmail.com', '0905234567', '456 Le Loi', 'Ho Chi Minh City', 'HCM', '700000'),
(3, 'Paul', 'Taylor', 'English Language Teacher', '1975-08-15', 'Male', 'paul.taylor@gmail.com', '0905345678', '789 Vo Van Tan', 'Da Nang', 'DN', '550000'),
(4, 'Emily', 'Johnson', 'English Language Teacher', '1986-02-04', 'Female', 'emily.johnson@gmail.com', '0905456789', '321 Tran Phu', 'Can Tho', 'CT', '900000'),
(5, 'Michael', 'Brown', 'English Language Teacher', '1980-09-09', 'Male', 'michael.brown@gmail.com', '0905567890', '654 Ba Thang Hai', 'Hue', 'TH', '530000'),
(6, 'Sara', 'Wilson', 'English Language Teacher', '1988-12-20', 'Female', 'sara.wilson@gmail.com', '0905678901', '987 Ly Tu Trong', 'Hai Phong', 'HP', '180000'),
(7, 'Nguyen', 'Thi Hoa', 'English Language Teacher', '1991-07-15', 'Female', 'hoa.nguyen@gmail.com', '0905789012', '135 Nguyen Van Linh', 'Nha Trang', 'NT', '650000'),
(8, 'Tran', 'Van Nam', 'English Language Teacher', '1984-03-22', 'Male', 'nam.tran@gmail.com', '0905890123', '246 Hai Ba Trung', 'Vung Tau', 'VT', '780000'),
(9, 'Le', 'Thi Lan', 'English Language Teacher', '1995-05-11', 'Female', 'lan.le@gmail.com', '0905901234', '369 Le Hong Phong', 'Quy Nhon', 'QN', '820000'),
(10, 'Pham', 'Van Kien', 'English Language Teacher', '1990-10-30', 'Male', 'kien.pham@gmail.com', '0906012345', '147 Tran Hung Dao', 'Bien Hoa', 'BH', '810000');

-- Insert data into teacher_account table
INSERT INTO teacher_account (teacher_id, username, password, is_active)
VALUES
(1, 'johndoe', 'password123', 1),
(2, 'janesmith', 'password123', 1),
(3, 'paultaylor', 'password123', 1),
(4, 'emilyjohnson', 'password123', 1),
(5, 'michaelbrown', 'password123', 1),
(6, 'sarawilson', 'password123', 1),
(7, 'hoanguyen', 'password123', 1),
(8, 'namtran', 'password123', 1),
(9, 'lanle', 'password123', 1),
(10, 'kienpham', 'password123', 1);

-- Insert data into class table
INSERT INTO class (id, start_date, end_date, teacher_id, course_id) VALUES
('C01', '2024-07-01', '2024-12-01', 1, 'W001'),
('C02', '2024-07-02', '2024-12-02', 2, 'W003'),
('C03', '2024-07-03', '2024-12-03', 3, 'R002'),
('C04', '2024-07-04', '2024-12-04', 4, 'L003'),
('C05', '2024-07-05', '2024-12-05', 5, 'R003'),
('C06', '2024-07-06', '2024-12-06', 6, 'S002'),
('C07', '2024-07-07', '2024-12-07', 7, 'S001'),
('C08', '2024-07-08', '2024-12-08', 8, 'W002'),
('C09', '2024-07-09', '2024-12-09', 9, 'R003'),
('C10', '2024-07-10', '2024-12-10', 10, 'L001');

-- Insert data into class_weekday table
INSERT INTO class_weekday (class_id, weekday_id) VALUES
('C01', 'Mon'),
('C01', 'Wed'),
('C02', 'Thu'),
('C02', 'Tue'),
('C03', 'Mon'),
('C03', 'Fri'),
('C04', 'Wed'),
('C04', 'Fri'),
('C05', 'Thu'),
('C05', 'Tue'),
('C06', 'Mon'),
('C06', 'Wed'),
('C07', 'Mon'),
('C07', 'Wed'),
('C08', 'Thu'),
('C08', 'Tue'),
('C09', 'Wed'),
('C09', 'Fri'),
('C10', 'Thu'),
('C10', 'Tue');

-- Insert data into exam table
INSERT INTO exam (id, date, description, class_id) VALUES
(1, '2024-07-30', 'Quiz 1', 'C01'),
(2, '2024-08-30', 'Quiz 2', 'C01'),
(3, '2024-09-30', 'Midterm Exam', 'C01'),
(4, '2024-10-30', 'Quiz 3', 'C01'),
(5, '2024-11-30', 'Final Exam', 'C01'),
(6, '2024-07-30', 'Quiz 1', 'C02'),
(7, '2024-08-30', 'Quiz 2', 'C02'),
(8, '2024-09-30', 'Midterm Exam', 'C02'),
(9, '2024-10-30', 'Quiz 3', 'C02'),
(10, '2024-11-30', 'Final Exam', 'C02'),
(11, '2024-07-30', 'Quiz 1', 'C03'),
(12, '2024-08-30', 'Quiz 2', 'C03'),
(13, '2024-09-30', 'Midterm Exam', 'C03'),
(14, '2024-10-30', 'Quiz 3', 'C03'),
(15, '2024-11-30', 'Final Exam', 'C03'),
(16, '2024-07-30', 'Quiz 1', 'C04'),
(17, '2024-08-30', 'Quiz 2', 'C04'),
(18, '2024-09-30', 'Midterm Exam', 'C04'),
(19, '2024-10-30', 'Quiz 3', 'C04'),
(20, '2024-11-30', 'Final Exam', 'C04'),
(21, '2024-07-30', 'Quiz 1', 'C05'),
(22, '2024-08-30', 'Quiz 2', 'C05'),
(23, '2024-09-30', 'Midterm Exam', 'C05'),
(24, '2024-10-30', 'Quiz 3', 'C05'),
(25, '2024-11-30', 'Final Exam', 'C05'),
(26, '2024-07-30', 'Quiz 1', 'C06'),
(27, '2024-08-30', 'Quiz 2', 'C06'),
(28, '2024-09-30', 'Midterm Exam', 'C06'),
(29, '2024-10-30', 'Quiz 3', 'C06'),
(30, '2024-11-30', 'Final Exam', 'C06'),
(31, '2024-07-30', 'Quiz 1', 'C07'),
(32, '2024-08-30', 'Quiz 2', 'C07'),
(33, '2024-09-30', 'Midterm Exam', 'C07'),
(34, '2024-10-30', 'Quiz 3', 'C07'),
(35, '2024-11-30', 'Final Exam', 'C07'),
(36, '2024-07-30', 'Quiz 1', 'C08'),
(37, '2024-08-30', 'Quiz 2', 'C08'),
(38, '2024-09-30', 'Midterm Exam', 'C08'),
(39, '2024-10-30', 'Quiz 3', 'C08'),
(40, '2024-11-30', 'Final Exam', 'C08'),
(41, '2024-07-30', 'Quiz 1', 'C09'),
(42, '2024-08-30', 'Quiz 2', 'C09'),
(43, '2024-09-30', 'Midterm Exam', 'C09'),
(44, '2024-10-30', 'Quiz 3', 'C09'),
(45, '2024-11-30', 'Final Exam', 'C09'),
(46, '2024-07-30', 'Quiz 1', 'C10'),
(47, '2024-08-30', 'Quiz 2', 'C10'),
(48, '2024-09-30', 'Midterm Exam', 'C10'),
(49, '2024-10-30', 'Quiz 3', 'C10'),
(50, '2024-11-30', 'Final Exam', 'C10');

-- Insert data into student table
INSERT INTO student (id, first_name, last_name, date_birth, email, phone, street, city, state, zip, gender)
VALUES
    (1, 'Nguyễn', 'Văn An', '1995-01-15', 'nguyenvanan@gmail.com', '0123456789', 'Số 10 Nguyễn Cơ Thạch', 'Hà Nội', 'Hà Nội', '100000', 'Male'),
    (2, 'Trần', 'Thị Bảo', '1996-02-20', 'tranthibao@gmail.com', '0987654321', 'Số 20 Lý Thường Kiệt', 'Hồ Chí Minh', 'Hồ Chí Minh', '700000', 'Female'),
    (3, 'Lê', 'Thành Công', '1997-03-25', 'lethanhcong@gmail.com', '0123456789', 'Số 30 Điện Biên Phủ', 'Đà Nẵng', 'Đà Nẵng', '500000', 'Male'),
    (4, 'Phạm', 'Ngọc Diệp', '1998-04-30', 'phamngocdiep@gmail.com', '0987654321', 'Số 40 Lê Lợi', 'Hải Phòng', 'Hải Phòng', '300000', 'Female'),
    (5, 'Hoàng', 'Quang Dũng', '1999-05-10', 'hoangquangdung@gmail.com', '0123456789', 'Số 50 Nguyễn Huệ', 'Cần Thơ', 'Cần Thơ', '900000', 'Male'),
    (6, 'Trần', 'Hồng Ngọc', '2000-06-15', 'tranhongngoc@gmail.com', '0987654321', 'Số 60 Trần Hưng Đạo', 'Vũng Tàu', 'Bà Rịa - Vũng Tàu', '800000', 'Female'),
    (7, 'Nguyễn', 'Đức Tuấn', '2001-07-20', 'nguyenductuan@gmail.com', '0123456789', 'Số 70 Phan Chu Trinh', 'Quy Nhơn', 'Bình Định', '590000', 'Male'),
    (8, 'Lê', 'Thị Thanh', '2002-08-25', 'lethithanh@gmail.com', '0987654321', 'Số 80 Hoàng Diệu', 'Huế', 'Thừa Thiên Huế', '540000', 'Female'),
    (9, 'Trần', 'Minh Tuấn', '2003-09-30', 'tranminhtuan@gmail.com', '0123456789', 'Số 90 Nguyễn Trãi', 'Nam Định', 'Nam Định', '420000', 'Male'),
    (10, 'Phạm', 'Mai Anh', '2004-10-05', 'phammaianh@gmail.com', '0987654321', 'Số 100 Lê Lai', 'Biên Hòa', 'Đồng Nai', '350000', 'Female'),
    (11, 'Nguyễn', 'Thị Mỹ', '1995-11-15', 'nguyenthimy@gmail.com', '0123456789', 'Số 110 Nguyễn Bỉnh Khiêm', 'Long Xuyên', 'An Giang', '880000', 'Female'),
    (12, 'Lê', 'Đình Tùng', '1996-12-20', 'ledinhtung@gmail.com', '0987654321', 'Số 120 Lý Thái Tổ', 'Quảng Ngãi', 'Quảng Ngãi', '470000', 'Male'),
    (13, 'Trần', 'Thị Kim Ngân', '1997-01-25', 'tranthikimngan@gmail.com', '0123456789', 'Số 130 Nguyễn Thị Minh Khai', 'Bắc Giang', 'Bắc Giang', '220000', 'Female'),
    (14, 'Phạm', 'Quốc Hùng', '1998-02-28', 'phamquochung@gmail.com', '0987654321', 'Số 140 Trần Hưng Đạo', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Male'),
    (15, 'Hoàng', 'Thị Lan', '1999-03-10', 'hoangthilan@gmail.com', '0123456789', 'Số 150 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Female'),
    (16, 'Nguyễn', 'Văn Nam', '2000-04-15', 'nguyenvannam@gmail.com', '0987654321', 'Số 160 Hùng Vương', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Male'),
    (17, 'Trần', 'Thị Ánh', '2001-05-20', 'tranthianh@gmail.com', '0123456789', 'Số 170 Lê Duẩn', 'Nha Trang', 'Khánh Hòa', '570000', 'Female'),
    (18, 'Lê', 'Minh Đức', '2002-06-25', 'leminhduc@gmail.com', '0987654321', 'Số 180 Trần Phú', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Male'),
    (19, 'Phạm', 'Thị Thảo', '2003-07-30', 'phamthithao@gmail.com', '0123456789', 'Số 190 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Female'),
    (20, 'Hoàng', 'Văn Tùng', '2004-08-05', 'hoangvantung@gmail.com', '0987654321', 'Số 200 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Male'),
    (21, 'Nguyễn', 'Thị Hương', '1995-09-15', 'nguyenthihuong@gmail.com', '0123456789', 'Số 210 Hùng Vương', 'Hải Dương', 'Hải Dương', '310000', 'Female'),
    (22, 'Trần', 'Văn Hải', '1996-10-20', 'tranvanhai@gmail.com', '0987654321', 'Số 220 Nguyễn Văn Linh', 'Long Xuyên', 'An Giang', '880000', 'Male'),
    (23, 'Lê', 'Thị Ngọc', '1997-11-25', 'lengoc@gmail.com', '0123456789', 'Số 230 Nguyễn Hữu Thọ', 'Quy Nhơn', 'Bình Định', '590000', 'Female'),
    (24, 'Phạm', 'Văn Quân', '1998-12-30', 'phamvanquan@gmail.com', '0987654321', 'Số 240 Lê Lai', 'Huế', 'Thừa Thiên Huế', '540000', 'Male'),
    (25, 'Hoàng', 'Thị Mai', '1999-01-10', 'hoangthimai@gmail.com', '0123456789', 'Số 250 Phan Chu Trinh', 'Nam Định', 'Nam Định', '420000', 'Female'),
    (26, 'Nguyễn', 'Hồng Sơn', '2000-02-15', 'nguyenhongson@gmail.com', '0987654321', 'Số 260 Lê Thánh Tôn', 'Biên Hòa', 'Đồng Nai', '350000', 'Male'),
    (27, 'Trần', 'Mai Anh', '2001-03-20', 'tranmaianh@gmail.com', '0123456789', 'Số 270 Nguyễn Huệ', 'Long Xuyên', 'An Giang', '880000', 'Female'),
    (28, 'Lê', 'Văn Đức', '2002-04-25', 'levanduc@gmail.com', '0987654321', 'Số 280 Lý Thái Tổ', 'Bắc Giang', 'Bắc Giang', '220000', 'Male'),
    (29, 'Phạm', 'Thị Lan', '2003-05-30', 'phamthilan@gmail.com', '0123456789', 'Số 290 Trần Phú', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Female'),
    (30, 'Hoàng', 'Văn Bình', '2004-06-05', 'hoangvanbinh@gmail.com', '0987654321', 'Số 300 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Male'),
    (31, 'Nguyễn', 'Thị Hạnh', '1995-07-15', 'nguyenthihanh@gmail.com', '0123456789', 'Số 310 Trần Hưng Đạo', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Female'),
    (32, 'Trần', 'Đức Huy', '1996-08-20', 'tranduchuy@gmail.com', '0987654321', 'Số 320 Lê Duẩn', 'Nha Trang', 'Khánh Hòa', '570000', 'Male'),
    (33, 'Lê', 'Thị Hương', '1997-09-25', 'lethihuong@gmail.com', '0123456789', 'Số 330 Hoàng Diệu', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Female'),
    (34, 'Phạm', 'Minh Tuấn', '1998-10-30', 'phamminhtuan@gmail.com', '0987654321', 'Số 340 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Male'),
    (35, 'Hoàng', 'Thị Hằng', '1999-11-10', 'hoangthihang@gmail.com', '0123456789', 'Số 350 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Female'),
    (36, 'Nguyễn', 'Văn Hùng', '2000-12-15', 'nguyenvanhung@gmail.com', '0987654321', 'Số 360 Hùng Vương', 'Hải Dương', 'Hải Dương', '310000', 'Male'),
    (37, 'Trần', 'Thị Thảo', '2001-01-20', 'tranthithao@gmail.com', '0123456789', 'Số 370 Nguyễn Văn Linh', 'Long Xuyên', 'An Giang', '880000', 'Female'),
    (38, 'Lê', 'Văn Minh', '2002-02-25', 'levanminh@gmail.com', '0987654321', 'Số 380 Nguyễn Hữu Thọ', 'Quy Nhơn', 'Bình Định', '590000', 'Male'),
    (39, 'Phạm', 'Thị Mai', '2003-03-30', 'phamthimai@gmail.com', '0123456789', 'Số 390 Lê Lai', 'Huế', 'Thừa Thiên Huế', '540000', 'Female'),
    (40, 'Hoàng', 'Văn Tùng', '2004-04-05', 'hoangvantung@gmail.com', '0987654321', 'Số 400 Trần Hưng Đạo', 'Nam Định', 'Nam Định', '420000', 'Male'),
    (41, 'Nguyễn', 'Thị Hạnh', '1995-05-15', 'nguyenthihanh@gmail.com', '0123456789', 'Số 410 Lý Thái Tổ', 'Biên Hòa', 'Đồng Nai', '350000', 'Female'),
    (42, 'Trần', 'Đức Huy', '1996-06-20', 'tranduchuy@gmail.com', '0987654321', 'Số 420 Lê Lợi', 'Vũng Tàu', 'Bà Rịa - Vũng Tàu', '800000', 'Male'),
    (43, 'Lê', 'Thị Hương', '1997-07-25', 'lethihuong@gmail.com', '0123456789', 'Số 430 Nguyễn Văn Linh', 'Quảng Ngãi', 'Quảng Ngãi', '470000', 'Female'),
    (44, 'Phạm', 'Minh Tuấn', '1998-08-30', 'phamminhtuan@gmail.com', '0987654321', 'Số 440 Lê Duẩn', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Male'),
    (45, 'Hoàng', 'Thị Mai', '1999-09-10', 'hoangthimai@gmail.com', '0123456789', 'Số 450 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Female'),
    (46, 'Nguyễn', 'Văn Nam', '2000-10-15', 'nguyenvannam@gmail.com', '0987654321', 'Số 460 Hùng Vương', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Male'),
    (47, 'Trần', 'Thị Ánh', '2001-11-20', 'tranthianh@gmail.com', '0123456789', 'Số 470 Lê Thánh Tôn', 'Nha Trang', 'Khánh Hòa', '570000', 'Female'),
    (48, 'Lê', 'Minh Đức', '2002-12-25', 'leminhduc@gmail.com', '0987654321', 'Số 480 Trần Phú', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Male'),
    (49, 'Phạm', 'Thị Lan', '2003-01-30', 'phamthilan@gmail.com', '0123456789', 'Số 490 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Female'),
    (50, 'Hoàng', 'Văn Tùng', '2004-02-05', 'hoangvantung@gmail.com', '0987654321', 'Số 500 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Male'),
    (51, 'Nguyễn', 'Thị Hương', '1995-03-15', 'nguyenthihuong@gmail.com', '0123456789', 'Số 510 Nguyễn Bỉnh Khiêm', 'Long Xuyên', 'An Giang', '880000', 'Female'),
    (52, 'Trần', 'Đình Tùng', '1996-04-20', 'ledinhtung@gmail.com', '0987654321', 'Số 520 Lý Thái Tổ', 'Quảng Ngãi', 'Quảng Ngãi', '470000', 'Male'),
    (53, 'Lê', 'Thị Kim Ngân', '1997-05-25', 'tranthikimngan@gmail.com', '0123456789', 'Số 530 Nguyễn Thị Minh Khai', 'Bắc Giang', 'Bắc Giang', '220000', 'Female'),
    (54, 'Phạm', 'Quốc Hùng', '1998-06-28', 'phamquochung@gmail.com', '0987654321', 'Số 540 Trần Hưng Đạo', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Male'),
    (55, 'Hoàng', 'Thị Lan', '1999-07-10', 'hoangthilan@gmail.com', '0123456789', 'Số 550 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Female'),
    (56, 'Nguyễn', 'Văn Nam', '2000-08-15', 'nguyenvannam@gmail.com', '0987654321', 'Số 560 Hùng Vương', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Male'),
    (57, 'Trần', 'Thị Ánh', '2001-09-20', 'tranthianh@gmail.com', '0123456789', 'Số 570 Lê Duẩn', 'Nha Trang', 'Khánh Hòa', '570000', 'Female'),
    (58, 'Lê', 'Minh Đức', '2002-10-25', 'leminhduc@gmail.com', '0987654321', 'Số 580 Trần Phú', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Male'),
    (59, 'Phạm', 'Thị Lan', '2003-11-30', 'phamthilan@gmail.com', '0123456789', 'Số 590 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Female'),
    (60, 'Hoàng', 'Văn Tùng', '2004-12-05', 'hoangvantung@gmail.com', '0987654321', 'Số 600 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Male'),
    (61, 'Nguyễn', 'Thị Hương', '1995-01-15', 'nguyenthihuong@gmail.com', '0123456789', 'Số 610 Hùng Vương', 'Hải Dương', 'Hải Dương', '310000', 'Female'),
    (62, 'Trần', 'Văn Hải', '1996-02-20', 'tranvanhai@gmail.com', '0987654321', 'Số 620 Nguyễn Văn Linh', 'Long Xuyên', 'An Giang', '880000', 'Male'),
    (63, 'Lê', 'Thị Ngọc', '1997-03-25', 'lengoc@gmail.com', '0123456789', 'Số 630 Nguyễn Hữu Thọ', 'Quy Nhơn', 'Bình Định', '590000', 'Female'),
    (64, 'Phạm', 'Văn Quân', '1998-04-30', 'phamvanquan@gmail.com', '0987654321', 'Số 640 Lê Lai', 'Huế', 'Thừa Thiên Huế', '540000', 'Male'),
    (65, 'Hoàng', 'Thị Mai', '1999-05-10', 'hoangthimai@gmail.com', '0123456789', 'Số 650 Phan Chu Trinh', 'Nam Định', 'Nam Định', '420000', 'Female'),
    (66, 'Nguyễn', 'Hồng Sơn', '2000-06-15', 'nguyenhongson@gmail.com', '0987654321', 'Số 660 Lê Thánh Tôn', 'Biên Hòa', 'Đồng Nai', '350000', 'Male'),
    (67, 'Trần', 'Mai Anh', '2001-07-20', 'tranmaianh@gmail.com', '0123456789', 'Số 670 Nguyễn Huệ', 'Long Xuyên', 'An Giang', '880000', 'Female'),
    (68, 'Lê', 'Văn Đức', '2002-08-25', 'levanduc@gmail.com', '0987654321', 'Số 680 Lý Thái Tổ', 'Bắc Giang', 'Bắc Giang', '220000', 'Male'),
    (69, 'Phạm', 'Thị Lan', '2003-09-30', 'phamthilan@gmail.com', '0123456789', 'Số 690 Trần Phú', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Female'),
    (70, 'Hoàng', 'Văn Bình', '2004-10-05', 'hoangvanbinh@gmail.com', '0987654321', 'Số 700 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Male'),
    (71, 'Nguyễn', 'Thị Hạnh', '1995-11-15', 'nguyenthihanh@gmail.com', '0123456789', 'Số 710 Trần Hưng Đạo', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Female'),
    (72, 'Trần', 'Đức Huy', '1996-12-20', 'tranduchuy@gmail.com', '0987654321', 'Số 720 Lê Duẩn', 'Nha Trang', 'Khánh Hòa', '570000', 'Male'),
    (73, 'Lê', 'Thị Hương', '1997-01-25', 'lethihuong@gmail.com', '0123456789', 'Số 730 Hoàng Diệu', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Female'),
    (74, 'Phạm', 'Minh Tuấn', '1998-02-28', 'phamminhtuan@gmail.com', '0987654321', 'Số 740 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Male'),
    (75, 'Hoàng', 'Thị Lan', '1999-03-10', 'hoangthilan@gmail.com', '0123456789', 'Số 750 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Female'),
    (76, 'Nguyễn', 'Văn Nam', '2000-04-15', 'nguyenvannam@gmail.com', '0987654321', 'Số 760 Hùng Vương', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Male'),
    (77, 'Trần', 'Thị Ánh', '2001-05-20', 'tranthianh@gmail.com', '0123456789', 'Số 770 Lê Thánh Tôn', 'Nha Trang', 'Khánh Hòa', '570000', 'Female'),
    (78, 'Lê', 'Minh Đức', '2002-06-25', 'leminhduc@gmail.com', '0987654321', 'Số 780 Trần Phú', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Male'),
    (79, 'Phạm', 'Thị Lan', '2003-07-30', 'phamthilan@gmail.com', '0123456789', 'Số 790 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Female'),
    (80, 'Hoàng', 'Văn Tùng', '2004-08-05', 'hoangvantung@gmail.com', '0987654321', 'Số 800 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Male'),
    (81, 'Nguyễn', 'Thị Hương', '1995-09-15', 'nguyenthihuong@gmail.com', '0123456789', 'Số 810 Nguyễn Bỉnh Khiêm', 'Long Xuyên', 'An Giang', '880000', 'Female'),
    (82, 'Trần', 'Đình Tùng', '1996-10-20', 'ledinhtung@gmail.com', '0987654321', 'Số 820 Lý Thái Tổ', 'Quảng Ngãi', 'Quảng Ngãi', '470000', 'Male'),
    (83, 'Lê', 'Thị Kim Ngân', '1997-11-25', 'tranthikimngan@gmail.com', '0123456789', 'Số 830 Nguyễn Thị Minh Khai', 'Bắc Giang', 'Bắc Giang', '220000', 'Female'),
    (84, 'Phạm', 'Quốc Hùng', '1998-12-30', 'phamquochung@gmail.com', '0987654321', 'Số 840 Trần Hưng Đạo', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Male'),
    (85, 'Hoàng', 'Thị Lan', '1999-01-10', 'hoangthilan@gmail.com', '0123456789', 'Số 850 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Female'),
    (86, 'Nguyễn', 'Văn Hùng', '2000-02-15', 'nguyenvanhung@gmail.com', '0987654321', 'Số 860 Hùng Vương', 'Hải Dương', 'Hải Dương', '310000', 'Male'),
    (87, 'Trần', 'Thị Thảo', '2001-03-20', 'tranthithao@gmail.com', '0123456789', 'Số 870 Nguyễn Văn Linh', 'Long Xuyên', 'An Giang', '880000', 'Female'),
    (88, 'Lê', 'Văn Minh', '2002-04-25', 'levanminh@gmail.com', '0987654321', 'Số 880 Nguyễn Hữu Thọ', 'Quy Nhơn', 'Bình Định', '590000', 'Male'),
    (89, 'Phạm', 'Thị Mai', '2003-05-30', 'phamthimai@gmail.com', '0123456789', 'Số 890 Lê Lai', 'Huế', 'Thừa Thiên Huế', '540000', 'Female'),
    (90, 'Hoàng', 'Văn Tùng', '2004-06-05', 'hoangvantung@gmail.com', '0987654321', 'Số 900 Trần Hưng Đạo', 'Nam Định', 'Nam Định', '420000', 'Male'),
    (91, 'Nguyễn', 'Thị Hạnh', '1995-07-15', 'nguyenthihanh@gmail.com', '0123456789', 'Số 910 Lý Thái Tổ', 'Biên Hòa', 'Đồng Nai', '350000', 'Female'),
    (92, 'Trần', 'Đức Huy', '1996-08-20', 'tranduchuy@gmail.com', '0987654321', 'Số 920 Lê Duẩn', 'Vũng Tàu', 'Bà Rịa - Vũng Tàu', '800000', 'Male'),
    (93, 'Lê', 'Thị Hương', '1997-09-25', 'lethihuong@gmail.com', '0123456789', 'Số 930 Nguyễn Văn Linh', 'Quảng Ngãi', 'Quảng Ngãi', '470000', 'Female'),
    (94, 'Phạm', 'Minh Tuấn', '1998-10-30', 'phamminhtuan@gmail.com', '0987654321', 'Số 940 Lê Duẩn', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Male'),
    (95, 'Hoàng', 'Thị Hằng', '1999-11-10', 'hoangthihang@gmail.com', '0123456789', 'Số 950 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Female'),
    (96, 'Nguyễn', 'Văn Hùng', '2000-12-15', 'nguyenvanhung@gmail.com', '0987654321', 'Số 960 Hùng Vương', 'Hải Dương', 'Hải Dương', '310000', 'Male'),
    (97, 'Trần', 'Thị Thảo', '2001-01-20', 'tranthithao@gmail.com', '0123456789', 'Số 970 Nguyễn Văn Linh', 'Long Xuyên', 'An Giang', '880000', 'Female'),
    (98, 'Lê', 'Văn Minh', '2002-02-25', 'levanminh@gmail.com', '0987654321', 'Số 980 Nguyễn Hữu Thọ', 'Quy Nhơn', 'Bình Định', '590000', 'Male'),
    (99, 'Phạm', 'Thị Mai', '2003-03-30', 'phamthimai@gmail.com', '0123456789', 'Số 990 Lê Lai', 'Huế', 'Thừa Thiên Huế', '540000', 'Female'),
    (100, 'Hoàng', 'Văn Tùng', '2004-04-05', 'hoangvantung@gmail.com', '0987654321', 'Số 1000 Trần Hưng Đạo', 'Nam Định', 'Nam Định', '420000', 'Male');


-- Insert data into student_account table
INSERT INTO student_account (student_id, username, password, balance, created_date)
VALUES
    (1, 'user1', 'pass1', 0.00, '2024-06-01'),
    (2, 'user2', 'pass2', 0.00, '2024-06-02'),
    (3, 'user3', 'pass3', 0.00, '2024-06-03'),
    (4, 'user4', 'pass4', 0.00, '2024-06-04'),
    (5, 'user5', 'pass5', 0.00, '2024-06-05'),
    (6, 'user6', 'pass6', 0.00, '2024-06-06'),
    (7, 'user7', 'pass7', 0.00, '2024-06-07'),
    (8, 'user8', 'pass8', 0.00, '2024-06-08'),
    (9, 'user9', 'pass9', 0.00, '2024-06-09'),
    (10, 'user10', 'pass10', 0.00, '2024-06-10'),
    (11, 'user11', 'pass11', 0.00, '2024-06-11'),
    (12, 'user12', 'pass12', 0.00, '2024-06-12'),
    (13, 'user13', 'pass13', 0.00, '2024-06-13'),
    (14, 'user14', 'pass14', 0.00, '2024-06-14'),
    (15, 'user15', 'pass15', 0.00, '2024-06-15'),
    (16, 'user16', 'pass16', 0.00, '2024-06-16'),
    (17, 'user17', 'pass17', 0.00, '2024-06-17'),
    (18, 'user18', 'pass18', 0.00, '2024-06-18'),
    (19, 'user19', 'pass19', 0.00, '2024-06-19'),
    (20, 'user20', 'pass20', 0.00, '2024-06-20'),
    (21, 'user21', 'pass21', 0.00, '2024-06-21'),
    (22, 'user22', 'pass22', 0.00, '2024-06-22'),
    (23, 'user23', 'pass23', 0.00, '2024-06-23'),
    (24, 'user24', 'pass24', 0.00, '2024-06-24'),
    (25, 'user25', 'pass25', 0.00, '2024-06-25'),
    (26, 'user26', 'pass26', 0.00, '2024-06-26'),
    (27, 'user27', 'pass27', 0.00, '2024-06-27'),
    (28, 'user28', 'pass28', 0.00, '2024-06-28'),
    (29, 'user29', 'pass29', 0.00, '2024-06-29'),
    (30, 'user30', 'pass30', 0.00, '2024-06-30'),
    (31, 'user31', 'pass31', 0.00, '2024-06-01'),
    (32, 'user32', 'pass32', 0.00, '2024-06-02'),
    (33, 'user33', 'pass33', 0.00, '2024-06-03'),
    (34, 'user34', 'pass34', 0.00, '2024-06-04'),
    (35, 'user35', 'pass35', 0.00, '2024-06-05'),
    (36, 'user36', 'pass36', 0.00, '2024-06-06'),
    (37, 'user37', 'pass37', 0.00, '2024-06-07'),
    (38, 'user38', 'pass38', 0.00, '2024-06-08'),
    (39, 'user39', 'pass39', 0.00, '2024-06-09'),
    (40, 'user40', 'pass40', 0.00, '2024-06-10'),
    (41, 'user41', 'pass41', 0.00, '2024-06-11'),
    (42, 'user42', 'pass42', 0.00, '2024-06-12'),
    (43, 'user43', 'pass43', 0.00, '2024-06-13'),
    (44, 'user44', 'pass44', 0.00, '2024-06-14'),
    (45, 'user45', 'pass45', 0.00, '2024-06-15'),
    (46, 'user46', 'pass46', 0.00, '2024-06-16'),
    (47, 'user47', 'pass47', 0.00, '2024-06-17'),
    (48, 'user48', 'pass48', 0.00, '2024-06-18'),
    (49, 'user49', 'pass49', 0.00, '2024-06-19'),
    (50, 'user50', 'pass50', 0.00, '2024-06-20'),
    (51, 'user51', 'pass51', 0.00, '2024-06-21'),
    (52, 'user52', 'pass52', 0.00, '2024-06-22'),
    (53, 'user53', 'pass53', 0.00, '2024-06-23'),
    (54, 'user54', 'pass54', 0.00, '2024-06-24'),
    (55, 'user55', 'pass55', 0.00, '2024-06-25'),
    (56, 'user56', 'pass56', 0.00, '2024-06-26'),
    (57, 'user57', 'pass57', 0.00, '2024-06-27'),
    (58, 'user58', 'pass58', 0.00, '2024-06-28'),
    (59, 'user59', 'pass59', 0.00, '2024-06-29'),
    (60, 'user60', 'pass60', 0.00, '2024-06-30'),
    (61, 'user61', 'pass61', 0.00, '2024-06-01'),
    (62, 'user62', 'pass62', 0.00, '2024-06-02'),
    (63, 'user63', 'pass63', 0.00, '2024-06-03'),
    (64, 'user64', 'pass64', 0.00, '2024-06-04'),
    (65, 'user65', 'pass65', 0.00, '2024-06-05'),
    (66, 'user66', 'pass66', 0.00, '2024-06-06'),
    (67, 'user67', 'pass67', 0.00, '2024-06-07'),
    (68, 'user68', 'pass68', 0.00, '2024-06-08'),
    (69, 'user69', 'pass69', 0.00, '2024-06-09'),
    (70, 'user70', 'pass70', 0.00, '2024-06-10'),
    (71, 'user71', 'pass71', 0.00, '2024-06-11'),
    (72, 'user72', 'pass72', 0.00, '2024-06-12'),
    (73, 'user73', 'pass73', 0.00, '2024-06-13'),
    (74, 'user74', 'pass74', 0.00, '2024-06-14'),
    (75, 'user75', 'pass75', 0.00, '2024-06-15'),
    (76, 'user76', 'pass76', 0.00, '2024-06-16'),
    (77, 'user77', 'pass77', 0.00, '2024-06-17'),
    (78, 'user78', 'pass78', 0.00, '2024-06-18'),
    (79, 'user79', 'pass79', 0.00, '2024-06-19'),
    (80, 'user80', 'pass80', 0.00, '2024-06-20'),
    (81, 'user81', 'pass81', 0.00, '2024-06-21'),
    (82, 'user82', 'pass82', 0.00, '2024-06-22'),
    (83, 'user83', 'pass83', 0.00, '2024-06-23'),
    (84, 'user84', 'pass84', 0.00, '2024-06-24'),
    (85, 'user85', 'pass85', 0.00, '2024-06-25'),
    (86, 'user86', 'pass86', 0.00, '2024-06-26'),
    (87, 'user87', 'pass87', 0.00, '2024-06-27'),
    (88, 'user88', 'pass88', 0.00, '2024-06-28'),
    (89, 'user89', 'pass89', 0.00, '2024-06-29'),
    (90, 'user90', 'pass90', 0.00, '2024-06-30'),
    (91, 'user91', 'pass91', 0.00, '2024-06-01'),
    (92, 'user92', 'pass92', 0.00, '2024-06-02'),
    (93, 'user93', 'pass93', 0.00, '2024-06-03'),
    (94, 'user94', 'pass94', 0.00, '2024-06-04'),
    (95, 'user95', 'pass95', 0.00, '2024-06-05'),
    (96, 'user96', 'pass96', 0.00, '2024-06-06'),
    (97, 'user97', 'pass97', 0.00, '2024-06-07'),
    (98, 'user98', 'pass98', 0.00, '2024-06-08'),
    (99, 'user99', 'pass99', 0.00, '2024-06-09'),
    (100, 'user100', 'pass100', 0.00, '2024-06-10');

-- Insert data into payment table
INSERT INTO payment (id, payment_date, amount, status, student_id) VALUES
(1, '2024-05-01', 5250.0, 'Completed', 35),
(2, '2024-05-01', 5250.0, 'Completed', 42),
(3, '2024-05-01', 5250.0, 'Completed', 13),
(4, '2024-05-02', 5250.0, 'Completed', 14),
(5, '2024-05-02', 5250.0, 'Completed', 10),
(6, '2024-05-02', 5250.0, 'Completed', 44),
(7, '2024-05-03', 5250.0, 'Completed', 11),
(8, '2024-05-03', 5250.0, 'Completed', 8),
(9, '2024-05-03', 5250.0, 'Completed', 39),
(10, '2024-05-04', 5250.0, 'Completed', 26),
(11, '2024-05-04', 5250.0, 'Completed', 22),
(12, '2024-05-04', 5250.0, 'Completed', 47),
(13, '2024-05-05', 5250.0, 'Completed', 49),
(14, '2024-05-05', 5250.0, 'Completed', 48),
(15, '2024-05-05', 5250.0, 'Completed', 41),
(16, '2024-05-06', 5250.0, 'Completed', 27),
(17, '2024-05-06', 5250.0, 'Completed', 37),
(18, '2024-05-06', 5250.0, 'Completed', 24),
(19, '2024-05-07', 5250.0, 'Completed', 25),
(20, '2024-05-07', 5250.0, 'Completed', 16),
(21, '2024-05-07', 5250.0, 'Completed', 28),
(22, '2024-05-08', 5250.0, 'Completed', 9),
(23, '2024-05-08', 5250.0, 'Completed', 50),
(24, '2024-05-08', 5250.0, 'Completed', 40),
(25, '2024-05-09', 5250.0, 'Completed', 31),
(26, '2024-05-09', 5250.0, 'Completed', 38),
(27, '2024-05-09', 5250.0, 'Completed', 33),
(28, '2024-05-10', 5250.0, 'Completed', 17),
(29, '2024-05-10', 5250.0, 'Completed', 46),
(30, '2024-05-10', 5250.0, 'Completed', 15),
(31, '2024-05-11', 5250.0, 'Completed', 4),
(32, '2024-05-11', 5250.0, 'Completed', 6),
(33, '2024-05-11', 5250.0, 'Completed', 5),
(34, '2024-05-12', 5250.0, 'Completed', 23),
(35, '2024-05-12', 5250.0, 'Completed', 3),
(36, '2024-05-12', 5250.0, 'Completed', 32),
(37, '2024-05-13', 5250.0, 'Completed', 1),
(38, '2024-05-13', 5250.0, 'Completed', 29),
(39, '2024-05-13', 5250.0, 'Completed', 7),
(40, '2024-05-14', 5250.0, 'Completed', 12),
(41, '2024-05-14', 5250.0, 'Completed', 45),
(42, '2024-05-14', 5250.0, 'Completed', 36),
(43, '2024-05-15', 5250.0, 'Completed', 18),
(44, '2024-05-15', 5250.0, 'Completed', 30),
(45, '2024-05-15', 5250.0, 'Completed', 20),
(46, '2024-05-16', 5250.0, 'Completed', 19),
(47, '2024-05-16', 5250.0, 'Completed', 21),
(48, '2024-05-16', 5250.0, 'Completed', 2),
(49, '2024-05-17', 5250.0, 'Completed', 34),
(50, '2024-05-17', 5250.0, 'Completed', 43),
(51, '2024-05-17', 5250.00, 'Completed', 18),
(52, '2024-05-18', 5250.00, 'Completed', 29),
(53, '2024-05-18', 5250.00, 'Completed', 40),
(54, '2024-05-18', 5250.00, 'Completed', 51),
(55, '2024-05-19', 5250.00, 'Completed', 62),
(56, '2024-05-19', 5250.00, 'Completed', 73),
(57, '2024-05-19', 5250.00, 'Completed', 84),
(58, '2024-05-20', 5250.00, 'Completed', 8),
(59, '2024-05-20', 5250.00, 'Completed', 19),
(60, '2024-05-20', 5250.00, 'Completed', 30),
(61, '2024-05-21', 5250.00, 'Completed', 41),
(62, '2024-05-21', 5250.00, 'Completed', 52),
(63, '2024-05-21', 5250.00, 'Completed', 63),
(64, '2024-05-22', 5250.00, 'Completed', 74),
(65, '2024-05-22', 5250.00, 'Completed', 9),
(66, '2024-05-22', 5250.00, 'Completed', 10),
(67, '2024-05-23', 5250.00, 'Completed', 11),
(68, '2024-05-23', 5250.00, 'Completed', 20),
(69, '2024-05-23', 5250.00, 'Completed', 21),
(70, '2024-05-24', 5250.00, 'Completed', 22),
(71, '2024-05-24', 5250.00, 'Completed', 31),
(72, '2024-05-24', 5250.00, 'Completed', 32),
(73, '2024-05-25', 5250.00, 'Completed', 33),
(74, '2024-05-25', 5250.00, 'Completed', 42),
(75, '2024-05-25', 5250.00, 'Completed', 43),
(76, '2024-05-26', 5250.00, 'Completed', 44),
(77, '2024-05-26', 5250.00, 'Completed', 53),
(78, '2024-05-26', 5250.00, 'Completed', 54),
(79, '2024-05-27', 5250.00, 'Completed', 55),
(80, '2024-05-27', 5250.00, 'Completed', 64),
(81, '2024-05-27', 5250.00, 'Completed', 65),
(82, '2024-05-28', 5250.00, 'Completed', 66),
(83, '2024-05-28', 5250.00, 'Completed', 75),
(84, '2024-05-28', 5250.00, 'Completed', 76),
(85, '2024-05-29', 5250.00, 'Completed', 77),
(86, '2024-05-31', 5250.00, 'Completed', 85),
(87, '2024-06-01', 5250.00, 'Completed', 96),
(88, '2024-06-02', 5250.00, 'Completed', 88),
(89, '2024-06-03', 5250.00, 'Completed', 100),
(90, '2024-06-04', 5250.00, 'Completed', 89),
(91, '2024-06-05', 5250.00, 'Completed', 97),
(92, '2024-06-06', 5250.00, 'Completed', 86),
(93, '2024-06-07', 5250.00, 'Completed', 99),
(94, '2024-06-08', 5250.00, 'Completed', 91),
(95, '2024-06-09', 5250.00, 'Completed', 87),
(96, '2024-06-10', 5250.00, 'Completed', 95),
(97, '2024-06-11', 5250.00, 'Completed', 93),
(98, '2024-06-12', 5250.00, 'Completed', 98),
(99, '2024-06-13', 5250.00, 'Completed', 90),
(100, '2024-06-14', 5250.00, 'Completed', 94);


-- Insert into class_student table
-- Insert 10 student to class C01
INSERT INTO class_student (class_id, student_id) VALUES
    ('C01', 1),
    ('C01', 2),
    ('C01', 3),
    ('C01', 4),
    ('C01', 5),
    ('C01', 6),
    ('C01', 7),
    ('C01', 8),
    ('C01', 9),
    ('C01', 10),
-- Insert 10 student to class C02
    ('C02', 11),
    ('C02', 12),
    ('C02', 13),
    ('C02', 14),
    ('C02', 15),
    ('C02', 16),
    ('C02', 17),
    ('C02', 18),
    ('C02', 19),
    ('C02', 20),
-- Insert 10 student to class C03
    ('C03', 21),
    ('C03', 22),
    ('C03', 23),
    ('C03', 24),
    ('C03', 25),
    ('C03', 26),
    ('C03', 27),
    ('C03', 28),
    ('C03', 29),
    ('C03', 30),
-- Insert 10 student to class C04
    ('C04', 31),
    ('C04', 32),
    ('C04', 33),
    ('C04', 34),
    ('C04', 35),
    ('C04', 36),
    ('C04', 37),
    ('C04', 38),
    ('C04', 39),
    ('C04', 40),
-- Insert 10 student to class C05
    ('C05', 41),
    ('C05', 42),
    ('C05', 43),
    ('C05', 44),
    ('C05', 45),
    ('C05', 46),
    ('C05', 47),
    ('C05', 48),
    ('C05', 49),
    ('C05', 50),
-- Insert 10 student to class C06
    ('C06', 51),
    ('C06', 52),
    ('C06', 53),
    ('C06', 54),
    ('C06', 55),
    ('C06', 56),
    ('C06', 57),
    ('C06', 58),
    ('C06', 59),
    ('C06', 60),
-- Insert 10 student to class C07
    ('C07', 61),
    ('C07', 62),
    ('C07', 63),
    ('C07', 64),
    ('C07', 65),
    ('C07', 66),
    ('C07', 67),
    ('C07', 68),
    ('C07', 69),
    ('C07', 70),
-- Insert 10 student to class C08
    ('C08', 71),
    ('C08', 72),
    ('C08', 73),
    ('C08', 74),
    ('C08', 75),
    ('C08', 76),
    ('C08', 77),
    ('C08', 78),
    ('C08', 79),
    ('C08', 80),
-- Insert 10 student to class C09
    ('C09', 81),
    ('C09', 82),
    ('C09', 83),
    ('C09', 84),
    ('C09', 85),
    ('C09', 86),
    ('C09', 87),
    ('C09', 88),
    ('C09', 89),
    ('C09', 90),
-- Insert 10 student to class C10
    ('C10', 91),
    ('C10', 92),
    ('C10', 93),
    ('C10', 94),
    ('C10', 95),
    ('C10', 96),
    ('C10', 97),
    ('C10', 98),
    ('C10', 99),
    ('C10', 100);

-- Insert grades with specific assignments
INSERT INTO grade (id, value, student_id, exam_id) 
SELECT
    ROW_NUMBER() OVER (ORDER BY student_id, exam_id) AS id,
    FLOOR(RAND(CHECKSUM(NEWID())) * 101) AS value,  -- Random grades from 0 to 100
    student_id,
    exam_id
FROM
(
    SELECT student_id, exam_id
    FROM 
    (
        SELECT s.id AS student_id, e.id AS exam_id, c.id AS class_id
        FROM student s
        CROSS JOIN exam e
        JOIN class_student cs ON s.id = cs.student_id
        JOIN class c ON cs.class_id = c.id AND e.class_id = c.id
    ) AS temp
) AS results;
