CREATE DATABASE EduCenterDB_TEST
GO

USE EduCenterDB_TEST
GO

CREATE TABLE language (
    id INT PRIMARY KEY,
    name NVARCHAR(50)
);

CREATE TABLE category (
    id INT PRIMARY KEY,
    name NVARCHAR(50)
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
    gender NVARCHAR(20),
    email VARCHAR(50),
    phone VARCHAR(15),
    street NVARCHAR(100),
    city NVARCHAR(50),
    state NVARCHAR(50),
    zip VARCHAR(10)
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

CREATE TABLE course (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    language_id INT,
    level_id INT,
    category_id INT,
    FOREIGN KEY (language_id) REFERENCES language(id),
    FOREIGN KEY (level_id) REFERENCES level(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE class (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    start_date DATE,
    end_date DATE,
    teacher_id INT,
    course_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE class_student (
    id INT PRIMARY KEY,
    class_id INT,
    student_id INT,
    FOREIGN KEY (class_id) REFERENCES class(id),
    FOREIGN KEY (student_id) REFERENCES student(id)
);

CREATE TABLE teacher_account (
    teacher_id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    is_active BIT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

CREATE TABLE course_material (
    id INT PRIMARY KEY,
    course_id INT,
    description TEXT,
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE payment (
    id INT PRIMARY KEY,
    payment_date DATE,
    amount MONEY,
    status VARCHAR(50),
    student_id INT,
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
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES class(id)
);


CREATE TABLE grade (
    id INT PRIMARY KEY,
    value INT,
    student_id INT,
    exam_id INT,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (exam_id) REFERENCES student(id)
);


CREATE TABLE class_weekday (
    id INT PRIMARY KEY,
    class_id INT,
    weekday_id INT,
    hours VARCHAR(20),
    FOREIGN KEY (class_id) REFERENCES class(id),
    FOREIGN KEY (weekday_id) REFERENCES weekday(id)
);

