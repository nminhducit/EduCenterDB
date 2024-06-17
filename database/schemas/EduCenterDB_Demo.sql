USE EduCenterDB_TEST;

CREATE TABLE course(
    course_id	INT PRIMARY KEY,
    lessons		INT,
    description	VARCHAR(300),
    term		VARCHAR(100),
    level_id	VARCHAR(1)
);

CREATE TABLE course_material(
    material_id	INT PRIMARY KEY,
    material_title	VARCHAR(50),
    material_description	VARCHAR(500),
    material_type	VARCHAR(50),
    material_url	VARCHAR(100),
    date_add		DATE
);

CREATE TABLE student(
    student_id INT PRIMARY KEY,
    first_name	VARCHAR(50),
    last_name	VARCHAR(50),
    date_birth_s	DATE,
    email_s		VARCHAR(50),
    phone_s		VARCHAR(15),
    address_s	VARCHAR(50),
    registration_date	DATE,
    status		VARCHAR(20)
);

CREATE TABLE student_account(
    account_id	INT PRIMARY KEY,
    student_id	INT,
    username	VARCHAR(50),
    password	VARCHAR(50),
    created_date	DATE,
    last_login	TIME,
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE payment(
    payment_id	INT PRIMARY KEY,
    student_id	INT,
    payment_date	DATE,
    amount		MONEY,
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE teacher(
    teacher_id  INT PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    email_t     VARCHAR(50),
    date_birth_t    DATE,
    phone_t     VARCHAR(15),
    address_t   VARCHAR(50)
);

CREATE TABLE teacher_account(
    account_id	INT PRIMARY KEY,
    username    VARCHAR(50),
    password    VARCHAR(50),
    created_date    DATE,
    last_login      VARCHAR(100)
);

CREATE TABLE class(
    class_id    INT PRIMARY KEY,
    name        VARCHAR(50),
    start_date  DATE,
    end_date    DATE,
    teacher_id  INT,
    course_id   INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE exam(
    exam_id		INT PRIMARY KEY,
    account_id  INT,
    exam_name   VARCHAR(50),
    exam_date   DATE,
    score       INT,
    FOREIGN KEY (account_id) REFERENCES student_account(account_id)
);

CREATE TABLE grade(
    grade_id    INT PRIMARY KEY,
    exam_id		INT,
    student_id  INT,
    student_name	VARCHAR(50),
    FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);
