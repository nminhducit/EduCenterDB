INSERT INTO weekday (id, name) VALUES 
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday'),
(6, 'Saturday'),
(7, 'Sunday');
GO

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
('S001', 'Speaking', 1)
('S002', 'Speaking', 2)
('S003', 'Speaking', 3);

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
('C01', Mon),
('C01', Wed),
('C02', Thu),
('C02', Tue),
('C03', Mon),
('C03', Fri),
('C04', Wed),
('C04', Fri),
('C05', Thu),
('C05', Tue),
('C06', Mon),
('C06', Wed),
('C07', Mon),
('C07', Wed),
('C08', Thu),
('C08', Tue),
('C09', Wed),
('C09', Fri),
('C10', Thu),
('C10', Tue);