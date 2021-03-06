USE [master]
GO
/****** Object:  Database [Florence_dev]    Script Date: 3/31/17 2:26:08 PM ******/
CREATE DATABASE [Florence_dev]
GO
ALTER DATABASE [Florence_dev] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Florence_dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Florence_dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Florence_dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Florence_dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Florence_dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Florence_dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [Florence_dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Florence_dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Florence_dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Florence_dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Florence_dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Florence_dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Florence_dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Florence_dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Florence_dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Florence_dev] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Florence_dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Florence_dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Florence_dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Florence_dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Florence_dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Florence_dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Florence_dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Florence_dev] SET RECOVERY FULL 
GO
ALTER DATABASE [Florence_dev] SET  MULTI_USER 
GO
ALTER DATABASE [Florence_dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Florence_dev] SET DB_CHAINING OFF 
GO
USE [Florence_dev]
GO
/****** Object:  Table [dbo].[Achievement]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Achievement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[AchievementTitle] [varchar](50) NOT NULL,
	[AchievementDate] [datetime] NOT NULL,
	[AchievementDescription] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdminDepartment]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminDepartment](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL CONSTRAINT [DF_Admin_Department_ParentID]  DEFAULT ((0)),
	[DeptCode] [varchar](30) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Tel] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Addr] [nvarchar](50) NULL,
	[PostCode] [char](6) NULL,
	[BankName] [nvarchar](25) NULL,
	[BankAccount] [varchar](50) NULL,
	[UserName] [nvarchar](25) NULL,
	[AbsIndex] [smallint] NULL CONSTRAINT [DF_Admin_Department_AbsIndex]  DEFAULT ((0)),
	[ItemLevel] [tinyint] NOT NULL CONSTRAINT [DF_Admin_Department_ItemLevel]  DEFAULT ((0)),
	[IsDir] [bit] NOT NULL CONSTRAINT [DF_Admin_Department_IsDir]  DEFAULT ((0)),
	[Memo] [varchar](50) NULL,
	[Responsibility] [varchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Admin_Department] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppUser]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Gid] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [varchar](50) NOT NULL,
	[PasswordHash] [varchar](250) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[UpdatedAt] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedAt] [datetime] NOT NULL DEFAULT (getdate()),
	[SecurityStamp] [uniqueidentifier] NOT NULL DEFAULT (newid()),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Assignment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AssignTo] [int] NOT NULL,
	[AssignmentName] [varchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Priority] [varchar](10) NOT NULL,
	[AssignmentDescription] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attendance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LinkID] [uniqueidentifier] NOT NULL,
	[UserID] [int] NOT NULL,
	[PunchDateTime] [datetime] NOT NULL,
	[CurrentPunchType] [varchar](20) NOT NULL,
	[Notes] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AutoDeduction]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AutoDeduction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ForAbsence] [bit] NOT NULL DEFAULT ((0)),
	[AbsenceAmount] [decimal](18, 0) NOT NULL DEFAULT ((0)),
	[ForLeaveWithoutPay] [bit] NOT NULL DEFAULT ((0)),
	[LeaveWithoutPayAmount] [decimal](18, 0) NOT NULL DEFAULT ((0)),
	[ForHalfDayLeave] [bit] NOT NULL DEFAULT ((0)),
	[HalfDayLeaveAmount] [decimal](18, 0) NOT NULL DEFAULT ((0)),
	[ForLateAttendance] [bit] NOT NULL DEFAULT ((0)),
	[LateMinutesFrom] [int] NOT NULL,
	[LateMinutesTo] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[LateAmountType] [varchar](50) NOT NULL,
	[AbsenceAmountType] [varchar](50) NOT NULL,
	[LeaveWithoutPayAmountType] [varchar](50) NOT NULL,
	[HalfDayLeaveAmountType] [varchar](50) NOT NULL,
	[LinkID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AutoOvertime]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AutoOvertime](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MinutesFrom] [int] NOT NULL,
	[MinutesTo] [int] NOT NULL,
	[OvertimeAmountType] [varchar](100) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CandidateEducation]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CandidateEducation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LinkID] [uniqueidentifier] NOT NULL,
	[Degree] [varchar](200) NOT NULL,
	[Subject] [varchar](100) NOT NULL,
	[Institute] [varchar](200) NOT NULL,
	[Grade] [decimal](9, 2) NOT NULL,
	[GraduationYear] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CandidateLanguage]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CandidateLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LinkID] [uniqueidentifier] NOT NULL,
	[Language] [varchar](100) NOT NULL,
	[ListeningLevel] [varchar](50) NOT NULL,
	[SpeakingLevel] [varchar](50) NOT NULL,
	[ReadingLevel] [varchar](50) NOT NULL,
	[WritingLevel] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CandidateReference]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CandidateReference](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LinkID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Organization] [varchar](100) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CandidateScore]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateScore](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LinkID] [uniqueidentifier] NOT NULL,
	[DressCode] [int] NOT NULL,
	[Attitude] [int] NOT NULL,
	[CommunicationSkills] [int] NOT NULL,
	[TechnicalKnowledge] [int] NOT NULL,
	[Confidence] [int] NOT NULL,
	[Potential] [int] NOT NULL,
	[LearningAbility] [int] NOT NULL,
	[MentalCapacity] [int] NOT NULL,
	[AnalytialApproach] [int] NOT NULL,
	[WillingnessToWork] [int] NOT NULL,
	[RatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[CandidateSkill]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CandidateSkill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LinkID] [uniqueidentifier] NOT NULL,
	[SkillName] [varchar](100) NOT NULL,
	[SkillLevel] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CandidateTraining]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CandidateTraining](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LinkID] [uniqueidentifier] NOT NULL,
	[Field] [varchar](100) NOT NULL,
	[OrganizationName] [varchar](100) NOT NULL,
	[TrainingTitle] [varchar](100) NOT NULL,
	[Location] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CandidateWorkExperience]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CandidateWorkExperience](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LinkID] [uniqueidentifier] NOT NULL,
	[JobField] [varchar](200) NOT NULL,
	[OrganizationName] [varchar](200) NOT NULL,
	[Designation] [varchar](200) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[JobDescription] [varchar](5000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address1] [varchar](200) NOT NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](100) NOT NULL,
	[State] [varchar](100) NOT NULL,
	[Country] [varchar](100) NOT NULL,
	[Zip] [varchar](20) NOT NULL DEFAULT (''),
	[Phone] [varchar](20) NOT NULL,
	[Email] [varchar](100) NOT NULL DEFAULT (''),
	[Fax] [varchar](20) NOT NULL DEFAULT (''),
	[Logo] [varchar](max) NOT NULL DEFAULT (''),
	[URL] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Complaint](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ComplaintFrom] [int] NOT NULL,
	[ComplaintTitle] [varchar](20) NOT NULL,
	[ComplaintDate] [datetime] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contract](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ContractType] [varchar](30) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Designation] [varchar](100) NOT NULL,
	[EmployeeType] [varchar](30) NOT NULL,
	[EmployeeCategory] [varchar](30) NOT NULL,
	[EmployeeGrade] [varchar](30) NOT NULL,
	[Station] [varchar](50) NULL,
	[Department] [int] NOT NULL,
	[ContactDesc] [varchar](30) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ContractFilePath] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](50) NOT NULL,
	[ParentDesignation] [varchar](50) NULL,
	[JobDescription] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Designation] [varchar](100) NOT NULL,
	[Station] [varchar](100) NULL,
	[Department] [int] NOT NULL,
	[Grade] [varchar](10) NOT NULL,
	[WorkShift] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ShowInOrganogram] [bit] NOT NULL DEFAULT ((1)),
	[NotificationByEmail] [bit] NOT NULL DEFAULT ((0)),
	[ReportTo] [int] NOT NULL,
	[Salutation] [varchar](10) NOT NULL DEFAULT (''),
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[Gender] [varchar](20) NOT NULL,
	[BloodGroup] [varchar](10) NOT NULL,
	[Nationality] [varchar](20) NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
	[GovernmentID] [varchar](20) NOT NULL DEFAULT (''),
	[SSN] [varchar](10) NOT NULL DEFAULT (''),
	[PassportID] [varchar](20) NOT NULL DEFAULT (''),
	[PassportExpiration] [datetime] NULL,
	[DriverLicense] [varchar](20) NOT NULL DEFAULT (''),
	[DriverLicenseExpiration] [datetime] NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[Zip] [varchar](10) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[HomePhone] [varchar](20) NOT NULL,
	[OfficePhone] [varchar](20) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[EmergencyContactName] [varchar](50) NOT NULL,
	[EmergencyRelationship] [varchar](20) NOT NULL,
	[EmergencyPhone] [varchar](20) NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[AvetarPath] [varchar](200) NOT NULL DEFAULT (''),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeExit]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeExit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[ExitDate] [datetime] NOT NULL,
	[TypeOfExit] [varchar](50) NOT NULL,
	[ConductedExitInterview] [bit] NOT NULL DEFAULT ((0)),
	[Reason] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeJoining]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeJoining](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
	[Type] [varchar](30) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Designation] [varchar](100) NOT NULL,
	[Station] [varchar](100) NULL,
	[Department] [int] NOT NULL,
	[Note] [varchar](5000) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExtraPayrollItems]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExtraPayrollItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PayrollItemName] [varchar](100) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Holiday]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Holiday](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[HolidayStartDate] [datetime] NOT NULL,
	[HolidayEndDate] [datetime] NOT NULL,
	[Description] [varchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HourlyWage]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HourlyWage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[RegularHoursRate] [decimal](18, 2) NOT NULL,
	[OvertimeHoursRate] [decimal](18, 2) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Insurance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[InsuranceType] [varchar](100) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[EmployeeAmountPerMonth] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[OrganizationSharePerMonth] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobInterview]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobInterview](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[JobPost] [varchar](30) NOT NULL,
	[InterviewDate] [datetime] NOT NULL,
	[Interviewer1] [varchar](50) NULL,
	[Interviewer2] [varchar](50) NULL,
	[Interviewee1] [varchar](50) NULL,
	[Interviewee2] [varchar](50) NULL,
	[PlaceOfInterview] [varchar](50) NOT NULL,
	[InterviewDesc] [varchar](5000) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobPost]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobPost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NOT NULL,
	[JobTitle] [varchar](100) NOT NULL,
	[JobType] [varchar](100) NOT NULL,
	[NumberOfPositions] [int] NOT NULL,
	[CandidateAgeRangeStart] [int] NOT NULL DEFAULT ((18)),
	[CandidateAgeRangeEnd] [int] NOT NULL DEFAULT ((60)),
	[JobLocation] [varchar](200) NOT NULL,
	[SalaryStartRange] [int] NOT NULL,
	[SalaryEndRange] [int] NOT NULL,
	[CandidateQualification] [varchar](max) NOT NULL,
	[CandidateExperience] [varchar](max) NOT NULL,
	[JobPostDescription] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CloseDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobPostRequisition]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobPostRequisition](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NOT NULL,
	[JobTitle] [varchar](100) NOT NULL,
	[JobType] [varchar](100) NOT NULL,
	[NumberOfPositions] [int] NOT NULL,
	[CandidateAgeRangeStart] [int] NOT NULL DEFAULT ((18)),
	[CandidateAgeRangeEnd] [int] NOT NULL DEFAULT ((60)),
	[JobLocation] [varchar](200) NOT NULL,
	[SalaryStartRange] [int] NOT NULL,
	[SalaryEndRange] [int] NOT NULL,
	[CandidateQualification] [varchar](max) NOT NULL,
	[CandidateExperience] [varchar](max) NOT NULL,
	[JobPostDescription] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobTest]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobTest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[JobPost] [varchar](30) NOT NULL,
	[TestTitle] [varchar](100) NOT NULL,
	[TestDescription] [varchar](max) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Leave]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Leave](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[LeaveType] [varchar](50) NOT NULL,
	[Reason] [varchar](1000) NOT NULL,
	[LeaveDuration] [varchar](50) NULL,
	[LeaveFrom] [datetime] NOT NULL,
	[LeaveTo] [datetime] NOT NULL,
	[AlternateContactNumber] [varchar](10) NOT NULL,
	[AlternateEmployee] [int] NOT NULL,
	[LeaveDescription] [varchar](5000) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[LoanAmount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[LoanBalance] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[LoanDate] [datetime] NOT NULL,
	[MonthlyRepaymentAmount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[RepaymentStartDate] [datetime] NOT NULL,
	[Description] [varchar](5000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Memo]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Memo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemoFrom] [int] NOT NULL,
	[MemoTo] [int] NOT NULL,
	[Sbuject] [varchar](50) NOT NULL,
	[MemoDate] [datetime] NOT NULL,
	[MemoDescription] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL DEFAULT ((0)),
	[Name] [varchar](30) NOT NULL,
	[Description] [varchar](100) NOT NULL DEFAULT (''),
	[Controller] [varchar](30) NOT NULL DEFAULT (''),
	[Action] [varchar](30) NOT NULL DEFAULT (''),
	[Level] [int] NOT NULL DEFAULT ((0)),
	[Icon] [varchar](100) NOT NULL DEFAULT (''),
	[URL] [varchar](max) NOT NULL DEFAULT (''),
	[Params] [varchar](max) NULL DEFAULT (''),
	[TaskID] [int] NULL DEFAULT ((1000)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuItemsGroup]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuItemsGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NULL DEFAULT ((0)),
	[Name] [varchar](50) NULL,
	[IsActive] [bit] NULL DEFAULT ((1)),
	[Icon] [varchar](20) NOT NULL DEFAULT (''),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ModelTypes]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ModelTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ModelName] [varchar](100) NOT NULL,
	[TypesArray] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[PostedAt] [datetime] NOT NULL,
	[PostUser] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Overtime]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Overtime](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[OvertimeHours] [decimal](9, 2) NOT NULL,
	[TimeIn] [datetime] NULL,
	[TimeOut] [datetime] NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Description] [varchar](1000) NOT NULL DEFAULT (''),
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[IsRecurring] [bit] NOT NULL DEFAULT ((0)),
	[RecurringCyclePerMonth] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PayrollOption]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PayrollOption](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PayrollMethod] [varchar](100) NOT NULL,
	[AutoApprovePayroll] [varchar](100) NOT NULL,
	[PayrollApprovedBy] [int] NOT NULL,
	[AutoEmailPayslips] [bit] NOT NULL DEFAULT ((0)),
	[PerDaySalaryCalculation] [varchar](100) NOT NULL,
	[NumberOfDayInMonth] [int] NOT NULL,
	[PayrollCurrency] [varchar](10) NULL,
	[PayslipTitle] [varchar](100) NOT NULL,
	[PayslipFormat] [varchar](100) NOT NULL,
	[BasicSalaryType] [varchar](100) NOT NULL,
	[BasicSalaryPercentage] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PayslipAllowance]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PayslipAllowance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AllowanceTitle] [varchar](20) NOT NULL,
	[IsTaxable] [bit] NOT NULL DEFAULT ((0)),
	[AllowanceType] [varchar](100) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[Percentage] [decimal](18, 2) NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PerformanceEvaluation]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PerformanceEvaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Policy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[PostedAt] [datetime] NOT NULL,
	[PostUser] [int] NOT NULL,
	[PolicyType] [varchar](50) NOT NULL,
	[Company] [int] NOT NULL DEFAULT ((0)),
	[Department] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](2000) NULL,
	[Status] [varchar](20) NOT NULL,
	[ClientID] [varchar](200) NULL,
	[ClientSID] [int] NOT NULL DEFAULT ((1)),
	[Version] [varchar](20) NOT NULL DEFAULT ('1.0'),
	[Completed] [decimal](5, 2) NOT NULL DEFAULT ((0)),
	[LastUpdated] [datetime] NOT NULL,
	[Priority] [varchar](50) NOT NULL DEFAULT ('Default'),
	[CreateBy] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectActivity]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectActivity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Comments] [varchar](2000) NULL,
	[ProjectID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectParticipants]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectParticipants](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Participants] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Promotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PromotionFor] [int] NOT NULL,
	[ForwardApplicationTo] [int] NOT NULL,
	[PromotionDate] [datetime] NOT NULL,
	[PromotionDescription] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProvidentFund]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProvidentFund](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[EmployeeShareAmount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[EmployeeSharePersentage] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[OrganizationShareAmount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[OrganizationSharePersentage] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[Description] [varchar](5000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecruitmentCandidate]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecruitmentCandidate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LinkID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Gender] [varchar](20) NOT NULL,
	[DOB] [date] NOT NULL,
	[Nationality] [varchar](100) NOT NULL,
	[JobField] [varchar](100) NOT NULL,
	[HaveWorkingPermit] [bit] NULL DEFAULT ((1)),
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](40) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[Zip] [varchar](20) NOT NULL,
	[Country] [varchar](30) NOT NULL,
	[Interests] [varchar](5000) NOT NULL,
	[Achievements] [varchar](5000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reimbursement]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reimbursement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InstanceID] [uniqueidentifier] NOT NULL,
	[Employee] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Description] [varchar](1000) NOT NULL DEFAULT (''),
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReimbursementDetail]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReimbursementDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InstanceID] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Category] [varchar](100) NOT NULL,
	[Item] [varchar](100) NOT NULL,
	[ReceiptNumber] [varchar](200) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Requistion]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Requistion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RequistionBy] [int] NOT NULL,
	[RequistionType] [varchar](20) NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[Priority] [varchar](10) NOT NULL,
	[RequistionDescription] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resignation]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resignation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ResigningEmployee] [int] NOT NULL,
	[ForwardApplicationTo] [int] NOT NULL,
	[NoticeDate] [datetime] NOT NULL,
	[ResignationDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [smallint] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[RoleDescription] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Salary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[SalaryType] [varchar](50) NOT NULL,
	[Currency] [varchar](10) NULL,
	[TaxRule] [varchar](50) NOT NULL,
	[OvertimeRate] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[AnnualGrossSalary] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[MonthlyBasicSalary] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[AllowanceID] [int] NOT NULL DEFAULT ((0)),
	[Claims] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[Commissions] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[Deductions] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[TaxDeductionAmount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[TaxDeductionPercentage] [decimal](18, 2) NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalaryCalculation]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryCalculation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IncludedBaseSalary] [bit] NOT NULL DEFAULT ((1)),
	[IncludeDeduction] [bit] NOT NULL DEFAULT ((1)),
	[IncludeBonus] [bit] NOT NULL DEFAULT ((1)),
	[IncludeCommission] [bit] NOT NULL DEFAULT ((1)),
	[IncludeAdjustment] [bit] NOT NULL DEFAULT ((1)),
	[IncludeReimbursement] [bit] NOT NULL DEFAULT ((1)),
	[IncludeOvertime] [bit] NOT NULL DEFAULT ((1)),
	[IncludeProvidentFund] [bit] NOT NULL DEFAULT ((1)),
	[IncludeAdvanceSalary] [bit] NOT NULL DEFAULT ((1)),
	[IncludeLoan] [bit] NOT NULL DEFAULT ((1)),
	[IncludeInsurance] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[SalaryItem]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalaryItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Description] [varchar](1000) NOT NULL DEFAULT (''),
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[IsRecurring] [bit] NOT NULL DEFAULT ((0)),
	[RecurringCyclePerMonth] [int] NOT NULL DEFAULT ((0)),
	[SalaryItemType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalaryPayslip]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalaryPayslip](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InstanceID] [uniqueidentifier] NOT NULL,
	[Employee] [int] NOT NULL,
	[SalaryDate] [datetime] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Note] [varchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalaryPayslipDetail]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalaryPayslipDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InstanceID] [uniqueidentifier] NOT NULL,
	[SalaryItem] [varchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [varchar](2) NOT NULL,
	[StateName] [varchar](128) NOT NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaxExemptEmployee]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxExemptEmployee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[TaxRule]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaxRule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RuleName] [varchar](100) NOT NULL,
	[TaxFormat] [varchar](50) NOT NULL DEFAULT ('General'),
	[SalaryFrom] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[SalaryTo] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[TaxPercentage] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[ExemptedTaxAmount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[AdditionalTaxAmount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[LinkID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Termination]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Termination](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TerminatedTo] [int] NOT NULL,
	[ForwardApplicationTo] [int] NOT NULL,
	[TerminationDate] [datetime] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trainer]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trainer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Designation] [varchar](50) NOT NULL,
	[Organization] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Zip] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[TrainerEmail] [varchar](50) NOT NULL,
	[TrainerPhone] [varchar](50) NOT NULL,
	[TrainerPhone2] [varchar](50) NULL,
	[TrainerExpertise] [varchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Training]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Training](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Subject] [varchar](50) NOT NULL,
	[NatureOfTraining] [varchar](50) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Trainer] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[SponsoredBy] [varchar](50) NOT NULL,
	[OrganizedBy] [varchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Description] [varchar](5000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrainingEvaluation]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrainingEvaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](5000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrainingEvent]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrainingEvent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Subject] [varchar](50) NOT NULL,
	[NatureOfTraining] [varchar](50) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[SponsoredBy] [varchar](50) NOT NULL,
	[OrganizedBy] [varchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Trainers] [varchar](1000) NOT NULL,
	[Trainees] [varchar](1000) NOT NULL,
	[Externals] [varchar](5000) NULL,
	[Description] [varchar](5000) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrainingNeedAssessment]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrainingNeedAssessment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Subject] [varchar](50) NOT NULL,
	[NatureOfTraining] [varchar](50) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Employee] [int] NOT NULL,
	[Reason] [varchar](5000) NOT NULL,
	[PreferredTrainer] [varchar](50) NOT NULL,
	[PreferredLocation] [varchar](50) NOT NULL,
	[PreferredStartDate] [datetime] NOT NULL,
	[PreferredEndDate] [datetime] NOT NULL,
	[Description] [varchar](5000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transfer]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transfer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeToTransfer] [int] NOT NULL,
	[ForwardApplicationTo] [int] NOT NULL,
	[TransferDate] [datetime] NOT NULL,
	[TransferToDepartment] [int] NOT NULL,
	[TransferToStation] [varchar](100) NULL,
	[TransferDescription] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Travel]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Travel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [int] NOT NULL,
	[ForwardApplicationTo] [int] NOT NULL,
	[Purpose] [varchar](200) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[ExpectedBudget] [decimal](18, 2) NOT NULL,
	[ActualBudget] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[TravelDescription] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserActionLog]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserActionLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[UserRole] [varchar](100) NOT NULL,
	[Path] [varchar](100) NULL,
	[PathParam] [varchar](max) NULL,
	[IsAuth] [bit] NULL,
	[LogTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [smallint] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Warning]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warning](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[WarningTo] [int] NOT NULL,
	[WarningBy] [varchar](20) NOT NULL,
	[WarningDate] [datetime] NOT NULL,
	[Subject] [varchar](20) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WorkShift]    Script Date: 3/31/17 2:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkShift](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InstanceID] [uniqueidentifier] NOT NULL,
	[WorkShiftTitle] [varchar](30) NULL,
	[WorkDays] [varchar](20) NOT NULL,
	[RegularWorkHoursFrom] [time](7) NOT NULL,
	[RegularWorkHoursTo] [time](7) NOT NULL,
	[LunchBreakHoursFrom] [time](7) NOT NULL,
	[LunchBreakHoursTo] [time](7) NOT NULL,
	[AdditionalBreakHoursFrom] [time](7) NOT NULL,
	[AdditionalBreakHoursTo] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Achievement] ON 

INSERT [dbo].[Achievement] ([id], [Employee], [AchievementTitle], [AchievementDate], [AchievementDescription], [CreatedBy], [CreatedAt]) VALUES (1, 1, N'Wining Man', CAST(N'2015-11-03 00:00:00.000' AS DateTime), N'You are the best!', 1, CAST(N'2015-11-18 22:27:09.000' AS DateTime))
INSERT [dbo].[Achievement] ([id], [Employee], [AchievementTitle], [AchievementDate], [AchievementDescription], [CreatedBy], [CreatedAt]) VALUES (2, 2, N'Best Cleaner', CAST(N'2015-11-10 00:00:00.000' AS DateTime), N'you know~', 1, CAST(N'2015-11-18 22:32:02.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Achievement] OFF
SET IDENTITY_INSERT [dbo].[AdminDepartment] ON 

INSERT [dbo].[AdminDepartment] ([DeptID], [ParentID], [DeptCode], [Name], [Tel], [Fax], [Email], [Addr], [PostCode], [BankName], [BankAccount], [UserName], [AbsIndex], [ItemLevel], [IsDir], [Memo], [Responsibility], [IsActive]) VALUES (1, 1, N'1001', N'Tech Dept', N'1231231234', N'1231231234', N'jim@cook.com', N'123 N. Dr.', N'19920 ', N'CBTXi', N'1000909', N'joey', 0, 0, 0, N'memo1111yyy111', N'dev tech', 1)
INSERT [dbo].[AdminDepartment] ([DeptID], [ParentID], [DeptCode], [Name], [Tel], [Fax], [Email], [Addr], [PostCode], [BankName], [BankAccount], [UserName], [AbsIndex], [ItemLevel], [IsDir], [Memo], [Responsibility], [IsActive]) VALUES (2, 1, N'1002', N'Financial Department', N'1231231234', N'7897897898', N'fin@dpsol.com', N'1299 N. St.', N'10002 ', N'American Bank', N'1000100010001', N'Jansen', 0, 1, 0, N'This is memo!', N'Financial stuff', 1)
INSERT [dbo].[AdminDepartment] ([DeptID], [ParentID], [DeptCode], [Name], [Tel], [Fax], [Email], [Addr], [PostCode], [BankName], [BankAccount], [UserName], [AbsIndex], [ItemLevel], [IsDir], [Memo], [Responsibility], [IsActive]) VALUES (3, 3, N'1012', N'Sales', N'1231232200', N'8989897799', N'kook@apple.com', N'North St.', N'87658 ', N'CBTX', N'10010010000', N'Josh', 0, 1, 1, N'This is memo! Get shi shit donw!!!', N'Sales Stuff', 1)
INSERT [dbo].[AdminDepartment] ([DeptID], [ParentID], [DeptCode], [Name], [Tel], [Fax], [Email], [Addr], [PostCode], [BankName], [BankAccount], [UserName], [AbsIndex], [ItemLevel], [IsDir], [Memo], [Responsibility], [IsActive]) VALUES (4, 3, N'10', N'Marketing', N'9657784455', N'7894561452', N'ms@email.com', N'1002 St.', N'75987 ', N'Capital One', N'7887475441', N'test1', 1, 1, 0, N'no memo', N'Market', 1)
SET IDENTITY_INSERT [dbo].[AdminDepartment] OFF
SET IDENTITY_INSERT [dbo].[AppUser] ON 

INSERT [dbo].[AppUser] ([id], [Gid], [UserName], [PasswordHash], [Email], [FirstName], [LastName], [IsActive], [UpdatedAt], [CreatedAt], [SecurityStamp]) VALUES (1, N'27820788-f0d4-4618-9728-cca88c5cf49a', N'jzhang', N'1000:RcCJBP9STwEZUva5ozb8nGPc1dcPvAuc:5kahFy5lCbzak+jcA2ambsmfss8FnHCZ', N'jansenzjh@gmail.com', N'Jansen', N'Zhang', 1, CAST(N'2015-10-05 13:57:34.000' AS DateTime), CAST(N'2015-10-05 13:57:34.000' AS DateTime), N'ebb320c1-2291-475d-a579-531a2061ffeb')
INSERT [dbo].[AppUser] ([id], [Gid], [UserName], [PasswordHash], [Email], [FirstName], [LastName], [IsActive], [UpdatedAt], [CreatedAt], [SecurityStamp]) VALUES (2, N'5e253985-5e4c-4a62-8e94-9477846da853', N'test1', N'1000:2gxS3thqQOaPjQV0sZMlPah29Kn7rIlq:lzKoLK36yXWyNZpnlKm6/+S2gPEn7d+W', N'123@123.com', N'Timmy', N'Cookie', 1, CAST(N'2015-11-18 21:39:05.000' AS DateTime), CAST(N'2015-11-18 21:39:05.000' AS DateTime), N'23715304-5727-40d0-a917-5246736d5253')
INSERT [dbo].[AppUser] ([id], [Gid], [UserName], [PasswordHash], [Email], [FirstName], [LastName], [IsActive], [UpdatedAt], [CreatedAt], [SecurityStamp]) VALUES (3, N'45fcf9bd-21c3-4f64-a9c7-2ab81da495bb', N'Test', N'1000:O5ttv5rkhuo8wMTztogbplRDmUdofmUd:UDK9AkwjRWD1KdscyGX6hlbmE5cjOgUP', N'test@maildrop.cc', N'test', N'test', 1, CAST(N'2017-03-18 15:20:46.000' AS DateTime), CAST(N'2017-03-18 15:20:46.000' AS DateTime), N'145c69cd-5248-4f2d-9d7d-5fc8710ab9b5')
INSERT [dbo].[AppUser] ([id], [Gid], [UserName], [PasswordHash], [Email], [FirstName], [LastName], [IsActive], [UpdatedAt], [CreatedAt], [SecurityStamp]) VALUES (4, N'7bbb8984-c6c2-4457-94fd-37a5110e6d2c', N'abuateek', N'1000:ETYBQHlGLulPSVymVMW6jcCP5RPNIySW:BwTcpSj9SQOz1v4U5zx+3B59OpBcjnUx', N'abuateek@gmail.com', N'Mohammad', N'Abuateek', 1, CAST(N'2017-03-19 08:41:53.000' AS DateTime), CAST(N'2017-03-19 08:41:53.000' AS DateTime), N'15c22c2b-7a5e-404a-aea6-35cf500ee52f')
INSERT [dbo].[AppUser] ([id], [Gid], [UserName], [PasswordHash], [Email], [FirstName], [LastName], [IsActive], [UpdatedAt], [CreatedAt], [SecurityStamp]) VALUES (5, N'ed09a3f1-d4f4-4151-8750-3327b52a6f88', N'test2', N'1000:rVVZGpArQyviB4usan76wwliWz2kVnz6:34IR6Fhu78Uz2wzYPU4ypjaEOQZn1MLh', N'test@test.com', N'John', N'Doeo', 1, CAST(N'2017-03-25 02:42:23.000' AS DateTime), CAST(N'2017-03-25 02:42:23.000' AS DateTime), N'21130ec0-80fd-40c9-a11b-42fe12457c29')
SET IDENTITY_INSERT [dbo].[AppUser] OFF
SET IDENTITY_INSERT [dbo].[Assignment] ON 

INSERT [dbo].[Assignment] ([id], [AssignTo], [AssignmentName], [StartDate], [EndDate], [Priority], [AssignmentDescription], [CreatedBy], [CreatedAt]) VALUES (4, 1, N'This is assignment', CAST(N'2015-11-02 00:00:00.000' AS DateTime), CAST(N'2015-11-26 00:00:00.000' AS DateTime), N'High', N'<p>Telerik Kendo UI® Core is the open source version of Kendo UI, the comprehensive framework for building modern web and mobile apps with HTML5 and JavaScript.</p><p><br></p><p>The open source package:</p><p>40+ jQuery-based widgets and framework features</p><p>Licensed under the permissive Apache v2 license</p><p>Suitable for projects not requiring dedicated technical support</p>', 2, CAST(N'2015-11-19 20:41:05.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Assignment] OFF
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1, N'7f11952e-a25d-4594-9a3f-1d128ee5f974', 2, CAST(N'2015-11-21 16:15:40.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2, N'7f11952e-a25d-4594-9a3f-1d128ee5f974', 2, CAST(N'2015-11-21 16:15:51.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (3, N'7f11952e-a25d-4594-9a3f-1d128ee5f974', 2, CAST(N'2015-11-21 16:15:55.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (4, N'7f11952e-a25d-4594-9a3f-1d128ee5f974', 2, CAST(N'2015-11-21 16:15:58.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (5, N'7f11952e-a25d-4594-9a3f-1d128ee5f974', 2, CAST(N'2015-11-21 16:16:04.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (6, N'7f11952e-a25d-4594-9a3f-1d128ee5f974', 2, CAST(N'2015-11-21 16:16:07.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (7, N'7f11952e-a25d-4594-9a3f-1d128ee5f974', 2, CAST(N'2015-11-21 16:16:11.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (8, N'7f11952e-a25d-4594-9a3f-1d128ee5f974', 2, CAST(N'2015-11-21 16:16:14.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (9, N'7f11952e-a25d-4594-9a3f-1d128ee5f974', 2, CAST(N'2015-11-21 16:25:22.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (10, N'7f11952e-a25d-4594-9a3f-1d128ee5f974', 2, CAST(N'2015-11-21 16:25:28.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (11, N'e5fa7e42-549d-4f93-b5bc-b9beace5d388', 2, CAST(N'2015-11-21 16:30:31.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (12, N'e5fa7e42-549d-4f93-b5bc-b9beace5d388', 2, CAST(N'2015-11-21 16:30:35.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (13, N'a824c34b-110a-4af9-a5e9-182aeee060ad', 2, CAST(N'2015-11-21 16:31:44.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (14, N'a824c34b-110a-4af9-a5e9-182aeee060ad', 2, CAST(N'2015-11-21 16:31:46.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (15, N'5d06ad14-856c-4723-aeec-6d48b49410e3', 2, CAST(N'2015-11-21 16:31:50.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (16, N'5d06ad14-856c-4723-aeec-6d48b49410e3', 2, CAST(N'2015-11-21 16:31:53.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (17, N'2481c4ad-8aca-4ce0-bf8b-2c2e63a0a315', 2, CAST(N'2015-11-22 00:42:34.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (18, N'2481c4ad-8aca-4ce0-bf8b-2c2e63a0a315', 2, CAST(N'2015-11-22 07:02:19.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (19, N'1e4fcb5e-4667-47c6-ada3-99b78aeda6a3', 2, CAST(N'2015-11-22 08:49:28.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (20, N'1e4fcb5e-4667-47c6-ada3-99b78aeda6a3', 2, CAST(N'2015-11-22 08:50:03.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (21, N'b5d12dd5-d501-4f61-99aa-c82893f78eb9', 2, CAST(N'2015-11-22 08:53:53.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (22, N'b5d12dd5-d501-4f61-99aa-c82893f78eb9', 2, CAST(N'2015-11-22 08:54:12.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (23, N'6d6429b7-e65d-44c2-8d13-3c67785e2cd1', 2, CAST(N'2015-11-22 09:45:47.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (24, N'6d6429b7-e65d-44c2-8d13-3c67785e2cd1', 2, CAST(N'2015-11-22 09:46:03.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (25, N'344f45c1-3c02-43ec-a9fc-70514a9393ab', 2, CAST(N'2015-11-22 09:46:41.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (26, N'344f45c1-3c02-43ec-a9fc-70514a9393ab', 2, CAST(N'2015-11-22 09:46:44.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (27, N'0345df25-d9aa-4dc2-b3c1-a28c4aa0734c', 2, CAST(N'2015-11-22 09:46:51.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (28, N'0345df25-d9aa-4dc2-b3c1-a28c4aa0734c', 2, CAST(N'2015-11-22 09:47:14.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (29, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 10:03:08.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (30, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 10:03:12.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (31, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 10:03:33.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (32, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 11:20:36.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (33, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 11:20:47.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (34, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 11:21:01.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (35, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 11:21:14.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (36, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 11:23:54.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (37, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 11:30:31.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (38, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 11:30:37.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (39, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 11:30:43.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (40, N'2168bd7d-a85d-4744-865a-0ba6dbcdb435', 2, CAST(N'2015-11-22 11:30:51.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (41, N'4a34ffaa-52af-4abb-9d73-5c1e7a3890dc', 2, CAST(N'2015-11-22 11:30:57.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (42, N'4a34ffaa-52af-4abb-9d73-5c1e7a3890dc', 2, CAST(N'2015-11-22 11:31:52.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (43, N'938732be-4a5d-4197-aded-587cedb62183', 2, CAST(N'2015-11-22 11:32:00.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (44, N'938732be-4a5d-4197-aded-587cedb62183', 2, CAST(N'2015-11-22 11:32:04.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (45, N'938732be-4a5d-4197-aded-587cedb62183', 2, CAST(N'2015-11-22 11:32:20.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (46, N'938732be-4a5d-4197-aded-587cedb62183', 2, CAST(N'2015-11-22 11:32:22.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (47, N'938732be-4a5d-4197-aded-587cedb62183', 2, CAST(N'2015-11-22 11:38:08.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (48, N'938732be-4a5d-4197-aded-587cedb62183', 2, CAST(N'2015-11-22 11:38:11.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (49, N'938732be-4a5d-4197-aded-587cedb62183', 2, CAST(N'2015-11-22 11:38:21.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (50, N'938732be-4a5d-4197-aded-587cedb62183', 2, CAST(N'2015-11-22 11:38:28.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (51, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 11:38:31.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (52, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 11:42:26.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (53, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 11:42:35.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (54, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 11:42:40.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (55, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 11:42:45.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (56, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 11:42:56.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (57, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 11:44:51.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (58, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 11:44:56.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (59, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 11:45:13.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (60, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 11:45:24.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (61, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 12:06:11.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (62, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 12:08:31.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (63, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 12:08:38.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (64, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 12:16:03.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (65, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 12:16:08.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (66, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 12:16:11.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (67, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 12:17:13.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (68, N'5c3d069e-123d-4720-b825-08abbc270295', 2, CAST(N'2015-11-22 12:17:16.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (69, N'd9db1283-ce8d-4a2b-8635-7bce800084a4', 4, CAST(N'2015-11-22 22:43:37.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (70, N'd9db1283-ce8d-4a2b-8635-7bce800084a4', 4, CAST(N'2015-11-23 08:31:28.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (71, N'd9db1283-ce8d-4a2b-8635-7bce800084a4', 4, CAST(N'2015-11-23 08:31:28.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (72, N'd9db1283-ce8d-4a2b-8635-7bce800084a4', 4, CAST(N'2015-11-23 08:31:28.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (73, N'd9db1283-ce8d-4a2b-8635-7bce800084a4', 4, CAST(N'2015-11-23 08:31:28.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (74, N'd9db1283-ce8d-4a2b-8635-7bce800084a4', 4, CAST(N'2015-11-23 08:31:28.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (75, N'd9db1283-ce8d-4a2b-8635-7bce800084a4', 4, CAST(N'2015-11-23 08:31:28.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (76, N'62a24fec-2dfc-43b4-ac20-166e7c580f82', 4, CAST(N'2015-12-01 21:18:06.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (77, N'62a24fec-2dfc-43b4-ac20-166e7c580f82', 4, CAST(N'2015-12-04 20:48:57.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (78, N'f1ae2650-69fd-422b-8ea0-3e767045780f', 4, CAST(N'2015-12-04 20:49:00.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (79, N'f1ae2650-69fd-422b-8ea0-3e767045780f', 4, CAST(N'2015-12-05 13:29:17.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (80, N'28760477-7a15-4b80-8204-6ec7237be9fb', 4, CAST(N'2015-12-05 13:29:21.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (81, N'28760477-7a15-4b80-8204-6ec7237be9fb', 4, CAST(N'2015-12-06 15:13:28.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (82, N'e89c3904-b921-40ea-bafb-c3d3c3a2f7e8', 4, CAST(N'2015-12-06 15:13:32.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (83, N'e89c3904-b921-40ea-bafb-c3d3c3a2f7e8', 4, CAST(N'2015-12-07 17:59:02.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (84, N'e89c3904-b921-40ea-bafb-c3d3c3a2f7e8', 4, CAST(N'2015-12-07 17:59:03.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (85, N'e89c3904-b921-40ea-bafb-c3d3c3a2f7e8', 4, CAST(N'2015-12-08 19:21:20.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (86, N'830384fe-7b10-4312-979e-ad68dba4ab04', 4, CAST(N'2015-12-08 19:21:23.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1085, N'830384fe-7b10-4312-979e-ad68dba4ab04', 4, CAST(N'2015-12-10 22:41:34.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1086, N'506b52be-5ed9-49f7-b501-9d21069e9272', 4, CAST(N'2015-12-10 22:41:37.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1087, N'506b52be-5ed9-49f7-b501-9d21069e9272', 4, CAST(N'2016-01-02 14:57:09.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1088, N'fefb93d9-b2e4-438d-9f52-e4ae306bb450', 4, CAST(N'2016-02-28 14:35:26.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1089, N'fefb93d9-b2e4-438d-9f52-e4ae306bb450', 4, CAST(N'2016-02-28 14:35:34.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1090, N'fefb93d9-b2e4-438d-9f52-e4ae306bb450', 4, CAST(N'2016-02-28 14:35:42.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1091, N'fefb93d9-b2e4-438d-9f52-e4ae306bb450', 4, CAST(N'2016-02-28 14:35:44.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1092, N'2dd9c2a9-003b-4cc3-bf77-52efab2d6780', 4, CAST(N'2016-02-28 14:35:47.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1093, N'2dd9c2a9-003b-4cc3-bf77-52efab2d6780', 4, CAST(N'2016-02-28 14:35:49.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1094, N'2dd9c2a9-003b-4cc3-bf77-52efab2d6780', 4, CAST(N'2016-02-28 14:35:57.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1095, N'2dd9c2a9-003b-4cc3-bf77-52efab2d6780', 4, CAST(N'2016-02-28 14:35:58.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1096, N'd54763d9-e729-477d-a2f6-b7c914a471f5', 4, CAST(N'2016-02-28 14:36:02.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1097, N'd54763d9-e729-477d-a2f6-b7c914a471f5', 4, CAST(N'2016-02-28 14:36:11.000' AS DateTime), N'BreakIn', NULL)
GO
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1098, N'd54763d9-e729-477d-a2f6-b7c914a471f5', 4, CAST(N'2016-02-28 14:36:21.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1099, N'd54763d9-e729-477d-a2f6-b7c914a471f5', 4, CAST(N'2016-02-28 14:36:22.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1100, N'bd463f5f-d8b4-4791-bbd0-6768aa79e6c9', 4, CAST(N'2016-02-28 15:36:51.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1101, N'bd463f5f-d8b4-4791-bbd0-6768aa79e6c9', 4, CAST(N'2016-02-28 15:37:10.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1102, N'bd463f5f-d8b4-4791-bbd0-6768aa79e6c9', 4, CAST(N'2016-02-28 15:37:17.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1103, N'bd463f5f-d8b4-4791-bbd0-6768aa79e6c9', 4, CAST(N'2016-02-28 15:37:19.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1104, N'01af81f2-31a6-4603-af43-976139e0a212', 4, CAST(N'2016-05-13 21:06:28.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1105, N'01af81f2-31a6-4603-af43-976139e0a212', 4, CAST(N'2016-05-13 21:06:31.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1106, N'd4a7f7e2-01f4-4552-a549-32e8b06f8ff7', 4, CAST(N'2016-05-14 07:17:00.000' AS DateTime), N'btnProjectPunch', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1107, N'd4a7f7e2-01f4-4552-a549-32e8b06f8ff7', 4, CAST(N'2016-05-15 10:23:51.000' AS DateTime), N'btnProjectPunch', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (1108, N'd4a7f7e2-01f4-4552-a549-32e8b06f8ff7', 4, CAST(N'2016-05-15 10:41:33.000' AS DateTime), N'btnProjectPunch', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2107, N'd4a7f7e2-01f4-4552-a549-32e8b06f8ff7', 4, CAST(N'2016-05-15 20:32:12.000' AS DateTime), N'btnProjectPunch', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2108, N'd4a7f7e2-01f4-4552-a549-32e8b06f8ff7', 4, CAST(N'2017-02-16 02:54:27.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2109, N'd4a7f7e2-01f4-4552-a549-32e8b06f8ff7', 4, CAST(N'2017-02-16 03:43:52.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2110, N'b7fc0cdb-a07d-426c-8ff0-97d0da80bc07', 4, CAST(N'2017-03-17 01:43:12.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2111, N'b7fc0cdb-a07d-426c-8ff0-97d0da80bc07', 4, CAST(N'2017-03-17 01:50:59.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2112, N'0f36d306-5568-4d52-a3c6-6d449d18e2ac', 4, CAST(N'2017-03-18 22:36:35.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2113, N'0f36d306-5568-4d52-a3c6-6d449d18e2ac', 4, CAST(N'2017-03-19 02:21:51.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2114, N'0f36d306-5568-4d52-a3c6-6d449d18e2ac', 4, CAST(N'2017-03-19 11:01:35.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2115, N'0f36d306-5568-4d52-a3c6-6d449d18e2ac', 4, CAST(N'2017-03-19 11:01:47.000' AS DateTime), N'BreakIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2116, N'0f36d306-5568-4d52-a3c6-6d449d18e2ac', 4, CAST(N'2017-03-19 11:01:54.000' AS DateTime), N'BreakOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2117, N'0f36d306-5568-4d52-a3c6-6d449d18e2ac', 4, CAST(N'2017-03-19 11:01:56.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2118, N'4661ac04-dfce-48e4-b2e6-93464f02bbad', 4, CAST(N'2017-03-21 07:59:16.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2119, N'4661ac04-dfce-48e4-b2e6-93464f02bbad', 4, CAST(N'2017-03-21 15:40:41.000' AS DateTime), N'ClockOut', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2120, N'5d6f3356-3828-4d93-b03d-e39a13abcc58', 4, CAST(N'2017-03-28 21:43:52.000' AS DateTime), N'ClockIn', NULL)
INSERT [dbo].[Attendance] ([id], [LinkID], [UserID], [PunchDateTime], [CurrentPunchType], [Notes]) VALUES (2121, N'5d6f3356-3828-4d93-b03d-e39a13abcc58', 4, CAST(N'2017-03-28 21:43:54.000' AS DateTime), N'ClockOut', NULL)
SET IDENTITY_INSERT [dbo].[Attendance] OFF
SET IDENTITY_INSERT [dbo].[AutoDeduction] ON 

INSERT [dbo].[AutoDeduction] ([id], [ForAbsence], [AbsenceAmount], [ForLeaveWithoutPay], [LeaveWithoutPayAmount], [ForHalfDayLeave], [HalfDayLeaveAmount], [ForLateAttendance], [LateMinutesFrom], [LateMinutesTo], [Amount], [LateAmountType], [AbsenceAmountType], [LeaveWithoutPayAmountType], [HalfDayLeaveAmountType], [LinkID]) VALUES (11, 0, CAST(1 AS Decimal(18, 0)), 1, CAST(1 AS Decimal(18, 0)), 0, CAST(2 AS Decimal(18, 0)), 0, 5, 10, CAST(10.00 AS Decimal(18, 2)), N'Specified Amount', N'Specified Amount', N'Specified Amount', N'Specified Amount', N'f5000d9b-0433-4ce0-8f4c-2ebde750773e')
INSERT [dbo].[AutoDeduction] ([id], [ForAbsence], [AbsenceAmount], [ForLeaveWithoutPay], [LeaveWithoutPayAmount], [ForHalfDayLeave], [HalfDayLeaveAmount], [ForLateAttendance], [LateMinutesFrom], [LateMinutesTo], [Amount], [LateAmountType], [AbsenceAmountType], [LeaveWithoutPayAmountType], [HalfDayLeaveAmountType], [LinkID]) VALUES (12, 0, CAST(1 AS Decimal(18, 0)), 1, CAST(1 AS Decimal(18, 0)), 0, CAST(2 AS Decimal(18, 0)), 0, 7, 7, CAST(7.00 AS Decimal(18, 2)), N'Quarter Day Salary', N'Specified Amount', N'Specified Amount', N'Specified Amount', N'f5000d9b-0433-4ce0-8f4c-2ebde750773e')
INSERT [dbo].[AutoDeduction] ([id], [ForAbsence], [AbsenceAmount], [ForLeaveWithoutPay], [LeaveWithoutPayAmount], [ForHalfDayLeave], [HalfDayLeaveAmount], [ForLateAttendance], [LateMinutesFrom], [LateMinutesTo], [Amount], [LateAmountType], [AbsenceAmountType], [LeaveWithoutPayAmountType], [HalfDayLeaveAmountType], [LinkID]) VALUES (13, 0, CAST(1 AS Decimal(18, 0)), 1, CAST(1 AS Decimal(18, 0)), 0, CAST(2 AS Decimal(18, 0)), 0, 7, 7, CAST(7.00 AS Decimal(18, 2)), N'Specified Amount', N'Specified Amount', N'Specified Amount', N'Specified Amount', N'f5000d9b-0433-4ce0-8f4c-2ebde750773e')
INSERT [dbo].[AutoDeduction] ([id], [ForAbsence], [AbsenceAmount], [ForLeaveWithoutPay], [LeaveWithoutPayAmount], [ForHalfDayLeave], [HalfDayLeaveAmount], [ForLateAttendance], [LateMinutesFrom], [LateMinutesTo], [Amount], [LateAmountType], [AbsenceAmountType], [LeaveWithoutPayAmountType], [HalfDayLeaveAmountType], [LinkID]) VALUES (14, 0, CAST(1 AS Decimal(18, 0)), 1, CAST(1 AS Decimal(18, 0)), 0, CAST(2 AS Decimal(18, 0)), 0, 7, 7, CAST(7.00 AS Decimal(18, 2)), N'Two Days Salary', N'Specified Amount', N'Specified Amount', N'Specified Amount', N'f5000d9b-0433-4ce0-8f4c-2ebde750773e')
INSERT [dbo].[AutoDeduction] ([id], [ForAbsence], [AbsenceAmount], [ForLeaveWithoutPay], [LeaveWithoutPayAmount], [ForHalfDayLeave], [HalfDayLeaveAmount], [ForLateAttendance], [LateMinutesFrom], [LateMinutesTo], [Amount], [LateAmountType], [AbsenceAmountType], [LeaveWithoutPayAmountType], [HalfDayLeaveAmountType], [LinkID]) VALUES (15, 0, CAST(1 AS Decimal(18, 0)), 1, CAST(1 AS Decimal(18, 0)), 0, CAST(2 AS Decimal(18, 0)), 0, 7, 7, CAST(7.00 AS Decimal(18, 2)), N'Specified Amount', N'Specified Amount', N'Specified Amount', N'Specified Amount', N'f5000d9b-0433-4ce0-8f4c-2ebde750773e')
SET IDENTITY_INSERT [dbo].[AutoDeduction] OFF
SET IDENTITY_INSERT [dbo].[AutoOvertime] ON 

INSERT [dbo].[AutoOvertime] ([id], [MinutesFrom], [MinutesTo], [OvertimeAmountType], [Amount]) VALUES (7, 7, 7, N'Specified Amount', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[AutoOvertime] ([id], [MinutesFrom], [MinutesTo], [OvertimeAmountType], [Amount]) VALUES (8, 7, 7, N'Two Days Salary', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[AutoOvertime] ([id], [MinutesFrom], [MinutesTo], [OvertimeAmountType], [Amount]) VALUES (9, 7, 7, N'Quarter Day Salary', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[AutoOvertime] ([id], [MinutesFrom], [MinutesTo], [OvertimeAmountType], [Amount]) VALUES (10, 7, 7, N'Specified Amount', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[AutoOvertime] ([id], [MinutesFrom], [MinutesTo], [OvertimeAmountType], [Amount]) VALUES (11, 7, 7, N'Half Day Salary', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[AutoOvertime] ([id], [MinutesFrom], [MinutesTo], [OvertimeAmountType], [Amount]) VALUES (12, 7, 7, N'Two Days Salary', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[AutoOvertime] ([id], [MinutesFrom], [MinutesTo], [OvertimeAmountType], [Amount]) VALUES (13, 7, 7, N'Quarter Day Salary', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[AutoOvertime] ([id], [MinutesFrom], [MinutesTo], [OvertimeAmountType], [Amount]) VALUES (14, 7, 7, N'Half Day Salary', CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[AutoOvertime] ([id], [MinutesFrom], [MinutesTo], [OvertimeAmountType], [Amount]) VALUES (15, 7, 7, N'Quarter Day Salary', CAST(7.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[AutoOvertime] OFF
SET IDENTITY_INSERT [dbo].[CandidateEducation] ON 

INSERT [dbo].[CandidateEducation] ([id], [LinkID], [Degree], [Subject], [Institute], [Grade], [GraduationYear]) VALUES (1, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'Master of Art', N'9', N'9', CAST(2.34 AS Decimal(9, 2)), 2010)
INSERT [dbo].[CandidateEducation] ([id], [LinkID], [Degree], [Subject], [Institute], [Grade], [GraduationYear]) VALUES (2, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'Master of Business', N'8', N'8', CAST(4.00 AS Decimal(9, 2)), 1965)
INSERT [dbo].[CandidateEducation] ([id], [LinkID], [Degree], [Subject], [Institute], [Grade], [GraduationYear]) VALUES (3, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'Master of Science', N'7', N'7', CAST(3.22 AS Decimal(9, 2)), 1999)
INSERT [dbo].[CandidateEducation] ([id], [LinkID], [Degree], [Subject], [Institute], [Grade], [GraduationYear]) VALUES (4, N'40069fbd-a353-4bb2-9364-b5210f725664', N'BBA', N'Computer Information Systems', N'SFASU', CAST(3.98 AS Decimal(9, 2)), 2012)
INSERT [dbo].[CandidateEducation] ([id], [LinkID], [Degree], [Subject], [Institute], [Grade], [GraduationYear]) VALUES (5, N'40069fbd-a353-4bb2-9364-b5210f725664', N'BBA', N'Computer Information Systems', N'SFASU', CAST(3.98 AS Decimal(9, 2)), 2012)
INSERT [dbo].[CandidateEducation] ([id], [LinkID], [Degree], [Subject], [Institute], [Grade], [GraduationYear]) VALUES (6, N'40069fbd-a353-4bb2-9364-b5210f725664', N'BBA', N'Computer Information Systems', N'SFASU', CAST(3.98 AS Decimal(9, 2)), 2012)
SET IDENTITY_INSERT [dbo].[CandidateEducation] OFF
SET IDENTITY_INSERT [dbo].[CandidateLanguage] ON 

INSERT [dbo].[CandidateLanguage] ([id], [LinkID], [Language], [ListeningLevel], [SpeakingLevel], [ReadingLevel], [WritingLevel]) VALUES (1, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'6', N'6', N'6', N'6', N'6')
INSERT [dbo].[CandidateLanguage] ([id], [LinkID], [Language], [ListeningLevel], [SpeakingLevel], [ReadingLevel], [WritingLevel]) VALUES (2, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'6', N'6', N'6', N'6', N'6')
INSERT [dbo].[CandidateLanguage] ([id], [LinkID], [Language], [ListeningLevel], [SpeakingLevel], [ReadingLevel], [WritingLevel]) VALUES (3, N'40069fbd-a353-4bb2-9364-b5210f725664', N'English', N'10', N'10', N'10', N'10')
INSERT [dbo].[CandidateLanguage] ([id], [LinkID], [Language], [ListeningLevel], [SpeakingLevel], [ReadingLevel], [WritingLevel]) VALUES (4, N'40069fbd-a353-4bb2-9364-b5210f725664', N'English', N'10', N'10', N'10', N'10')
INSERT [dbo].[CandidateLanguage] ([id], [LinkID], [Language], [ListeningLevel], [SpeakingLevel], [ReadingLevel], [WritingLevel]) VALUES (5, N'40069fbd-a353-4bb2-9364-b5210f725664', N'English', N'10', N'10', N'10', N'10')
SET IDENTITY_INSERT [dbo].[CandidateLanguage] OFF
SET IDENTITY_INSERT [dbo].[CandidateReference] ON 

INSERT [dbo].[CandidateReference] ([id], [LinkID], [Name], [Organization], [Phone], [Email]) VALUES (1, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'789', N'789', N'789', N'789')
INSERT [dbo].[CandidateReference] ([id], [LinkID], [Name], [Organization], [Phone], [Email]) VALUES (2, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'678', N'687', N'678', N'687')
INSERT [dbo].[CandidateReference] ([id], [LinkID], [Name], [Organization], [Phone], [Email]) VALUES (3, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Nick', N'sfasu', N'1231231232', N'jan@gmail.com')
INSERT [dbo].[CandidateReference] ([id], [LinkID], [Name], [Organization], [Phone], [Email]) VALUES (4, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Mary', N'SFASU', N'1231231234', N'jan@kkkcciik.com')
SET IDENTITY_INSERT [dbo].[CandidateReference] OFF
SET IDENTITY_INSERT [dbo].[CandidateScore] ON 

INSERT [dbo].[CandidateScore] ([id], [LinkID], [DressCode], [Attitude], [CommunicationSkills], [TechnicalKnowledge], [Confidence], [Potential], [LearningAbility], [MentalCapacity], [AnalytialApproach], [WillingnessToWork], [RatedBy]) VALUES (1, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', 5, 8, 9, 8, 7, 8, 7, 8, 7, 8, 1)
INSERT [dbo].[CandidateScore] ([id], [LinkID], [DressCode], [Attitude], [CommunicationSkills], [TechnicalKnowledge], [Confidence], [Potential], [LearningAbility], [MentalCapacity], [AnalytialApproach], [WillingnessToWork], [RatedBy]) VALUES (2, N'b0895b45-ca1f-44ec-a860-981863caa5ea', 5, 4, 4, 5, 7, 6, 8, 7, 7, 8, 1)
INSERT [dbo].[CandidateScore] ([id], [LinkID], [DressCode], [Attitude], [CommunicationSkills], [TechnicalKnowledge], [Confidence], [Potential], [LearningAbility], [MentalCapacity], [AnalytialApproach], [WillingnessToWork], [RatedBy]) VALUES (3, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', 3, 7, 4, 8, 3, 5, 8, 2, 5, 8, 4)
INSERT [dbo].[CandidateScore] ([id], [LinkID], [DressCode], [Attitude], [CommunicationSkills], [TechnicalKnowledge], [Confidence], [Potential], [LearningAbility], [MentalCapacity], [AnalytialApproach], [WillingnessToWork], [RatedBy]) VALUES (4, N'40069fbd-a353-4bb2-9364-b5210f725664', 0, 7, 0, 5, 0, 0, 8, 0, 9, 0, 4)
INSERT [dbo].[CandidateScore] ([id], [LinkID], [DressCode], [Attitude], [CommunicationSkills], [TechnicalKnowledge], [Confidence], [Potential], [LearningAbility], [MentalCapacity], [AnalytialApproach], [WillingnessToWork], [RatedBy]) VALUES (5, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', 0, 0, 3, 0, 6, 0, 4, 0, 8, 5, 4)
INSERT [dbo].[CandidateScore] ([id], [LinkID], [DressCode], [Attitude], [CommunicationSkills], [TechnicalKnowledge], [Confidence], [Potential], [LearningAbility], [MentalCapacity], [AnalytialApproach], [WillingnessToWork], [RatedBy]) VALUES (6, N'40069fbd-a353-4bb2-9364-b5210f725664', 6, 0, 10, 5, 0, 8, 0, 0, 0, 0, 4)
INSERT [dbo].[CandidateScore] ([id], [LinkID], [DressCode], [Attitude], [CommunicationSkills], [TechnicalKnowledge], [Confidence], [Potential], [LearningAbility], [MentalCapacity], [AnalytialApproach], [WillingnessToWork], [RatedBy]) VALUES (7, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', 6, 0, 6, 0, 7, 0, 0, 0, 7, 5, 4)
INSERT [dbo].[CandidateScore] ([id], [LinkID], [DressCode], [Attitude], [CommunicationSkills], [TechnicalKnowledge], [Confidence], [Potential], [LearningAbility], [MentalCapacity], [AnalytialApproach], [WillingnessToWork], [RatedBy]) VALUES (8, N'40069fbd-a353-4bb2-9364-b5210f725664', 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 4)
SET IDENTITY_INSERT [dbo].[CandidateScore] OFF
SET IDENTITY_INSERT [dbo].[CandidateSkill] ON 

INSERT [dbo].[CandidateSkill] ([id], [LinkID], [SkillName], [SkillLevel]) VALUES (1, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'67', N'67')
INSERT [dbo].[CandidateSkill] ([id], [LinkID], [SkillName], [SkillLevel]) VALUES (2, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'67', N'77')
INSERT [dbo].[CandidateSkill] ([id], [LinkID], [SkillName], [SkillLevel]) VALUES (3, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Eating', N'10')
INSERT [dbo].[CandidateSkill] ([id], [LinkID], [SkillName], [SkillLevel]) VALUES (4, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Sleeping', N'10')
INSERT [dbo].[CandidateSkill] ([id], [LinkID], [SkillName], [SkillLevel]) VALUES (5, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Eating', N'10')
INSERT [dbo].[CandidateSkill] ([id], [LinkID], [SkillName], [SkillLevel]) VALUES (6, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Sleeping', N'10')
INSERT [dbo].[CandidateSkill] ([id], [LinkID], [SkillName], [SkillLevel]) VALUES (7, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Eating', N'10')
INSERT [dbo].[CandidateSkill] ([id], [LinkID], [SkillName], [SkillLevel]) VALUES (8, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Sleeping', N'10')
SET IDENTITY_INSERT [dbo].[CandidateSkill] OFF
SET IDENTITY_INSERT [dbo].[CandidateTraining] ON 

INSERT [dbo].[CandidateTraining] ([id], [LinkID], [Field], [OrganizationName], [TrainingTitle], [Location]) VALUES (1, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'809', N'890', N'890', N'890')
INSERT [dbo].[CandidateTraining] ([id], [LinkID], [Field], [OrganizationName], [TrainingTitle], [Location]) VALUES (2, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'789', N'798', N'798', N'798')
INSERT [dbo].[CandidateTraining] ([id], [LinkID], [Field], [OrganizationName], [TrainingTitle], [Location]) VALUES (3, N'40069fbd-a353-4bb2-9364-b5210f725664', N'cool', N'sfasu', N'eating nice', N'Lufkin')
INSERT [dbo].[CandidateTraining] ([id], [LinkID], [Field], [OrganizationName], [TrainingTitle], [Location]) VALUES (4, N'40069fbd-a353-4bb2-9364-b5210f725664', N'cool', N'sfasu', N'eating nice', N'Lufkin')
INSERT [dbo].[CandidateTraining] ([id], [LinkID], [Field], [OrganizationName], [TrainingTitle], [Location]) VALUES (5, N'40069fbd-a353-4bb2-9364-b5210f725664', N'cool', N'sfasu', N'eating nice', N'Lufkin')
SET IDENTITY_INSERT [dbo].[CandidateTraining] OFF
SET IDENTITY_INSERT [dbo].[CandidateWorkExperience] ON 

INSERT [dbo].[CandidateWorkExperience] ([id], [LinkID], [JobField], [OrganizationName], [Designation], [StartDate], [EndDate], [JobDescription]) VALUES (1, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'890', N'890', N'809', CAST(N'2015-11-17 00:00:00.000' AS DateTime), CAST(N'2015-11-17 00:00:00.000' AS DateTime), N'78789080')
INSERT [dbo].[CandidateWorkExperience] ([id], [LinkID], [JobField], [OrganizationName], [Designation], [StartDate], [EndDate], [JobDescription]) VALUES (2, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'78789', N'789789', N'798798', CAST(N'2011-11-10 00:00:00.000' AS DateTime), CAST(N'2015-11-23 00:00:00.000' AS DateTime), N'890809')
INSERT [dbo].[CandidateWorkExperience] ([id], [LinkID], [JobField], [OrganizationName], [Designation], [StartDate], [EndDate], [JobDescription]) VALUES (3, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Developer', N'SFASU', N'Cool', CAST(N'2011-11-01 00:00:00.000' AS DateTime), CAST(N'2015-11-28 00:00:00.000' AS DateTime), N'Coding the shit')
INSERT [dbo].[CandidateWorkExperience] ([id], [LinkID], [JobField], [OrganizationName], [Designation], [StartDate], [EndDate], [JobDescription]) VALUES (4, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Technician', N'SFASU', N'cool', CAST(N'2011-11-02 00:00:00.000' AS DateTime), CAST(N'2016-09-02 00:00:00.000' AS DateTime), N'Get the thing done')
INSERT [dbo].[CandidateWorkExperience] ([id], [LinkID], [JobField], [OrganizationName], [Designation], [StartDate], [EndDate], [JobDescription]) VALUES (5, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Developer', N'SFASU', N'Cool', CAST(N'2011-11-01 00:00:00.000' AS DateTime), CAST(N'2015-11-28 00:00:00.000' AS DateTime), N'Coding the shit')
INSERT [dbo].[CandidateWorkExperience] ([id], [LinkID], [JobField], [OrganizationName], [Designation], [StartDate], [EndDate], [JobDescription]) VALUES (6, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Technician', N'SFASU', N'cool', CAST(N'2011-11-02 00:00:00.000' AS DateTime), CAST(N'2016-09-02 00:00:00.000' AS DateTime), N'Get the thing done')
INSERT [dbo].[CandidateWorkExperience] ([id], [LinkID], [JobField], [OrganizationName], [Designation], [StartDate], [EndDate], [JobDescription]) VALUES (7, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Developer', N'SFASU', N'Cool', CAST(N'2011-11-01 00:00:00.000' AS DateTime), CAST(N'2015-11-28 00:00:00.000' AS DateTime), N'Coding the shit')
INSERT [dbo].[CandidateWorkExperience] ([id], [LinkID], [JobField], [OrganizationName], [Designation], [StartDate], [EndDate], [JobDescription]) VALUES (8, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Technician', N'SFASU', N'cool', CAST(N'2015-11-02 00:00:00.000' AS DateTime), CAST(N'2016-09-02 00:00:00.000' AS DateTime), N'Get the thing done')
SET IDENTITY_INSERT [dbo].[CandidateWorkExperience] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([id], [Name], [Address1], [Address2], [City], [State], [Country], [Zip], [Phone], [Email], [Fax], [Logo], [URL]) VALUES (1, N'DP Solution Inc.', N'1st North Street 1880', N'None', N'Lufkin', N'TN', N'USA', N'75962', N'1231231234', N'info@dpsol.com', N'1231231234', N'logo1.PNG', N'http://www.dpsol.com')
INSERT [dbo].[Company] ([id], [Name], [Address1], [Address2], [City], [State], [Country], [Zip], [Phone], [Email], [Fax], [Logo], [URL]) VALUES (2, N'Apple Inc.', N'100 Infinite Loop', NULL, N'Cuppotino', N'LA', N'USA', N'75901', N'8908908091', N'qa@apple.com', N'1231237980', N'809.jpg', N'http://www.apple.com')
INSERT [dbo].[Company] ([id], [Name], [Address1], [Address2], [City], [State], [Country], [Zip], [Phone], [Email], [Fax], [Logo], [URL]) VALUES (3, N'Microsoft', N'100th St.', NULL, N'Seatle', N'WA', N'USA', N'90001', N'7896785678', N'ms@microsoft.com', N'7987981234', N'golg', N'http://www.microsoft.com')
INSERT [dbo].[Company] ([id], [Name], [Address1], [Address2], [City], [State], [Country], [Zip], [Phone], [Email], [Fax], [Logo], [URL]) VALUES (4, N'Google Inc.', N'1 Infinite Loop', NULL, N'Los Angela', N'LA', N'USA', N'89990', N'1231231234', N'hr@google.com', N'1231231234', N'google.png', N'http://www.google.com')
INSERT [dbo].[Company] ([id], [Name], [Address1], [Address2], [City], [State], [Country], [Zip], [Phone], [Email], [Fax], [Logo], [URL]) VALUES (5, N'798', N'798', NULL, N'798', N'AL', N'798', N'798', N'798', N'798@c.v', N'890', N'C:\Users\jianhengzhang\Documents\Visual Studio 2015\Projects\Florence\Florence\Images\google.png', N'http://www.google.com')
INSERT [dbo].[Company] ([id], [Name], [Address1], [Address2], [City], [State], [Country], [Zip], [Phone], [Email], [Fax], [Logo], [URL]) VALUES (6, N'798', N'798', N'798', N'798', N'AL', N'798', N'798', N'7798', N'798@78.c', N'798', N'google.png', N'http://www.apple.com')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Complaint] ON 

INSERT [dbo].[Complaint] ([id], [ComplaintFrom], [ComplaintTitle], [ComplaintDate], [Description], [CreatedBy], [CreatedAt]) VALUES (1, 0, N'I complain you', CAST(N'2015-11-03 00:00:00.000' AS DateTime), N'<p>Hundreds of Scenarios Out-of-the-Box</p><p>Kendo UI Core comes with 40+ widgets and framework features for creating HTML5 and JavaScript projects, without the worries of cross-browser compatibility, standards compliance or touch-device support.</p>', 2, CAST(N'2015-11-19 21:02:31.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Complaint] OFF
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([id], [EmployeeID], [ContractType], [Title], [StartDate], [EndDate], [Designation], [EmployeeType], [EmployeeCategory], [EmployeeGrade], [Station], [Department], [ContactDesc], [CreatedBy], [CreatedAt], [ContractFilePath]) VALUES (1, 2, N'Contractual', N'13', CAST(N'2015-11-02 00:00:00.000' AS DateTime), CAST(N'2015-11-26 00:00:00.000' AS DateTime), N'Chief Technology Officer', N'Support Employees', N'Auxiliary', N'123', N'123', 1, N'809890', 2, CAST(N'2015-11-19 22:32:32.000' AS DateTime), N'8098098')
INSERT [dbo].[Contract] ([id], [EmployeeID], [ContractType], [Title], [StartDate], [EndDate], [Designation], [EmployeeType], [EmployeeCategory], [EmployeeGrade], [Station], [Department], [ContactDesc], [CreatedBy], [CreatedAt], [ContractFilePath]) VALUES (3, 4, N'Probationary', N'First News Ever!!!!', CAST(N'2015-11-02 00:00:00.000' AS DateTime), CAST(N'2015-11-26 00:00:00.000' AS DateTime), N'Chief Financial Officer', N'Project Employees', N'Management', N'123', NULL, 2, N'<p>123123124123412342</p>', 2, CAST(N'2015-11-19 22:51:57.000' AS DateTime), N'213412341235')
INSERT [dbo].[Contract] ([id], [EmployeeID], [ContractType], [Title], [StartDate], [EndDate], [Designation], [EmployeeType], [EmployeeCategory], [EmployeeGrade], [Station], [Department], [ContactDesc], [CreatedBy], [CreatedAt], [ContractFilePath]) VALUES (4, 4, N'Contractual', N'First News33333 Ever!!!!', CAST(N'2015-11-02 00:00:00.000' AS DateTime), CAST(N'2015-11-26 00:00:00.000' AS DateTime), N'Chief Technology Officer', N'Regular Employees', N'Professional', N'123', NULL, 3, N'<p>wryerty</p>', 2, CAST(N'2015-11-19 22:52:28.000' AS DateTime), N'12341234123')
SET IDENTITY_INSERT [dbo].[Contract] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (1, N'Chief Financial Officer', NULL, NULL)
INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (2, N'Chief Technology Officer', N'President', NULL)
INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (3, N'HR Manager', NULL, NULL)
INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (4, N'Junior Software Engineer', NULL, NULL)
INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (5, N'Learning Executive', NULL, NULL)
INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (6, N'Learning Manager', NULL, NULL)
INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (7, N'President', NULL, NULL)
INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (8, N'Software Engineer', NULL, NULL)
INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (9, N'Administrator', NULL, NULL)
INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (10, N'Graphics Designer', NULL, NULL)
INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (11, N'Project Director', N'President', NULL)
INSERT [dbo].[Designation] ([id], [DesignationName], [ParentDesignation], [JobDescription]) VALUES (12, N'Contractor Manager', N'HR Manager', NULL)
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([id], [Type], [Category], [Designation], [Station], [Department], [Grade], [WorkShift], [UserName], [Password], [Email], [ShowInOrganogram], [NotificationByEmail], [ReportTo], [Salutation], [FirstName], [LastName], [DOB], [Gender], [BloodGroup], [Nationality], [JoiningDate], [GovernmentID], [SSN], [PassportID], [PassportExpiration], [DriverLicense], [DriverLicenseExpiration], [Address], [City], [State], [Zip], [Country], [HomePhone], [OfficePhone], [Mobile], [EmergencyContactName], [EmergencyRelationship], [EmergencyPhone], [IsActive], [CreatedBy], [CreatedAt], [AvetarPath]) VALUES (1, N'Project Employees', N'Professional', N'Chief Technology Officer', NULL, 3, N'890', N'Cook WS', N'Joanna', N'890', N'890', 0, 0, 9, N'809', N'Joanna', N'Scrott', CAST(N'2015-12-02 00:00:00.000' AS DateTime), N'Male', N'890', N'890', CAST(N'2015-11-17 00:00:00.000' AS DateTime), N'809', N'809', N'809', CAST(N'2015-11-25 00:00:00.000' AS DateTime), N'890', CAST(N'2015-11-16 00:00:00.000' AS DateTime), N'8098', N'890', N'8908', N'90', N'890', N'809', N'8908', N'9080', N'9809', N'890', N'890', 1, 1, CAST(N'2015-11-16 17:36:20.000' AS DateTime), N'890')
INSERT [dbo].[Employee] ([id], [Type], [Category], [Designation], [Station], [Department], [Grade], [WorkShift], [UserName], [Password], [Email], [ShowInOrganogram], [NotificationByEmail], [ReportTo], [Salutation], [FirstName], [LastName], [DOB], [Gender], [BloodGroup], [Nationality], [JoiningDate], [GovernmentID], [SSN], [PassportID], [PassportExpiration], [DriverLicense], [DriverLicenseExpiration], [Address], [City], [State], [Zip], [Country], [HomePhone], [OfficePhone], [Mobile], [EmergencyContactName], [EmergencyRelationship], [EmergencyPhone], [IsActive], [CreatedBy], [CreatedAt], [AvetarPath]) VALUES (2, N'Project Employees', N'Auxiliary', N'HR Manager', NULL, 2, N'12', N'Random Time', N'jansen', N'890809809', N'jasne@gmail.com', 1, 1, 1, N'Mrs.', N'Drall', N'diik', CAST(N'2015-11-16 00:00:00.000' AS DateTime), N'Female', N'890', N'809', CAST(N'2015-11-25 00:00:00.000' AS DateTime), N'798', N'809', N'798', CAST(N'2015-11-13 00:00:00.000' AS DateTime), N'u80989080', CAST(N'2015-11-18 00:00:00.000' AS DateTime), N'789', N'789', N'798', N'798', N'798', N'798', N'798', N'798', N'789', N'798', N'7698', 1, 1, CAST(N'2015-11-16 19:36:42.000' AS DateTime), N'789')
INSERT [dbo].[Employee] ([id], [Type], [Category], [Designation], [Station], [Department], [Grade], [WorkShift], [UserName], [Password], [Email], [ShowInOrganogram], [NotificationByEmail], [ReportTo], [Salutation], [FirstName], [LastName], [DOB], [Gender], [BloodGroup], [Nationality], [JoiningDate], [GovernmentID], [SSN], [PassportID], [PassportExpiration], [DriverLicense], [DriverLicenseExpiration], [Address], [City], [State], [Zip], [Country], [HomePhone], [OfficePhone], [Mobile], [EmergencyContactName], [EmergencyRelationship], [EmergencyPhone], [IsActive], [CreatedBy], [CreatedAt], [AvetarPath]) VALUES (4, N'Regular Employees', N'Auxiliary', N'Junior Software Engineer', NULL, 3, N'123', N'First WS', N'test1', N'1000:2gxS3thqQOaPjQV0sZMlPah29Kn7rIlq:lzKoLK36yXWyNZpnlKm6/+S2gPEn7d+W', N'test1@gg.com', 0, 0, 1, N'Mrs.', N'Timmy', N'Cookie', CAST(N'2015-11-24 00:00:00.000' AS DateTime), N'Female', N'809', N'890', CAST(N'2015-11-01 00:00:00.000' AS DateTime), N'123222', N'123123222', N'123123123123', CAST(N'2015-11-25 00:00:00.000' AS DateTime), N'123123', CAST(N'2015-11-26 00:00:00.000' AS DateTime), N'687', N'678', N'687', N'687', N'687', N'678', N'687', N'687', N'678', N'687', N'687', 1, 1, CAST(N'2015-11-18 21:38:40.000' AS DateTime), N'687')
INSERT [dbo].[Employee] ([id], [Type], [Category], [Designation], [Station], [Department], [Grade], [WorkShift], [UserName], [Password], [Email], [ShowInOrganogram], [NotificationByEmail], [ReportTo], [Salutation], [FirstName], [LastName], [DOB], [Gender], [BloodGroup], [Nationality], [JoiningDate], [GovernmentID], [SSN], [PassportID], [PassportExpiration], [DriverLicense], [DriverLicenseExpiration], [Address], [City], [State], [Zip], [Country], [HomePhone], [OfficePhone], [Mobile], [EmergencyContactName], [EmergencyRelationship], [EmergencyPhone], [IsActive], [CreatedBy], [CreatedAt], [AvetarPath]) VALUES (5, N'Project Employees', N'Management', N'HR Manager', NULL, 3, N'1', N'Cook WS', N'test2', N'1000:rVVZGpArQyviB4usan76wwliWz2kVnz6:34IR6Fhu78Uz2wzYPU4ypjaEOQZn1MLh', N'test@test.com', 0, 0, 1, N'Mr.', N'John', N'Doeo', CAST(N'2001-01-18 00:00:00.000' AS DateTime), N'Male', N'b', N'China', CAST(N'2017-03-25 00:00:00.000' AS DateTime), N'1231231232', N'1231231232', N'1231231232', CAST(N'2017-03-29 00:00:00.000' AS DateTime), N'1231231232', CAST(N'2017-09-22 00:00:00.000' AS DateTime), N'2011 Google Drive', N'Lufkin', N'TX', N'123123', N'China', N'1231231232', N'1231231232', N'798789789', N'Gmail', N'friend', N'898989999', 1, 4, CAST(N'2017-03-25 02:42:23.000' AS DateTime), N'123')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[EmployeeExit] ON 

INSERT [dbo].[EmployeeExit] ([id], [Employee], [ExitDate], [TypeOfExit], [ConductedExitInterview], [Reason], [CreatedBy], [CreatedAt]) VALUES (1, 4, CAST(N'2015-11-18 00:00:00.000' AS DateTime), N'End of Temporary Appointment', 0, N'get out', 2, CAST(N'2015-11-20 16:59:28.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[EmployeeExit] OFF
SET IDENTITY_INSERT [dbo].[EmployeeJoining] ON 

INSERT [dbo].[EmployeeJoining] ([id], [EmployeeID], [JoiningDate], [Type], [Category], [Designation], [Station], [Department], [Note], [CreatedBy], [CreatedAt]) VALUES (1, 4, CAST(N'2015-11-09 00:00:00.000' AS DateTime), N'Support Employees', N'Auxiliary', N'Chief Financial Officer', NULL, 3, N'lkjlkjlkjl', 2, CAST(N'2015-11-20 21:10:25.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[EmployeeJoining] OFF
SET IDENTITY_INSERT [dbo].[Holiday] ON 

INSERT [dbo].[Holiday] ([id], [Title], [HolidayStartDate], [HolidayEndDate], [Description]) VALUES (1, N'holiday 1', CAST(N'2015-10-27 00:00:00.000' AS DateTime), CAST(N'2015-11-10 00:00:00.000' AS DateTime), N'<p>this is holiday</p>')
SET IDENTITY_INSERT [dbo].[Holiday] OFF
SET IDENTITY_INSERT [dbo].[HourlyWage] ON 

INSERT [dbo].[HourlyWage] ([id], [Employee], [Title], [RegularHoursRate], [OvertimeHoursRate], [Description], [CreatedAt], [CreatedBy]) VALUES (1, 2, N'Give me more', CAST(10.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), N'<p>oiqweuroiweuroipqeuropiqweuroiweurpoieus</p><p>poeiufosdijfoweiqru</p>', CAST(N'2015-12-01 15:45:28.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[HourlyWage] OFF
SET IDENTITY_INSERT [dbo].[Insurance] ON 

INSERT [dbo].[Insurance] ([id], [Employee], [InsuranceType], [Title], [EmployeeAmountPerMonth], [OrganizationSharePerMonth], [CreatedAt], [CreatedBy]) VALUES (1, 1, N'Health Insurance', N'8098908908', CAST(8989.00 AS Decimal(18, 2)), CAST(9090.00 AS Decimal(18, 2)), CAST(N'2015-12-01 22:16:06.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[Insurance] OFF
SET IDENTITY_INSERT [dbo].[JobInterview] ON 

INSERT [dbo].[JobInterview] ([id], [JobPost], [InterviewDate], [Interviewer1], [Interviewer2], [Interviewee1], [Interviewee2], [PlaceOfInterview], [InterviewDesc], [CreateBy], [CreateAt]) VALUES (1, N'Software Engineer', CAST(N'2015-10-28 00:00:00.000' AS DateTime), N'Jansen Zhang', N'Joey Hu', N'Hunter Cook', NULL, N'Main Office', N'<p>• Team Support:  Demonstrate a selfless commitment to others on the store team, including schedule and activity-based dependability, continuous improvement, and responding effectively to feedback. Actively seeks opportunities to contribute at higher level of service to the business, the customers, and others on the team.</p><p><br></p><p>o Show professionalism and enthusiasm by working well with others — deliver great team results</p><p><br></p><p>o Assist the team members with training store associates in all aspects of their job responsibilities, including company/store policies procedures, and guidelines.</p><p><br></p>', 1, CAST(N'2015-11-15 11:23:16.000' AS DateTime))
INSERT [dbo].[JobInterview] ([id], [JobPost], [InterviewDate], [Interviewer1], [Interviewer2], [Interviewee1], [Interviewee2], [PlaceOfInterview], [InterviewDesc], [CreateBy], [CreateAt]) VALUES (2, N'Software Engineer', CAST(N'2015-11-03 02:30:00.000' AS DateTime), N'Jim Cook', N'Terry Tom', N'Baidu Cook', NULL, N'nacogdoches', N'<p>o Adhere to all of GameStop''s ESRB policies and procedures</p><p><br></p><p>• Solution Selling Focus:  Drive sales and customer loyalty by creating complete, lasting customer solutions. Demonstrate unique interest in every customer. Ask questions and makes recommendations in order to make technology easier and more affordable for every customer.</p><p><br></p><p>o Promote GameStop’s unique customer benefits: new title reservations program, PowerUp Rewards Credit Card (PURCC) and PowerUp Rewards customer loyalty program.</p><p><br></p><p>o Promote GameStop’s emerging digital products to customers</p><p><br></p><p>o Respond to customer concerns quickly, effectively and courteously. Request management support as needed to ensure that every customer returns and recommends GameStop to others</p><p><br></p><p style="line-height: 18.5714px;">• Solution Selling Focus:  Drive sales and customer loyalty by creating complete, lasting customer solutions. Demonstrate unique interest in every customer. Ask questions and makes recommendations in order to make technology easier and more affordable for every customer.</p><p style="line-height: 18.5714px;"><br></p><p style="line-height: 18.5714px;">o Promote GameStop’s unique customer benefits: new title reservations program, PowerUp Rewards Credit Card (PURCC) and PowerUp Rewards customer loyalty program.</p><p style="line-height: 18.5714px;"><br></p><p style="line-height: 18.5714px;">o Promote GameStop’s emerging digital products to customers</p><p style="line-height: 18.5714px;"><br></p><p style="line-height: 18.5714px;">o Respond to customer concerns quickly, effectively and courteously. Request management support as needed to ensure that every customer returns and recommends GameStop to others</p><div><br></div><p>o Demonstrate appreciation for customers by thanking them for their visits and their business</p>', 1, CAST(N'2015-11-15 11:35:42.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[JobInterview] OFF
SET IDENTITY_INSERT [dbo].[JobPost] ON 

INSERT [dbo].[JobPost] ([id], [Department], [JobTitle], [JobType], [NumberOfPositions], [CandidateAgeRangeStart], [CandidateAgeRangeEnd], [JobLocation], [SalaryStartRange], [SalaryEndRange], [CandidateQualification], [CandidateExperience], [JobPostDescription], [CreatedBy], [CreatedAt], [CloseDate]) VALUES (1, 1, N'Software Engineer', N'Technical', 10, 20, 60, N'Nacogdoches', 2000, 3000, N'<p>Develop and maintain web application</p><p>Understands technical and functional design requirements.</p><p>Assists in physical and logical database design.</p><p>Designs, codes, and tests technical solutions.</p><p>Identifies system deficiencies and recommends solutions.</p><p>Leads small teams of developers.</p><p>Assists in enforcement of development deadlines and schedules.</p><p>Understands the necessity of and contributes to coding standards.</p><p>Prioritizes multiple tasks effectively.</p>', N'<p>Develop and maintain web application</p><p>Understands technical and functional design requirements.</p><p>Assists in physical and logical database design.</p><p>Designs, codes, and tests technical solutions.</p><p>Identifies system deficiencies and recommends solutions.</p><p>Leads small teams of developers.</p><p>Assists in enforcement of development deadlines and schedules.</p><p>Understands the necessity of and contributes to coding standards.</p><p>Prioritizes multiple tasks effectively.</p>', N'<p>Develop and maintain web application</p><p>Understands technical and functional design requirements.</p><p>Assists in physical and logical database design.</p><p>Designs, codes, and tests technical solutions.</p><p>Identifies system deficiencies and recommends solutions.</p><p>Leads small teams of developers.</p><p>Assists in enforcement of development deadlines and schedules.</p><p>Understands the necessity of and contributes to coding standards.</p><p>Prioritizes multiple tasks effectively.</p>', 1, CAST(N'2015-10-29 22:09:38.000' AS DateTime), CAST(N'2015-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[JobPost] ([id], [Department], [JobTitle], [JobType], [NumberOfPositions], [CandidateAgeRangeStart], [CandidateAgeRangeEnd], [JobLocation], [SalaryStartRange], [SalaryEndRange], [CandidateQualification], [CandidateExperience], [JobPostDescription], [CreatedBy], [CreatedAt], [CloseDate]) VALUES (2, 1, N'Game Tester', N'Project Based', 5, 78, 78, N'Houston, TX', 2000, 4000, N'<p> Ability to work in a fast-paced, rapidly changing environment</p><p><br></p><p>• Working ability to operate Point of Sale computer system</p><p><br></p><p>• Possess working mathematical and alphabetizing skills</p><p><br></p><p>• Working ability to complete required paperwork properly</p><p><br></p><p>• Ability to bend, stoop, reach with arms / hands and lift merchandise weighing up to 20 lbs. from ground level to minimum height of 4, and climb on ladders</p><p><br></p><p>• Ability to move throughout the store unassisted to provide customer service or perform tasks in any part of the store for up to 8 hours</p><p><br></p>', N'<p>o Demonstrate the behaviors expected of all GameStop associates, including a strong bias for action and drive for results; high levels of maturity and professionalism; providing effective feedback to others, a consistently high service orientation; and commitments to diversity, a respectful workplace, and integrity</p><p><br></p><p>o Adhere to operational procedures and company policies and practices as communicated through the company handbook, procedure manual, Store Support Center and other communications including accurately recording all time worked as required</p><p><br></p><p>o Manage relationships in a manner acceptable to others and to the organization</p>', N'<p>o Demonstrate the behaviors expected of all GameStop associates, including a strong bias for action and drive for results; high levels of maturity and professionalism; providing effective feedback to others, a consistently high service orientation; and commitments to diversity, a respectful workplace, and integrity</p><p><br></p><p>o Adhere to operational procedures and company policies and practices as communicated through the company handbook, procedure manual, Store Support Center and other communications including accurately recording all time worked as required</p><p><br></p><p>o Manage relationships in a manner acceptable to others and to the organization</p>', 1, CAST(N'2015-11-14 20:54:48.000' AS DateTime), CAST(N'2015-11-26 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[JobPost] OFF
SET IDENTITY_INSERT [dbo].[JobPostRequisition] ON 

INSERT [dbo].[JobPostRequisition] ([id], [Department], [JobTitle], [JobType], [NumberOfPositions], [CandidateAgeRangeStart], [CandidateAgeRangeEnd], [JobLocation], [SalaryStartRange], [SalaryEndRange], [CandidateQualification], [CandidateExperience], [JobPostDescription], [CreatedBy], [CreatedAt]) VALUES (1, 2, N'Financial Guy', N'Intern', 10, 22, 60, N'Lufkin', 900, 9000, N'<p>MBA in HR from a Reputable University / Institute<br></p>', N'<p>Atleast 5 years of work experience as a Human Resource Manager in a reputable organization.<br></p>', N'<p>Verge Systems is in a need of a HR manager for its Head Office in Hyderabad.<br></p>', 1, CAST(N'2015-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[JobPostRequisition] ([id], [Department], [JobTitle], [JobType], [NumberOfPositions], [CandidateAgeRangeStart], [CandidateAgeRangeEnd], [JobLocation], [SalaryStartRange], [SalaryEndRange], [CandidateQualification], [CandidateExperience], [JobPostDescription], [CreatedBy], [CreatedAt]) VALUES (2, 2, N'Moeny Handler', N'Intern', 10, 20, 50, N'Tyler, Tx', 1000, 2000, N'<p>Description:</p><p><br></p><p>SUMMARY</p><p><br></p><p>At GameStop, we refer to our Sales Associates as "Game Advisors."  Working with direct or close supervision, the Game Advisor delivers consistent world-class customer service experiences using elements of GameStop''s Buy-Sell-Trade  Model, The Circle of Life and Solution Selling  techniques. This position ensures products are easy to see and to buy; sharing product and gaming knowledge; providing a clean, organized environment in which to shop; and providing every customer with outstanding shopping experiences that lead to higher units per transaction, higher net promoter (customer service) scores, higher levels of PowerUp Rewards participation, and generate customer interest in GameStop’s growing digital business initiatives. Associate will interact with a supervisor frequently during each work period. With the understanding that satisfying customers and resolving customer service issues is a routine expectation, most non-routine activities will require a supervisor’s advance approval.</p>', N'<p>MINIMUM QUALIFICATIONS, JOB SKILLS, ABILITIES</p><p><br></p><p>• Possess outgoing and friendly personality with strong customer service skills</p><p><br></p><p>• Demonstrate clear verbal communication and listening skills, both in person and on the phone, using spoken English; bilingual English/Spanish speaking and writing skills preferred</p><p><br></p><p>• Ability to work in a fast-paced, rapidly changing environment</p><p><br></p><p>• Working ability to operate Point of Sale computer system</p><p><br></p><p>• Possess working mathematical and alphabetizing skills</p><p><br></p><p>• Working ability to complete required paperwork properly</p>', N'<p>• Ability to bend, stoop, reach with arms / hands and lift merchandise weighing up to 20 lbs. from ground level to minimum height of 4, and climb on ladders</p><p><br></p><p>• Ability to move throughout the store unassisted to provide customer service or perform tasks in any part of the store for up to 8 hours</p><p><br></p><p>• Ability to comprehend and comply with all GameStop policies and procedures including, but not limited to, those related to attendance, confidentiality, conflict of interest, respectful workplace, and ethical responsibilities</p><p><br></p><p>• Working knowledge of computerized cash register system preferred</p><p><br></p><p>• Video game knowledge preferred, but not required</p>', 1, CAST(N'2015-11-13 16:37:54.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[JobPostRequisition] OFF
SET IDENTITY_INSERT [dbo].[JobTest] ON 

INSERT [dbo].[JobTest] ([id], [JobPost], [TestTitle], [TestDescription], [CreateBy], [CreateAt]) VALUES (1, N'Software Engineer', N'First Test', N'<p>o Demonstrate the behaviors expected of all GameStop associates, including a strong bias for action and drive for results; high levels of maturity and professionalism; providing effective feedback to others, a consistently high service orientation; and commitments to diversity, a respectful workplace, and integrity</p><p><br></p><p>o Adhere to operational procedures and company policies and practices as communicated through the company handbook, procedure manual, Store Support Center and other communications including accurately recording all time worked as required</p><p><br></p><p>o Manage relationships in a manner acceptable to others and to the organization</p>', 1, CAST(N'2015-11-14 20:59:48.000' AS DateTime))
INSERT [dbo].[JobTest] ([id], [JobPost], [TestTitle], [TestDescription], [CreateBy], [CreateAt]) VALUES (2, N'Software Engineer', N'Second Test', N'<p>POSITION DESCRIPTION</p><p>Are you ready to join a great warehouse team? If you answered YES!, then Coca-Cola Refreshments wants YOU. We are seeking individuals to pull various Coca-Cola products from our warehouse to build specific orders onto pallets. We are looking for individuals that ENJOY working in a fast pace warehouse.   Responsible for pulling orders based on pick ticket to accurately build orders for loading onto delivery trucks. - Build orders according to assigned load tickets using industrial power equipment. - Manually lift and move product to restock and repack ensuring date code accuracy and proper rotation. - Adhere to good manufacturing practices and safety standards. - Responsible for meeting productivity requirements. - Stage completed pallets in designated area.</p><p>- High School diploma or GED preferred. - 0 - 1 year of general work experience. - Prior warehouse experience required. - Ability to operate a manual/powered pallet jack or lift product is preferred. - Demonstrated attention to detail. - Certified Forklift License a plus. - Must be able to repetitively lift up to 50lbs.</p><p>Coca-Cola Refreshments is an Equal Opportunity Employer and does not discriminate against any employee or applicant for employment because of race, color, sex, age, national origin, religion, sexual orientation, gender identity and/or expression, status as a veteran, and basis of disability or any other federal, state or local protected class.</p>', 1, CAST(N'2015-11-16 15:27:06.000' AS DateTime))
INSERT [dbo].[JobTest] ([id], [JobPost], [TestTitle], [TestDescription], [CreateBy], [CreateAt]) VALUES (3, N'Game Tester', N'Final Test', N'<p>POSITION DESCRIPTION</p><p>Are you ready to join a great warehouse team? If you answered YES!, then Coca-Cola Refreshments wants YOU. We are seeking individuals to pull various Coca-Cola products from our warehouse to build specific orders onto pallets. We are looking for individuals that ENJOY working in a fast pace warehouse.   Responsible for pulling orders based on pick ticket to accurately build orders for loading onto delivery trucks. - Build orders according to assigned load tickets using industrial power equipment. - Manually lift and move product to restock and repack ensuring date code accuracy and proper rotation. - Adhere to good manufacturing practices and safety standards. - Responsible for meeting productivity requirements. - Stage completed pallets in designated area.</p><p>- High School diploma or GED preferred. - 0 - 1 year of general work experience. - Prior warehouse experience required. - Ability to operate a manual/powered pallet jack or lift product is preferred. - Demonstrated attention to detail. - Certified Forklift License a plus. - Must be able to repetitively lift up to 50lbs.</p><p>Coca-Cola Refreshments is an Equal Opportunity Employer and does not discriminate against any employee or applicant for employment because of race, color, sex, age, national origin, religion, sexual orientation, gender identity and/or expression, status as a veteran, and basis of disability or any other federal, state or local protected class.</p>', 1, CAST(N'2015-11-16 15:27:23.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[JobTest] OFF
SET IDENTITY_INSERT [dbo].[Leave] ON 

INSERT [dbo].[Leave] ([id], [Employee], [LeaveType], [Reason], [LeaveDuration], [LeaveFrom], [LeaveTo], [AlternateContactNumber], [AlternateEmployee], [LeaveDescription], [CreatedBy], [CreatedAt]) VALUES (1, 4, N'Life Insurance', N'whatever', NULL, CAST(N'2015-12-01 03:30:00.000' AS DateTime), CAST(N'2015-12-01 08:00:00.000' AS DateTime), N'1231231232', 1231231231, N'desc', 4, CAST(N'2015-12-01 22:39:16.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Leave] OFF
SET IDENTITY_INSERT [dbo].[Loan] ON 

INSERT [dbo].[Loan] ([id], [Employee], [Title], [LoanAmount], [LoanBalance], [LoanDate], [MonthlyRepaymentAmount], [RepaymentStartDate], [Description], [CreatedAt], [CreatedBy]) VALUES (1, 1, N'oiuoiu', CAST(9000.00 AS Decimal(18, 2)), CAST(9000.00 AS Decimal(18, 2)), CAST(N'2015-12-22 00:00:00.000' AS DateTime), CAST(900.00 AS Decimal(18, 2)), CAST(N'2015-12-24 00:00:00.000' AS DateTime), N'<p>uoiuiouoi</p>', CAST(N'2015-12-01 21:19:54.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[Loan] OFF
SET IDENTITY_INSERT [dbo].[MenuItems] ON 

INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (4, 1, N'Departments', N'Departments', N'AdminDepartment', N'Index', 1, N'', N'', N'', 1800)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (32, 1, N'AppUser', N'Users', N'AppUser', N'Index', 0, N'', N'', N'', 900)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (33, 1, N'Companies', N'Company', N'Company', N'Index', 1, N'', N'', N'', 3100)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (34, 1, N'MenuItems', N'MenuItems', N'MenuItems', N'Index', 1, N'', N'', N'', 4400)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (38, 1, N'States', N'States', N'State', N'Index', 0, N'', N'', N'', 3400)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (62, 1, N'Organization News', N'Organization News', N'News', N'Index', 1, N'', N'', N'', 5100)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (63, 1, N'Announcements', N'Announcements', N'Article', N'Announcements', 0, N'', N'', N'', 1000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (64, 1, N'System Settings', N'System Settings', N'Setting', N'Index', 0, N'', N'', N'', 1000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (65, 1, N'System Logs', N'System Logs', N'UserActionLog', N'Index', 1, N'', N'', N'', 6300)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (66, 1, N'Policies', N'Policies', N'Policy', N'Index', 1, N'', N'', N'', 5200)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (67, 2, N'JobPostRequisitions
', N'Job Post Requisitions
', N'JobPostRequisition', N'Index', 1, N'', N'', N'', 5400)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (68, 2, N'JobPost', N'Job Posts', N'JobPost', N'Index', 1, N'', N'', N'', 5600)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (69, 2, N'Job Candidate', N'Job Candidates', N'RecruitmentCandidate', N'Index', 1, N'', N'', N'', 7000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (70, 2, N'Recruitment Dashboard', N'Recruitment Dashboard', N'RecruitmentCandidate', N'RecruitmentDashboard', 1, N'', N'', N'', 7000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (71, 2, N'Job Test', N'Job Test', N'JobTest', N'Index', 1, N'', N'', N'', 500)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (72, 2, N'Job Interview', N'Job Interviews', N'JobInterview', N'Index', 1, N'', N'', N'', 600)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (73, 3, N'Achievement', N'Achievement', N'Achievement', N'Index', 1, N'', N'', N'', 2300)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (74, 3, N'Assignment', N'Assignment', N'Assignment', N'Index', 1, N'', N'', N'', 2900)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (75, 3, N'Complaint', N'Complaint', N'Complaint', N'Index', 1, N'', N'', N'', 1600)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (76, 3, N'Contract', N'Contract', N'Contract', N'Index', 1, N'', N'', N'', 3000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (77, 3, N'Employee', N'Employee', N'Employee', N'Index', 1, N'', N'', N'', 3300)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (78, 3, N'EmployeeExit', N'Employee Exit', N'EmployeeExit', N'Index', 1, N'', N'', N'', 800)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (79, 3, N'EmployeeJoining', N'Employee Joining', N'EmployeeJoining', N'Index', 1, N'', N'', N'', 3200)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (80, 3, N'Memo', N'Memo', N'Memo', N'Index', 0, N'', N'', N'', 1300)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (81, 3, N'PerformanceEvaluation', N'Performance Evaluation', N'PerformanceEvaluation', N'Index', 1, N'', N'', N'', 1000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (82, 3, N'Promotion', N'Promotion', N'Promotion', N'Index', 1, N'', N'', N'', 1700)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (83, 3, N'Requistion', N'Requistion', N'Requistion', N'Index', 1, N'', N'', N'', 2800)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (84, 3, N'Resignation', N'Resignation', N'Resignation', N'Index', 1, N'', N'', N'', 2500)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (85, 3, N'Termination', N'Termination', N'Termination', N'Index', 1, N'', N'', N'', 1200)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (86, 3, N'Transfer', N'Transfer', N'Transfer', N'Index', 1, N'', N'', N'', 2700)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (87, 3, N'Travel', N'Travel', N'Travel', N'Index', 1, N'', N'', N'', 2000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (88, 3, N'Warning', N'Warning', N'Warning', N'Index', 1, N'', N'', N'', 1400)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (89, 4, N'Attendance', N'Attendance', N'Attendance', N'Index', 1, N'', N'', N'', 4200)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (90, 4, N'Leave', N'Leave', N'Leave', N'Index', 1, N'', N'', N'', 3700)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (91, 4, N'WorkShift', N'Work Shift', N'WorkShift', N'Index', 1, N'', N'', N'', 3800)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (92, 4, N'Holiday', N'Holiday', N'Holiday', N'Index', 1, N'', N'', N'', 3900)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (93, 5, N'PayrollOption', N'Payroll Options', N'PayrollOption', N'Index', 0, N'', N'', N'', 4000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (94, 5, N'PayslipAllowance', N'Payslip Allowance', N'PayslipAllowance', N'Index', 0, N'', N'', N'', 4100)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (95, 5, N'ExtraPayrollItems', N'Extra Payroll Items', N'ExtraPayrollItems', N'Index', 0, N'', N'', N'', 4300)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (96, 5, N'TaxRule', N'Tax Rule', N'TaxRule', N'Index', 0, N'', N'', N'', 4500)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (97, 5, N'TaxExemptEmployee', N'Tax Exempt Employee', N'TaxExemptEmployee', N'Index', 1, N'', N'', N'', 4600)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (98, 5, N'AutoDeduction', N'Auto Deduction', N'AutoDeduction', N'Index', 0, N'', N'', N'', 4800)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (99, 5, N'AutoOvertime', N'Auto Overtime', N'AutoOvertime', N'Index', 0, N'', N'', N'', 4900)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (100, 5, N'SalaryCalculation', N'Salary Calculation', N'SalaryCalculation', N'Index', 1, N'', N'', N'', 5000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (101, 5, N'Salary', N'Salary', N'Salary', N'Index', 1, N'', N'', N'', 5500)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (102, 5, N'SalaryPayslip', N'Salary Payslip', N'SalaryPayslip', N'Index', 1, N'', N'', N'', 6200)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (103, 5, N'SalaryPayslipDetail', N'Salary Payslip Detail', N'SalaryPayslipDetail', N'Index', 1, N'', N'', N'', 6500)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (104, 5, N'HourlyWage', N'Hourly Wage', N'HourlyWage', N'Index', 1, N'', N'', N'', 6700)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (105, 5, N'SalaryItem', N'Salary Item', N'SalaryItem', N'Index', 1, N'', N'', N'', 6900)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (106, 5, N'Reimbursement', N'Reimbursement', N'Reimbursement', N'Index', 1, N'', N'', N'', 7100)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (107, 5, N'ReimbursementDetail', N'Reimbursement Detail', N'ReimbursementDetail', N'Index', 0, N'', N'', N'', 300)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (108, 5, N'Overtime', N'Overtime', N'Overtime', N'Index', 1, N'', N'', N'', 400)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (109, 5, N'ProvidentFund', N'Provident Fund', N'ProvidentFund', N'Index', 1, N'', N'', N'', 700)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (110, 5, N'Loan', N'Loan', N'Loan', N'Index', 1, N'', N'', N'', 1100)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (111, 5, N'Insurance', N'Insurance', N'Insurance', N'Index', 1, N'', N'', N'', 1500)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (112, 6, N'Training', N'Training', N'Training', N'Index', 1, N'', N'', N'', 1900)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (113, 6, N'TrainingNeedAssessment', N'Training Need Assessment', N'TrainingNeedAssessment', N'Index', 1, N'', N'', N'', 2100)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (114, 6, N'TrainingEvent', N'Training Event', N'TrainingEvent', N'Index', 1, N'', N'', N'', 2200)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (115, 6, N'Trainer', N'Trainer', N'Trainer', N'Index', 1, N'', N'', N'', 2400)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (116, 6, N'TrainingEvaluation', N'Training Evaluation', N'TrainingEvaluation', N'Index', 1, N'', N'', N'', 2600)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (117, 7, N'Reporting', N'Reporting', N'Reporting', N'Index', 0, N'', N'/', N'', 1000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (118, 8, N'Information', N'Information', N'Information', N'Index', 0, N'', N'/', N'', 1000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (119, 3, N'Designation', N'Designations', N'Designation', N'Index', 1, N'', N'', N'', 3600)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (120, 5, N'PayrollStructure', N'Payroll Structure', N'PayrollOption', N'PayrollStructure', 1, N'', N'', N'', 4000)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (121, 3, N'Roles', N'Employee Roles', N'Employee', N'Role', 1, N'', N'', N'', 3300)
INSERT [dbo].[MenuItems] ([id], [ParentID], [Name], [Description], [Controller], [Action], [Level], [Icon], [URL], [Params], [TaskID]) VALUES (122, 11, N'Projects', N'Projects', N'Project', N'Index', 1, N'', N'/', N'', 7200)
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
SET IDENTITY_INSERT [dbo].[MenuItemsGroup] ON 

INSERT [dbo].[MenuItemsGroup] ([id], [GroupID], [Name], [IsActive], [Icon]) VALUES (1, 1, N'Organization', 1, N'fa fa-sitemap')
INSERT [dbo].[MenuItemsGroup] ([id], [GroupID], [Name], [IsActive], [Icon]) VALUES (2, 2, N'Recruitment
', 1, N'fa fa-user')
INSERT [dbo].[MenuItemsGroup] ([id], [GroupID], [Name], [IsActive], [Icon]) VALUES (3, 3, N'Employment', 1, N'fa 
fa-group')
INSERT [dbo].[MenuItemsGroup] ([id], [GroupID], [Name], [IsActive], [Icon]) VALUES (4, 4, N'Timesheet', 1, N'fa fa-clock-o')
INSERT [dbo].[MenuItemsGroup] ([id], [GroupID], [Name], [IsActive], [Icon]) VALUES (5, 5, N'Payroll
', 1, N'fa 
fa-money')
INSERT [dbo].[MenuItemsGroup] ([id], [GroupID], [Name], [IsActive], [Icon]) VALUES (6, 6, N'Trainings', 1, N'fa fa-graduation-cap')
INSERT [dbo].[MenuItemsGroup] ([id], [GroupID], [Name], [IsActive], [Icon]) VALUES (7, 7, N'Reports', 0, N'fa fa-files-o')
INSERT [dbo].[MenuItemsGroup] ([id], [GroupID], [Name], [IsActive], [Icon]) VALUES (8, 8, N'Information', 0, N'fa fa-info-circle')
INSERT [dbo].[MenuItemsGroup] ([id], [GroupID], [Name], [IsActive], [Icon]) VALUES (9, 9, N'Piecework', 0, N'fa fa-sitemap')
INSERT [dbo].[MenuItemsGroup] ([id], [GroupID], [Name], [IsActive], [Icon]) VALUES (10, 10, N'Admin', 1, N'fa fa-gears')
INSERT [dbo].[MenuItemsGroup] ([id], [GroupID], [Name], [IsActive], [Icon]) VALUES (11, 11, N'Projects', 1, N'fa fa-folder')
SET IDENTITY_INSERT [dbo].[MenuItemsGroup] OFF
SET IDENTITY_INSERT [dbo].[ModelTypes] ON 

INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (1, N'PolicyTypes', N'General Policies,HR Policies,Finance Policies,Environment Policies,')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (2, N'GenderTypes', N'Male,Female,')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (3, N'JobTypes', N'Permanent,Contract,Project Based,Intern,Other')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (4, N'EmployeeTypes', N'Regular Employees,Project Employees,Support Employees,')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (5, N'EmployeeCategory', N'Management,Professional,Auxiliary,Technical,')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (6, N'SalutationTypes', N'Mr.,Miss,Mrs.,Ms.,Dr.')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (7, N'Priority', N'Low,Medium,High,Critical')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (8, N'ContractTypes', N'Probationary,Contractual,Permanent')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (9, N'EmployeeExitTypes', N'Resignation,Retirement,End of Contract,End of Project,Dismissal,Layoff, Termination by Mutual Agreement,Forced Resignation,End of Temporary Appointment,Death,Abadonment')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (10, N'PerDaySalaryCalculationTypes', N'Divide with Number of Days in the Salary Month,Divide with Specified Number of Days')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (11, N'PayslipFormatTypes', N'Standard,')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (12, N'BasicSalaryTypes', N'Percentage Based,Fixed Amount')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (13, N'PayrollMethodTypes', N'Standard,Custom')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (14, N'AutoApprovePayrollTypes', N'Yes,No - Approve by Following Employee')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (15, N'SalaryTypes', N'Monthly,Hourly')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (16, N'SalaryItemTypes', N'Deductions,Bonuses,Adjustments,Comissions,Advance Salary')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (17, N'InsuranceTypes', N'Life Insurance,Health Insurance')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (18, N'LeaveTypes', N'Annual Leaves,Casual Leaves,Maternity Leaves,Sick Leave')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (19, N'TrainingTypes', N'Online Training,Seminar,Seminar,Workshop,Hands On Training,Webinar')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (20, N'NatureOfTrainingTypes', N'Internal,External')
INSERT [dbo].[ModelTypes] ([id], [ModelName], [TypesArray]) VALUES (21, N'ReimbursementCategory', N'Transportation,Boarding,Lodging,Communication,Other')
SET IDENTITY_INSERT [dbo].[ModelTypes] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [Title], [Content], [PostedAt], [PostUser]) VALUES (1, N'First News Ever!!!!', N'<p style="line-height: 1.6;"><span style="font-weight: bold; font-style: italic; text-decoration: underline; background-color: rgb(0, 255, 255);">Lorem Ipsum is simply</span></p><p>dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only<span style="color: rgb(0, 0, 255); background-color: rgb(107, 173, 222);"> five centuries, but </span>also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with </p><p><br></p><p></p><ol><li><span style="color: inherit; line-height: 1.42857;">Remaining essentially unchanged</span><br></li><li><span style="color: inherit; line-height: 1.42857;">Make a type specimen book</span><br></li><li><span style="color: inherit; line-height: 1.42857;">Unknown printer</span><br></li></ol><p></p><p><br></p><p>Column mapping is generally not required, because the<span style="background-color: rgb(255, 255, 0);"> Entity Framework usually chooses the appropriate SQL Server data type based on the CLR type that you define for the property. The CLR decimal type maps to a SQL Server decimal type. But in this case you know that the column will</span> be holding currency amounts, and the money data type is more appropriate for that. For more information about CLR data types and how they match to SQL Server data types, see SqlClient for Entity FrameworkTypes.</p><p><br></p><p>Foreign Key and Navigation Properties</p><p></p><table class="table table-bordered"><tbody><tr><td>12</td><td>22</td><td>23</td></tr><tr><td>23</td><td>23</td><td>22</td></tr><tr><td>234</td><td>234</td><td>324</td></tr></tbody></table><br><p></p><p>The foreign key and navigation properties reflect the following relationships:</p><p>aslkdjfl;asdjflsakdjf;adljf\</p><p>;lasdkjfl;asdkjfal;s</p><p>as;dfjoipawefmoads;m</p><p><br></p><p>A department may or may not have an administrator, and an administrator is always an instructor. Therefore the InstructorID property is included as the foreign key to the Instructor entity, and a question mark is added after the int type designation to mark the property as nullable.The navigation property is named Administrator but holds an Instructor entity:</p>', CAST(N'2015-11-15 11:53:45.000' AS DateTime), 1)
INSERT [dbo].[News] ([id], [Title], [Content], [PostedAt], [PostUser]) VALUES (2, N'Company found!!', N'<p>By default, the Entity Framework assumes that primary key values are generated by the database. That''s what you want in most scenarios. However, for Course entities, you''ll use a user-specified course number such as a 1000 series for one department, a 2000 series for another department, and so on.</p><p><span style="color: inherit; line-height: 1.42857;">Foreign Key and Navigation Properties</span><br></p><p><span style="color: inherit; line-height: 1.42857;">The foreign key properties and navigation properties in the Course entity reflect the following relationships:</span><br></p><p><span style="color: inherit; line-height: 1.42857;">A course is assigned to one department, so there''s a DepartmentID foreign key and a Department navigation property for the reasons mentioned above.</span><br></p><p><a href="http://www.bing.com" target="_blank">google</a></p>', CAST(N'2015-10-28 16:16:36.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Overtime] ON 

INSERT [dbo].[Overtime] ([id], [Employee], [Title], [OvertimeHours], [TimeIn], [TimeOut], [Amount], [Description], [CreatedAt], [CreatedBy], [IsRecurring], [RecurringCyclePerMonth]) VALUES (3, 1, N'908', CAST(89.00 AS Decimal(9, 2)), CAST(N'2015-12-01 20:26:00.000' AS DateTime), CAST(N'2015-12-01 20:26:00.000' AS DateTime), CAST(89.00 AS Decimal(18, 2)), N'<p>87987</p>', CAST(N'2015-12-01 20:20:02.000' AS DateTime), 4, 0, 0)
SET IDENTITY_INSERT [dbo].[Overtime] OFF
SET IDENTITY_INSERT [dbo].[PayrollOption] ON 

INSERT [dbo].[PayrollOption] ([id], [PayrollMethod], [AutoApprovePayroll], [PayrollApprovedBy], [AutoEmailPayslips], [PerDaySalaryCalculation], [NumberOfDayInMonth], [PayrollCurrency], [PayslipTitle], [PayslipFormat], [BasicSalaryType], [BasicSalaryPercentage]) VALUES (4, N'Standard', N'No - Approve by Following Employee', 4, 0, N'Divide with Specified Number of Days', 12, NULL, N'Payslip A', N'Standard', N'Fixed Amount', CAST(12.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[PayrollOption] OFF
SET IDENTITY_INSERT [dbo].[PayslipAllowance] ON 

INSERT [dbo].[PayslipAllowance] ([id], [AllowanceTitle], [IsTaxable], [AllowanceType], [Amount], [Percentage]) VALUES (1, N'Work throw holiday', 0, N'holiday type', CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[PayslipAllowance] OFF
SET IDENTITY_INSERT [dbo].[PerformanceEvaluation] ON 

INSERT [dbo].[PerformanceEvaluation] ([id], [Title], [Description], [CreatedBy], [CreatedAt]) VALUES (1, N'asdfasdfasd', N'<p>Features of Kendo UI Core</p><p><br></p><p>Kendo UI Core is a free and open-source subset of Kendo UI. The following table details the widgets and features available in Kendo UI Core, as well as the additional features available via a commercial Kendo UI license.</p>', 2, CAST(N'2015-11-20 21:25:46.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[PerformanceEvaluation] OFF
SET IDENTITY_INSERT [dbo].[Policy] ON 

INSERT [dbo].[Policy] ([id], [Title], [Content], [PostedAt], [PostUser], [PolicyType], [Company], [Department]) VALUES (1, N'Don''t eat too much!', N'<p>By default, the Entity Framework assumes that primary key values are generated by the database. That''s what you want in most scenarios. However, for Course entities, you''ll use a user-specified course number such as a 1000 series for one department, a 2000 series for another department, and so on.</p><p><br></p><p>Foreign Key and Navigation Properties</p><p><br></p><p>The foreign key properties and navigation properties in the Course entity reflect the following relationships:</p><p><br></p><p>A course is assigned to one department, so there''s a DepartmentID foreign key and a Department navigation property for the reasons mentioned above.</p><p>The “2015 Guangdong 21st Century Maritime Silk Road International Expo - Port City Development & Cooperation Forum” will be held in Guangzhou’s Baiyun International Convention Center this Friday. </p><p><br></p><p>The governor of Guangdong, Zhu Xiaodan, and the chairman of the China Council for Promotion of International Trade (CCPIT), will attend the Forum with invited representatives from different port cities from China and other nations. </p><p><br></p><p>A seminar will be held Friday a<span style="background-color: yellow;">fternoon on the future development of the Maritime Silk Road and on the way Guangzhou and other port cities can cooperate on that development. Leading the seminar will be Chen Jianhua, the mayor of Guangzhou. Other participants will include senior administration officials from many port cities along the maritime route, among them the governor of Alexandria in Egypt, the governor of Mombasa in Kenya, the mayor of Colombo in Sri Lanka, the mayor of Karachi in Pakistan, an</span>d the deputy mayor of Sydney in Australia.</p><p><br></p><p>(By Cassie Lin, Louis Berney)</p><p>Editor:Cassie Lin</p><p>- See more at: http://www.lifeofguangzhou.com/node_981/node_989/node_997/node_1007/2015/10/28/1446023315173111.shtml#sthash.t86SGwIl.dpuf</p>', CAST(N'2015-10-28 21:15:56.000' AS DateTime), 1, N'Finance Policies', 1, 1)
SET IDENTITY_INSERT [dbo].[Policy] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([id], [Name], [Description], [Status], [ClientID], [ClientSID], [Version], [Completed], [LastUpdated], [Priority], [CreateBy], [CreateAt]) VALUES (1, N'Project IP', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s. Over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', N'Active', N'Contract with Zender Company', 1, N'1.0.0', CAST(20.00 AS Decimal(5, 2)), CAST(N'2016-03-19 20:50:04.000' AS DateTime), N'High', 4, CAST(N'2016-03-19 20:50:04.000' AS DateTime))
INSERT [dbo].[Project] ([id], [Name], [Description], [Status], [ClientID], [ClientSID], [Version], [Completed], [LastUpdated], [Priority], [CreateBy], [CreateAt]) VALUES (2, N'Project Tango', N'If the property is inside a class (or struct or interface) that is generic, the type of the property may of course depend on the type parameters of the containing class, but the property cannot introduce new type parameters like a generic method does.', N'Open', N'Omega Champ Company', 1, N'1.1', CAST(10.00 AS Decimal(5, 2)), CAST(N'2016-05-15 21:11:47.000' AS DateTime), N'1', 4, CAST(N'2016-05-15 21:11:47.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[ProjectActivity] ON 

INSERT [dbo].[ProjectActivity] ([id], [UserID], [Status], [Title], [StartTime], [EndTime], [Comments], [ProjectID]) VALUES (1, 4, N'Close', N'Project IP', CAST(N'2016-04-08 21:32:59.000' AS DateTime), CAST(N'2016-05-15 20:47:08.000' AS DateTime), N'i love it', 1)
INSERT [dbo].[ProjectActivity] ([id], [UserID], [Status], [Title], [StartTime], [EndTime], [Comments], [ProjectID]) VALUES (2, 4, N'Close', N'Project IP', CAST(N'2016-05-13 21:50:18.000' AS DateTime), CAST(N'2016-05-13 22:31:43.000' AS DateTime), NULL, 1)
INSERT [dbo].[ProjectActivity] ([id], [UserID], [Status], [Title], [StartTime], [EndTime], [Comments], [ProjectID]) VALUES (3, 4, N'Close', N'Project IP', CAST(N'2016-05-20 00:00:00.000' AS DateTime), CAST(N'2016-05-15 20:46:08.000' AS DateTime), N'this is my comment111', 1)
INSERT [dbo].[ProjectActivity] ([id], [UserID], [Status], [Title], [StartTime], [EndTime], [Comments], [ProjectID]) VALUES (4, 4, N'Close', N'Project Tango', CAST(N'2016-05-15 21:22:02.000' AS DateTime), CAST(N'2016-05-15 21:59:07.000' AS DateTime), N'this is my activity', 2)
INSERT [dbo].[ProjectActivity] ([id], [UserID], [Status], [Title], [StartTime], [EndTime], [Comments], [ProjectID]) VALUES (5, 4, N'Close', N'Project Tango', CAST(N'2016-05-15 22:18:03.000' AS DateTime), CAST(N'2016-05-15 22:18:25.000' AS DateTime), N'I just want to clock this out', 2)
INSERT [dbo].[ProjectActivity] ([id], [UserID], [Status], [Title], [StartTime], [EndTime], [Comments], [ProjectID]) VALUES (6, 4, N'Close', N'Project Tango', CAST(N'2016-05-15 22:55:51.000' AS DateTime), CAST(N'2016-05-15 22:56:41.000' AS DateTime), N'I call Mr. Wang to get more money!', 2)
INSERT [dbo].[ProjectActivity] ([id], [UserID], [Status], [Title], [StartTime], [EndTime], [Comments], [ProjectID]) VALUES (7, 4, N'Close', N'Project IP', CAST(N'2016-05-16 22:12:26.000' AS DateTime), CAST(N'2016-05-16 22:13:06.000' AS DateTime), N'I code it', 1)
INSERT [dbo].[ProjectActivity] ([id], [UserID], [Status], [Title], [StartTime], [EndTime], [Comments], [ProjectID]) VALUES (8, 4, N'Close', N'Project IP', CAST(N'2017-02-16 02:54:42.000' AS DateTime), CAST(N'2017-02-16 02:56:53.000' AS DateTime), N'good', 1)
INSERT [dbo].[ProjectActivity] ([id], [UserID], [Status], [Title], [StartTime], [EndTime], [Comments], [ProjectID]) VALUES (9, 4, N'Close', N'Project IP', CAST(N'2017-03-17 01:43:53.000' AS DateTime), CAST(N'2017-03-17 01:44:57.000' AS DateTime), N'good job', 1)
INSERT [dbo].[ProjectActivity] ([id], [UserID], [Status], [Title], [StartTime], [EndTime], [Comments], [ProjectID]) VALUES (10, 4, N'Close', N'Project IP', CAST(N'2017-03-18 22:36:11.000' AS DateTime), CAST(N'2017-03-19 10:58:19.000' AS DateTime), N'', 1)
SET IDENTITY_INSERT [dbo].[ProjectActivity] OFF
SET IDENTITY_INSERT [dbo].[Promotion] ON 

INSERT [dbo].[Promotion] ([id], [PromotionFor], [ForwardApplicationTo], [PromotionDate], [PromotionDescription], [CreatedBy], [CreatedAt]) VALUES (1, 2, 3, CAST(N'2015-11-10 00:00:00.000' AS DateTime), N'<p>adgadsgadsgadfgdf</p>', 2, CAST(N'2015-11-20 21:43:09.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Promotion] OFF
SET IDENTITY_INSERT [dbo].[ProvidentFund] ON 

INSERT [dbo].[ProvidentFund] ([id], [Employee], [EmployeeShareAmount], [EmployeeSharePersentage], [OrganizationShareAmount], [OrganizationSharePersentage], [Description]) VALUES (1, 1, CAST(89.00 AS Decimal(18, 2)), CAST(77.00 AS Decimal(18, 2)), CAST(555.00 AS Decimal(18, 2)), CAST(444.00 AS Decimal(18, 2)), N'<p>53233423223234234</p>')
SET IDENTITY_INSERT [dbo].[ProvidentFund] OFF
SET IDENTITY_INSERT [dbo].[RecruitmentCandidate] ON 

INSERT [dbo].[RecruitmentCandidate] ([id], [LinkID], [Name], [Gender], [DOB], [Nationality], [JobField], [HaveWorkingPermit], [Email], [Phone], [Address], [City], [State], [Zip], [Country], [Interests], [Achievements]) VALUES (1, N'0eca137d-9d8c-4e6e-bcac-4f0a2688e187', N'aa', N'Male', CAST(N'2001-01-16' AS Date), N'890', N'Game Tester', 1, N'890@89.co', N'809890809', N'890', N'890', N'890', N'809', N'809', N'80', N'123')
INSERT [dbo].[RecruitmentCandidate] ([id], [LinkID], [Name], [Gender], [DOB], [Nationality], [JobField], [HaveWorkingPermit], [Email], [Phone], [Address], [City], [State], [Zip], [Country], [Interests], [Achievements]) VALUES (2, N'40069fbd-a353-4bb2-9364-b5210f725664', N'Jansen Zhang', N'Male', CAST(N'2014-04-01' AS Date), N'China', N'Software Engineer', 1, N'jansenzjh@gmail.com', N'1231237890', N'123 North St.', N'Nacogdoches', N'Tx', N'75962', N'USA', N'Coding', N'Scholarship')
INSERT [dbo].[RecruitmentCandidate] ([id], [LinkID], [Name], [Gender], [DOB], [Nationality], [JobField], [HaveWorkingPermit], [Email], [Phone], [Address], [City], [State], [Zip], [Country], [Interests], [Achievements]) VALUES (3, N'0de6a8cd-c3f9-4388-8173-7160238c2839', N'8797', N'Male', CAST(N'2001-01-10' AS Date), N'798', N'Software Engineer', NULL, N'798', N'789', N'798', N'978', N'79', N'79', N'789', N'798', N'789')
INSERT [dbo].[RecruitmentCandidate] ([id], [LinkID], [Name], [Gender], [DOB], [Nationality], [JobField], [HaveWorkingPermit], [Email], [Phone], [Address], [City], [State], [Zip], [Country], [Interests], [Achievements]) VALUES (4, N'b0895b45-ca1f-44ec-a860-981863caa5ea', N'809999', N'Male', CAST(N'2001-01-02' AS Date), N'99999', N'Game Tester', NULL, N'999999', N'9999', N'9999', N'9999', N'99999', N'9999', N'9999', N'99999999', N'999999')
INSERT [dbo].[RecruitmentCandidate] ([id], [LinkID], [Name], [Gender], [DOB], [Nationality], [JobField], [HaveWorkingPermit], [Email], [Phone], [Address], [City], [State], [Zip], [Country], [Interests], [Achievements]) VALUES (5, N'b8a0b4c0-6bae-432a-a5cf-2a0c564f9d5e', N'Steve Jobs', N'Male', CAST(N'1992-02-04' AS Date), N'USA', N'Game Tester', 1, N'stevejob@apple.com', N'12389023489', N'123 N st', N'Cappo', N'LA', N'890123', N'USA', N'good', N'8098908098098')
INSERT [dbo].[RecruitmentCandidate] ([id], [LinkID], [Name], [Gender], [DOB], [Nationality], [JobField], [HaveWorkingPermit], [Email], [Phone], [Address], [City], [State], [Zip], [Country], [Interests], [Achievements]) VALUES (6, N'f95e26e0-6ccb-4ecb-9fce-8064fb2b4fdf', N'Jimmy John', N'Female', CAST(N'1964-06-17' AS Date), N'Canada', N'Game Tester', 1, N'jimmy@gmail.com', N'808098999', N'89089 ', N'809809', N'LA', N'808999', N'USA', N'80890809809', N'8909809809809')
SET IDENTITY_INSERT [dbo].[RecruitmentCandidate] OFF
SET IDENTITY_INSERT [dbo].[Reimbursement] ON 

INSERT [dbo].[Reimbursement] ([id], [InstanceID], [Employee], [Title], [Amount], [Description], [CreatedAt], [CreatedBy], [IsApproved]) VALUES (1, N'd35a9d0f-9c9e-49ef-b39f-086dd242ce6d', 1, N'yiu', CAST(0.00 AS Decimal(18, 2)), N'', CAST(N'2015-12-05 22:52:59.000' AS DateTime), 4, 1)
INSERT [dbo].[Reimbursement] ([id], [InstanceID], [Employee], [Title], [Amount], [Description], [CreatedAt], [CreatedBy], [IsApproved]) VALUES (2, N'19d6689f-ce95-435f-811f-6f8f0dbc04e6', 2, N'asdfasdf', CAST(999999.00 AS Decimal(18, 2)), N'<p>098sdf08sd09f8a09sdf8</p><p>a09sdf80a9ds8f09ads8f09sd899999999999999999f09</p>', CAST(N'2015-12-05 23:11:53.000' AS DateTime), 4, 1)
SET IDENTITY_INSERT [dbo].[Reimbursement] OFF
SET IDENTITY_INSERT [dbo].[ReimbursementDetail] ON 

INSERT [dbo].[ReimbursementDetail] ([id], [InstanceID], [CreatedDate], [Category], [Item], [ReceiptNumber], [Location], [Amount]) VALUES (1, N'd35a9d0f-9c9e-49ef-b39f-086dd242ce6d', CAST(N'2015-12-29 00:00:00.000' AS DateTime), N'Boarding', N'w3', N'809', N'890', CAST(89.00 AS Decimal(18, 2)))
INSERT [dbo].[ReimbursementDetail] ([id], [InstanceID], [CreatedDate], [Category], [Item], [ReceiptNumber], [Location], [Amount]) VALUES (2, N'd35a9d0f-9c9e-49ef-b39f-086dd242ce6d', CAST(N'2015-12-17 00:00:00.000' AS DateTime), N'Communication', N'u8', N'798', N'789', CAST(687.00 AS Decimal(18, 2)))
INSERT [dbo].[ReimbursementDetail] ([id], [InstanceID], [CreatedDate], [Category], [Item], [ReceiptNumber], [Location], [Amount]) VALUES (3, N'19d6689f-ce95-435f-811f-6f8f0dbc04e6', CAST(N'2015-12-06 00:00:00.000' AS DateTime), N'Other', N'809', N'809', N'809', CAST(8709.00 AS Decimal(18, 2)))
INSERT [dbo].[ReimbursementDetail] ([id], [InstanceID], [CreatedDate], [Category], [Item], [ReceiptNumber], [Location], [Amount]) VALUES (4, N'19d6689f-ce95-435f-811f-6f8f0dbc04e6', CAST(N'2015-12-06 00:00:00.000' AS DateTime), N'Other', N'789', N'789', N'789', CAST(78798.00 AS Decimal(18, 2)))
INSERT [dbo].[ReimbursementDetail] ([id], [InstanceID], [CreatedDate], [Category], [Item], [ReceiptNumber], [Location], [Amount]) VALUES (5, N'19d6689f-ce95-435f-811f-6f8f0dbc04e6', CAST(N'2015-12-06 00:00:00.000' AS DateTime), N'Communication', N'999', N'999', N'999', CAST(9999.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ReimbursementDetail] OFF
SET IDENTITY_INSERT [dbo].[Requistion] ON 

INSERT [dbo].[Requistion] ([id], [RequistionBy], [RequistionType], [Title], [Priority], [RequistionDescription], [CreatedBy], [CreatedAt]) VALUES (1, 1, N'123123', N'132123123', N'Medium', N'<p>123123123123</p>', 2, CAST(N'2015-11-20 21:49:37.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Requistion] OFF
SET IDENTITY_INSERT [dbo].[Resignation] ON 

INSERT [dbo].[Resignation] ([id], [ResigningEmployee], [ForwardApplicationTo], [NoticeDate], [ResignationDate], [CreatedBy], [CreatedAt]) VALUES (1, 2, 4, CAST(N'2015-11-24 00:00:00.000' AS DateTime), CAST(N'2015-11-24 00:00:00.000' AS DateTime), 2, CAST(N'2015-11-20 22:00:30.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Resignation] OFF
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (0, N'SuperAdmin', N'Super Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (1, N'Admin', N'Administrator')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (2, N'Employee', N'Employee')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (300, N'ReimbursementDetail_Admin', N'ReimbursementDetail Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (400, N'Overtime_Admin', N'Overtime Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (500, N'JobTest_Admin', N'JobTest Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (600, N'JobInterview_Admin', N'JobInterview Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (700, N'ProvidentFund_Admin', N'ProvidentFund Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (800, N'EmployeeExit_Admin', N'EmployeeExit Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (900, N'AppUser_Admin', N'AppUser Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (1000, N'PerformanceEvaluation_Admin', N'PerformanceEvaluation Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (1100, N'Loan_Admin', N'Loan Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (1200, N'Termination_Admin', N'Termination Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (1300, N'Memo_Admin', N'Memo Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (1400, N'Warning_Admin', N'Warning Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (1500, N'Insurance_Admin', N'Insurance Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (1600, N'Complaint_Admin', N'Complaint Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (1700, N'Promotion_Admin', N'Promotion Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (1800, N'AdminDepartment_Admin', N'AdminDepartment Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (1900, N'Training_Admin', N'Training Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (2000, N'Travel_Admin', N'Travel Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (2100, N'TrainingNeedAssessment_Admin', N'TrainingNeedAssessment Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (2200, N'TrainingEvent_Admin', N'TrainingEvent Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (2300, N'Achievement_Admin', N'Achievement Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (2400, N'Trainer_Admin', N'Trainer Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (2500, N'Resignation_Admin', N'Resignation Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (2600, N'TrainingEvaluation_Admin', N'TrainingEvaluation Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (2700, N'Transfer_Admin', N'Transfer Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (2800, N'Requistion_Admin', N'Requistion Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (2900, N'Assignment_Admin', N'Assignment Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (3000, N'Contract_Admin', N'Contract Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (3100, N'Company_Admin', N'Company Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (3200, N'EmployeeJoining_Admin', N'EmployeeJoining Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (3300, N'Employee_Admin', N'Employee Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (3400, N'State_Admin', N'State Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (3500, N'CandidateScore_Admin', N'CandidateScore Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (3600, N'Designation_Admin', N'Designation Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (3700, N'Leave_Admin', N'Leave Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (3800, N'WorkShift_Admin', N'WorkShift Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (3900, N'Holiday_Admin', N'Holiday Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (4000, N'PayrollOption_Admin', N'PayrollOption Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (4100, N'PayslipAllowance_Admin', N'PayslipAllowance Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (4200, N'Attendance_Admin', N'Attendance Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (4300, N'ExtraPayrollItems_Admin', N'ExtraPayrollItems Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (4400, N'MenuItems_Admin', N'MenuItems Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (4500, N'TaxRule_Admin', N'TaxRule Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (4600, N'TaxExemptEmployee_Admin', N'TaxExemptEmployee Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (4700, N'MenuItemsGroup_Admin', N'MenuItemsGroup Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (4800, N'AutoDeduction_Admin', N'AutoDeduction Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (4900, N'AutoOvertime_Admin', N'AutoOvertime Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (5000, N'SalaryCalculation_Admin', N'SalaryCalculation Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (5100, N'News_Admin', N'News Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (5200, N'Policy_Admin', N'Policy Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (5300, N'ModelTypes_Admin', N'ModelTypes Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (5400, N'JobPostRequisition_Admin', N'JobPostRequisition Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (5500, N'Salary_Admin', N'Salary Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (5600, N'JobPost_Admin', N'JobPost Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (5700, N'Roles_Admin', N'Roles Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (5800, N'CandidateEducation_Admin', N'CandidateEducation Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (5900, N'UserRoles_Admin', N'UserRoles Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (6000, N'CandidateWorkExperience_Admin', N'CandidateWorkExperience Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (6100, N'CandidateTraining_Admin', N'CandidateTraining Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (6200, N'SalaryPayslip_Admin', N'SalaryPayslip Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (6300, N'UserActionLog_Admin', N'UserActionLog Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (6400, N'CandidateLanguage_Admin', N'CandidateLanguage Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (6500, N'SalaryPayslipDetail_Admin', N'SalaryPayslipDetail Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (6600, N'CandidateSkill_Admin', N'CandidateSkill Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (6700, N'HourlyWage_Admin', N'HourlyWage Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (6800, N'CandidateReference_Admin', N'CandidateReference Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (6900, N'SalaryItem_Admin', N'SalaryItem Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (7000, N'RecruitmentCandidate_Admin', N'RecruitmentCandidate Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (7100, N'Reimbursement_Admin', N'Reimbursement Admin Control')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleDescription]) VALUES (7200, N'Project_Admin', N'Project Admin Control')
SET IDENTITY_INSERT [dbo].[Salary] ON 

INSERT [dbo].[Salary] ([id], [Employee], [SalaryType], [Currency], [TaxRule], [OvertimeRate], [AnnualGrossSalary], [MonthlyBasicSalary], [AllowanceID], [Claims], [Commissions], [Deductions], [TaxDeductionAmount], [TaxDeductionPercentage]) VALUES (1, 0, N'89', NULL, N'0', CAST(89.00 AS Decimal(18, 2)), CAST(89.00 AS Decimal(18, 2)), CAST(89.00 AS Decimal(18, 2)), 89, CAST(89.00 AS Decimal(18, 2)), CAST(89.00 AS Decimal(18, 2)), CAST(89.00 AS Decimal(18, 2)), CAST(89.00 AS Decimal(18, 2)), CAST(89.00 AS Decimal(18, 2)))
INSERT [dbo].[Salary] ([id], [Employee], [SalaryType], [Currency], [TaxRule], [OvertimeRate], [AnnualGrossSalary], [MonthlyBasicSalary], [AllowanceID], [Claims], [Commissions], [Deductions], [TaxDeductionAmount], [TaxDeductionPercentage]) VALUES (2, 0, N'Monthly', NULL, N'0', CAST(88.00 AS Decimal(18, 2)), CAST(8880.00 AS Decimal(18, 2)), CAST(8880.00 AS Decimal(18, 2)), 8880, CAST(80.00 AS Decimal(18, 2)), CAST(880.00 AS Decimal(18, 2)), CAST(880.00 AS Decimal(18, 2)), CAST(880.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Salary] ([id], [Employee], [SalaryType], [Currency], [TaxRule], [OvertimeRate], [AnnualGrossSalary], [MonthlyBasicSalary], [AllowanceID], [Claims], [Commissions], [Deductions], [TaxDeductionAmount], [TaxDeductionPercentage]) VALUES (3, 0, N'Hourly', NULL, N'0', CAST(89.00 AS Decimal(18, 2)), CAST(890.00 AS Decimal(18, 2)), CAST(890.00 AS Decimal(18, 2)), 890, CAST(890.00 AS Decimal(18, 2)), CAST(890.00 AS Decimal(18, 2)), CAST(890.00 AS Decimal(18, 2)), CAST(890.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Salary] ([id], [Employee], [SalaryType], [Currency], [TaxRule], [OvertimeRate], [AnnualGrossSalary], [MonthlyBasicSalary], [AllowanceID], [Claims], [Commissions], [Deductions], [TaxDeductionAmount], [TaxDeductionPercentage]) VALUES (4, 2, N'Monthly', NULL, N'Rule 2', CAST(7.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 70, CAST(70.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)))
INSERT [dbo].[Salary] ([id], [Employee], [SalaryType], [Currency], [TaxRule], [OvertimeRate], [AnnualGrossSalary], [MonthlyBasicSalary], [AllowanceID], [Claims], [Commissions], [Deductions], [TaxDeductionAmount], [TaxDeductionPercentage]) VALUES (5, 1, N'Hourly', NULL, N'0', CAST(60.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), 60, CAST(60.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[Salary] ([id], [Employee], [SalaryType], [Currency], [TaxRule], [OvertimeRate], [AnnualGrossSalary], [MonthlyBasicSalary], [AllowanceID], [Claims], [Commissions], [Deductions], [TaxDeductionAmount], [TaxDeductionPercentage]) VALUES (6, 4, N'Monthly', NULL, N'Rule 2', CAST(9.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), 90, CAST(90.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Salary] OFF
SET IDENTITY_INSERT [dbo].[SalaryCalculation] ON 

INSERT [dbo].[SalaryCalculation] ([id], [IncludedBaseSalary], [IncludeDeduction], [IncludeBonus], [IncludeCommission], [IncludeAdjustment], [IncludeReimbursement], [IncludeOvertime], [IncludeProvidentFund], [IncludeAdvanceSalary], [IncludeLoan], [IncludeInsurance]) VALUES (5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[SalaryCalculation] OFF
SET IDENTITY_INSERT [dbo].[SalaryItem] ON 

INSERT [dbo].[SalaryItem] ([id], [Employee], [Title], [Amount], [Description], [CreatedAt], [CreatedBy], [IsRecurring], [RecurringCyclePerMonth], [SalaryItemType]) VALUES (1, 2, N'bon', CAST(123.00 AS Decimal(18, 2)), N'<p>asdfasdfasdf</p>', CAST(N'2015-12-01 19:31:55.000' AS DateTime), 4, 1, 2, N'Adjustments')
INSERT [dbo].[SalaryItem] ([id], [Employee], [Title], [Amount], [Description], [CreatedAt], [CreatedBy], [IsRecurring], [RecurringCyclePerMonth], [SalaryItemType]) VALUES (2, 4, N'kuo dsoiuf', CAST(890.00 AS Decimal(18, 2)), N'<p>8098908098</p>', CAST(N'2015-12-08 23:10:55.000' AS DateTime), 4, 0, 0, N'Bonuses')
INSERT [dbo].[SalaryItem] ([id], [Employee], [Title], [Amount], [Description], [CreatedAt], [CreatedBy], [IsRecurring], [RecurringCyclePerMonth], [SalaryItemType]) VALUES (3, 1, N'890890', CAST(809809.00 AS Decimal(18, 2)), N'<p>809890</p>', CAST(N'2015-12-08 23:11:16.000' AS DateTime), 4, 0, 0, N'Comissions')
INSERT [dbo].[SalaryItem] ([id], [Employee], [Title], [Amount], [Description], [CreatedAt], [CreatedBy], [IsRecurring], [RecurringCyclePerMonth], [SalaryItemType]) VALUES (4, 4, N'798', CAST(798.00 AS Decimal(18, 2)), N'<p>6798687687687</p>', CAST(N'2015-12-08 23:11:41.000' AS DateTime), 4, 0, 0, N'Bonuses')
INSERT [dbo].[SalaryItem] ([id], [Employee], [Title], [Amount], [Description], [CreatedAt], [CreatedBy], [IsRecurring], [RecurringCyclePerMonth], [SalaryItemType]) VALUES (5, 1, N'7897', CAST(567.91 AS Decimal(18, 2)), N'<p>89809</p>', CAST(N'2015-12-08 23:12:18.000' AS DateTime), 4, 0, 1, N'Bonuses')
SET IDENTITY_INSERT [dbo].[SalaryItem] OFF
SET IDENTITY_INSERT [dbo].[SalaryPayslip] ON 

INSERT [dbo].[SalaryPayslip] ([id], [InstanceID], [Employee], [SalaryDate], [StartDate], [EndDate], [Note], [CreatedAt], [CreatedBy]) VALUES (1, N'1697fdfc-15cb-4721-8adc-6e0826372a85', 4, CAST(N'2015-12-08 00:00:00.000' AS DateTime), CAST(N'2015-12-29 00:00:00.000' AS DateTime), CAST(N'2015-12-23 00:00:00.000' AS DateTime), N'THis is note that I don''t really care', CAST(N'2015-12-08 17:59:11.000' AS DateTime), 4)
INSERT [dbo].[SalaryPayslip] ([id], [InstanceID], [Employee], [SalaryDate], [StartDate], [EndDate], [Note], [CreatedAt], [CreatedBy]) VALUES (2, N'1697fdfc-15cb-4721-8adc-6e0826372a85', 1, CAST(N'2015-12-08 00:00:00.000' AS DateTime), CAST(N'2015-12-29 00:00:00.000' AS DateTime), CAST(N'2015-12-23 00:00:00.000' AS DateTime), N'THis is note that I don''t really care', CAST(N'2015-12-08 18:05:52.000' AS DateTime), 4)
INSERT [dbo].[SalaryPayslip] ([id], [InstanceID], [Employee], [SalaryDate], [StartDate], [EndDate], [Note], [CreatedAt], [CreatedBy]) VALUES (3, N'5b04487b-8ff0-4a95-ba1b-61ea76556789', 1, CAST(N'2015-11-30 00:00:00.000' AS DateTime), CAST(N'2015-12-22 00:00:00.000' AS DateTime), CAST(N'2015-12-23 00:00:00.000' AS DateTime), N'08798798', CAST(N'2015-12-08 18:08:29.000' AS DateTime), 4)
INSERT [dbo].[SalaryPayslip] ([id], [InstanceID], [Employee], [SalaryDate], [StartDate], [EndDate], [Note], [CreatedAt], [CreatedBy]) VALUES (4, N'1697fdfc-15cb-4721-8adc-6e0826372a85', 1, CAST(N'2015-12-08 00:00:00.000' AS DateTime), CAST(N'2015-12-29 00:00:00.000' AS DateTime), CAST(N'2015-12-23 00:00:00.000' AS DateTime), N'THis is note that I don''t really care', CAST(N'2015-12-08 18:20:19.000' AS DateTime), 4)
INSERT [dbo].[SalaryPayslip] ([id], [InstanceID], [Employee], [SalaryDate], [StartDate], [EndDate], [Note], [CreatedAt], [CreatedBy]) VALUES (5, N'1697fdfc-15cb-4721-8adc-6e0826372a85', 1, CAST(N'2015-12-08 00:00:00.000' AS DateTime), CAST(N'2015-12-29 00:00:00.000' AS DateTime), CAST(N'2015-12-23 00:00:00.000' AS DateTime), N'THis is note that I don''t really care', CAST(N'2015-12-08 18:27:33.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[SalaryPayslip] OFF
SET IDENTITY_INSERT [dbo].[SalaryPayslipDetail] ON 

INSERT [dbo].[SalaryPayslipDetail] ([id], [InstanceID], [SalaryItem], [Amount]) VALUES (5, N'5b04487b-8ff0-4a95-ba1b-61ea76556789', N'908', CAST(987.00 AS Decimal(18, 2)))
INSERT [dbo].[SalaryPayslipDetail] ([id], [InstanceID], [SalaryItem], [Amount]) VALUES (6, N'1697fdfc-15cb-4721-8adc-6e0826372a85', N'123', CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[SalaryPayslipDetail] ([id], [InstanceID], [SalaryItem], [Amount]) VALUES (7, N'1697fdfc-15cb-4721-8adc-6e0826372a85', N'123', CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[SalaryPayslipDetail] ([id], [InstanceID], [SalaryItem], [Amount]) VALUES (8, N'1697fdfc-15cb-4721-8adc-6e0826372a85', N'999', CAST(999.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[SalaryPayslipDetail] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (1, N'AL', N'Alabama')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (2, N'AK', N'Alaska')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (3, N'AZ', N'Arizona')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (4, N'AR', N'Arkansas')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (5, N'CA', N'California')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (6, N'CO', N'Colorado')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (7, N'CT', N'Connecticut')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (8, N'DE', N'Delaware')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (9, N'DC', N'District of Columbia')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (10, N'FL', N'Florida')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (11, N'GA', N'Georgia')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (12, N'HI', N'Hawaii')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (13, N'ID', N'Idaho')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (14, N'IL', N'Illinois')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (15, N'IN', N'Indiana')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (16, N'IA', N'Iowa')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (17, N'KS', N'Kansas')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (18, N'KY', N'Kentucky')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (19, N'LA', N'Louisiana')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (20, N'ME', N'Maine')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (21, N'MD', N'Maryland')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (22, N'MA', N'Massachusetts')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (23, N'MI', N'Michigan')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (24, N'MN', N'Minnesota')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (25, N'MS', N'Mississippi')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (26, N'MO', N'Missouri')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (27, N'MT', N'Montana')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (28, N'NE', N'Nebraska')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (29, N'NV', N'Nevada')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (30, N'NH', N'New Hampshire')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (31, N'NJ', N'New Jersey')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (32, N'NM', N'New Mexico')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (33, N'NY', N'New York')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (34, N'NC', N'North Carolina')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (35, N'ND', N'North Dakota')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (36, N'OH', N'Ohio')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (37, N'OK', N'Oklahoma')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (38, N'OR', N'Oregon')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (39, N'PA', N'Pennsylvania')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (40, N'PR', N'Puerto Rico')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (41, N'RI', N'Rhode Island')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (42, N'SC', N'South Carolina')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (43, N'SD', N'South Dakota')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (44, N'TN', N'Tennessee')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (45, N'TX', N'Texas')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (46, N'UT', N'Utah')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (47, N'VT', N'Vermont')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (48, N'VA', N'Virginia')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (49, N'WA', N'Washington')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (50, N'WV', N'West Virginia')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (51, N'WI', N'Wisconsin')
INSERT [dbo].[State] ([StateID], [StateCode], [StateName]) VALUES (52, N'WY', N'Wyoming')
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[TaxExemptEmployee] ON 

INSERT [dbo].[TaxExemptEmployee] ([id], [Employee]) VALUES (2, 2)
INSERT [dbo].[TaxExemptEmployee] ([id], [Employee]) VALUES (3, 4)
INSERT [dbo].[TaxExemptEmployee] ([id], [Employee]) VALUES (4, 4)
INSERT [dbo].[TaxExemptEmployee] ([id], [Employee]) VALUES (5, 1)
SET IDENTITY_INSERT [dbo].[TaxExemptEmployee] OFF
SET IDENTITY_INSERT [dbo].[TaxRule] ON 

INSERT [dbo].[TaxRule] ([id], [RuleName], [TaxFormat], [SalaryFrom], [SalaryTo], [TaxPercentage], [ExemptedTaxAmount], [AdditionalTaxAmount], [LinkID]) VALUES (11, N'Rule 2', N'General', CAST(1000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(0.08 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'6aaedf11-3c21-482e-a9b9-4a9b1da23f9d')
INSERT [dbo].[TaxRule] ([id], [RuleName], [TaxFormat], [SalaryFrom], [SalaryTo], [TaxPercentage], [ExemptedTaxAmount], [AdditionalTaxAmount], [LinkID]) VALUES (12, N'Rule 2', N'General', CAST(2001.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(0.10 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'6aaedf11-3c21-482e-a9b9-4a9b1da23f9d')
INSERT [dbo].[TaxRule] ([id], [RuleName], [TaxFormat], [SalaryFrom], [SalaryTo], [TaxPercentage], [ExemptedTaxAmount], [AdditionalTaxAmount], [LinkID]) VALUES (13, N'Rule 2', N'General', CAST(3001.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)), CAST(0.15 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'6aaedf11-3c21-482e-a9b9-4a9b1da23f9d')
INSERT [dbo].[TaxRule] ([id], [RuleName], [TaxFormat], [SalaryFrom], [SalaryTo], [TaxPercentage], [ExemptedTaxAmount], [AdditionalTaxAmount], [LinkID]) VALUES (14, N'Rule 2', N'General', CAST(4001.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(0.20 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'6aaedf11-3c21-482e-a9b9-4a9b1da23f9d')
INSERT [dbo].[TaxRule] ([id], [RuleName], [TaxFormat], [SalaryFrom], [SalaryTo], [TaxPercentage], [ExemptedTaxAmount], [AdditionalTaxAmount], [LinkID]) VALUES (15, N'Rule 2', N'General', CAST(5001.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)), CAST(0.30 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'6aaedf11-3c21-482e-a9b9-4a9b1da23f9d')
INSERT [dbo].[TaxRule] ([id], [RuleName], [TaxFormat], [SalaryFrom], [SalaryTo], [TaxPercentage], [ExemptedTaxAmount], [AdditionalTaxAmount], [LinkID]) VALUES (16, N'Rule 2', N'General', CAST(6001.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.40 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'6aaedf11-3c21-482e-a9b9-4a9b1da23f9d')
SET IDENTITY_INSERT [dbo].[TaxRule] OFF
SET IDENTITY_INSERT [dbo].[Termination] ON 

INSERT [dbo].[Termination] ([id], [TerminatedTo], [ForwardApplicationTo], [TerminationDate], [Description], [CreatedBy], [CreatedAt]) VALUES (1, 3, 4, CAST(N'2015-11-17 00:00:00.000' AS DateTime), N'<p>Kendo UI Core</p><p>About Kendo UI Core</p><p><br></p><p>Kendo UI is everything you need to build sites and apps with HTML5 & JavaScript. Kendo UI Core is the free and open-source version of Kendo UI that provides access to the web''s best UI widgets and key framework features, essential for developing great experiences for the web and mobile.</p><p><br></p><p>Build Status</p><p><br></p><p>Features of Kendo UI Core</p><p><br></p><p>Kendo UI Core is a free and open-source subset of Kendo UI. The following table details the widgets and features available in Kendo UI Core, as well as the additional features available via a commercial Kendo UI license.</p>', 2, CAST(N'2015-11-20 22:13:49.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Termination] OFF
SET IDENTITY_INSERT [dbo].[Trainer] ON 

INSERT [dbo].[Trainer] ([id], [FirstName], [LastName], [Designation], [Organization], [Address], [City], [State], [Zip], [Country], [TrainerEmail], [TrainerPhone], [TrainerPhone2], [TrainerExpertise]) VALUES (1, N'Tom', N'Jack', N'Manager', N'123kkk', N'1st N St.', N'Nacogdoches', N'TX', N'76543', N'USA', N'gmail@gmail.com', N'808098909', N'798798788', N'Good Smile')
SET IDENTITY_INSERT [dbo].[Trainer] OFF
SET IDENTITY_INSERT [dbo].[Training] ON 

INSERT [dbo].[Training] ([id], [Employee], [Type], [Subject], [NatureOfTraining], [Title], [Trainer], [Location], [SponsoredBy], [OrganizedBy], [StartDate], [EndDate], [Description], [CreatedAt], [CreatedBy]) VALUES (1, 1, N'Seminar', N'89', N'Internal', N'89', N'89', N'89', N'89', N'89', CAST(N'2015-12-14 00:00:00.000' AS DateTime), CAST(N'2015-12-31 00:00:00.000' AS DateTime), N'<p>9809809809809809890890</p>', CAST(N'2015-12-01 22:50:41.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[Training] OFF
SET IDENTITY_INSERT [dbo].[TrainingEvaluation] ON 

INSERT [dbo].[TrainingEvaluation] ([id], [Title], [Description], [CreatedAt], [CreatedBy]) VALUES (1, N'Nice touch', N'<p>3pripi</p><p>qrwer</p><p>werqwerqwer</p>', CAST(N'2015-12-01 23:55:26.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[TrainingEvaluation] OFF
SET IDENTITY_INSERT [dbo].[TrainingEvent] ON 

INSERT [dbo].[TrainingEvent] ([id], [Type], [Subject], [NatureOfTraining], [Title], [Location], [SponsoredBy], [OrganizedBy], [StartDate], [EndDate], [Trainers], [Trainees], [Externals], [Description], [CreatedAt], [CreatedBy]) VALUES (1, N'Seminar', N'80', N'Internal', N'78', N'78', N'78', N'78', CAST(N'2015-12-15 00:00:00.000' AS DateTime), CAST(N'2016-01-08 00:00:00.000' AS DateTime), N'78', N'7878', N'78', N'<p>787878787878</p>', CAST(N'2015-12-01 23:44:30.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[TrainingEvent] OFF
SET IDENTITY_INSERT [dbo].[TrainingNeedAssessment] ON 

INSERT [dbo].[TrainingNeedAssessment] ([id], [Department], [Type], [Subject], [NatureOfTraining], [Title], [Employee], [Reason], [PreferredTrainer], [PreferredLocation], [PreferredStartDate], [PreferredEndDate], [Description], [CreatedAt], [CreatedBy]) VALUES (1, 1, N'Seminar', N'89', N'Internal', N'89', 89, N'89', N'89', N'89', CAST(N'2015-12-07 00:00:00.000' AS DateTime), CAST(N'2015-12-31 00:00:00.000' AS DateTime), N'<p>898898989</p>', CAST(N'2015-12-01 23:01:05.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[TrainingNeedAssessment] OFF
SET IDENTITY_INSERT [dbo].[Transfer] ON 

INSERT [dbo].[Transfer] ([id], [EmployeeToTransfer], [ForwardApplicationTo], [TransferDate], [TransferToDepartment], [TransferToStation], [TransferDescription], [CreatedBy], [CreatedAt]) VALUES (1, 1, 1, CAST(N'2015-11-17 00:00:00.000' AS DateTime), 1, N'0', N'<p>uouybhkjhkljhklhklhklj hkl hklbhlkj</p>', 2, CAST(N'2015-11-20 22:26:52.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transfer] OFF
SET IDENTITY_INSERT [dbo].[Travel] ON 

INSERT [dbo].[Travel] ([id], [Employee], [ForwardApplicationTo], [Purpose], [StartDate], [EndDate], [ExpectedBudget], [ActualBudget], [TravelDescription], [CreatedBy], [CreatedAt]) VALUES (1, 1, 1, N'890809890', CAST(N'2015-11-09 00:00:00.000' AS DateTime), CAST(N'2015-11-18 00:00:00.000' AS DateTime), CAST(90.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), N'<p>Telerik - A Progress Company</p><p>PRODUCTS </p><p>ENTERPRISE</p><p>FREE TRIALS</p><p>PRICING</p><p>SUPPORT & LEARNING</p><p>COMPANY</p><p>Your Account</p><p>Telerik Platform</p><p>Kendo UI</p><p>‹ Overview</p><p>Demos Pricing Try now</p><p>Kendo UI Core</p><p>The Open Source Kendo UI: HTML5 widgets for web and mobile development</p><p>Open Source and Free HTML5 Framework</p><p><br></p><p>Telerik Kendo UI® Core is the open source version of Kendo UI, the comprehensive framework for building modern web and mobile apps with HTML5 and JavaScript.</p><p><br></p><p>The open source package:</p><p>40+ jQuery-based widgets and framework features</p><p>Licensed under the permissive Apache v2 license</p><p>Suitable for projects not requiring dedicated technical support</p><p>Get Kendo UI Core</p><p>Join the Kendo UI Core community on GitHub</p><p><br></p><p> </p><p><br></p><p>Key Features</p><p><br></p><p>features-controls</p><p>Hundreds of Scenarios Out-of-the-Box</p><p>Kendo UI Core comes with 40+ widgets and framework features for creating HTML5 and JavaScript projects, without the worries of cross-browser compatibility, standards compliance or touch-device support.</p><p><br></p><p><br></p><p>  Pixel-perfect-themes</p><p>Pixel-Perfect Themes for Your Apps</p><p>Kendo UI widgets can easily be themed and styled via CSS. The framework includes 11 out-of-the-box themes that you can customize with a point-and-click using the Theme Builder tool.</p><p><br></p><p><br></p><p>  ultimate-performace</p><p>Ultimate JavaScript Performance</p><p>Kendo UI was engineered with performance in mind: It comes with a templating library that performs faster than jQuery Templates, optimized animations leveraging CSS3 hardware acceleration and cutting-edge UI virtualization.</p><p><br></p>', 2, CAST(N'2015-11-20 22:38:18.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Travel] OFF
SET IDENTITY_INSERT [dbo].[UserActionLog] ON 

INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (1, N'test1', N'Admin', N'/jobpost', N'', 1, CAST(N'2015-12-12 20:51:45.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (2, N'test1', N'Admin', N'/jobpost', N'', 0, CAST(N'2015-12-12 20:54:20.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (3, N'test1', N'Admin', N'/jobpost', N'', 0, CAST(N'2015-12-12 21:01:03.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (4, N'test1', N'Admin', N'/jobpost', N'', 0, CAST(N'2015-12-12 21:01:03.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (5, N'test1', N'Admin', N'/jobpost', N'', 0, CAST(N'2015-12-12 21:03:47.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (6, N'test1', N'Admin', N'/jobpost', N'', 0, CAST(N'2015-12-12 21:03:47.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (7, N'test1', N'Admin', N'/jobpost', N'', 0, CAST(N'2015-12-12 21:08:25.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (8, N'test1', N'Admin', N'/jobpost', N'', 0, CAST(N'2015-12-12 21:08:25.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (9, N'test1', N'Admin', N'/jobpost', N'', 0, CAST(N'2015-12-12 21:12:09.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (10, N'test1', N'Admin', N'/jobpost', N'', 0, CAST(N'2015-12-12 21:12:09.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (11, N'test1', N'Admin', N'/jobpost', N'', 0, CAST(N'2016-01-02 17:27:35.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (12, N'test1', N'Admin', N'/jobpost', N'', 0, CAST(N'2016-01-02 23:09:53.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (13, N'test1', N'Admin', N'/JobPost', N'', 1, CAST(N'2016-02-27 10:49:33.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (14, N'test1', N'Admin', N'/JobPost', N'', 1, CAST(N'2016-02-28 11:30:49.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (15, N'test1', N'Admin', N'/JobPost', N'', 1, CAST(N'2016-04-07 21:29:59.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (16, N'test1', N'Admin', N'/JobPost', N'', 1, CAST(N'2017-03-12 21:05:03.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (17, N'test1', N'Admin', N'/JobPost', N'', 1, CAST(N'2017-03-17 01:46:06.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (18, N'test1', N'Admin', N'/JobPost', N'', 1, CAST(N'2017-03-26 17:11:01.000' AS DateTime))
INSERT [dbo].[UserActionLog] ([id], [UserName], [UserRole], [Path], [PathParam], [IsAuth], [LogTime]) VALUES (19, N'test1', N'Admin', N'/JobPost', N'', 1, CAST(N'2017-03-30 02:41:06.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserActionLog] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (160, 2, 2)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (161, 2, 400)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (162, 2, 500)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (163, 2, 700)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (164, 2, 900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (165, 2, 1100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (166, 2, 1400)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (167, 2, 1900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (168, 2, 2000)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (169, 2, 2100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (170, 2, 2300)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (171, 2, 2600)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (172, 2, 2700)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (173, 2, 2900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (174, 2, 3000)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (175, 2, 4900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (176, 2, 5300)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (225, 1, 2)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (226, 1, 700)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (227, 1, 900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (228, 1, 1000)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (229, 1, 1100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (230, 1, 1200)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (231, 1, 1300)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (232, 1, 1400)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (233, 1, 1500)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (234, 1, 1600)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (235, 1, 1800)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (236, 1, 1900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (237, 1, 2000)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (238, 1, 2100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (239, 1, 2500)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (240, 1, 2800)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (241, 1, 3200)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (242, 1, 4100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (243, 1, 4600)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (323, 4, 0)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (324, 4, 1)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (325, 4, 2)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (326, 4, 300)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (327, 4, 400)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (328, 4, 500)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (329, 4, 600)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (330, 4, 700)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (331, 4, 800)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (332, 4, 900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (333, 4, 1000)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (334, 4, 1100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (335, 4, 1200)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (336, 4, 1300)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (337, 4, 1400)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (338, 4, 1500)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (339, 4, 1600)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (340, 4, 1700)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (341, 4, 1800)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (342, 4, 1900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (343, 4, 2000)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (344, 4, 2100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (345, 4, 2200)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (346, 4, 2300)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (347, 4, 2400)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (348, 4, 2500)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (349, 4, 2600)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (350, 4, 2700)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (351, 4, 2800)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (352, 4, 2900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (353, 4, 3000)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (354, 4, 3100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (355, 4, 3200)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (356, 4, 3300)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (357, 4, 3400)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (358, 4, 3500)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (359, 4, 3600)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (360, 4, 3700)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (361, 4, 3800)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (362, 4, 3900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (363, 4, 4000)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (364, 4, 4100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (365, 4, 4200)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (366, 4, 4300)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (367, 4, 4400)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (368, 4, 4500)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (369, 4, 4600)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (370, 4, 4700)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (371, 4, 4800)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (372, 4, 4900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (373, 4, 5000)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (374, 4, 5100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (375, 4, 5200)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (376, 4, 5300)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (377, 4, 5400)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (378, 4, 5500)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (379, 4, 5600)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (380, 4, 5700)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (381, 4, 5800)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (382, 4, 5900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (383, 4, 6000)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (384, 4, 6100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (385, 4, 6200)
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (386, 4, 6300)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (387, 4, 6400)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (388, 4, 6500)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (389, 4, 6600)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (390, 4, 6700)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (391, 4, 6800)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (392, 4, 6900)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (393, 4, 7000)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (394, 4, 7100)
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (395, 4, 7200)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
SET IDENTITY_INSERT [dbo].[Warning] ON 

INSERT [dbo].[Warning] ([id], [WarningTo], [WarningBy], [WarningDate], [Subject], [Description], [CreatedBy], [CreatedAt]) VALUES (1, 0, N'890 809', CAST(N'2015-11-12 00:00:00.000' AS DateTime), N'I warn you', N'<p>asdfasdfasdfasdfasdfasdfasdfasd</p>', 2, CAST(N'2015-11-20 22:45:01.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Warning] OFF
SET IDENTITY_INSERT [dbo].[WorkShift] ON 

INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (13, N'c39e927a-ea80-40dd-8c56-d78d541d338b', N'Weekend Shift', N'Sun', CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (14, N'c39e927a-ea80-40dd-8c56-d78d541d338b', N'Weekend Shift', N'Sat', CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (15, N'b4717399-4c40-4d3c-8fc2-fd877b705cf1', N'Another SW', N'Sun', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (16, N'b4717399-4c40-4d3c-8fc2-fd877b705cf1', N'Another SW', N'Fri', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (17, N'58cce2c0-92f9-4cf2-8913-dd71c3dff937', N'2ND WS', N'Mon', CAST(N'05:30:00' AS Time), CAST(N'14:30:00' AS Time), CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (18, N'58cce2c0-92f9-4cf2-8913-dd71c3dff937', N'2ND WS', N'Thu', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (19, N'58cce2c0-92f9-4cf2-8913-dd71c3dff937', N'2ND WS', N'Fri', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (31, N'81baba9d-0f84-4582-b856-cd8b8c52cfb9', N'Random Time 2', N'Mon', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (32, N'81baba9d-0f84-4582-b856-cd8b8c52cfb9', N'Random Time 2', N'Tue', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (33, N'81baba9d-0f84-4582-b856-cd8b8c52cfb9', N'Random Time 2', N'Thu', CAST(N'05:30:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (34, N'81baba9d-0f84-4582-b856-cd8b8c52cfb9', N'Random Time 2', N'Sat', CAST(N'18:30:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (39, N'179c47ea-1024-4d2f-b722-6f56db75f170', N'Random Time', N'Mon', CAST(N'16:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (40, N'179c47ea-1024-4d2f-b722-6f56db75f170', N'Random Time', N'Tue', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (41, N'179c47ea-1024-4d2f-b722-6f56db75f170', N'Random Time', N'Thu', CAST(N'05:30:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (42, N'179c47ea-1024-4d2f-b722-6f56db75f170', N'Random Time', N'Sat', CAST(N'18:30:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (45, N'1e6a80a4-115a-467f-8506-3208635780b6', N'Good God TW', N'Sun', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (46, N'1e6a80a4-115a-467f-8506-3208635780b6', N'Good God TW', N'Fri', CAST(N'22:30:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (47, N'b1b1977e-5170-4774-8862-74f299526192', N'Cook WS', N'Sun', CAST(N'06:30:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (48, N'b1b1977e-5170-4774-8862-74f299526192', N'Cook WS', N'Mon', CAST(N'05:30:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (49, N'332fe9d9-5d74-454d-8f4d-0875a9b7f169', N'First WS', N'Mon', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (50, N'332fe9d9-5d74-454d-8f4d-0875a9b7f169', N'First WS', N'Tue', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (51, N'332fe9d9-5d74-454d-8f4d-0875a9b7f169', N'First WS', N'Wed', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (52, N'332fe9d9-5d74-454d-8f4d-0875a9b7f169', N'First WS', N'Thu', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[WorkShift] ([id], [InstanceID], [WorkShiftTitle], [WorkDays], [RegularWorkHoursFrom], [RegularWorkHoursTo], [LunchBreakHoursFrom], [LunchBreakHoursTo], [AdditionalBreakHoursFrom], [AdditionalBreakHoursTo]) VALUES (53, N'332fe9d9-5d74-454d-8f4d-0875a9b7f169', N'First WS', N'Fri', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[WorkShift] OFF
ALTER TABLE [dbo].[ExtraPayrollItems] ADD  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[AdminDepartment]  WITH CHECK ADD  CONSTRAINT [FK_AdminDepartment_Company] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Company] ([id])
GO
ALTER TABLE [dbo].[AdminDepartment] CHECK CONSTRAINT [FK_AdminDepartment_Company]
GO
ALTER TABLE [dbo].[JobPost]  WITH CHECK ADD  CONSTRAINT [FK_JobPost_AdminDepartment] FOREIGN KEY([Department])
REFERENCES [dbo].[AdminDepartment] ([DeptID])
GO
ALTER TABLE [dbo].[JobPost] CHECK CONSTRAINT [FK_JobPost_AdminDepartment]
GO
ALTER TABLE [dbo].[JobPostRequisition]  WITH CHECK ADD  CONSTRAINT [FK_JobPostRequisition_AdminDepartment] FOREIGN KEY([Department])
REFERENCES [dbo].[AdminDepartment] ([DeptID])
GO
ALTER TABLE [dbo].[JobPostRequisition] CHECK CONSTRAINT [FK_JobPostRequisition_AdminDepartment]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
/****** Object:  StoredProcedure [dbo].[SPEmploymentDashboard]    Script Date: 3/31/17 2:26:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPEmploymentDashboard]
(
  @FromDate smalldatetime = null,
  @ToDate smalldatetime = null
)

--  exec [SPEmploymentDashboard]

AS
BEGIN
    select e.Type
		, e.Category
		, dept.Name as DepartmentName
		, e.Designation
		, e.Gender
		, e.FirstName + ' ' + e.LastName as EmployeeName
		, e.IsActive as IsActive
		, e.WorkShift
		, s.MonthlyBasicSalary
		, s.SalaryType
		, s.TaxRule
		, isnull(si.Amount , 0) as Amount
		, si.SalaryItemType
	from Employee e
	left outer join AdminDepartment dept on e.Department = dept.DeptID
	left outer join Salary s on s.Employee = e.id
	left outer join SalaryItem si on si.Employee = e.id
	
	union all

	select e.Type
		, e.Category
		, dept.Name as DepartmentName
		, e.Designation
		, e.Gender
		, e.FirstName + ' ' + e.LastName as EmployeeName
		, e.IsActive as IsActive
		, e.WorkShift
		, s.MonthlyBasicSalary
		, s.SalaryType
		, s.TaxRule
		, isnull(ot.Amount, 0) as Amount
		, 'Overtimes' as SalaryItemType
	from Employee e
	left outer join AdminDepartment dept on e.Department = dept.DeptID
	left outer join Salary s on s.Employee = e.id
	left outer join Overtime ot on ot.Employee = e.id

	union all

	select e.Type
		, e.Category
		, dept.Name as DepartmentName
		, e.Designation
		, e.Gender
		, e.FirstName + ' ' + e.LastName as EmployeeName
		, e.IsActive as IsActive
		, e.WorkShift
		, s.MonthlyBasicSalary
		, s.SalaryType
		, s.TaxRule
		, isnull(l.LoanAmount * -1 , 0) as Amount
		, 'Loans' as SalaryItemType
	from Employee e
	left outer join AdminDepartment dept on e.Department = dept.DeptID
	left outer join Salary s on s.Employee = e.id
	left outer join Loan l on l.Employee = e.id


	
	union all

	select e.Type
		, e.Category
		, dept.Name as DepartmentName
		, e.Designation
		, e.Gender
		, e.FirstName + ' ' + e.LastName as EmployeeName
		, e.IsActive as IsActive
		, e.WorkShift
		, s.MonthlyBasicSalary
		, s.SalaryType
		, s.TaxRule
		, isnull(rim.Amount, 0) as Amount
		, 'Reimbursements' as SalaryItemType
	from Employee e
	left outer join AdminDepartment dept on e.Department = dept.DeptID
	left outer join Salary s on s.Employee = e.id
	left outer join reimbursement rim on rim.Employee = e.id

END



GO
USE [master]
GO
ALTER DATABASE [Florence_dev] SET  READ_WRITE 
GO
