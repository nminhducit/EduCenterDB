CREATE DATABASE EduCenterDB
GO

USE EduCenterDB
GO

CREATE TABLE category (
    id NVARCHAR(50) PRIMARY KEY,
);

CREATE TABLE level (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);


CREATE TABLE student (
    id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    date_birth DATE,
    email VARCHAR(50),
    phone VARCHAR(15),
    street NVARCHAR(100),
    city NVARCHAR(50),
    state NVARCHAR(50),
    zip VARCHAR(10)
);

CREATE TABLE payment (
    id INT PRIMARY KEY,
    payment_date DATE,
    amount MONEY,
    status VARCHAR(50),
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES student(id)
);

CREATE TABLE teacher (
    id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    description NVARCHAR(100),
    date_birth DATE,
    gender NVARCHAR(20),
    email VARCHAR(50),
    phone VARCHAR(15),
    street NVARCHAR(100),
    city NVARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(50)
);

CREATE TABLE teacher_account (
    teacher_id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    is_active BIT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

CREATE TABLE course (
    id NVARCHAR(50) PRIMARY KEY,
    description NVARCHAR(300),
    level_id INT,
    category_id NVARCHAR(50),
    FOREIGN KEY (category_id) REFERENCES category(id),
	FOREIGN KEY (level_id)	REFERENCES level(id)
);

CREATE TABLE course_material (
    id NVARCHAR(50) PRIMARY KEY,
    course_id NVARCHAR(50),
    description TEXT,
	material_type	NVARCHAR(50),
	material_url		varchar(100),
	date_add			date,
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE class (
    id NVARCHAR(20) PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    teacher_id INT,
    course_id NVARCHAR(50),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);


CREATE TABLE class_student (
    PRIMARY KEY (class_id,student_id),
    class_id NVARCHAR(20),
    student_id INT,
    FOREIGN KEY (class_id) REFERENCES class(id),
    FOREIGN KEY (student_id) REFERENCES student(id)
);

CREATE TABLE student_account (
    student_id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    balance DECIMAL(10,2) DEFAULT 0.00,
	created_date date,
    FOREIGN KEY (student_id) REFERENCES student(id)
);

CREATE TABLE exam (
    id INT PRIMARY KEY,
    date DATE,
    description TEXT,
    class_id NVARCHAR(20),
    FOREIGN KEY (class_id) REFERENCES class(id)
);


CREATE TABLE grade (
    id INT PRIMARY KEY,
    value INT,
    student_id INT,
    exam_id INT,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (exam_id) REFERENCES exam(id)
);

CREATE TABLE class_weekday (
    class_id NVARCHAR(20),
    weekday_id VARCHAR(20),
    FOREIGN KEY (class_id) REFERENCES class(id),
);

