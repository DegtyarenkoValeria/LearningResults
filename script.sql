USE [master]
GO
/****** Object:  Database [LearningResultsDB]    Script Date: 12.06.2024 17:29:03 ******/
CREATE DATABASE [LearningResultsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LearningResultsDB', FILENAME = N'I:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LearningResultsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LearningResultsDB_log', FILENAME = N'I:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LearningResultsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LearningResultsDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LearningResultsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LearningResultsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LearningResultsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LearningResultsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LearningResultsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LearningResultsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LearningResultsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LearningResultsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LearningResultsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LearningResultsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LearningResultsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LearningResultsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LearningResultsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LearningResultsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LearningResultsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LearningResultsDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LearningResultsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LearningResultsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LearningResultsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LearningResultsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LearningResultsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LearningResultsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LearningResultsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LearningResultsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LearningResultsDB] SET  MULTI_USER 
GO
ALTER DATABASE [LearningResultsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LearningResultsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LearningResultsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LearningResultsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LearningResultsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LearningResultsDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LearningResultsDB', N'ON'
GO
ALTER DATABASE [LearningResultsDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [LearningResultsDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LearningResultsDB]
GO
/****** Object:  Table [dbo].[Данные_об_обучении]    Script Date: 12.06.2024 17:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Данные_об_обучении](
	[Номер_строки] [int] NOT NULL,
	[Работник] [int] NULL,
	[Результат] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_строки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ИС]    Script Date: 12.06.2024 17:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ИС](
	[Код_ИС] [int] NOT NULL,
	[Название] [nvarchar](255) NOT NULL,
	[Тип] [int] NULL,
	[Сложность] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_ИС] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Подразделения]    Script Date: 12.06.2024 17:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Подразделения](
	[Код_подразделения] [int] NOT NULL,
	[Название] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_подразделения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Работники]    Script Date: 12.06.2024 17:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Работники](
	[Код_работника] [int] NOT NULL,
	[ФИО] [nvarchar](255) NOT NULL,
	[Телефон] [nvarchar](50) NULL,
	[Подразделение] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_работника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Результаты_обучения]    Script Date: 12.06.2024 17:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Результаты_обучения](
	[Номер_результата] [int] NOT NULL,
	[Сотрудник_департамента] [int] NULL,
	[ИС] [int] NULL,
	[Дата] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Номер_результата] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники_департамента]    Script Date: 12.06.2024 17:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники_департамента](
	[Код_сотрудника] [int] NOT NULL,
	[ФИО] [nvarchar](255) NOT NULL,
	[Стаж_работы] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Типы_ИС]    Script Date: 12.06.2024 17:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Типы_ИС](
	[Код_типа] [int] NOT NULL,
	[Название] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_типа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Данные_об_обучении] ([Номер_строки], [Работник], [Результат]) VALUES (1, 1, 3)
INSERT [dbo].[Данные_об_обучении] ([Номер_строки], [Работник], [Результат]) VALUES (2, 1, 2)
INSERT [dbo].[Данные_об_обучении] ([Номер_строки], [Работник], [Результат]) VALUES (3, 1, 3)
INSERT [dbo].[Данные_об_обучении] ([Номер_строки], [Работник], [Результат]) VALUES (4, 3, 4)
INSERT [dbo].[Данные_об_обучении] ([Номер_строки], [Работник], [Результат]) VALUES (5, 3, 5)
INSERT [dbo].[Данные_об_обучении] ([Номер_строки], [Работник], [Результат]) VALUES (6, 2, 5)
INSERT [dbo].[Данные_об_обучении] ([Номер_строки], [Работник], [Результат]) VALUES (7, 2, 4)
INSERT [dbo].[Данные_об_обучении] ([Номер_строки], [Работник], [Результат]) VALUES (8, 3, 3)
INSERT [dbo].[Данные_об_обучении] ([Номер_строки], [Работник], [Результат]) VALUES (9, 4, 4)
INSERT [dbo].[Данные_об_обучении] ([Номер_строки], [Работник], [Результат]) VALUES (10, 4, 5)
GO
INSERT [dbo].[ИС] ([Код_ИС], [Название], [Тип], [Сложность]) VALUES (1, N'Microsoft SQL Server', 1, 3)
INSERT [dbo].[ИС] ([Код_ИС], [Название], [Тип], [Сложность]) VALUES (2, N'Windows 10', 2, 2)
INSERT [dbo].[ИС] ([Код_ИС], [Название], [Тип], [Сложность]) VALUES (3, N'Jira', 3, 4)
INSERT [dbo].[ИС] ([Код_ИС], [Название], [Тип], [Сложность]) VALUES (4, N'Power BI', 4, 3)
INSERT [dbo].[ИС] ([Код_ИС], [Название], [Тип], [Сложность]) VALUES (5, N'Salesforce', 5, 4)
INSERT [dbo].[ИС] ([Код_ИС], [Название], [Тип], [Сложность]) VALUES (6, N'SAP', 6, 5)
INSERT [dbo].[ИС] ([Код_ИС], [Название], [Тип], [Сложность]) VALUES (7, N'Git', 7, 2)
INSERT [dbo].[ИС] ([Код_ИС], [Название], [Тип], [Сложность]) VALUES (8, N'Azure', 8, 4)
INSERT [dbo].[ИС] ([Код_ИС], [Название], [Тип], [Сложность]) VALUES (9, N'VMware', 9, 3)
INSERT [dbo].[ИС] ([Код_ИС], [Название], [Тип], [Сложность]) VALUES (10, N'Zabbix', 10, 3)
GO
INSERT [dbo].[Подразделения] ([Код_подразделения], [Название]) VALUES (1, N'Отдел разработки')
INSERT [dbo].[Подразделения] ([Код_подразделения], [Название]) VALUES (2, N'Отдел тестирования')
INSERT [dbo].[Подразделения] ([Код_подразделения], [Название]) VALUES (3, N'Отдел аналитики')
INSERT [dbo].[Подразделения] ([Код_подразделения], [Название]) VALUES (4, N'Отдел поддержки')
INSERT [dbo].[Подразделения] ([Код_подразделения], [Название]) VALUES (5, N'Отдел продаж')
INSERT [dbo].[Подразделения] ([Код_подразделения], [Название]) VALUES (6, N'Отдел маркетинга')
INSERT [dbo].[Подразделения] ([Код_подразделения], [Название]) VALUES (7, N'Отдел кадров')
INSERT [dbo].[Подразделения] ([Код_подразделения], [Название]) VALUES (8, N'Отдел закупок')
INSERT [dbo].[Подразделения] ([Код_подразделения], [Название]) VALUES (9, N'Отдел логистики')
INSERT [dbo].[Подразделения] ([Код_подразделения], [Название]) VALUES (10, N'Отдел бухгалтерии')
GO
INSERT [dbo].[Работники] ([Код_работника], [ФИО], [Телефон], [Подразделение]) VALUES (1, N'Иванов Иван Иванович', N'123-456-7890', 1)
INSERT [dbo].[Работники] ([Код_работника], [ФИО], [Телефон], [Подразделение]) VALUES (2, N'Петров Петр Петрович', N'123-456-7891', 2)
INSERT [dbo].[Работники] ([Код_работника], [ФИО], [Телефон], [Подразделение]) VALUES (3, N'Сидоров Сидор Сидорович', N'123-456-7892', 3)
INSERT [dbo].[Работники] ([Код_работника], [ФИО], [Телефон], [Подразделение]) VALUES (4, N'Кузнецов Алексей Александрович', N'123-456-7893', 4)
INSERT [dbo].[Работники] ([Код_работника], [ФИО], [Телефон], [Подразделение]) VALUES (5, N'Смирнова Анна Сергеевна', N'123-456-7894', 5)
INSERT [dbo].[Работники] ([Код_работника], [ФИО], [Телефон], [Подразделение]) VALUES (6, N'Федорова Мария Ивановна', N'123-456-7895', 6)
INSERT [dbo].[Работники] ([Код_работника], [ФИО], [Телефон], [Подразделение]) VALUES (7, N'Михайлов Михаил Михайлович', N'123-456-7896', 7)
INSERT [dbo].[Работники] ([Код_работника], [ФИО], [Телефон], [Подразделение]) VALUES (8, N'Алексеева Ольга Владимировна', N'123-456-7897', 8)
INSERT [dbo].[Работники] ([Код_работника], [ФИО], [Телефон], [Подразделение]) VALUES (9, N'Николаев Николай Николаевич', N'123-456-7898', 9)
INSERT [dbo].[Работники] ([Код_работника], [ФИО], [Телефон], [Подразделение]) VALUES (10, N'Лебедева Екатерина Павловна', N'123-456-7899', 10)
GO
INSERT [dbo].[Результаты_обучения] ([Номер_результата], [Сотрудник_департамента], [ИС], [Дата]) VALUES (1, 1, 1, CAST(N'2024-01-15' AS Date))
INSERT [dbo].[Результаты_обучения] ([Номер_результата], [Сотрудник_департамента], [ИС], [Дата]) VALUES (2, 2, 2, CAST(N'2024-02-20' AS Date))
INSERT [dbo].[Результаты_обучения] ([Номер_результата], [Сотрудник_департамента], [ИС], [Дата]) VALUES (3, 3, 3, CAST(N'2024-03-25' AS Date))
INSERT [dbo].[Результаты_обучения] ([Номер_результата], [Сотрудник_департамента], [ИС], [Дата]) VALUES (4, 1, 4, CAST(N'2024-04-10' AS Date))
INSERT [dbo].[Результаты_обучения] ([Номер_результата], [Сотрудник_департамента], [ИС], [Дата]) VALUES (5, 2, 5, CAST(N'2024-05-18' AS Date))
INSERT [dbo].[Результаты_обучения] ([Номер_результата], [Сотрудник_департамента], [ИС], [Дата]) VALUES (6, 3, 6, CAST(N'2024-05-22' AS Date))
INSERT [dbo].[Результаты_обучения] ([Номер_результата], [Сотрудник_департамента], [ИС], [Дата]) VALUES (7, 4, 7, CAST(N'2024-05-30' AS Date))
INSERT [dbo].[Результаты_обучения] ([Номер_результата], [Сотрудник_департамента], [ИС], [Дата]) VALUES (8, 2, 8, CAST(N'2024-04-14' AS Date))
INSERT [dbo].[Результаты_обучения] ([Номер_результата], [Сотрудник_департамента], [ИС], [Дата]) VALUES (9, 3, 9, CAST(N'2024-04-05' AS Date))
INSERT [dbo].[Результаты_обучения] ([Номер_результата], [Сотрудник_департамента], [ИС], [Дата]) VALUES (10, 1, 10, CAST(N'2024-04-19' AS Date))
GO
INSERT [dbo].[Сотрудники_департамента] ([Код_сотрудника], [ФИО], [Стаж_работы]) VALUES (1, N'Васильев Василий Васильевич', 10)
INSERT [dbo].[Сотрудники_департамента] ([Код_сотрудника], [ФИО], [Стаж_работы]) VALUES (2, N'Попов Петр Петрович', 8)
INSERT [dbo].[Сотрудники_департамента] ([Код_сотрудника], [ФИО], [Стаж_работы]) VALUES (3, N'Григорьев Григорий Григорьевич', 6)
INSERT [dbo].[Сотрудники_департамента] ([Код_сотрудника], [ФИО], [Стаж_работы]) VALUES (4, N'Мартынова Мария Михайловна', 7)
INSERT [dbo].[Сотрудники_департамента] ([Код_сотрудника], [ФИО], [Стаж_работы]) VALUES (5, N'Захаров Захар Захарович', 9)
INSERT [dbo].[Сотрудники_департамента] ([Код_сотрудника], [ФИО], [Стаж_работы]) VALUES (6, N'Семенова Светлана Семеновна', 5)
INSERT [dbo].[Сотрудники_департамента] ([Код_сотрудника], [ФИО], [Стаж_работы]) VALUES (7, N'Орлов Олег Олегович', 11)
INSERT [dbo].[Сотрудники_департамента] ([Код_сотрудника], [ФИО], [Стаж_работы]) VALUES (8, N'Павлова Полина Павловна', 4)
INSERT [dbo].[Сотрудники_департамента] ([Код_сотрудника], [ФИО], [Стаж_работы]) VALUES (9, N'Тимофеев Тимофей Тимофеевич', 3)
INSERT [dbo].[Сотрудники_департамента] ([Код_сотрудника], [ФИО], [Стаж_работы]) VALUES (10, N'Фролова Федора Федоровна', 12)
GO
INSERT [dbo].[Типы_ИС] ([Код_типа], [Название]) VALUES (1, N'Система управления базами данных')
INSERT [dbo].[Типы_ИС] ([Код_типа], [Название]) VALUES (2, N'Операционная система')
INSERT [dbo].[Типы_ИС] ([Код_типа], [Название]) VALUES (3, N'Система управления проектами')
INSERT [dbo].[Типы_ИС] ([Код_типа], [Название]) VALUES (4, N'Система аналитики данных')
INSERT [dbo].[Типы_ИС] ([Код_типа], [Название]) VALUES (5, N'CRM-система')
INSERT [dbo].[Типы_ИС] ([Код_типа], [Название]) VALUES (6, N'ERP-система')
INSERT [dbo].[Типы_ИС] ([Код_типа], [Название]) VALUES (7, N'Система контроля версий')
INSERT [dbo].[Типы_ИС] ([Код_типа], [Название]) VALUES (8, N'Облачная платформа')
INSERT [dbo].[Типы_ИС] ([Код_типа], [Название]) VALUES (9, N'Система виртуализации')
INSERT [dbo].[Типы_ИС] ([Код_типа], [Название]) VALUES (10, N'Система мониторинга')
GO
ALTER TABLE [dbo].[Данные_об_обучении]  WITH CHECK ADD FOREIGN KEY([Работник])
REFERENCES [dbo].[Работники] ([Код_работника])
GO
ALTER TABLE [dbo].[Данные_об_обучении]  WITH CHECK ADD FOREIGN KEY([Результат])
REFERENCES [dbo].[Результаты_обучения] ([Номер_результата])
GO
ALTER TABLE [dbo].[ИС]  WITH CHECK ADD FOREIGN KEY([Тип])
REFERENCES [dbo].[Типы_ИС] ([Код_типа])
GO
ALTER TABLE [dbo].[Работники]  WITH CHECK ADD FOREIGN KEY([Подразделение])
REFERENCES [dbo].[Подразделения] ([Код_подразделения])
GO
ALTER TABLE [dbo].[Результаты_обучения]  WITH CHECK ADD FOREIGN KEY([Сотрудник_департамента])
REFERENCES [dbo].[Сотрудники_департамента] ([Код_сотрудника])
GO
ALTER TABLE [dbo].[Результаты_обучения]  WITH CHECK ADD FOREIGN KEY([ИС])
REFERENCES [dbo].[ИС] ([Код_ИС])
GO
USE [master]
GO
ALTER DATABASE [LearningResultsDB] SET  READ_WRITE 
GO
