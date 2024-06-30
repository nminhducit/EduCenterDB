
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