CREATE DATABASE EduCenterDB_TEST;

USE EduCenterDB_TEST

CREATE TABLE student (
    id INT PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    date_birth DATE NOT NULL,
    email NVARCHAR(100),
    phone VARCHAR(15),
    street NVARCHAR(100),
    city NVARCHAR(50),
    state NVARCHAR(50),
    zip VARCHAR(10)
);

CREATE TABLE student_account (
    student_id INT PRIMARY KEY
    login VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    balance DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (student_id) REFERENCES student(id)
);


CREATE TABLE teacher (
    id INT PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    date_birth DATE NOT NULL,
    email NVARCHAR(100),
    phone VARCHAR(15),
    street NVARCHAR(100),
    city NVARCHAR(50),
    state NVARCHAR(50),
    zip VARCHAR(10)
);


CREATE TABLE teacher_account (
    teacher_id INT PRIMARY KEY,
    login VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_active  bit,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);


CREATE TABLE language (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE level (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE category (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE course (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
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
    name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
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


CREATE TABLE payment_method (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE payment (
    id INT PRIMARY KEY,
    payment_date DATETIME NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method_id INT,
    status VARCHAR(50) NOT NULL,
    student_id INT,
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (student_id) REFERENCES student(id)
);


CREATE TABLE exam (
    id INT PRIMARY KEY,
    class_id INT,
    date DATE NOT NULL,
    description TEXT,
    FOREIGN KEY (class_id) REFERENCES class(id)
);


CREATE TABLE grade (
    id INT PRIMARY KEY,
    student_id INT,
    exam_id INT,
    value INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (exam_id) REFERENCES exam(id)
);


CREATE TABLE weekday (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE class_weekday (
    id INT PRIMARY KEY,
    class_id INT,
    weekday_id INT,
    hours VARCHAR(20),
    FOREIGN KEY (class_id) REFERENCES class(id),
    FOREIGN KEY (weekday_id) REFERENCES weekday(id)
);


CREATE TABLE course_material (
    id INT PRIMARY KEY,
    course_id INT,
    description TEXT,
    FOREIGN KEY (course_id) REFERENCES course(id)
);
