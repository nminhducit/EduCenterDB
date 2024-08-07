CREATE DATABASE EduCenterDB
GO
USE [EduCenterDB]
GO
/****** Object:  Table [dbo].[student]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[date_birth] [date] NULL,
	[gender] [nvarchar](20) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](15) NULL,
	[street] [nvarchar](100) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[zip] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[id] [nvarchar](20) NOT NULL,
	[date] [date] NULL,
	[description] [text] NULL,
	[class_id] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade](
	[id] [int] NOT NULL,
	[value] [int] NULL,
	[student_id] [int] NULL,
	[exam_id] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentGrades]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--View a list of student scores (D)
	CREATE VIEW [dbo].[StudentGrades] AS
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
/****** Object:  Table [dbo].[payment]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[id] [int] NOT NULL,
	[payment_date] [date] NULL,
	[amount] [money] NULL,
	[status] [varchar](20) NULL,
	[student_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CompletedPayments]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	   
--Browse the payment list and print out completed payments (D)
	CREATE VIEW [dbo].[CompletedPayments] AS
	SELECT
		id,
		payment_date,
		amount,
		status,
		student_id
	FROM payment
	WHERE status = 'Completed';

GO
/****** Object:  UserDefinedFunction [dbo].[get_student_info]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Create a function that returns student information by id. (V)
	CREATE FUNCTION [dbo].[get_student_info](
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
/****** Object:  Table [dbo].[teacher]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[id] [int] NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
	[date_birth] [date] NULL,
	[gender] [nvarchar](20) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](15) NULL,
	[street] [nvarchar](100) NULL,
	[city] [nvarchar](50) NULL,
	[state] [varchar](50) NULL,
	[zip] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[id] [nvarchar](20) NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[teacher_id] [int] NULL,
	[course_id] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ClassWithTeacherName]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Create a view that displays a list of classes along with teacher names. (B)
	CREATE VIEW [dbo].[ClassWithTeacherName] AS
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
/****** Object:  Table [dbo].[class_student]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class_student](
	[class_id] [nvarchar](20) NOT NULL,
	[student_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[class_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class_weekday]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class_weekday](
	[class_id] [nvarchar](20) NULL,
	[weekday_id] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[id] [nvarchar](50) NOT NULL,
	[description] [nvarchar](300) NULL,
	[level_id] [int] NULL,
	[last_modified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_material]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_material](
	[id] [nvarchar](50) NOT NULL,
	[course_id] [nvarchar](50) NULL,
	[description] [text] NULL,
	[material_type] [nvarchar](50) NULL,
	[material_url] [varchar](100) NULL,
	[date_add] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[level]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[level](
	[id] [int] NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_account]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_account](
	[student_id] [int] NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[balance] [decimal](10, 2) NULL,
	[created_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_account]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_account](
	[teacher_id] [int] NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[class] ([id], [start_date], [end_date], [teacher_id], [course_id]) VALUES (N'C01', CAST(N'2024-07-01' AS Date), CAST(N'2024-12-01' AS Date), 1, N'W001')
INSERT [dbo].[class] ([id], [start_date], [end_date], [teacher_id], [course_id]) VALUES (N'C02', CAST(N'2024-07-02' AS Date), CAST(N'2024-12-02' AS Date), 2, N'W003')
INSERT [dbo].[class] ([id], [start_date], [end_date], [teacher_id], [course_id]) VALUES (N'C03', CAST(N'2024-07-03' AS Date), CAST(N'2024-12-03' AS Date), 3, N'R002')
INSERT [dbo].[class] ([id], [start_date], [end_date], [teacher_id], [course_id]) VALUES (N'C04', CAST(N'2024-07-04' AS Date), CAST(N'2024-12-04' AS Date), 4, N'L003')
INSERT [dbo].[class] ([id], [start_date], [end_date], [teacher_id], [course_id]) VALUES (N'C05', CAST(N'2024-07-05' AS Date), CAST(N'2024-12-05' AS Date), 5, N'R003')
INSERT [dbo].[class] ([id], [start_date], [end_date], [teacher_id], [course_id]) VALUES (N'C06', CAST(N'2024-07-06' AS Date), CAST(N'2024-12-06' AS Date), 6, N'S002')
INSERT [dbo].[class] ([id], [start_date], [end_date], [teacher_id], [course_id]) VALUES (N'C07', CAST(N'2024-07-07' AS Date), CAST(N'2024-12-07' AS Date), 7, N'S001')
INSERT [dbo].[class] ([id], [start_date], [end_date], [teacher_id], [course_id]) VALUES (N'C08', CAST(N'2024-07-08' AS Date), CAST(N'2024-12-08' AS Date), 8, N'W002')
INSERT [dbo].[class] ([id], [start_date], [end_date], [teacher_id], [course_id]) VALUES (N'C09', CAST(N'2024-07-09' AS Date), CAST(N'2024-12-09' AS Date), 9, N'R003')
INSERT [dbo].[class] ([id], [start_date], [end_date], [teacher_id], [course_id]) VALUES (N'C10', CAST(N'2024-07-10' AS Date), CAST(N'2024-12-10' AS Date), 10, N'L001')
GO
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C01', 1)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C01', 2)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C01', 3)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C01', 4)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C01', 5)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C01', 6)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C01', 7)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C01', 8)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C01', 9)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C01', 10)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C02', 11)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C02', 12)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C02', 13)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C02', 14)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C02', 15)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C02', 16)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C02', 17)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C02', 18)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C02', 19)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C02', 20)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C03', 21)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C03', 22)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C03', 23)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C03', 24)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C03', 25)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C03', 26)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C03', 27)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C03', 28)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C03', 29)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C03', 30)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C04', 31)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C04', 32)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C04', 33)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C04', 34)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C04', 35)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C04', 36)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C04', 37)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C04', 38)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C04', 39)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C04', 40)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C05', 41)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C05', 42)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C05', 43)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C05', 44)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C05', 45)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C05', 46)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C05', 47)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C05', 48)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C05', 49)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C05', 50)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C06', 51)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C06', 52)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C06', 53)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C06', 54)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C06', 55)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C06', 56)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C06', 57)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C06', 58)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C06', 59)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C06', 60)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C07', 61)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C07', 62)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C07', 63)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C07', 64)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C07', 65)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C07', 66)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C07', 67)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C07', 68)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C07', 69)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C07', 70)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C08', 71)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C08', 72)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C08', 73)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C08', 74)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C08', 75)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C08', 76)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C08', 77)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C08', 78)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C08', 79)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C08', 80)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C09', 81)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C09', 82)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C09', 83)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C09', 84)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C09', 85)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C09', 86)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C09', 87)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C09', 88)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C09', 89)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C09', 90)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C10', 91)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C10', 92)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C10', 93)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C10', 94)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C10', 95)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C10', 96)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C10', 97)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C10', 98)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C10', 99)
INSERT [dbo].[class_student] ([class_id], [student_id]) VALUES (N'C10', 100)
GO
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C01', N'Mon')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C01', N'Wed')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C02', N'Thu')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C02', N'Tue')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C03', N'Mon')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C03', N'Fri')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C04', N'Wed')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C04', N'Fri')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C05', N'Thu')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C05', N'Tue')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C06', N'Mon')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C06', N'Wed')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C07', N'Mon')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C07', N'Wed')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C08', N'Thu')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C08', N'Tue')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C09', N'Wed')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C09', N'Fri')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C10', N'Thu')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C10', N'Tue')
INSERT [dbo].[class_weekday] ([class_id], [weekday_id]) VALUES (N'C01', N'Tue')
GO
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'L001', N'Listening', 1, NULL)
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'L002', N'Listening', 2, NULL)
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'L003', N'Listening', 3, NULL)
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'R001', N'Reading', 1, NULL)
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'R002', N'Reading', 2, NULL)
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'R003', N'Reading', 3, NULL)
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'S001', N'Speaking', 1, NULL)
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'S002', N'Speaking', 2, NULL)
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'S003', N'Speaking', 3, NULL)
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'W001', N'Writing', 1, NULL)
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'W002', N'Writing', 2, NULL)
INSERT [dbo].[course] ([id], [description], [level_id], [last_modified]) VALUES (N'W003', N'Writing', 3, NULL)
GO
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'1', N'W001', N'The Essential Guide to Writing: Exercises for Beginners', N'Exercises', N'http://educenterdb.com/writing/essential-guide-exercises-beginners', CAST(N'2024-01-01' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'10', N'R001', N'Reading Fundamentals: Exercises to Improve Basic Skills', N'Exercises', N'http://educenterdb.com/reading/fundamentals-exercises-basic', CAST(N'2024-01-04' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'11', N'R001', N'Introduction to Reading: Foundational Textbook for Beginners', N'Textbook', N'http://educenterdb.com/reading/introduction-textbook-beginners', CAST(N'2024-01-04' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'12', N'R001', N'Understanding Narratives: A Beginner’s Reference Book', N'Reference', N'http://educenterdb.com/reading/understanding-narratives-reference', CAST(N'2024-01-04' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'13', N'R002', N'Intermediate Reading Practice: Exercises for Skill Enhancement', N'Exercises', N'http://educenterdb.com/reading/intermediate-practice-exercises', CAST(N'2024-01-05' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'14', N'R002', N'Exploring Literature: An Intermediate Textbook for Readers', N'Textbook', N'http://educenterdb.com/reading/exploring-literature-textbook', CAST(N'2024-01-05' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'15', N'R002', N'Critical Reading Skills: A Reference for Intermediate Learners', N'Reference', N'http://educenterdb.com/reading/critical-skills-reference', CAST(N'2024-01-05' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'16', N'R003', N'Advanced Reading Comprehension: Exercises for Proficient Readers', N'Exercises', N'http://educenterdb.com/reading/advanced-comprehension-exercises', CAST(N'2024-01-06' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'17', N'R003', N'Analyzing Texts: A Comprehensive Textbook for Advanced Readers', N'Textbook', N'http://educenterdb.com/reading/analyzing-texts-textbook', CAST(N'2024-01-06' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'18', N'R003', N'Interpreting Complex Narratives: An Advanced Reference Guide', N'Reference', N'http://educenterdb.com/reading/complex-narratives-reference', CAST(N'2024-01-06' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'19', N'L001', N'Listening Skills Development: Basic Exercises for Beginners', N'Exercises', N'http://educenterdb.com/listening/skills-development-exercises', CAST(N'2024-01-07' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'2', N'W001', N'Fundamentals of Writing: Comprehensive Textbook for Level 1', N'Textbook', N'http://educenterdb.com/writing/fundamentals-textbook-level1', CAST(N'2024-01-01' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'20', N'L001', N'Listening Essentials: A Textbook for Foundational Learning', N'Textbook', N'http://educenterdb.com/listening/essentials-textbook', CAST(N'2024-01-07' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'21', N'L001', N'Effective Listening Strategies: A Reference for Beginners', N'Reference', N'http://educenterdb.com/listening/effective-strategies-reference', CAST(N'2024-01-07' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'22', N'L002', N'Enhancing Listening Skills: Exercises for Intermediate Students', N'Exercises', N'http://educenterdb.com/listening/enhancing-skills-exercises', CAST(N'2024-01-08' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'23', N'L002', N'Listening in Context: An Intermediate Textbook for Skill Building', N'Textbook', N'http://educenterdb.com/listening/in-context-textbook', CAST(N'2024-01-08' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'24', N'L002', N'Advanced Listening Techniques: A Reference for Intermediate Learners', N'Reference', N'http://educenterdb.com/listening/advanced-techniques-reference', CAST(N'2024-01-08' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'25', N'L003', N'Proficient Listening Practice: Advanced Exercises for High-level Learners', N'Exercises', N'http://educenterdb.com/listening/proficient-practice-exercises', CAST(N'2024-01-09' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'26', N'L003', N'Mastering Listening Skills: Comprehensive Textbook for Advanced Students', N'Textbook', N'http://educenterdb.com/listening/mastering-skills-textbook', CAST(N'2024-01-09' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'27', N'L003', N'Strategies for Complex Auditory Processing: An Advanced Reference Guide', N'Reference', N'http://educenterdb.com/listening/complex-processing-reference', CAST(N'2024-01-09' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'28', N'S001', N'Basic Speaking Skills: Exercises for Novice Speakers', N'Exercises', N'http://educenterdb.com/speaking/basic-skills-exercises', CAST(N'2024-01-10' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'29', N'S001', N'Introduction to Speaking: A Textbook for Beginners', N'Textbook', N'http://educenterdb.com/speaking/introduction-textbook', CAST(N'2024-01-10' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'3', N'W001', N'Mastering Grammar and Style: A Reference for Novice Writers', N'Reference', N'http://educenterdb.com/writing/mastering-grammar-style-reference', CAST(N'2024-01-01' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'30', N'S001', N'Effective Speaking Strategies: A Reference for New Learners', N'Reference', N'http://educenterdb.com/speaking/effective-strategies-reference', CAST(N'2024-01-10' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'31', N'S002', N'Intermediate Speaking Practice: Skill-building Exercises', N'Exercises', N'http://educenterdb.com/speaking/intermediate-practice-exercises', CAST(N'2024-01-11' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'32', N'S002', N'Communicative Speaking: An Intermediate Textbook', N'Textbook', N'http://educenterdb.com/speaking/communicative-textbook', CAST(N'2024-01-11' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'33', N'S002', N'Advanced Communication Techniques: A Reference for Intermediate Speakers', N'Reference', N'http://educenterdb.com/speaking/communication-techniques-reference', CAST(N'2024-01-11' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'34', N'S003', N'Fluency in Speaking: Advanced Exercises for Proficient Communicators', N'Exercises', N'http://educenterdb.com/speaking/fluency-exercises', CAST(N'2024-01-12' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'35', N'S003', N'Mastering Public Speaking: A Comprehensive Textbook for Advanced Levels', N'Textbook', N'http://educenterdb.com/speaking/public-speaking-textbook', CAST(N'2024-01-12' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'36', N'S003', N'Oratory Excellence: An Advanced Reference for Skilled Speakers', N'Reference', N'http://educenterdb.com/speaking/oratory-excellence-reference', CAST(N'2024-01-12' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'4', N'W002', N'Advanced Writing Techniques: Exercises for Intermediate Learners', N'Exercises', N'http://educenterdb.com/writing/advanced-techniques-exercises-intermediate', CAST(N'2024-01-02' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'5', N'W002', N'Writing with Precision: A Detailed Textbook for Level 2', N'Textbook', N'http://educenterdb.com/writing/precision-textbook-level2', CAST(N'2024-01-02' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'6', N'W002', N'Crafting Effective Arguments: A Reference for Intermediate Writers', N'Reference', N'http://educenterdb.com/writing/effective-arguments-reference', CAST(N'2024-01-02' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'7', N'W003', N'Mastery in Writing: Challenging Exercises for Advanced Students', N'Exercises', N'http://educenterdb.com/writing/mastery-exercises-advanced', CAST(N'2024-01-03' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'8', N'W003', N'The Writer’s Handbook: Comprehensive Textbook for Level 3', N'Textbook', N'http://educenterdb.com/writing/handbook-textbook-level3', CAST(N'2024-01-03' AS Date))
INSERT [dbo].[course_material] ([id], [course_id], [description], [material_type], [material_url], [date_add]) VALUES (N'9', N'W003', N'Writing Across Genres: An Advanced Reference Guide', N'Reference', N'http://educenterdb.com/writing/genres-reference-guide', CAST(N'2024-01-03' AS Date))
GO
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'1', CAST(N'2024-07-30' AS Date), N'Quiz 1', N'C01')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'10', CAST(N'2024-11-30' AS Date), N'Final Exam', N'C02')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'11', CAST(N'2024-07-30' AS Date), N'Quiz 1', N'C03')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'12', CAST(N'2024-08-30' AS Date), N'Quiz 2', N'C03')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'13', CAST(N'2024-09-30' AS Date), N'Midterm Exam', N'C03')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'14', CAST(N'2024-10-30' AS Date), N'Quiz 3', N'C03')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'15', CAST(N'2024-11-30' AS Date), N'Final Exam', N'C03')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'16', CAST(N'2024-07-30' AS Date), N'Quiz 1', N'C04')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'17', CAST(N'2024-08-30' AS Date), N'Quiz 2', N'C04')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'18', CAST(N'2024-09-30' AS Date), N'Midterm Exam', N'C04')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'19', CAST(N'2024-10-30' AS Date), N'Quiz 3', N'C04')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'2', CAST(N'2024-08-30' AS Date), N'Quiz 2', N'C01')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'20', CAST(N'2024-11-30' AS Date), N'Final Exam', N'C04')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'21', CAST(N'2024-07-30' AS Date), N'Quiz 1', N'C05')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'22', CAST(N'2024-08-30' AS Date), N'Quiz 2', N'C05')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'23', CAST(N'2024-09-30' AS Date), N'Midterm Exam', N'C05')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'24', CAST(N'2024-10-30' AS Date), N'Quiz 3', N'C05')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'25', CAST(N'2024-11-30' AS Date), N'Final Exam', N'C05')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'26', CAST(N'2024-07-30' AS Date), N'Quiz 1', N'C06')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'27', CAST(N'2024-08-30' AS Date), N'Quiz 2', N'C06')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'28', CAST(N'2024-09-30' AS Date), N'Midterm Exam', N'C06')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'29', CAST(N'2024-10-30' AS Date), N'Quiz 3', N'C06')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'3', CAST(N'2024-09-30' AS Date), N'Midterm Exam', N'C01')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'30', CAST(N'2024-11-30' AS Date), N'Final Exam', N'C06')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'31', CAST(N'2024-07-30' AS Date), N'Quiz 1', N'C07')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'32', CAST(N'2024-08-30' AS Date), N'Quiz 2', N'C07')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'33', CAST(N'2024-09-30' AS Date), N'Midterm Exam', N'C07')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'34', CAST(N'2024-10-30' AS Date), N'Quiz 3', N'C07')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'35', CAST(N'2024-11-30' AS Date), N'Final Exam', N'C07')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'36', CAST(N'2024-07-30' AS Date), N'Quiz 1', N'C08')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'37', CAST(N'2024-08-30' AS Date), N'Quiz 2', N'C08')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'38', CAST(N'2024-09-30' AS Date), N'Midterm Exam', N'C08')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'39', CAST(N'2024-10-30' AS Date), N'Quiz 3', N'C08')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'4', CAST(N'2024-10-30' AS Date), N'Quiz 3', N'C01')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'40', CAST(N'2024-11-30' AS Date), N'Final Exam', N'C08')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'41', CAST(N'2024-07-30' AS Date), N'Quiz 1', N'C09')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'42', CAST(N'2024-08-30' AS Date), N'Quiz 2', N'C09')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'43', CAST(N'2024-09-30' AS Date), N'Midterm Exam', N'C09')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'44', CAST(N'2024-10-30' AS Date), N'Quiz 3', N'C09')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'45', CAST(N'2024-11-30' AS Date), N'Final Exam', N'C09')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'46', CAST(N'2024-07-30' AS Date), N'Quiz 1', N'C10')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'47', CAST(N'2024-08-30' AS Date), N'Quiz 2', N'C10')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'48', CAST(N'2024-09-30' AS Date), N'Midterm Exam', N'C10')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'49', CAST(N'2024-10-30' AS Date), N'Quiz 3', N'C10')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'5', CAST(N'2024-11-30' AS Date), N'Final Exam', N'C01')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'50', CAST(N'2024-11-30' AS Date), N'Final Exam', N'C10')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'6', CAST(N'2024-07-30' AS Date), N'Quiz 1', N'C02')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'7', CAST(N'2024-08-30' AS Date), N'Quiz 2', N'C02')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'8', CAST(N'2024-09-30' AS Date), N'Midterm Exam', N'C02')
INSERT [dbo].[exam] ([id], [date], [description], [class_id]) VALUES (N'9', CAST(N'2024-10-30' AS Date), N'Quiz 3', N'C02')
GO
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (1, 60, 1, N'1')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (2, 93, 1, N'2')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (3, 3, 1, N'3')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (4, 7, 1, N'4')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (5, 29, 1, N'5')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (6, 0, 2, N'1')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (7, 28, 2, N'2')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (8, 81, 2, N'3')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (9, 42, 2, N'4')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (10, 87, 2, N'5')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (11, 52, 3, N'1')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (12, 54, 3, N'2')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (13, 82, 3, N'3')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (14, 12, 3, N'4')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (15, 54, 3, N'5')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (16, 6, 4, N'1')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (17, 87, 4, N'2')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (18, 14, 4, N'3')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (19, 97, 4, N'4')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (20, 22, 4, N'5')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (21, 57, 5, N'1')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (22, 81, 5, N'2')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (23, 30, 5, N'3')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (24, 92, 5, N'4')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (25, 4, 5, N'5')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (26, 83, 6, N'1')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (27, 66, 6, N'2')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (28, 7, 6, N'3')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (29, 46, 6, N'4')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (30, 93, 6, N'5')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (31, 70, 7, N'1')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (32, 61, 7, N'2')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (33, 46, 7, N'3')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (34, 31, 7, N'4')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (35, 40, 7, N'5')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (36, 93, 8, N'1')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (37, 28, 8, N'2')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (38, 99, 8, N'3')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (39, 36, 8, N'4')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (40, 43, 8, N'5')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (41, 100, 9, N'1')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (42, 29, 9, N'2')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (43, 56, 9, N'3')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (44, 95, 9, N'4')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (45, 28, 9, N'5')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (46, 47, 10, N'1')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (47, 14, 10, N'2')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (48, 24, 10, N'3')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (49, 32, 10, N'4')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (50, 76, 10, N'5')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (51, 39, 11, N'10')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (52, 8, 11, N'6')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (53, 25, 11, N'7')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (54, 29, 11, N'8')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (55, 19, 11, N'9')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (56, 94, 12, N'10')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (57, 88, 12, N'6')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (58, 63, 12, N'7')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (59, 99, 12, N'8')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (60, 76, 12, N'9')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (61, 88, 13, N'10')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (62, 17, 13, N'6')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (63, 23, 13, N'7')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (64, 48, 13, N'8')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (65, 24, 13, N'9')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (66, 81, 14, N'10')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (67, 89, 14, N'6')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (68, 29, 14, N'7')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (69, 19, 14, N'8')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (70, 35, 14, N'9')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (71, 25, 15, N'10')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (72, 55, 15, N'6')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (73, 69, 15, N'7')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (74, 91, 15, N'8')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (75, 13, 15, N'9')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (76, 57, 16, N'10')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (77, 74, 16, N'6')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (78, 49, 16, N'7')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (79, 96, 16, N'8')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (80, 39, 16, N'9')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (81, 56, 17, N'10')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (82, 43, 17, N'6')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (83, 46, 17, N'7')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (84, 73, 17, N'8')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (85, 38, 17, N'9')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (86, 46, 18, N'10')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (87, 20, 18, N'6')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (88, 65, 18, N'7')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (89, 14, 18, N'8')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (90, 100, 18, N'9')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (91, 17, 19, N'10')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (92, 20, 19, N'6')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (93, 31, 19, N'7')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (94, 91, 19, N'8')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (95, 30, 19, N'9')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (96, 19, 20, N'10')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (97, 79, 20, N'6')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (98, 77, 20, N'7')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (99, 36, 20, N'8')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (100, 85, 20, N'9')
GO
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (101, 89, 21, N'11')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (102, 26, 21, N'12')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (103, 99, 21, N'13')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (104, 37, 21, N'14')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (105, 72, 21, N'15')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (106, 24, 22, N'11')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (107, 11, 22, N'12')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (108, 54, 22, N'13')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (109, 71, 22, N'14')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (110, 46, 22, N'15')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (111, 31, 23, N'11')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (112, 95, 23, N'12')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (113, 90, 23, N'13')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (114, 91, 23, N'14')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (115, 84, 23, N'15')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (116, 89, 24, N'11')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (117, 31, 24, N'12')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (118, 58, 24, N'13')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (119, 88, 24, N'14')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (120, 99, 24, N'15')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (121, 58, 25, N'11')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (122, 25, 25, N'12')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (123, 45, 25, N'13')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (124, 5, 25, N'14')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (125, 30, 25, N'15')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (126, 90, 26, N'11')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (127, 34, 26, N'12')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (128, 9, 26, N'13')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (129, 0, 26, N'14')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (130, 96, 26, N'15')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (131, 27, 27, N'11')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (132, 93, 27, N'12')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (133, 32, 27, N'13')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (134, 49, 27, N'14')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (135, 34, 27, N'15')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (136, 21, 28, N'11')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (137, 6, 28, N'12')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (138, 75, 28, N'13')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (139, 32, 28, N'14')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (140, 96, 28, N'15')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (141, 21, 29, N'11')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (142, 22, 29, N'12')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (143, 59, 29, N'13')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (144, 56, 29, N'14')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (145, 67, 29, N'15')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (146, 14, 30, N'11')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (147, 54, 30, N'12')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (148, 98, 30, N'13')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (149, 18, 30, N'14')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (150, 84, 30, N'15')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (151, 86, 31, N'16')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (152, 22, 31, N'17')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (153, 91, 31, N'18')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (154, 38, 31, N'19')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (155, 2, 31, N'20')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (156, 19, 32, N'16')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (157, 88, 32, N'17')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (158, 43, 32, N'18')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (159, 70, 32, N'19')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (160, 93, 32, N'20')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (161, 23, 33, N'16')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (162, 98, 33, N'17')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (163, 19, 33, N'18')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (164, 96, 33, N'19')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (165, 71, 33, N'20')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (166, 62, 34, N'16')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (167, 57, 34, N'17')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (168, 70, 34, N'18')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (169, 57, 34, N'19')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (170, 86, 34, N'20')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (171, 70, 35, N'16')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (172, 34, 35, N'17')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (173, 71, 35, N'18')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (174, 59, 35, N'19')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (175, 98, 35, N'20')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (176, 28, 36, N'16')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (177, 60, 36, N'17')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (178, 27, 36, N'18')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (179, 58, 36, N'19')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (180, 66, 36, N'20')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (181, 62, 37, N'16')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (182, 40, 37, N'17')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (183, 19, 37, N'18')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (184, 98, 37, N'19')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (185, 65, 37, N'20')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (186, 35, 38, N'16')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (187, 71, 38, N'17')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (188, 71, 38, N'18')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (189, 23, 38, N'19')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (190, 65, 38, N'20')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (191, 35, 39, N'16')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (192, 51, 39, N'17')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (193, 86, 39, N'18')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (194, 3, 39, N'19')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (195, 58, 39, N'20')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (196, 32, 40, N'16')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (197, 43, 40, N'17')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (198, 19, 40, N'18')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (199, 55, 40, N'19')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (200, 60, 40, N'20')
GO
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (201, 39, 41, N'21')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (202, 84, 41, N'22')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (203, 11, 41, N'23')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (204, 26, 41, N'24')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (205, 71, 41, N'25')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (206, 93, 42, N'21')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (207, 45, 42, N'22')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (208, 46, 42, N'23')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (209, 83, 42, N'24')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (210, 24, 42, N'25')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (211, 71, 43, N'21')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (212, 7, 43, N'22')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (213, 10, 43, N'23')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (214, 36, 43, N'24')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (215, 13, 43, N'25')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (216, 29, 44, N'21')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (217, 67, 44, N'22')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (218, 100, 44, N'23')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (219, 19, 44, N'24')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (220, 2, 44, N'25')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (221, 63, 45, N'21')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (222, 31, 45, N'22')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (223, 63, 45, N'23')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (224, 60, 45, N'24')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (225, 97, 45, N'25')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (226, 45, 46, N'21')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (227, 51, 46, N'22')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (228, 82, 46, N'23')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (229, 54, 46, N'24')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (230, 76, 46, N'25')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (231, 51, 47, N'21')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (232, 46, 47, N'22')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (233, 9, 47, N'23')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (234, 74, 47, N'24')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (235, 12, 47, N'25')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (236, 42, 48, N'21')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (237, 23, 48, N'22')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (238, 18, 48, N'23')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (239, 16, 48, N'24')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (240, 28, 48, N'25')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (241, 10, 49, N'21')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (242, 24, 49, N'22')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (243, 22, 49, N'23')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (244, 81, 49, N'24')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (245, 58, 49, N'25')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (246, 0, 50, N'21')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (247, 42, 50, N'22')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (248, 26, 50, N'23')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (249, 32, 50, N'24')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (250, 61, 50, N'25')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (251, 90, 51, N'26')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (252, 11, 51, N'27')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (253, 9, 51, N'28')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (254, 83, 51, N'29')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (255, 14, 51, N'30')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (256, 40, 52, N'26')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (257, 92, 52, N'27')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (258, 78, 52, N'28')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (259, 98, 52, N'29')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (260, 35, 52, N'30')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (261, 86, 53, N'26')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (262, 46, 53, N'27')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (263, 57, 53, N'28')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (264, 16, 53, N'29')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (265, 91, 53, N'30')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (266, 16, 54, N'26')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (267, 63, 54, N'27')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (268, 72, 54, N'28')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (269, 92, 54, N'29')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (270, 75, 54, N'30')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (271, 7, 55, N'26')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (272, 86, 55, N'27')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (273, 79, 55, N'28')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (274, 36, 55, N'29')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (275, 39, 55, N'30')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (276, 47, 56, N'26')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (277, 46, 56, N'27')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (278, 63, 56, N'28')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (279, 38, 56, N'29')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (280, 62, 56, N'30')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (281, 60, 57, N'26')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (282, 80, 57, N'27')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (283, 19, 57, N'28')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (284, 97, 57, N'29')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (285, 86, 57, N'30')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (286, 3, 58, N'26')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (287, 90, 58, N'27')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (288, 73, 58, N'28')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (289, 24, 58, N'29')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (290, 37, 58, N'30')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (291, 4, 59, N'26')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (292, 77, 59, N'27')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (293, 25, 59, N'28')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (294, 91, 59, N'29')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (295, 87, 59, N'30')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (296, 75, 60, N'26')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (297, 53, 60, N'27')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (298, 7, 60, N'28')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (299, 79, 60, N'29')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (300, 46, 60, N'30')
GO
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (301, 18, 61, N'31')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (302, 50, 61, N'32')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (303, 28, 61, N'33')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (304, 99, 61, N'34')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (305, 44, 61, N'35')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (306, 35, 62, N'31')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (307, 9, 62, N'32')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (308, 88, 62, N'33')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (309, 10, 62, N'34')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (310, 28, 62, N'35')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (311, 46, 63, N'31')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (312, 100, 63, N'32')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (313, 83, 63, N'33')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (314, 15, 63, N'34')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (315, 86, 63, N'35')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (316, 60, 64, N'31')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (317, 0, 64, N'32')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (318, 82, 64, N'33')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (319, 3, 64, N'34')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (320, 78, 64, N'35')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (321, 39, 65, N'31')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (322, 82, 65, N'32')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (323, 96, 65, N'33')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (324, 52, 65, N'34')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (325, 51, 65, N'35')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (326, 59, 66, N'31')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (327, 49, 66, N'32')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (328, 39, 66, N'33')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (329, 33, 66, N'34')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (330, 95, 66, N'35')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (331, 64, 67, N'31')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (332, 34, 67, N'32')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (333, 16, 67, N'33')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (334, 43, 67, N'34')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (335, 44, 67, N'35')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (336, 77, 68, N'31')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (337, 9, 68, N'32')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (338, 30, 68, N'33')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (339, 94, 68, N'34')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (340, 4, 68, N'35')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (341, 38, 69, N'31')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (342, 21, 69, N'32')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (343, 15, 69, N'33')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (344, 39, 69, N'34')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (345, 56, 69, N'35')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (346, 73, 70, N'31')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (347, 3, 70, N'32')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (348, 48, 70, N'33')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (349, 90, 70, N'34')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (350, 46, 70, N'35')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (351, 86, 71, N'36')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (352, 28, 71, N'37')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (353, 43, 71, N'38')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (354, 50, 71, N'39')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (355, 13, 71, N'40')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (356, 37, 72, N'36')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (357, 49, 72, N'37')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (358, 17, 72, N'38')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (359, 38, 72, N'39')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (360, 54, 72, N'40')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (361, 47, 73, N'36')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (362, 9, 73, N'37')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (363, 22, 73, N'38')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (364, 98, 73, N'39')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (365, 79, 73, N'40')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (366, 93, 74, N'36')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (367, 69, 74, N'37')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (368, 61, 74, N'38')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (369, 48, 74, N'39')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (370, 2, 74, N'40')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (371, 65, 75, N'36')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (372, 89, 75, N'37')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (373, 80, 75, N'38')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (374, 30, 75, N'39')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (375, 72, 75, N'40')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (376, 81, 76, N'36')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (377, 83, 76, N'37')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (378, 73, 76, N'38')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (379, 9, 76, N'39')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (380, 98, 76, N'40')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (381, 94, 77, N'36')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (382, 95, 77, N'37')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (383, 52, 77, N'38')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (384, 36, 77, N'39')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (385, 97, 77, N'40')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (386, 2, 78, N'36')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (387, 9, 78, N'37')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (388, 41, 78, N'38')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (389, 53, 78, N'39')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (390, 97, 78, N'40')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (391, 41, 79, N'36')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (392, 77, 79, N'37')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (393, 41, 79, N'38')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (394, 3, 79, N'39')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (395, 36, 79, N'40')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (396, 13, 80, N'36')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (397, 29, 80, N'37')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (398, 10, 80, N'38')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (399, 5, 80, N'39')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (400, 33, 80, N'40')
GO
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (401, 20, 81, N'41')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (402, 78, 81, N'42')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (403, 78, 81, N'43')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (404, 66, 81, N'44')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (405, 14, 81, N'45')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (406, 17, 82, N'41')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (407, 92, 82, N'42')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (408, 86, 82, N'43')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (409, 35, 82, N'44')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (410, 47, 82, N'45')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (411, 72, 83, N'41')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (412, 74, 83, N'42')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (413, 66, 83, N'43')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (414, 12, 83, N'44')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (415, 80, 83, N'45')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (416, 36, 84, N'41')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (417, 49, 84, N'42')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (418, 62, 84, N'43')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (419, 15, 84, N'44')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (420, 63, 84, N'45')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (421, 53, 85, N'41')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (422, 91, 85, N'42')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (423, 77, 85, N'43')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (424, 13, 85, N'44')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (425, 37, 85, N'45')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (426, 62, 86, N'41')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (427, 58, 86, N'42')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (428, 30, 86, N'43')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (429, 90, 86, N'44')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (430, 51, 86, N'45')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (431, 57, 87, N'41')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (432, 35, 87, N'42')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (433, 5, 87, N'43')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (434, 95, 87, N'44')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (435, 87, 87, N'45')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (436, 18, 88, N'41')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (437, 53, 88, N'42')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (438, 64, 88, N'43')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (439, 5, 88, N'44')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (440, 6, 88, N'45')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (441, 46, 89, N'41')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (442, 60, 89, N'42')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (443, 50, 89, N'43')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (444, 29, 89, N'44')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (445, 21, 89, N'45')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (446, 71, 90, N'41')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (447, 65, 90, N'42')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (448, 95, 90, N'43')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (449, 91, 90, N'44')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (450, 17, 90, N'45')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (451, 88, 91, N'46')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (452, 93, 91, N'47')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (453, 84, 91, N'48')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (454, 62, 91, N'49')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (455, 42, 91, N'50')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (456, 79, 92, N'46')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (457, 38, 92, N'47')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (458, 36, 92, N'48')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (459, 84, 92, N'49')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (460, 9, 92, N'50')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (461, 39, 93, N'46')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (462, 30, 93, N'47')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (463, 95, 93, N'48')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (464, 25, 93, N'49')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (465, 38, 93, N'50')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (466, 25, 94, N'46')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (467, 72, 94, N'47')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (468, 71, 94, N'48')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (469, 44, 94, N'49')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (470, 27, 94, N'50')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (471, 85, 95, N'46')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (472, 7, 95, N'47')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (473, 29, 95, N'48')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (474, 29, 95, N'49')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (475, 66, 95, N'50')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (476, 62, 96, N'46')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (477, 93, 96, N'47')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (478, 87, 96, N'48')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (479, 74, 96, N'49')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (480, 95, 96, N'50')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (481, 48, 97, N'46')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (482, 35, 97, N'47')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (483, 73, 97, N'48')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (484, 0, 97, N'49')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (485, 60, 97, N'50')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (486, 23, 98, N'46')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (487, 89, 98, N'47')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (488, 76, 98, N'48')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (489, 56, 98, N'49')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (490, 96, 98, N'50')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (491, 72, 99, N'46')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (492, 95, 99, N'47')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (493, 39, 99, N'48')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (494, 69, 99, N'49')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (495, 66, 99, N'50')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (496, 51, 100, N'46')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (497, 76, 100, N'47')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (498, 3, 100, N'48')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (499, 43, 100, N'49')
INSERT [dbo].[grade] ([id], [value], [student_id], [exam_id]) VALUES (500, 100, 100, N'50')
GO
INSERT [dbo].[level] ([id], [name]) VALUES (1, N'0-450')
INSERT [dbo].[level] ([id], [name]) VALUES (2, N'450-600')
INSERT [dbo].[level] ([id], [name]) VALUES (3, N'600-750')
GO
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (1, CAST(N'2024-05-01' AS Date), 5250.0000, N'Completed', 35)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (2, CAST(N'2024-05-01' AS Date), 5250.0000, N'Completed', 42)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (3, CAST(N'2024-05-01' AS Date), 5250.0000, N'Completed', 13)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (4, CAST(N'2024-05-02' AS Date), 5250.0000, N'Completed', 14)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (5, CAST(N'2024-05-02' AS Date), 5250.0000, N'Completed', 10)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (6, CAST(N'2024-05-02' AS Date), 5250.0000, N'Completed', 44)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (7, CAST(N'2024-05-03' AS Date), 5250.0000, N'Completed', 11)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (8, CAST(N'2024-05-03' AS Date), 5250.0000, N'Completed', 8)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (9, CAST(N'2024-05-03' AS Date), 5250.0000, N'Completed', 39)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (10, CAST(N'2024-05-04' AS Date), 5250.0000, N'Completed', 26)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (11, CAST(N'2024-05-04' AS Date), 5250.0000, N'Completed', 22)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (12, CAST(N'2024-05-04' AS Date), 5250.0000, N'Completed', 47)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (13, CAST(N'2024-05-05' AS Date), 5250.0000, N'Completed', 49)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (14, CAST(N'2024-05-05' AS Date), 5250.0000, N'Completed', 48)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (15, CAST(N'2024-05-05' AS Date), 5250.0000, N'Completed', 41)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (16, CAST(N'2024-05-06' AS Date), 5250.0000, N'Completed', 27)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (17, CAST(N'2024-05-06' AS Date), 5250.0000, N'Completed', 37)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (18, CAST(N'2024-05-06' AS Date), 5250.0000, N'Completed', 24)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (19, CAST(N'2024-05-07' AS Date), 5250.0000, N'Completed', 25)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (20, CAST(N'2024-05-07' AS Date), 5250.0000, N'Completed', 16)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (21, CAST(N'2024-05-07' AS Date), 5250.0000, N'Completed', 28)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (22, CAST(N'2024-05-08' AS Date), 5250.0000, N'Completed', 9)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (23, CAST(N'2024-05-08' AS Date), 5250.0000, N'Completed', 50)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (24, CAST(N'2024-05-08' AS Date), 5250.0000, N'Completed', 40)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (25, CAST(N'2024-05-09' AS Date), 5250.0000, N'Completed', 31)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (26, CAST(N'2024-05-09' AS Date), 5250.0000, N'Completed', 38)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (27, CAST(N'2024-05-09' AS Date), 5250.0000, N'Completed', 33)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (28, CAST(N'2024-05-10' AS Date), 5250.0000, N'Completed', 17)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (29, CAST(N'2024-05-10' AS Date), 5250.0000, N'Completed', 46)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (30, CAST(N'2024-05-10' AS Date), 5250.0000, N'Completed', 15)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (31, CAST(N'2024-05-11' AS Date), 5250.0000, N'Completed', 4)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (32, CAST(N'2024-05-11' AS Date), 5250.0000, N'Completed', 6)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (33, CAST(N'2024-05-11' AS Date), 5250.0000, N'Completed', 5)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (34, CAST(N'2024-05-12' AS Date), 5250.0000, N'Completed', 23)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (35, CAST(N'2024-05-12' AS Date), 5250.0000, N'Completed', 3)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (36, CAST(N'2024-05-12' AS Date), 5250.0000, N'Completed', 32)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (37, CAST(N'2024-05-13' AS Date), 5250.0000, N'Completed', 1)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (38, CAST(N'2024-05-13' AS Date), 5250.0000, N'Completed', 29)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (39, CAST(N'2024-05-13' AS Date), 5250.0000, N'Completed', 7)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (40, CAST(N'2024-05-14' AS Date), 5250.0000, N'Completed', 12)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (41, CAST(N'2024-05-14' AS Date), 5250.0000, N'Completed', 45)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (42, CAST(N'2024-05-14' AS Date), 5250.0000, N'Completed', 36)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (43, CAST(N'2024-05-15' AS Date), 5250.0000, N'Completed', 18)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (44, CAST(N'2024-05-15' AS Date), 5250.0000, N'Completed', 30)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (45, CAST(N'2024-05-15' AS Date), 5250.0000, N'Completed', 20)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (46, CAST(N'2024-05-16' AS Date), 5250.0000, N'Completed', 19)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (47, CAST(N'2024-05-16' AS Date), 5250.0000, N'Completed', 21)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (48, CAST(N'2024-05-16' AS Date), 5250.0000, N'Completed', 2)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (49, CAST(N'2024-05-17' AS Date), 5250.0000, N'Completed', 34)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (50, CAST(N'2024-05-17' AS Date), 5250.0000, N'Completed', 43)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (51, CAST(N'2024-05-17' AS Date), 5250.0000, N'Completed', 18)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (52, CAST(N'2024-05-18' AS Date), 5250.0000, N'Completed', 29)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (53, CAST(N'2024-05-18' AS Date), 5250.0000, N'Completed', 40)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (54, CAST(N'2024-05-18' AS Date), 5250.0000, N'Completed', 51)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (55, CAST(N'2024-05-19' AS Date), 5250.0000, N'Completed', 62)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (56, CAST(N'2024-05-19' AS Date), 5250.0000, N'Completed', 73)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (57, CAST(N'2024-05-19' AS Date), 5250.0000, N'Completed', 84)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (58, CAST(N'2024-05-20' AS Date), 5250.0000, N'Completed', 8)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (59, CAST(N'2024-05-20' AS Date), 5250.0000, N'Completed', 19)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (60, CAST(N'2024-05-20' AS Date), 5250.0000, N'Completed', 30)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (61, CAST(N'2024-05-21' AS Date), 5250.0000, N'Completed', 41)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (62, CAST(N'2024-05-21' AS Date), 5250.0000, N'Completed', 52)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (63, CAST(N'2024-05-21' AS Date), 5250.0000, N'Completed', 63)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (64, CAST(N'2024-05-22' AS Date), 5250.0000, N'Completed', 74)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (65, CAST(N'2024-05-22' AS Date), 5250.0000, N'Completed', 9)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (66, CAST(N'2024-05-22' AS Date), 5250.0000, N'Completed', 10)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (67, CAST(N'2024-05-23' AS Date), 5250.0000, N'Completed', 11)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (68, CAST(N'2024-05-23' AS Date), 5250.0000, N'Completed', 20)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (69, CAST(N'2024-05-23' AS Date), 5250.0000, N'Completed', 21)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (70, CAST(N'2024-05-24' AS Date), 5250.0000, N'Completed', 22)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (71, CAST(N'2024-05-24' AS Date), 5250.0000, N'Completed', 31)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (72, CAST(N'2024-05-24' AS Date), 5250.0000, N'Completed', 32)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (73, CAST(N'2024-05-25' AS Date), 5250.0000, N'Completed', 33)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (74, CAST(N'2024-05-25' AS Date), 5250.0000, N'Completed', 42)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (75, CAST(N'2024-05-25' AS Date), 5250.0000, N'Completed', 43)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (76, CAST(N'2024-05-26' AS Date), 5250.0000, N'Completed', 44)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (77, CAST(N'2024-05-26' AS Date), 5250.0000, N'Completed', 53)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (78, CAST(N'2024-05-26' AS Date), 5250.0000, N'Completed', 54)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (79, CAST(N'2024-05-27' AS Date), 5250.0000, N'Completed', 55)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (80, CAST(N'2024-05-27' AS Date), 5250.0000, N'Completed', 64)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (81, CAST(N'2024-05-27' AS Date), 5250.0000, N'Completed', 65)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (82, CAST(N'2024-05-28' AS Date), 5250.0000, N'Completed', 66)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (83, CAST(N'2024-05-28' AS Date), 5250.0000, N'Completed', 75)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (84, CAST(N'2024-05-28' AS Date), 5250.0000, N'Completed', 76)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (85, CAST(N'2024-05-29' AS Date), 5250.0000, N'Completed', 77)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (86, CAST(N'2024-05-31' AS Date), 5250.0000, N'Completed', 85)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (87, CAST(N'2024-06-01' AS Date), 5250.0000, N'Completed', 96)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (88, CAST(N'2024-06-02' AS Date), 5250.0000, N'Completed', 88)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (89, CAST(N'2024-06-03' AS Date), 5250.0000, N'Completed', 100)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (90, CAST(N'2024-06-04' AS Date), 5250.0000, N'Completed', 89)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (91, CAST(N'2024-06-05' AS Date), 5250.0000, N'Completed', 97)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (92, CAST(N'2024-06-06' AS Date), 5250.0000, N'Completed', 86)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (93, CAST(N'2024-06-07' AS Date), 5250.0000, N'Completed', 99)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (94, CAST(N'2024-06-08' AS Date), 5250.0000, N'Completed', 91)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (95, CAST(N'2024-06-09' AS Date), 5250.0000, N'Completed', 87)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (96, CAST(N'2024-06-10' AS Date), 5250.0000, N'Completed', 95)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (97, CAST(N'2024-06-11' AS Date), 5250.0000, N'Completed', 93)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (98, CAST(N'2024-06-12' AS Date), 5250.0000, N'Completed', 98)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (99, CAST(N'2024-06-13' AS Date), 5250.0000, N'Completed', 90)
INSERT [dbo].[payment] ([id], [payment_date], [amount], [status], [student_id]) VALUES (100, CAST(N'2024-06-14' AS Date), 5250.0000, N'Completed', 94)
GO
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (1, N'Nguy?n', N'Van An', CAST(N'1995-01-15' AS Date), N'Male', N'nguyenvanan@gmail.com', N'0123456789', N'S? 10 Nguy?n Co Th?ch', N'Hà N?i', N'Hà N?i', N'100000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (2, N'Tr?n', N'Th? B?o', CAST(N'1996-02-20' AS Date), N'Female', N'tranthibao@gmail.com', N'0987654321', N'S? 20 Lý Thu?ng Ki?t', N'H? Chí Minh', N'H? Chí Minh', N'700000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (3, N'Lê', N'Thành Công', CAST(N'1997-03-25' AS Date), N'Male', N'lethanhcong@gmail.com', N'0123456789', N'S? 30 Ði?n Biên Ph?', N'Ðà N?ng', N'Ðà N?ng', N'500000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (4, N'Ph?m', N'Ng?c Di?p', CAST(N'1998-04-30' AS Date), N'Female', N'phamngocdiep@gmail.com', N'0987654321', N'S? 40 Lê L?i', N'H?i Phòng', N'H?i Phòng', N'300000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (5, N'Hoàng', N'Quang Dung', CAST(N'1999-05-10' AS Date), N'Male', N'hoangquangdung@gmail.com', N'0123456789', N'S? 50 Nguy?n Hu?', N'C?n Tho', N'C?n Tho', N'900000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (6, N'Tr?n', N'H?ng Ng?c', CAST(N'2000-06-15' AS Date), N'Female', N'tranhongngoc@gmail.com', N'0987654321', N'S? 60 Tr?n Hung Ð?o', N'Vung Tàu', N'Bà R?a - Vung Tàu', N'800000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (7, N'Nguy?n', N'Ð?c Tu?n', CAST(N'2001-07-20' AS Date), N'Male', N'nguyenductuan@gmail.com', N'0123456789', N'S? 70 Phan Chu Trinh', N'Quy Nhon', N'Bình Ð?nh', N'590000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (8, N'Lê', N'Th? Thanh', CAST(N'2002-08-25' AS Date), N'Female', N'lethithanh@gmail.com', N'0987654321', N'S? 80 Hoàng Di?u', N'Hu?', N'Th?a Thiên Hu?', N'540000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (9, N'Tr?n', N'Minh Tu?n', CAST(N'2003-09-30' AS Date), N'Male', N'tranminhtuan@gmail.com', N'0123456789', N'S? 90 Nguy?n Trãi', N'Nam Ð?nh', N'Nam Ð?nh', N'420000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (10, N'Ph?m', N'Mai Anh', CAST(N'2004-10-05' AS Date), N'Female', N'phammaianh@gmail.com', N'0987654321', N'S? 100 Lê Lai', N'Biên Hòa', N'Ð?ng Nai', N'350000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (11, N'Nguy?n', N'Th? M?', CAST(N'1995-11-15' AS Date), N'Female', N'nguyenthimy@gmail.com', N'0123456789', N'S? 110 Nguy?n B?nh Khiêm', N'Long Xuyên', N'An Giang', N'880000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (12, N'Lê', N'Ðình Tùng', CAST(N'1996-12-20' AS Date), N'Male', N'ledinhtung@gmail.com', N'0987654321', N'S? 120 Lý Thái T?', N'Qu?ng Ngãi', N'Qu?ng Ngãi', N'470000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (13, N'Tr?n', N'Th? Kim Ngân', CAST(N'1997-01-25' AS Date), N'Female', N'tranthikimngan@gmail.com', N'0123456789', N'S? 130 Nguy?n Th? Minh Khai', N'B?c Giang', N'B?c Giang', N'220000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (14, N'Ph?m', N'Qu?c Hùng', CAST(N'1998-02-28' AS Date), N'Male', N'phamquochung@gmail.com', N'0987654321', N'S? 140 Tr?n Hung Ð?o', N'Hà Tinh', N'Hà Tinh', N'480000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (15, N'Hoàng', N'Th? Lan', CAST(N'1999-03-10' AS Date), N'Female', N'hoangthilan@gmail.com', N'0123456789', N'S? 150 Nguy?n Công Tr?', N'Phan Thi?t', N'Bình Thu?n', N'620000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (16, N'Nguy?n', N'Van Nam', CAST(N'2000-04-15' AS Date), N'Male', N'nguyenvannam@gmail.com', N'0987654321', N'S? 160 Hùng Vuong', N'Thái Nguyên', N'Thái Nguyên', N'250000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (17, N'Tr?n', N'Th? Ánh', CAST(N'2001-05-20' AS Date), N'Female', N'tranthianh@gmail.com', N'0123456789', N'S? 170 Lê Du?n', N'Nha Trang', N'Khánh Hòa', N'570000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (18, N'Lê', N'Minh Ð?c', CAST(N'2002-06-25' AS Date), N'Male', N'leminhduc@gmail.com', N'0987654321', N'S? 180 Tr?n Phú', N'Vinh Yên', N'Vinh Phúc', N'280000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (19, N'Ph?m', N'Th? Th?o', CAST(N'2003-07-30' AS Date), N'Female', N'phamthithao@gmail.com', N'0123456789', N'S? 190 Nguy?n Van Linh', N'R?ch Giá', N'Kiên Giang', N'920000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (20, N'Hoàng', N'Van Tùng', CAST(N'2004-08-05' AS Date), N'Male', N'hoangvantung@gmail.com', N'0987654321', N'S? 200 Lý Thu?ng Ki?t', N'Cà Mau', N'Cà Mau', N'970000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (21, N'Nguy?n', N'Th? Huong', CAST(N'1995-09-15' AS Date), N'Female', N'nguyenthihuong@gmail.com', N'0123456789', N'S? 210 Hùng Vuong', N'H?i Duong', N'H?i Duong', N'310000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (22, N'Tr?n', N'Van H?i', CAST(N'1996-10-20' AS Date), N'Male', N'tranvanhai@gmail.com', N'0987654321', N'S? 220 Nguy?n Van Linh', N'Long Xuyên', N'An Giang', N'880000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (23, N'Lê', N'Th? Ng?c', CAST(N'1997-11-25' AS Date), N'Female', N'lengoc@gmail.com', N'0123456789', N'S? 230 Nguy?n H?u Th?', N'Quy Nhon', N'Bình Ð?nh', N'590000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (24, N'Ph?m', N'Van Quân', CAST(N'1998-12-30' AS Date), N'Male', N'phamvanquan@gmail.com', N'0987654321', N'S? 240 Lê Lai', N'Hu?', N'Th?a Thiên Hu?', N'540000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (25, N'Hoàng', N'Th? Mai', CAST(N'1999-01-10' AS Date), N'Female', N'hoangthimai@gmail.com', N'0123456789', N'S? 250 Phan Chu Trinh', N'Nam Ð?nh', N'Nam Ð?nh', N'420000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (26, N'Nguy?n', N'H?ng Son', CAST(N'2000-02-15' AS Date), N'Male', N'nguyenhongson@gmail.com', N'0987654321', N'S? 260 Lê Thánh Tôn', N'Biên Hòa', N'Ð?ng Nai', N'350000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (27, N'Tr?n', N'Mai Anh', CAST(N'2001-03-20' AS Date), N'Female', N'tranmaianh@gmail.com', N'0123456789', N'S? 270 Nguy?n Hu?', N'Long Xuyên', N'An Giang', N'880000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (28, N'Lê', N'Van Ð?c', CAST(N'2002-04-25' AS Date), N'Male', N'levanduc@gmail.com', N'0987654321', N'S? 280 Lý Thái T?', N'B?c Giang', N'B?c Giang', N'220000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (29, N'Ph?m', N'Th? Lan', CAST(N'2003-05-30' AS Date), N'Female', N'phamthilan@gmail.com', N'0123456789', N'S? 290 Tr?n Phú', N'Hà Tinh', N'Hà Tinh', N'480000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (30, N'Hoàng', N'Van Bình', CAST(N'2004-06-05' AS Date), N'Male', N'hoangvanbinh@gmail.com', N'0987654321', N'S? 300 Nguy?n Công Tr?', N'Phan Thi?t', N'Bình Thu?n', N'620000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (31, N'Nguy?n', N'Th? H?nh', CAST(N'1995-07-15' AS Date), N'Female', N'nguyenthihanh@gmail.com', N'0123456789', N'S? 310 Tr?n Hung Ð?o', N'Thái Nguyên', N'Thái Nguyên', N'250000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (32, N'Tr?n', N'Ð?c Huy', CAST(N'1996-08-20' AS Date), N'Male', N'tranduchuy@gmail.com', N'0987654321', N'S? 320 Lê Du?n', N'Nha Trang', N'Khánh Hòa', N'570000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (33, N'Lê', N'Th? Huong', CAST(N'1997-09-25' AS Date), N'Female', N'lethihuong@gmail.com', N'0123456789', N'S? 330 Hoàng Di?u', N'Vinh Yên', N'Vinh Phúc', N'280000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (34, N'Ph?m', N'Minh Tu?n', CAST(N'1998-10-30' AS Date), N'Male', N'phamminhtuan@gmail.com', N'0987654321', N'S? 340 Nguy?n Van Linh', N'R?ch Giá', N'Kiên Giang', N'920000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (35, N'Hoàng', N'Th? H?ng', CAST(N'1999-11-10' AS Date), N'Female', N'hoangthihang@gmail.com', N'0123456789', N'S? 350 Lý Thu?ng Ki?t', N'Cà Mau', N'Cà Mau', N'970000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (36, N'Nguy?n', N'Van Hùng', CAST(N'2000-12-15' AS Date), N'Male', N'nguyenvanhung@gmail.com', N'0987654321', N'S? 360 Hùng Vuong', N'H?i Duong', N'H?i Duong', N'310000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (37, N'Tr?n', N'Th? Th?o', CAST(N'2001-01-20' AS Date), N'Female', N'tranthithao@gmail.com', N'0123456789', N'S? 370 Nguy?n Van Linh', N'Long Xuyên', N'An Giang', N'880000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (38, N'Lê', N'Van Minh', CAST(N'2002-02-25' AS Date), N'Male', N'levanminh@gmail.com', N'0987654321', N'S? 380 Nguy?n H?u Th?', N'Quy Nhon', N'Bình Ð?nh', N'590000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (39, N'Ph?m', N'Th? Mai', CAST(N'2003-03-30' AS Date), N'Female', N'phamthimai@gmail.com', N'0123456789', N'S? 390 Lê Lai', N'Hu?', N'Th?a Thiên Hu?', N'540000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (40, N'Hoàng', N'Van Tùng', CAST(N'2004-04-05' AS Date), N'Male', N'hoangvantung@gmail.com', N'0987654321', N'S? 400 Tr?n Hung Ð?o', N'Nam Ð?nh', N'Nam Ð?nh', N'420000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (41, N'Nguy?n', N'Th? H?nh', CAST(N'1995-05-15' AS Date), N'Female', N'nguyenthihanh@gmail.com', N'0123456789', N'S? 410 Lý Thái T?', N'Biên Hòa', N'Ð?ng Nai', N'350000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (42, N'Tr?n', N'Ð?c Huy', CAST(N'1996-06-20' AS Date), N'Male', N'tranduchuy@gmail.com', N'0987654321', N'S? 420 Lê L?i', N'Vung Tàu', N'Bà R?a - Vung Tàu', N'800000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (43, N'Lê', N'Th? Huong', CAST(N'1997-07-25' AS Date), N'Female', N'lethihuong@gmail.com', N'0123456789', N'S? 430 Nguy?n Van Linh', N'Qu?ng Ngãi', N'Qu?ng Ngãi', N'470000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (44, N'Ph?m', N'Minh Tu?n', CAST(N'1998-08-30' AS Date), N'Male', N'phamminhtuan@gmail.com', N'0987654321', N'S? 440 Lê Du?n', N'Hà Tinh', N'Hà Tinh', N'480000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (45, N'Hoàng', N'Th? Mai', CAST(N'1999-09-10' AS Date), N'Female', N'hoangthimai@gmail.com', N'0123456789', N'S? 450 Nguy?n Công Tr?', N'Phan Thi?t', N'Bình Thu?n', N'620000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (46, N'Nguy?n', N'Van Nam', CAST(N'2000-10-15' AS Date), N'Male', N'nguyenvannam@gmail.com', N'0987654321', N'S? 460 Hùng Vuong', N'Thái Nguyên', N'Thái Nguyên', N'250000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (47, N'Tr?n', N'Th? Ánh', CAST(N'2001-11-20' AS Date), N'Female', N'tranthianh@gmail.com', N'0123456789', N'S? 470 Lê Thánh Tôn', N'Nha Trang', N'Khánh Hòa', N'570000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (48, N'Lê', N'Minh Ð?c', CAST(N'2002-12-25' AS Date), N'Male', N'leminhduc@gmail.com', N'0987654321', N'S? 480 Tr?n Phú', N'Vinh Yên', N'Vinh Phúc', N'280000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (49, N'Ph?m', N'Th? Lan', CAST(N'2003-01-30' AS Date), N'Female', N'phamthilan@gmail.com', N'0123456789', N'S? 490 Nguy?n Van Linh', N'R?ch Giá', N'Kiên Giang', N'920000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (50, N'Hoàng', N'Van Tùng', CAST(N'2004-02-05' AS Date), N'Male', N'hoangvantung@gmail.com', N'0987654321', N'S? 500 Lý Thu?ng Ki?t', N'Cà Mau', N'Cà Mau', N'970000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (51, N'Nguy?n', N'Th? Huong', CAST(N'1995-03-15' AS Date), N'Female', N'nguyenthihuong@gmail.com', N'0123456789', N'S? 510 Nguy?n B?nh Khiêm', N'Long Xuyên', N'An Giang', N'880000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (52, N'Tr?n', N'Ðình Tùng', CAST(N'1996-04-20' AS Date), N'Male', N'ledinhtung@gmail.com', N'0987654321', N'S? 520 Lý Thái T?', N'Qu?ng Ngãi', N'Qu?ng Ngãi', N'470000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (53, N'Lê', N'Th? Kim Ngân', CAST(N'1997-05-25' AS Date), N'Female', N'tranthikimngan@gmail.com', N'0123456789', N'S? 530 Nguy?n Th? Minh Khai', N'B?c Giang', N'B?c Giang', N'220000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (54, N'Ph?m', N'Qu?c Hùng', CAST(N'1998-06-28' AS Date), N'Male', N'phamquochung@gmail.com', N'0987654321', N'S? 540 Tr?n Hung Ð?o', N'Hà Tinh', N'Hà Tinh', N'480000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (55, N'Hoàng', N'Th? Lan', CAST(N'1999-07-10' AS Date), N'Female', N'hoangthilan@gmail.com', N'0123456789', N'S? 550 Nguy?n Công Tr?', N'Phan Thi?t', N'Bình Thu?n', N'620000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (56, N'Nguy?n', N'Van Nam', CAST(N'2000-08-15' AS Date), N'Male', N'nguyenvannam@gmail.com', N'0987654321', N'S? 560 Hùng Vuong', N'Thái Nguyên', N'Thái Nguyên', N'250000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (57, N'Tr?n', N'Th? Ánh', CAST(N'2001-09-20' AS Date), N'Female', N'tranthianh@gmail.com', N'0123456789', N'S? 570 Lê Du?n', N'Nha Trang', N'Khánh Hòa', N'570000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (58, N'Lê', N'Minh Ð?c', CAST(N'2002-10-25' AS Date), N'Male', N'leminhduc@gmail.com', N'0987654321', N'S? 580 Tr?n Phú', N'Vinh Yên', N'Vinh Phúc', N'280000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (59, N'Ph?m', N'Th? Lan', CAST(N'2003-11-30' AS Date), N'Female', N'phamthilan@gmail.com', N'0123456789', N'S? 590 Nguy?n Van Linh', N'R?ch Giá', N'Kiên Giang', N'920000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (60, N'Hoàng', N'Van Tùng', CAST(N'2004-12-05' AS Date), N'Male', N'hoangvantung@gmail.com', N'0987654321', N'S? 600 Lý Thu?ng Ki?t', N'Cà Mau', N'Cà Mau', N'970000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (61, N'Nguy?n', N'Th? Huong', CAST(N'1995-01-15' AS Date), N'Female', N'nguyenthihuong@gmail.com', N'0123456789', N'S? 610 Hùng Vuong', N'H?i Duong', N'H?i Duong', N'310000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (62, N'Tr?n', N'Van H?i', CAST(N'1996-02-20' AS Date), N'Male', N'tranvanhai@gmail.com', N'0987654321', N'S? 620 Nguy?n Van Linh', N'Long Xuyên', N'An Giang', N'880000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (63, N'Lê', N'Th? Ng?c', CAST(N'1997-03-25' AS Date), N'Female', N'lengoc@gmail.com', N'0123456789', N'S? 630 Nguy?n H?u Th?', N'Quy Nhon', N'Bình Ð?nh', N'590000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (64, N'Ph?m', N'Van Quân', CAST(N'1998-04-30' AS Date), N'Male', N'phamvanquan@gmail.com', N'0987654321', N'S? 640 Lê Lai', N'Hu?', N'Th?a Thiên Hu?', N'540000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (65, N'Hoàng', N'Th? Mai', CAST(N'1999-05-10' AS Date), N'Female', N'hoangthimai@gmail.com', N'0123456789', N'S? 650 Phan Chu Trinh', N'Nam Ð?nh', N'Nam Ð?nh', N'420000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (66, N'Nguy?n', N'H?ng Son', CAST(N'2000-06-15' AS Date), N'Male', N'nguyenhongson@gmail.com', N'0987654321', N'S? 660 Lê Thánh Tôn', N'Biên Hòa', N'Ð?ng Nai', N'350000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (67, N'Tr?n', N'Mai Anh', CAST(N'2001-07-20' AS Date), N'Female', N'tranmaianh@gmail.com', N'0123456789', N'S? 670 Nguy?n Hu?', N'Long Xuyên', N'An Giang', N'880000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (68, N'Lê', N'Van Ð?c', CAST(N'2002-08-25' AS Date), N'Male', N'levanduc@gmail.com', N'0987654321', N'S? 680 Lý Thái T?', N'B?c Giang', N'B?c Giang', N'220000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (69, N'Ph?m', N'Th? Lan', CAST(N'2003-09-30' AS Date), N'Female', N'phamthilan@gmail.com', N'0123456789', N'S? 690 Tr?n Phú', N'Hà Tinh', N'Hà Tinh', N'480000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (70, N'Hoàng', N'Van Bình', CAST(N'2004-10-05' AS Date), N'Male', N'hoangvanbinh@gmail.com', N'0987654321', N'S? 700 Nguy?n Công Tr?', N'Phan Thi?t', N'Bình Thu?n', N'620000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (71, N'Nguy?n', N'Th? H?nh', CAST(N'1995-11-15' AS Date), N'Female', N'nguyenthihanh@gmail.com', N'0123456789', N'S? 710 Tr?n Hung Ð?o', N'Thái Nguyên', N'Thái Nguyên', N'250000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (72, N'Tr?n', N'Ð?c Huy', CAST(N'1996-12-20' AS Date), N'Male', N'tranduchuy@gmail.com', N'0987654321', N'S? 720 Lê Du?n', N'Nha Trang', N'Khánh Hòa', N'570000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (73, N'Lê', N'Th? Huong', CAST(N'1997-01-25' AS Date), N'Female', N'lethihuong@gmail.com', N'0123456789', N'S? 730 Hoàng Di?u', N'Vinh Yên', N'Vinh Phúc', N'280000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (74, N'Ph?m', N'Minh Tu?n', CAST(N'1998-02-28' AS Date), N'Male', N'phamminhtuan@gmail.com', N'0987654321', N'S? 740 Nguy?n Van Linh', N'R?ch Giá', N'Kiên Giang', N'920000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (75, N'Hoàng', N'Th? Lan', CAST(N'1999-03-10' AS Date), N'Female', N'hoangthilan@gmail.com', N'0123456789', N'S? 750 Nguy?n Công Tr?', N'Phan Thi?t', N'Bình Thu?n', N'620000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (76, N'Nguy?n', N'Van Nam', CAST(N'2000-04-15' AS Date), N'Male', N'nguyenvannam@gmail.com', N'0987654321', N'S? 760 Hùng Vuong', N'Thái Nguyên', N'Thái Nguyên', N'250000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (77, N'Tr?n', N'Th? Ánh', CAST(N'2001-05-20' AS Date), N'Female', N'tranthianh@gmail.com', N'0123456789', N'S? 770 Lê Thánh Tôn', N'Nha Trang', N'Khánh Hòa', N'570000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (78, N'Lê', N'Minh Ð?c', CAST(N'2002-06-25' AS Date), N'Male', N'leminhduc@gmail.com', N'0987654321', N'S? 780 Tr?n Phú', N'Vinh Yên', N'Vinh Phúc', N'280000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (79, N'Ph?m', N'Th? Lan', CAST(N'2003-07-30' AS Date), N'Female', N'phamthilan@gmail.com', N'0123456789', N'S? 790 Nguy?n Van Linh', N'R?ch Giá', N'Kiên Giang', N'920000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (80, N'Hoàng', N'Van Tùng', CAST(N'2004-08-05' AS Date), N'Male', N'hoangvantung@gmail.com', N'0987654321', N'S? 800 Lý Thu?ng Ki?t', N'Cà Mau', N'Cà Mau', N'970000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (81, N'Nguy?n', N'Th? Huong', CAST(N'1995-09-15' AS Date), N'Female', N'nguyenthihuong@gmail.com', N'0123456789', N'S? 810 Nguy?n B?nh Khiêm', N'Long Xuyên', N'An Giang', N'880000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (82, N'Tr?n', N'Ðình Tùng', CAST(N'1996-10-20' AS Date), N'Male', N'ledinhtung@gmail.com', N'0987654321', N'S? 820 Lý Thái T?', N'Qu?ng Ngãi', N'Qu?ng Ngãi', N'470000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (83, N'Lê', N'Th? Kim Ngân', CAST(N'1997-11-25' AS Date), N'Female', N'tranthikimngan@gmail.com', N'0123456789', N'S? 830 Nguy?n Th? Minh Khai', N'B?c Giang', N'B?c Giang', N'220000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (84, N'Ph?m', N'Qu?c Hùng', CAST(N'1998-12-30' AS Date), N'Male', N'phamquochung@gmail.com', N'0987654321', N'S? 840 Tr?n Hung Ð?o', N'Hà Tinh', N'Hà Tinh', N'480000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (85, N'Hoàng', N'Th? Lan', CAST(N'1999-01-10' AS Date), N'Female', N'hoangthilan@gmail.com', N'0123456789', N'S? 850 Nguy?n Công Tr?', N'Phan Thi?t', N'Bình Thu?n', N'620000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (86, N'Nguy?n', N'Van Hùng', CAST(N'2000-02-15' AS Date), N'Male', N'nguyenvanhung@gmail.com', N'0987654321', N'S? 860 Hùng Vuong', N'H?i Duong', N'H?i Duong', N'310000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (87, N'Tr?n', N'Th? Th?o', CAST(N'2001-03-20' AS Date), N'Female', N'tranthithao@gmail.com', N'0123456789', N'S? 870 Nguy?n Van Linh', N'Long Xuyên', N'An Giang', N'880000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (88, N'Lê', N'Van Minh', CAST(N'2002-04-25' AS Date), N'Male', N'levanminh@gmail.com', N'0987654321', N'S? 880 Nguy?n H?u Th?', N'Quy Nhon', N'Bình Ð?nh', N'590000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (89, N'Ph?m', N'Th? Mai', CAST(N'2003-05-30' AS Date), N'Female', N'phamthimai@gmail.com', N'0123456789', N'S? 890 Lê Lai', N'Hu?', N'Th?a Thiên Hu?', N'540000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (90, N'Hoàng', N'Van Tùng', CAST(N'2004-06-05' AS Date), N'Male', N'hoangvantung@gmail.com', N'0987654321', N'S? 900 Tr?n Hung Ð?o', N'Nam Ð?nh', N'Nam Ð?nh', N'420000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (91, N'Nguy?n', N'Th? H?nh', CAST(N'1995-07-15' AS Date), N'Female', N'nguyenthihanh@gmail.com', N'0123456789', N'S? 910 Lý Thái T?', N'Biên Hòa', N'Ð?ng Nai', N'350000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (92, N'Tr?n', N'Ð?c Huy', CAST(N'1996-08-20' AS Date), N'Male', N'tranduchuy@gmail.com', N'0987654321', N'S? 920 Lê Du?n', N'Vung Tàu', N'Bà R?a - Vung Tàu', N'800000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (93, N'Lê', N'Th? Huong', CAST(N'1997-09-25' AS Date), N'Female', N'lethihuong@gmail.com', N'0123456789', N'S? 930 Nguy?n Van Linh', N'Qu?ng Ngãi', N'Qu?ng Ngãi', N'470000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (94, N'Ph?m', N'Minh Tu?n', CAST(N'1998-10-30' AS Date), N'Male', N'phamminhtuan@gmail.com', N'0987654321', N'S? 940 Lê Du?n', N'Hà Tinh', N'Hà Tinh', N'480000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (95, N'Hoàng', N'Th? H?ng', CAST(N'1999-11-10' AS Date), N'Female', N'hoangthihang@gmail.com', N'0123456789', N'S? 950 Lý Thu?ng Ki?t', N'Cà Mau', N'Cà Mau', N'970000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (96, N'Nguy?n', N'Van Hùng', CAST(N'2000-12-15' AS Date), N'Male', N'nguyenvanhung@gmail.com', N'0987654321', N'S? 960 Hùng Vuong', N'H?i Duong', N'H?i Duong', N'310000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (97, N'Tr?n', N'Th? Th?o', CAST(N'2001-01-20' AS Date), N'Female', N'tranthithao@gmail.com', N'0123456789', N'S? 970 Nguy?n Van Linh', N'Long Xuyên', N'An Giang', N'880000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (98, N'Lê', N'Van Minh', CAST(N'2002-02-25' AS Date), N'Male', N'levanminh@gmail.com', N'0987654321', N'S? 980 Nguy?n H?u Th?', N'Quy Nhon', N'Bình Ð?nh', N'590000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (99, N'Ph?m', N'Th? Mai', CAST(N'2003-03-30' AS Date), N'Female', N'phamthimai@gmail.com', N'0123456789', N'S? 990 Lê Lai', N'Hu?', N'Th?a Thiên Hu?', N'540000')
INSERT [dbo].[student] ([id], [first_name], [last_name], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (100, N'Hoàng', N'Van Tùng', CAST(N'2004-04-05' AS Date), N'Male', N'hoangvantung@gmail.com', N'0987654321', N'S? 1000 Tr?n Hung Ð?o', N'Nam Ð?nh', N'Nam Ð?nh', N'420000')
GO
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (1, N'user1', N'pass1', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-01' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (2, N'user2', N'pass2', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-02' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (3, N'user3', N'pass3', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-03' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (4, N'user4', N'pass4', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-04' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (5, N'user5', N'pass5', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-05' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (6, N'user6', N'pass6', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-06' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (7, N'user7', N'pass7', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-07' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (8, N'user8', N'pass8', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-08' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (9, N'user9', N'pass9', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-09' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (10, N'user10', N'pass10', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-10' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (11, N'user11', N'pass11', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-11' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (12, N'user12', N'pass12', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-12' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (13, N'user13', N'pass13', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-13' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (14, N'user14', N'pass14', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-14' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (15, N'user15', N'pass15', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-15' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (16, N'user16', N'pass16', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-16' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (17, N'user17', N'pass17', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-17' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (18, N'user18', N'pass18', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-18' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (19, N'user19', N'pass19', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-19' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (20, N'user20', N'pass20', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (21, N'user21', N'pass21', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-21' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (22, N'user22', N'pass22', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-22' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (23, N'user23', N'pass23', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-23' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (24, N'user24', N'pass24', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-24' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (25, N'user25', N'pass25', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-25' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (26, N'user26', N'pass26', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-26' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (27, N'user27', N'pass27', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-27' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (28, N'user28', N'pass28', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-28' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (29, N'user29', N'pass29', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-29' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (30, N'user30', N'pass30', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (31, N'user31', N'pass31', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-01' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (32, N'user32', N'pass32', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-02' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (33, N'user33', N'pass33', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-03' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (34, N'user34', N'pass34', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-04' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (35, N'user35', N'pass35', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-05' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (36, N'user36', N'pass36', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-06' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (37, N'user37', N'pass37', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-07' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (38, N'user38', N'pass38', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-08' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (39, N'user39', N'pass39', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-09' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (40, N'user40', N'pass40', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-10' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (41, N'user41', N'pass41', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-11' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (42, N'user42', N'pass42', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-12' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (43, N'user43', N'pass43', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-13' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (44, N'user44', N'pass44', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-14' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (45, N'user45', N'pass45', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-15' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (46, N'user46', N'pass46', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-16' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (47, N'user47', N'pass47', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-17' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (48, N'user48', N'pass48', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-18' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (49, N'user49', N'pass49', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-19' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (50, N'user50', N'pass50', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (51, N'user51', N'pass51', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-21' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (52, N'user52', N'pass52', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-22' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (53, N'user53', N'pass53', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-23' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (54, N'user54', N'pass54', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-24' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (55, N'user55', N'pass55', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-25' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (56, N'user56', N'pass56', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-26' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (57, N'user57', N'pass57', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-27' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (58, N'user58', N'pass58', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-28' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (59, N'user59', N'pass59', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-29' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (60, N'user60', N'pass60', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (61, N'user61', N'pass61', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-01' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (62, N'user62', N'pass62', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-02' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (63, N'user63', N'pass63', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-03' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (64, N'user64', N'pass64', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-04' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (65, N'user65', N'pass65', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-05' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (66, N'user66', N'pass66', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-06' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (67, N'user67', N'pass67', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-07' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (68, N'user68', N'pass68', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-08' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (69, N'user69', N'pass69', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-09' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (70, N'user70', N'pass70', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-10' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (71, N'user71', N'pass71', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-11' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (72, N'user72', N'pass72', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-12' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (73, N'user73', N'pass73', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-13' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (74, N'user74', N'pass74', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-14' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (75, N'user75', N'pass75', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-15' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (76, N'user76', N'pass76', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-16' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (77, N'user77', N'pass77', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-17' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (78, N'user78', N'pass78', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-18' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (79, N'user79', N'pass79', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-19' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (80, N'user80', N'pass80', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (81, N'user81', N'pass81', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-21' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (82, N'user82', N'pass82', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-22' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (83, N'user83', N'pass83', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-23' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (84, N'user84', N'pass84', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-24' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (85, N'user85', N'pass85', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-25' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (86, N'user86', N'pass86', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-26' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (87, N'user87', N'pass87', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-27' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (88, N'user88', N'pass88', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-28' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (89, N'user89', N'pass89', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-29' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (90, N'user90', N'pass90', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (91, N'user91', N'pass91', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-01' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (92, N'user92', N'pass92', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-02' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (93, N'user93', N'pass93', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-03' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (94, N'user94', N'pass94', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-04' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (95, N'user95', N'pass95', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-05' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (96, N'user96', N'pass96', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-06' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (97, N'user97', N'pass97', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-07' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (98, N'user98', N'pass98', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-08' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (99, N'user99', N'pass99', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-09' AS Date))
INSERT [dbo].[student_account] ([student_id], [username], [password], [balance], [created_date]) VALUES (100, N'user100', N'pass100', CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-06-10' AS Date))
GO
INSERT [dbo].[teacher] ([id], [first_name], [last_name], [description], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (1, N'John', N'Doe', N'English Language Teacher', CAST(N'1979-05-10' AS Date), N'Male', N'john.doe@gmail.com', N'0905123456', N'123 Nguyen Du', N'Hanoi', N'HN', N'100000')
INSERT [dbo].[teacher] ([id], [first_name], [last_name], [description], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (2, N'Jane', N'Smith', N'English Language Teacher', CAST(N'1982-11-23' AS Date), N'Female', N'jane.smith@gmail.com', N'0905234567', N'456 Le Loi', N'Ho Chi Minh City', N'HCM', N'700000')
INSERT [dbo].[teacher] ([id], [first_name], [last_name], [description], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (3, N'Paul', N'Taylor', N'English Language Teacher', CAST(N'1975-08-15' AS Date), N'Male', N'paul.taylor@gmail.com', N'0905345678', N'789 Vo Van Tan', N'Da Nang', N'DN', N'550000')
INSERT [dbo].[teacher] ([id], [first_name], [last_name], [description], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (4, N'Emily', N'Johnson', N'English Language Teacher', CAST(N'1986-02-04' AS Date), N'Female', N'emily.johnson@gmail.com', N'0905456789', N'321 Tran Phu', N'Can Tho', N'CT', N'900000')
INSERT [dbo].[teacher] ([id], [first_name], [last_name], [description], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (5, N'Michael', N'Brown', N'English Language Teacher', CAST(N'1980-09-09' AS Date), N'Male', N'michael.brown@gmail.com', N'0905567890', N'654 Ba Thang Hai', N'Hue', N'TH', N'530000')
INSERT [dbo].[teacher] ([id], [first_name], [last_name], [description], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (6, N'Sara', N'Wilson', N'English Language Teacher', CAST(N'1988-12-20' AS Date), N'Female', N'sara.wilson@gmail.com', N'0905678901', N'987 Ly Tu Trong', N'Hai Phong', N'HP', N'180000')
INSERT [dbo].[teacher] ([id], [first_name], [last_name], [description], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (7, N'Nguyen', N'Thi Hoa', N'English Language Teacher', CAST(N'1991-07-15' AS Date), N'Female', N'hoa.nguyen@gmail.com', N'0905789012', N'135 Nguyen Van Linh', N'Nha Trang', N'NT', N'650000')
INSERT [dbo].[teacher] ([id], [first_name], [last_name], [description], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (8, N'Tran', N'Van Nam', N'English Language Teacher', CAST(N'1984-03-22' AS Date), N'Male', N'nam.tran@gmail.com', N'0905890123', N'246 Hai Ba Trung', N'Vung Tau', N'VT', N'780000')
INSERT [dbo].[teacher] ([id], [first_name], [last_name], [description], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (9, N'Le', N'Thi Lan', N'English Language Teacher', CAST(N'1995-05-11' AS Date), N'Female', N'lan.le@gmail.com', N'0905901234', N'369 Le Hong Phong', N'Quy Nhon', N'QN', N'820000')
INSERT [dbo].[teacher] ([id], [first_name], [last_name], [description], [date_birth], [gender], [email], [phone], [street], [city], [state], [zip]) VALUES (10, N'Pham', N'Van Kien', N'English Language Teacher', CAST(N'1990-10-30' AS Date), N'Male', N'kien.pham@gmail.com', N'0906012345', N'147 Tran Hung Dao', N'Bien Hoa', N'BH', N'810000')
GO
INSERT [dbo].[teacher_account] ([teacher_id], [username], [password], [is_active]) VALUES (1, N'johndoe', N'password123', 1)
INSERT [dbo].[teacher_account] ([teacher_id], [username], [password], [is_active]) VALUES (2, N'janesmith', N'password123', 1)
INSERT [dbo].[teacher_account] ([teacher_id], [username], [password], [is_active]) VALUES (3, N'paultaylor', N'password123', 1)
INSERT [dbo].[teacher_account] ([teacher_id], [username], [password], [is_active]) VALUES (4, N'emilyjohnson', N'password123', 1)
INSERT [dbo].[teacher_account] ([teacher_id], [username], [password], [is_active]) VALUES (5, N'michaelbrown', N'password123', 1)
INSERT [dbo].[teacher_account] ([teacher_id], [username], [password], [is_active]) VALUES (6, N'sarawilson', N'password123', 1)
INSERT [dbo].[teacher_account] ([teacher_id], [username], [password], [is_active]) VALUES (7, N'hoanguyen', N'password123', 1)
INSERT [dbo].[teacher_account] ([teacher_id], [username], [password], [is_active]) VALUES (8, N'namtran', N'password123', 1)
INSERT [dbo].[teacher_account] ([teacher_id], [username], [password], [is_active]) VALUES (9, N'lanle', N'password123', 1)
INSERT [dbo].[teacher_account] ([teacher_id], [username], [password], [is_active]) VALUES (10, N'kienpham', N'password123', 1)
GO
ALTER TABLE [dbo].[student_account] ADD  DEFAULT ((0.00)) FOR [balance]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([id])
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teacher] ([id])
GO
ALTER TABLE [dbo].[class_student]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([id])
GO
ALTER TABLE [dbo].[class_student]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[class_weekday]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([id])
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD FOREIGN KEY([level_id])
REFERENCES [dbo].[level] ([id])
GO
ALTER TABLE [dbo].[course_material]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([id])
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([id])
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([id])
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[student_account]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[teacher_account]  WITH CHECK ADD FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teacher] ([id])
GO
/****** Object:  StoredProcedure [dbo].[AddClassSchedule]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Create a stored procedure to add a new class schedule to the class. (B)
	CREATE PROCEDURE [dbo].[AddClassSchedule]
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
/****** Object:  StoredProcedure [dbo].[AddTeacher]    Script Date: 07/07/2024 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Create a stored procedure to add a new teacher. (Đ)
	CREATE PROCEDURE [dbo].[AddTeacher] (
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
