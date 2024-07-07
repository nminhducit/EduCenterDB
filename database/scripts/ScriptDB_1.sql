--View a list of student scores (D)
	CREATE VIEW StudentGrades AS
	SELECT
		g.id AS grade_id,
		s.id AS student_id,
		CONCAT(s.first_name, ' ', s.last_name) AS student_name,
		e.id AS exam_id,
		e.description AS exam_description, -- Dùng description thay vì name
		g.value AS grade_value
	FROM grade g
	JOIN student s ON g.student_id = s.id
	JOIN exam e ON g.exam_id = e.id;
	GO
	   
--Browse the payment list and print out completed payments (D)
	CREATE VIEW CompletedPayments AS
	SELECT
		id,
		payment_date,
		amount,
		status,
		student_id
	FROM payment
	WHERE status = 'Completed';
	GO

--Browse Student List and Print Out Students Who Don't Have Emails (V)
	-- Declare variables for Cursor
	DECLARE @student_id INT;
	DECLARE @student_name NVARCHAR(100);
	DECLARE @student_email NVARCHAR(100);
	-- Initialize Cursor
	DECLARE student_cursor CURSOR FOR
	SELECT 
		id, 
		last_name + ' ' + first_name as [name], 
		email
	FROM student
	WHERE email IS NULL; 
	-- Open Cursor
	OPEN student_cursor;
	-- Loop through each line of data
		FETCH NEXT FROM student_cursor INTO @student_id, @student_name, @student_email;
	WHILE @@FETCH_STATUS = 0
	BEGIN
	-- Print out student information that does not have an email
		PRINT 'Student ' + @student_name + ' no email yet.';
	-- Get the next line
		FETCH NEXT FROM student_cursor INTO @student_id, @student_name, @student_email;
	END
	-- Close and release the Cursor
	CLOSE student_cursor;
	DEALLOCATE student_cursor;
	GO

--Create a function that returns student information by id. (V)
	CREATE FUNCTION get_student_info(
		@student_id INT
	)
	RETURNS TABLE
	AS
	RETURN
	(
		SELECT *
		FROM student
		WHERE id = @student_id
	)
	GO

--Create a view that displays a list of classes along with teacher names. (B)
	CREATE VIEW ClassWithTeacherName AS
	SELECT 
		c.id AS class_id,
		c.start_date,
		c.end_date,
		CONCAT(t.first_name, ' ', t.last_name) AS teacher_name,
		c.course_id
	FROM 
		class c
	JOIN 
		teacher t ON c.teacher_id = t.id;
	GO

--Create a stored procedure to add a new class schedule to the class. (B)
	CREATE PROCEDURE AddClassSchedule
		@class_id NVARCHAR(20),
		@weekday_id NVARCHAR(20)
	AS
	BEGIN
		-- Check if the class exists
		IF NOT EXISTS (SELECT 1 FROM class WHERE id = @class_id)
		BEGIN
			RAISERROR('The class does not exist.', 16, 1);
			RETURN;
		END
		-- Check if weekday_id is valid
	DECLARE @valid_weekdays TABLE (weekday_id NVARCHAR(20));
		INSERT INTO @valid_weekdays VALUES ('Mon'), ('Tue'), ('Wed'), ('Thu'), ('Fri'), ('Sat'), ('Sun');
		IF NOT EXISTS (SELECT 1 FROM @valid_weekdays WHERE weekday_id = @weekday_id)
		BEGIN
			RAISERROR('Invalid weekday ID.', 16, 1);
			RETURN;
		END
	-- Check to see if the class schedule exists
	IF EXISTS (SELECT 1 FROM class_weekday WHERE class_id = @class_id AND weekday_id = @weekday_id)
		BEGIN
			RAISERROR('A class schedule already exists for this class.', 16, 1);
			RETURN;
		END
	-- Add new class schedule
	INSERT INTO class_weekday (class_id, weekday_id)
		VALUES (@class_id, @weekday_id);
		PRINT 'The class schedule has been successfully added.';
	END;
	GO
	--Call stored procedure
	EXEC AddClassSchedule @class_id = 'C01', @weekday_id = 'Tue';  
	GO

--Create a stored procedure to add a new teacher. (Đ)
	CREATE PROCEDURE AddTeacher (
		@p_first_name VARCHAR(50),
		@p_last_name VARCHAR(50),
		@p_description VARCHAR(100),
		@p_date_birth DATE,
		@p_gender VARCHAR(10),
		@p_email VARCHAR(100),
		@p_phone VARCHAR(15),
		@p_street VARCHAR(100),
		@p_city VARCHAR(50),
		@p_state VARCHAR(10),
		@p_zip VARCHAR(10)
	)
	AS
	BEGIN
		INSERT INTO teacher (
			first_name, last_name, description, date_birth, gender, email, phone, street, city, state, zip
		) VALUES (
			@p_first_name, @p_last_name, @p_description, @p_date_birth, @p_gender, @p_email, @p_phone, @p_street, @p_city, @p_state, @p_zip
		);
	END
	GO

--Create a trigger to check and update account information when there are changes.. (Đ)
	CREATE TRIGGER UpdateTeacherAccount 
	ON teacher
	AFTER UPDATE
	AS
	BEGIN
		DECLARE @teacher_id INT;
		DECLARE @new_email VARCHAR(100);
		DECLARE @new_phone VARCHAR(15);
		DECLARE @old_email VARCHAR(100);
		DECLARE @old_phone VARCHAR(15);
    
		-- Lấy giá trị mới và cũ từ bảng teacher
		SELECT 
			@teacher_id = INSERTED.id,
			@new_email = INSERTED.email,
			@new_phone = INSERTED.phone,
			@old_email = DELETED.email,
			@old_phone = DELETED.phone
		FROM INSERTED
		JOIN DELETED ON INSERTED.id = DELETED.id;

		IF (@new_email != @old_email OR @new_phone != @old_phone)
		BEGIN
			UPDATE teacher_account
			SET username = @new_email
			WHERE teacher_id = @teacher_id;
		END
	END;
	GO

--Create index for description to speed up search. (S)
	CREATE INDEX testcourse   ON dbo.course(description)
	GO

--Create a trigger to update the last change time of the course when there is an update. (S)
	ALTER TABLE course
	ADD last_modified DATETIME;  -- Assuming you want last_modified to be a datetime column
	GO
	CREATE OR ALTER TRIGGER trg_update_last_modified
	ON course_material
	AFTER INSERT, UPDATE, DELETE
	AS
	BEGIN
		DECLARE @course_id INT;

		IF EXISTS (SELECT 1 FROM inserted)
		BEGIN
			SELECT @course_id = course_id FROM inserted;
		END
		ELSE IF EXISTS (SELECT 1 FROM deleted)
		BEGIN
			SELECT @course_id = course_id FROM deleted;
		END

		UPDATE course
		SET last_modified = GETDATE()  -- Assuming last_modified is a datetime column in the course table
		WHERE id = @course_id;
	END;