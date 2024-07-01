
INSERT INTO level (id, name)
VALUES
(1, '0-450'),
(2, '450-600'),
(3, '600-750');

INSERT INTO course (id, description, level_id)
VALUES
--Writing
('W001', 'Writing', 1),
('W002', 'Writing', 2),
('W003', 'Writing', 3),
--Reading
('R001', 'Reading', 1), 
('R002', 'Reading', 2), 
('R003', 'Reading', 3), 
--Listening
('L001', 'Listening', 1),
('L002', 'Listening', 2),
('L003', 'Listening', 3),
--Speaking
('S001', 'Speaking', 1),
('S002', 'Speaking', 2),
('S003', 'Speaking', 3);

INSERT INTO teacher (id, first_name, last_name, description, date_birth, gender, email, phone, street, city, state, zip)
VALUES
(1, 'John', 'Doe', 'English Language Teacher', '1979-05-10', 'Male', 'john.doe@gmail.com', '0905123456', '123 Nguyen Du', 'Hanoi', 'HN', '100000'),
(2, 'Jane', 'Smith', 'English Language Teacher', '1982-11-23', 'Female', 'jane.smith@gmail.com', '0905234567', '456 Le Loi', 'Ho Chi Minh City', 'HCM', '700000'),
(3, 'Paul', 'Taylor', 'English Language Teacher', '1975-08-15', 'Male', 'paul.taylor@gmail.com', '0905345678', '789 Vo Van Tan', 'Da Nang', 'DN', '550000'),
(4, 'Emily', 'Johnson', 'English Language Teacher', '1986-02-04', 'Female', 'emily.johnson@gmail.com', '0905456789', '321 Tran Phu', 'Can Tho', 'CT', '900000'),
(5, 'Michael', 'Brown', 'English Language Teacher', '1980-09-09', 'Male', 'michael.brown@gmail.com', '0905567890', '654 Ba Thang Hai', 'Hue', 'TH', '530000'),
(6, 'Sara', 'Wilson', 'English Language Teacher', '1988-12-20', 'Female', 'sara.wilson@gmail.com', '0905678901', '987 Ly Tu Trong', 'Hai Phong', 'HP', '180000');

INSERT INTO teacher (id, first_name, last_name, description, date_birth, gender, email, phone, street, city, state, zip)
VALUES
(7, 'Nguyen', 'Thi Hoa', 'English Language Teacher', '1991-07-15', 'Female', 'hoa.nguyen@gmail.com', '0905789012', '135 Nguyen Van Linh', 'Nha Trang', 'NT', '650000'),
(8, 'Tran', 'Van Nam', 'English Language Teacher', '1984-03-22', 'Male', 'nam.tran@gmail.com', '0905890123', '246 Hai Ba Trung', 'Vung Tau', 'VT', '780000'),
(9, 'Le', 'Thi Lan', 'English Language Teacher', '1995-05-11', 'Female', 'lan.le@gmail.com', '0905901234', '369 Le Hong Phong', 'Quy Nhon', 'QN', '820000'),
(10, 'Pham', 'Van Kien', 'English Language Teacher', '1990-10-30', 'Male', 'kien.pham@gmail.com', '0906012345', '147 Tran Hung Dao', 'Bien Hoa', 'BH', '810000');

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

INSERT INTO exam (id, date, description, class_id) VALUES
(1, '2023-06-27', 'Quiz 1', 'C01'),
(2, '2023-07-27', 'Quiz 2', 'C01'),
(3, '2023-08-27', 'Midterm Exam', 'C01'),
(4, '2023-09-27', 'Quiz 3', 'C01'),
(5, '2023-10-27', 'Final Exam', 'C01'),
(6, '2023-06-27', 'Quiz 1', 'C02'),
(7, '2023-07-27', 'Quiz 2', 'C02'),
(8, '2023-08-27', 'Midterm Exam', 'C02'),
(9, '2023-09-27', 'Quiz 3', 'C02'),
(10, '2023-10-27', 'Final Exam', 'C02'),
(11, '2023-06-27', 'Quiz 1', 'C03'),
(12, '2023-07-27', 'Quiz 2', 'C03'),
(13, '2023-08-27', 'Midterm Exam', 'C03'),
(14, '2023-09-27', 'Quiz 3', 'C03'),
(15, '2023-10-27', 'Final Exam', 'C03'),
(16, '2023-06-27', 'Quiz 1', 'C04'),
(17, '2023-07-27', 'Quiz 2', 'C04'),
(18, '2023-08-27', 'Midterm Exam', 'C04'),
(19, '2023-09-27', 'Quiz 3', 'C04'),
(20, '2023-10-27', 'Final Exam', 'C04'),
(21, '2023-06-27', 'Quiz 1', 'C05'),
(22, '2023-07-27', 'Quiz 2', 'C05'),
(23, '2023-08-27', 'Midterm Exam', 'C05'),
(24, '2023-09-27', 'Quiz 3', 'C05'),
(25, '2023-10-27', 'Final Exam', 'C05'),
(26, '2023-06-27', 'Quiz 1', 'C06'),
(27, '2023-07-27', 'Quiz 2', 'C06'),
(28, '2023-08-27', 'Midterm Exam', 'C06'),
(29, '2023-09-27', 'Quiz 3', 'C06'),
(30, '2023-10-27', 'Final Exam', 'C06'),
(31, '2023-06-27', 'Quiz 1', 'C07'),
(32, '2023-07-27', 'Quiz 2', 'C07'),
(33, '2023-08-27', 'Midterm Exam', 'C07'),
(34, '2023-09-27', 'Quiz 3', 'C07'),
(35, '2023-10-27', 'Final Exam', 'C07'),
(36, '2023-06-27', 'Quiz 1', 'C08'),
(37, '2023-07-27', 'Quiz 2', 'C08'),
(38, '2023-08-27', 'Midterm Exam', 'C08'),
(39, '2023-09-27', 'Quiz 3', 'C08'),
(40, '2023-10-27', 'Final Exam', 'C08'),
(41, '2023-06-27', 'Quiz 1', 'C09'),
(42, '2023-07-27', 'Quiz 2', 'C09'),
(43, '2023-08-27', 'Midterm Exam', 'C09'),
(44, '2023-09-27', 'Quiz 3', 'C09'),
(45, '2023-10-27', 'Final Exam', 'C09'),
(46, '2023-06-27', 'Quiz 1', 'C10'),
(47, '2023-07-27', 'Quiz 2', 'C10'),
(48, '2023-08-27', 'Midterm Exam', 'C10'),
(49, '2023-09-27', 'Quiz 3', 'C10'),
(50, '2023-10-27', 'Final Exam', 'C10');

INSERT INTO student (id, first_name, last_name, date_birth, email, phone, street, city, state, zip, gender)
VALUES
    (1, 'Nguyễn', 'Văn An', '1995-01-15', 'nguyenvanan@gmail.com', '0123456789', 'Số 10 Nguyễn Cơ Thạch', 'Hà Nội', 'Hà Nội', '100000', 'Nam'),
    (2, 'Trần', 'Thị Bảo', '1996-02-20', 'tranthibao@gmail.com', '0987654321', 'Số 20 Lý Thường Kiệt', 'Hồ Chí Minh', 'Hồ Chí Minh', '700000', 'Nữ'),
    (3, 'Lê', 'Thành Công', '1997-03-25', 'lethanhcong@gmail.com', '0123456789', 'Số 30 Điện Biên Phủ', 'Đà Nẵng', 'Đà Nẵng', '500000', 'Nam'),
    (4, 'Phạm', 'Ngọc Diệp', '1998-04-30', 'phamngocdiep@gmail.com', '0987654321', 'Số 40 Lê Lợi', 'Hải Phòng', 'Hải Phòng', '300000', 'Nữ'),
    (5, 'Hoàng', 'Quang Dũng', '1999-05-10', 'hoangquangdung@gmail.com', '0123456789', 'Số 50 Nguyễn Huệ', 'Cần Thơ', 'Cần Thơ', '900000', 'Nam'),
    (6, 'Trần', 'Hồng Ngọc', '2000-06-15', 'tranhongngoc@gmail.com', '0987654321', 'Số 60 Trần Hưng Đạo', 'Vũng Tàu', 'Bà Rịa - Vũng Tàu', '800000', 'Nữ'),
    (7, 'Nguyễn', 'Đức Tuấn', '2001-07-20', 'nguyenductuan@gmail.com', '0123456789', 'Số 70 Phan Chu Trinh', 'Quy Nhơn', 'Bình Định', '590000', 'Nam'),
    (8, 'Lê', 'Thị Thanh', '2002-08-25', 'lethithanh@gmail.com', '0987654321', 'Số 80 Hoàng Diệu', 'Huế', 'Thừa Thiên Huế', '540000', 'Nữ'),
    (9, 'Trần', 'Minh Tuấn', '2003-09-30', 'tranminhtuan@gmail.com', '0123456789', 'Số 90 Nguyễn Trãi', 'Nam Định', 'Nam Định', '420000', 'Nam'),
    (10, 'Phạm', 'Mai Anh', '2004-10-05', 'phammaianh@gmail.com', '0987654321', 'Số 100 Lê Lai', 'Biên Hòa', 'Đồng Nai', '350000', 'Nữ'),
    (11, 'Nguyễn', 'Thị Mỹ', '1995-11-15', 'nguyenthimy@gmail.com', '0123456789', 'Số 110 Nguyễn Bỉnh Khiêm', 'Long Xuyên', 'An Giang', '880000', 'Nữ'),
    (12, 'Lê', 'Đình Tùng', '1996-12-20', 'ledinhtung@gmail.com', '0987654321', 'Số 120 Lý Thái Tổ', 'Quảng Ngãi', 'Quảng Ngãi', '470000', 'Nam'),
    (13, 'Trần', 'Thị Kim Ngân', '1997-01-25', 'tranthikimngan@gmail.com', '0123456789', 'Số 130 Nguyễn Thị Minh Khai', 'Bắc Giang', 'Bắc Giang', '220000', 'Nữ'),
    (14, 'Phạm', 'Quốc Hùng', '1998-02-28', 'phamquochung@gmail.com', '0987654321', 'Số 140 Trần Hưng Đạo', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Nam'),
    (15, 'Hoàng', 'Thị Lan', '1999-03-10', 'hoangthilan@gmail.com', '0123456789', 'Số 150 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Nữ'),
    (16, 'Nguyễn', 'Văn Nam', '2000-04-15', 'nguyenvannam@gmail.com', '0987654321', 'Số 160 Hùng Vương', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Nam'),
    (17, 'Trần', 'Thị Ánh', '2001-05-20', 'tranthianh@gmail.com', '0123456789', 'Số 170 Lê Duẩn', 'Nha Trang', 'Khánh Hòa', '570000', 'Nữ'),
    (18, 'Lê', 'Minh Đức', '2002-06-25', 'leminhduc@gmail.com', '0987654321', 'Số 180 Trần Phú', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Nam'),
    (19, 'Phạm', 'Thị Thảo', '2003-07-30', 'phamthithao@gmail.com', '0123456789', 'Số 190 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Nữ'),
    (20, 'Hoàng', 'Văn Tùng', '2004-08-05', 'hoangvantung@gmail.com', '0987654321', 'Số 200 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Nam'),
    (21, 'Nguyễn', 'Thị Hương', '1995-09-15', 'nguyenthihuong@gmail.com', '0123456789', 'Số 210 Hùng Vương', 'Hải Dương', 'Hải Dương', '310000', 'Nữ'),
    (22, 'Trần', 'Văn Hải', '1996-10-20', 'tranvanhai@gmail.com', '0987654321', 'Số 220 Nguyễn Văn Linh', 'Long Xuyên', 'An Giang', '880000', 'Nam'),
    (23, 'Lê', 'Thị Ngọc', '1997-11-25', 'lengoc@gmail.com', '0123456789', 'Số 230 Nguyễn Hữu Thọ', 'Quy Nhơn', 'Bình Định', '590000', 'Nữ'),
    (24, 'Phạm', 'Văn Quân', '1998-12-30', 'phamvanquan@gmail.com', '0987654321', 'Số 240 Lê Lai', 'Huế', 'Thừa Thiên Huế', '540000', 'Nam'),
    (25, 'Hoàng', 'Thị Mai', '1999-01-10', 'hoangthimai@gmail.com', '0123456789', 'Số 250 Phan Chu Trinh', 'Nam Định', 'Nam Định', '420000', 'Nữ'),
    (26, 'Nguyễn', 'Hồng Sơn', '2000-02-15', 'nguyenhongson@gmail.com', '0987654321', 'Số 260 Lê Thánh Tôn', 'Biên Hòa', 'Đồng Nai', '350000', 'Nam'),
    (27, 'Trần', 'Mai Anh', '2001-03-20', 'tranmaianh@gmail.com', '0123456789', 'Số 270 Nguyễn Huệ', 'Long Xuyên', 'An Giang', '880000', 'Nữ'),
    (28, 'Lê', 'Văn Đức', '2002-04-25', 'levanduc@gmail.com', '0987654321', 'Số 280 Lý Thái Tổ', 'Bắc Giang', 'Bắc Giang', '220000', 'Nam'),
    (29, 'Phạm', 'Thị Lan', '2003-05-30', 'phamthilan@gmail.com', '0123456789', 'Số 290 Trần Phú', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Nữ'),
    (30, 'Hoàng', 'Văn Bình', '2004-06-05', 'hoangvanbinh@gmail.com', '0987654321', 'Số 300 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Nam'),
    (31, 'Nguyễn', 'Thị Hạnh', '1995-07-15', 'nguyenthihanh@gmail.com', '0123456789', 'Số 310 Trần Hưng Đạo', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Nữ'),
    (32, 'Trần', 'Đức Huy', '1996-08-20', 'tranduchuy@gmail.com', '0987654321', 'Số 320 Lê Duẩn', 'Nha Trang', 'Khánh Hòa', '570000', 'Nam'),
    (33, 'Lê', 'Thị Hương', '1997-09-25', 'lethihuong@gmail.com', '0123456789', 'Số 330 Hoàng Diệu', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Nữ'),
    (34, 'Phạm', 'Minh Tuấn', '1998-10-30', 'phamminhtuan@gmail.com', '0987654321', 'Số 340 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Nam'),
    (35, 'Hoàng', 'Thị Hằng', '1999-11-10', 'hoangthihang@gmail.com', '0123456789', 'Số 350 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Nữ'),
    (36, 'Nguyễn', 'Văn Hùng', '2000-12-15', 'nguyenvanhung@gmail.com', '0987654321', 'Số 360 Hùng Vương', 'Hải Dương', 'Hải Dương', '310000', 'Nam'),
    (37, 'Trần', 'Thị Thảo', '2001-01-20', 'tranthithao@gmail.com', '0123456789', 'Số 370 Nguyễn Văn Linh', 'Long Xuyên', 'An Giang', '880000', 'Nữ'),
    (38, 'Lê', 'Văn Minh', '2002-02-25', 'levanminh@gmail.com', '0987654321', 'Số 380 Nguyễn Hữu Thọ', 'Quy Nhơn', 'Bình Định', '590000', 'Nam'),
    (39, 'Phạm', 'Thị Mai', '2003-03-30', 'phamthimai@gmail.com', '0123456789', 'Số 390 Lê Lai', 'Huế', 'Thừa Thiên Huế', '540000', 'Nữ'),
    (40, 'Hoàng', 'Văn Tùng', '2004-04-05', 'hoangvantung@gmail.com', '0987654321', 'Số 400 Trần Hưng Đạo', 'Nam Định', 'Nam Định', '420000', 'Nam'),
    (41, 'Nguyễn', 'Thị Hạnh', '1995-05-15', 'nguyenthihanh@gmail.com', '0123456789', 'Số 410 Lý Thái Tổ', 'Biên Hòa', 'Đồng Nai', '350000', 'Nữ'),
    (42, 'Trần', 'Đức Huy', '1996-06-20', 'tranduchuy@gmail.com', '0987654321', 'Số 420 Lê Lợi', 'Vũng Tàu', 'Bà Rịa - Vũng Tàu', '800000', 'Nam'),
    (43, 'Lê', 'Thị Hương', '1997-07-25', 'lethihuong@gmail.com', '0123456789', 'Số 430 Nguyễn Văn Linh', 'Quảng Ngãi', 'Quảng Ngãi', '470000', 'Nữ'),
    (44, 'Phạm', 'Minh Tuấn', '1998-08-30', 'phamminhtuan@gmail.com', '0987654321', 'Số 440 Lê Duẩn', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Nam'),
    (45, 'Hoàng', 'Thị Mai', '1999-09-10', 'hoangthimai@gmail.com', '0123456789', 'Số 450 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Nữ'),
    (46, 'Nguyễn', 'Văn Nam', '2000-10-15', 'nguyenvannam@gmail.com', '0987654321', 'Số 460 Hùng Vương', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Nam'),
    (47, 'Trần', 'Thị Ánh', '2001-11-20', 'tranthianh@gmail.com', '0123456789', 'Số 470 Lê Thánh Tôn', 'Nha Trang', 'Khánh Hòa', '570000', 'Nữ'),
    (48, 'Lê', 'Minh Đức', '2002-12-25', 'leminhduc@gmail.com', '0987654321', 'Số 480 Trần Phú', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Nam'),
    (49, 'Phạm', 'Thị Lan', '2003-01-30', 'phamthilan@gmail.com', '0123456789', 'Số 490 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Nữ'),
    (50, 'Hoàng', 'Văn Tùng', '2004-02-05', 'hoangvantung@gmail.com', '0987654321', 'Số 500 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Nam'),
    (51, 'Nguyễn', 'Thị Hương', '1995-03-15', 'nguyenthihuong@gmail.com', '0123456789', 'Số 510 Nguyễn Bỉnh Khiêm', 'Long Xuyên', 'An Giang', '880000', 'Nữ'),
    (52, 'Trần', 'Đình Tùng', '1996-04-20', 'ledinhtung@gmail.com', '0987654321', 'Số 520 Lý Thái Tổ', 'Quảng Ngãi', 'Quảng Ngãi', '470000', 'Nam'),
    (53, 'Lê', 'Thị Kim Ngân', '1997-05-25', 'tranthikimngan@gmail.com', '0123456789', 'Số 530 Nguyễn Thị Minh Khai', 'Bắc Giang', 'Bắc Giang', '220000', 'Nữ'),
    (54, 'Phạm', 'Quốc Hùng', '1998-06-28', 'phamquochung@gmail.com', '0987654321', 'Số 540 Trần Hưng Đạo', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Nam'),
    (55, 'Hoàng', 'Thị Lan', '1999-07-10', 'hoangthilan@gmail.com', '0123456789', 'Số 550 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Nữ'),
    (56, 'Nguyễn', 'Văn Nam', '2000-08-15', 'nguyenvannam@gmail.com', '0987654321', 'Số 560 Hùng Vương', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Nam'),
    (57, 'Trần', 'Thị Ánh', '2001-09-20', 'tranthianh@gmail.com', '0123456789', 'Số 570 Lê Duẩn', 'Nha Trang', 'Khánh Hòa', '570000', 'Nữ'),
    (58, 'Lê', 'Minh Đức', '2002-10-25', 'leminhduc@gmail.com', '0987654321', 'Số 580 Trần Phú', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Nam'),
    (59, 'Phạm', 'Thị Lan', '2003-11-30', 'phamthilan@gmail.com', '0123456789', 'Số 590 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Nữ'),
    (60, 'Hoàng', 'Văn Tùng', '2004-12-05', 'hoangvantung@gmail.com', '0987654321', 'Số 600 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Nam'),
    (61, 'Nguyễn', 'Thị Hương', '1995-01-15', 'nguyenthihuong@gmail.com', '0123456789', 'Số 610 Hùng Vương', 'Hải Dương', 'Hải Dương', '310000', 'Nữ'),
    (62, 'Trần', 'Văn Hải', '1996-02-20', 'tranvanhai@gmail.com', '0987654321', 'Số 620 Nguyễn Văn Linh', 'Long Xuyên', 'An Giang', '880000', 'Nam'),
    (63, 'Lê', 'Thị Ngọc', '1997-03-25', 'lengoc@gmail.com', '0123456789', 'Số 630 Nguyễn Hữu Thọ', 'Quy Nhơn', 'Bình Định', '590000', 'Nữ'),
    (64, 'Phạm', 'Văn Quân', '1998-04-30', 'phamvanquan@gmail.com', '0987654321', 'Số 640 Lê Lai', 'Huế', 'Thừa Thiên Huế', '540000', 'Nam'),
    (65, 'Hoàng', 'Thị Mai', '1999-05-10', 'hoangthimai@gmail.com', '0123456789', 'Số 650 Phan Chu Trinh', 'Nam Định', 'Nam Định', '420000', 'Nữ'),
    (66, 'Nguyễn', 'Hồng Sơn', '2000-06-15', 'nguyenhongson@gmail.com', '0987654321', 'Số 660 Lê Thánh Tôn', 'Biên Hòa', 'Đồng Nai', '350000', 'Nam'),
    (67, 'Trần', 'Mai Anh', '2001-07-20', 'tranmaianh@gmail.com', '0123456789', 'Số 670 Nguyễn Huệ', 'Long Xuyên', 'An Giang', '880000', 'Nữ'),
    (68, 'Lê', 'Văn Đức', '2002-08-25', 'levanduc@gmail.com', '0987654321', 'Số 680 Lý Thái Tổ', 'Bắc Giang', 'Bắc Giang', '220000', 'Nam'),
    (69, 'Phạm', 'Thị Lan', '2003-09-30', 'phamthilan@gmail.com', '0123456789', 'Số 690 Trần Phú', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Nữ'),
    (70, 'Hoàng', 'Văn Bình', '2004-10-05', 'hoangvanbinh@gmail.com', '0987654321', 'Số 700 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Nam'),
    (71, 'Nguyễn', 'Thị Hạnh', '1995-11-15', 'nguyenthihanh@gmail.com', '0123456789', 'Số 710 Trần Hưng Đạo', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Nữ'),
    (72, 'Trần', 'Đức Huy', '1996-12-20', 'tranduchuy@gmail.com', '0987654321', 'Số 720 Lê Duẩn', 'Nha Trang', 'Khánh Hòa', '570000', 'Nam'),
    (73, 'Lê', 'Thị Hương', '1997-01-25', 'lethihuong@gmail.com', '0123456789', 'Số 730 Hoàng Diệu', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Nữ'),
    (74, 'Phạm', 'Minh Tuấn', '1998-02-28', 'phamminhtuan@gmail.com', '0987654321', 'Số 740 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Nam'),
    (75, 'Hoàng', 'Thị Lan', '1999-03-10', 'hoangthilan@gmail.com', '0123456789', 'Số 750 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Nữ'),
    (76, 'Nguyễn', 'Văn Nam', '2000-04-15', 'nguyenvannam@gmail.com', '0987654321', 'Số 760 Hùng Vương', 'Thái Nguyên', 'Thái Nguyên', '250000', 'Nam'),
    (77, 'Trần', 'Thị Ánh', '2001-05-20', 'tranthianh@gmail.com', '0123456789', 'Số 770 Lê Thánh Tôn', 'Nha Trang', 'Khánh Hòa', '570000', 'Nữ'),
    (78, 'Lê', 'Minh Đức', '2002-06-25', 'leminhduc@gmail.com', '0987654321', 'Số 780 Trần Phú', 'Vĩnh Yên', 'Vĩnh Phúc', '280000', 'Nam'),
    (79, 'Phạm', 'Thị Lan', '2003-07-30', 'phamthilan@gmail.com', '0123456789', 'Số 790 Nguyễn Văn Linh', 'Rạch Giá', 'Kiên Giang', '920000', 'Nữ'),
    (80, 'Hoàng', 'Văn Tùng', '2004-08-05', 'hoangvantung@gmail.com', '0987654321', 'Số 800 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Nam'),
    (81, 'Nguyễn', 'Thị Hương', '1995-09-15', 'nguyenthihuong@gmail.com', '0123456789', 'Số 810 Nguyễn Bỉnh Khiêm', 'Long Xuyên', 'An Giang', '880000', 'Nữ'),
    (82, 'Trần', 'Đình Tùng', '1996-10-20', 'ledinhtung@gmail.com', '0987654321', 'Số 820 Lý Thái Tổ', 'Quảng Ngãi', 'Quảng Ngãi', '470000', 'Nam'),
    (83, 'Lê', 'Thị Kim Ngân', '1997-11-25', 'tranthikimngan@gmail.com', '0123456789', 'Số 830 Nguyễn Thị Minh Khai', 'Bắc Giang', 'Bắc Giang', '220000', 'Nữ'),
    (84, 'Phạm', 'Quốc Hùng', '1998-12-30', 'phamquochung@gmail.com', '0987654321', 'Số 840 Trần Hưng Đạo', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Nam'),
    (85, 'Hoàng', 'Thị Lan', '1999-01-10', 'hoangthilan@gmail.com', '0123456789', 'Số 850 Nguyễn Công Trứ', 'Phan Thiết', 'Bình Thuận', '620000', 'Nữ'),
    (86, 'Nguyễn', 'Văn Hùng', '2000-02-15', 'nguyenvanhung@gmail.com', '0987654321', 'Số 860 Hùng Vương', 'Hải Dương', 'Hải Dương', '310000', 'Nam'),
    (87, 'Trần', 'Thị Thảo', '2001-03-20', 'tranthithao@gmail.com', '0123456789', 'Số 870 Nguyễn Văn Linh', 'Long Xuyên', 'An Giang', '880000', 'Nữ'),
    (88, 'Lê', 'Văn Minh', '2002-04-25', 'levanminh@gmail.com', '0987654321', 'Số 880 Nguyễn Hữu Thọ', 'Quy Nhơn', 'Bình Định', '590000', 'Nam'),
    (89, 'Phạm', 'Thị Mai', '2003-05-30', 'phamthimai@gmail.com', '0123456789', 'Số 890 Lê Lai', 'Huế', 'Thừa Thiên Huế', '540000', 'Nữ'),
    (90, 'Hoàng', 'Văn Tùng', '2004-06-05', 'hoangvantung@gmail.com', '0987654321', 'Số 900 Trần Hưng Đạo', 'Nam Định', 'Nam Định', '420000', 'Nam'),
    (91, 'Nguyễn', 'Thị Hạnh', '1995-07-15', 'nguyenthihanh@gmail.com', '0123456789', 'Số 910 Lý Thái Tổ', 'Biên Hòa', 'Đồng Nai', '350000', 'Nữ'),
    (92, 'Trần', 'Đức Huy', '1996-08-20', 'tranduchuy@gmail.com', '0987654321', 'Số 920 Lê Duẩn', 'Vũng Tàu', 'Bà Rịa - Vũng Tàu', '800000', 'Nam'),
    (93, 'Lê', 'Thị Hương', '1997-09-25', 'lethihuong@gmail.com', '0123456789', 'Số 930 Nguyễn Văn Linh', 'Quảng Ngãi', 'Quảng Ngãi', '470000', 'Nữ'),
    (94, 'Phạm', 'Minh Tuấn', '1998-10-30', 'phamminhtuan@gmail.com', '0987654321', 'Số 940 Lê Duẩn', 'Hà Tĩnh', 'Hà Tĩnh', '480000', 'Nam'),
    (95, 'Hoàng', 'Thị Hằng', '1999-11-10', 'hoangthihang@gmail.com', '0123456789', 'Số 950 Lý Thường Kiệt', 'Cà Mau', 'Cà Mau', '970000', 'Nữ'),
    (96, 'Nguyễn', 'Văn Hùng', '2000-12-15', 'nguyenvanhung@gmail.com', '0987654321', 'Số 960 Hùng Vương', 'Hải Dương', 'Hải Dương', '310000', 'Nam'),
    (97, 'Trần', 'Thị Thảo', '2001-01-20', 'tranthithao@gmail.com', '0123456789', 'Số 970 Nguyễn Văn Linh', 'Long Xuyên', 'An Giang', '880000', 'Nữ'),
    (98, 'Lê', 'Văn Minh', '2002-02-25', 'levanminh@gmail.com', '0987654321', 'Số 980 Nguyễn Hữu Thọ', 'Quy Nhơn', 'Bình Định', '590000', 'Nam'),
    (99, 'Phạm', 'Thị Mai', '2003-03-30', 'phamthimai@gmail.com', '0123456789', 'Số 990 Lê Lai', 'Huế', 'Thừa Thiên Huế', '540000', 'Nữ'),
    (100, 'Hoàng', 'Văn Tùng', '2004-04-05', 'hoangvantung@gmail.com', '0987654321', 'Số 1000 Trần Hưng Đạo', 'Nam Định', 'Nam Định', '420000', 'Nam');


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

-- Phân lớp và insert vào bảng class_student

-- Lớp 1 (C01)
INSERT INTO class_student (class_id, student_id)
SELECT 'C01', student_id
FROM RankedStudents
WHERE RowNum BETWEEN 1 AND 10;

-- Lớp 2 (C02)
INSERT INTO class_student (class_id, student_id)
SELECT 'C02', student_id
FROM RankedStudents
WHERE RowNum BETWEEN 11 AND 20;

-- Lớp 3 (C03)
INSERT INTO class_student (class_id, student_id)
SELECT 'C03', student_id
FROM RankedStudents
WHERE RowNum BETWEEN 21 AND 30;

-- Lớp 4 (C04)
INSERT INTO class_student (class_id, student_id)
SELECT 'C04', student_id
FROM RankedStudents
WHERE RowNum BETWEEN 31 AND 40;

-- Lớp 5 (C05)
INSERT INTO class_student (class_id, student_id)
SELECT 'C05', student_id
FROM RankedStudents
WHERE RowNum BETWEEN 41 AND 50;

-- Lớp 6 (C06)
INSERT INTO class_student (class_id, student_id)
SELECT 'C06', student_id
FROM RankedStudents
WHERE RowNum BETWEEN 51 AND 60;

-- Lớp 7 (C07)
INSERT INTO class_student (class_id, student_id)
SELECT 'C07', student_id
FROM RankedStudents
WHERE RowNum BETWEEN 61 AND 70;

-- Lớp 8 (C08)
INSERT INTO class_student (class_id, student_id)
SELECT 'C08', student_id
FROM RankedStudents
WHERE RowNum BETWEEN 71 AND 80;

-- Lớp 9 (C09)
INSERT INTO class_student (class_id, student_id)
SELECT 'C09', student_id
FROM RankedStudents
WHERE RowNum BETWEEN 81 AND 90;

-- Lớp 10 (C10)
INSERT INTO class_student (class_id, student_id)
SELECT 'C10', student_id
FROM RankedStudents
WHERE RowNum BETWEEN 91 AND 100;


INSERT INTO payment (id, payment_date, amount, status, student_id) VALUES
(1, '2023-03-01', 5250.00, 'Completed', 5),
(2, '2023-03-02', 5250.00, 'Completed', 12),
(3, '2023-03-03', 5250.00, 'Completed', 23),
(4, '2023-03-04', 5250.00, 'Completed', 34),
(5, '2023-03-05', 5250.00, 'Completed', 45),
(6, '2023-03-06', 5250.00, 'Completed', 56),
(7, '2023-03-07', 5250.00, 'Completed', 67),
(8, '2023-03-08', 5250.00, 'Completed', 78),
(9, '2023-03-09', 5250.00, 'Completed', 85),
(10, '2023-03-10', 5250.00, 'Completed', 3),
(11, '2023-03-11', 5250.00, 'Completed', 14),
(12, '2023-03-12', 5250.00, 'Completed', 25),
(13, '2023-03-13', 5250.00, 'Completed', 36),
(14, '2023-03-14', 5250.00, 'Completed', 47),
(15, '2023-03-15', 5250.00, 'Completed', 58),
(16, '2023-03-16', 5250.00, 'Completed', 69),
(17, '2023-03-17', 5250.00, 'Completed', 80),
(18, '2023-03-18', 5250.00, 'Completed', 1),
(19, '2023-03-19', 5250.00, 'Completed', 13),
(20, '2023-03-20', 5250.00, 'Completed', 24),
(21, '2023-03-21', 5250.00, 'Completed', 35),
(22, '2023-03-22', 5250.00, 'Completed', 46),
(23, '2023-03-23', 5250.00, 'Completed', 57),
(24, '2023-03-24', 5250.00, 'Completed', 68),
(25, '2023-03-25', 5250.00, 'Completed', 79),
(26, '2023-03-26', 5250.00, 'Completed', 2),
(27, '2023-03-27', 5250.00, 'Completed', 15),
(28, '2023-03-28', 5250.00, 'Completed', 26),
(29, '2023-03-29', 5250.00, 'Completed', 37),
(30, '2023-03-30', 5250.00, 'Completed', 48),
(31, '2023-03-31', 5250.00, 'Completed', 59),
(32, '2023-04-01', 5250.00, 'Completed', 70),
(33, '2023-04-02', 5250.00, 'Completed', 81),
(34, '2023-04-03', 5250.00, 'Completed', 4),
(35, '2023-04-04', 5250.00, 'Completed', 16),
(36, '2023-04-05', 5250.00, 'Completed', 27),
(37, '2023-04-06', 5250.00, 'Completed', 38),
(38, '2023-04-07', 5250.00, 'Completed', 49),
(39, '2023-04-08', 5250.00, 'Completed', 60),
(40, '2023-04-09', 5250.00, 'Completed', 71),
(41, '2023-04-10', 5250.00, 'Completed', 82),
(42, '2023-04-11', 5250.00, 'Completed', 6),
(43, '2023-04-12', 5250.00, 'Completed', 17),
(44, '2023-04-13', 5250.00, 'Completed', 28),
(45, '2023-04-14', 5250.00, 'Completed', 39),
(46, '2023-04-15', 5250.00, 'Completed', 50),
(47, '2023-04-16', 5250.00, 'Completed', 61),
(48, '2023-04-17', 5250.00, 'Completed', 72),
(49, '2023-04-18', 5250.00, 'Completed', 83),
(50, '2023-04-19', 5250.00, 'Completed', 7),
(51, '2023-04-20', 5250.00, 'Completed', 18),
(52, '2023-04-21', 5250.00, 'Completed', 29),
(53, '2023-04-22', 5250.00, 'Completed', 40),
(54, '2023-04-23', 5250.00, 'Completed', 51),
(55, '2023-04-24', 5250.00, 'Completed', 62),
(56, '2023-04-25', 5250.00, 'Completed', 73),
(57, '2023-04-26', 5250.00, 'Completed', 84),
(58, '2023-04-27', 5250.00, 'Completed', 8),
(59, '2023-04-28', 5250.00, 'Completed', 19),
(60, '2023-04-29', 5250.00, 'Completed', 30),
(61, '2023-04-30', 5250.00, 'Completed', 41),
(62, '2023-05-01', 5250.00, 'Completed', 52),
(63, '2023-05-02', 5250.00, 'Completed', 63),
(64, '2023-05-03', 5250.00, 'Completed', 74),
(65, '2023-05-04', 5250.00, 'Completed', 9),
(66, '2023-05-05', 5250.00, 'Completed', 20),
(67, '2023-05-06', 5250.00, 'Completed', 31),
(68, '2023-05-07', 5250.00, 'Completed', 42),
(69, '2023-05-08', 5250.00, 'Completed', 53),
(70, '2023-05-09', 5250.00, 'Completed', 64),
(71, '2023-05-10', 5250.00, 'Completed', 75),
(72, '2023-05-11', 5250.00, 'Completed', 10),
(73, '2023-05-12', 5250.00, 'Completed', 21),
(74, '2023-05-13', 5250.00, 'Completed', 32),
(75, '2023-05-14', 5250.00, 'Completed', 43),
(76, '2023-05-15', 5250.00, 'Completed', 54),
(77, '2023-05-16', 5250.00, 'Completed', 65),
(78, '2023-05-17', 5250.00, 'Completed', 76),
(79, '2023-05-18', 5250.00, 'Completed', 11),
(80, '2023-05-19', 5250.00, 'Completed', 22),
(81, '2023-05-20', 5250.00, 'Completed', 33),
(82, '2023-05-21', 5250.00, 'Completed', 44),
(83, '2023-05-22', 5250.00, 'Completed', 55),
(84, '2023-05-23', 5250.00, 'Completed', 66),
(85, '2023-05-25', 5250.00, 'Completed', 92),
(86, '2023-05-25', 5250.00, 'Completed', 85),
(87, '2023-05-25', 5250.00, 'Completed', 96),
(88, '2023-05-25', 5250.00, 'Completed', 88),
(89, '2023-05-25', 5250.00, 'Completed', 100),
(90, '2023-05-25', 5250.00, 'Completed', 89),
(91, '2023-05-26', 5250.00, 'Completed', 97),
(92, '2023-03-26', 5250.00, 'Completed', 86),
(93, '2023-03-27', 5250.00, 'Completed', 99),
(94, '2023-03-27', 5250.00, 'Completed', 91),
(95, '2023-03-27', 5250.00, 'Completed', 87),
(96, '2023-03-28', 5250.00, 'Completed', 95),
(97, '2023-03-28', 5250.00, 'Completed', 93),
(98, '2023-03-28', 5250.00, 'Completed', 98),
(99, '2023-03-29', 5250.00, 'Completed', 90),
(100, '2023-03-29', 5250.00, 'Completed', 94);