USE [MTrackerAPI]
GO
/****** Object:  StoredProcedure [dbo].[PojectTaskDetails]    Script Date: 09-04-2023 10:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PojectTaskDetails] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT r.ResourceName,p.ProjectTaskID,u.Story,pr.ProjectName from ProjectTasks p INNER JOIN Resource r on p.AssignedTo=r.ResourceID inner join UserStories u on p.UserStoryID=u.UserStoryID
inner join Projects pr on u.ProjectID=pr.ProjectID
END

GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 09-04-2023 10:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 09-04-2023 10:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CName] [nvarchar](max) NULL,
	[Age] [int] NOT NULL,
	[CAddress] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 09-04-2023 10:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Company_name] [nvarchar](max) NULL,
	[Designation] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ManagerComments]    Script Date: 09-04-2023 10:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerComments](
	[ManagerCommentID] [int] IDENTITY(1,1) NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[ProjectTaskID] [int] NULL,
 CONSTRAINT [PK_ManagerComments] PRIMARY KEY CLUSTERED 
(
	[ManagerCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 09-04-2023 10:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[ClientName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectTasks]    Script Date: 09-04-2023 10:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTasks](
	[ProjectTaskID] [int] IDENTITY(1,1) NOT NULL,
	[AssignedTo] [int] NULL,
	[TaskStartDate] [datetime2](7) NULL,
	[TaskEndDate] [datetime2](7) NULL,
	[TaskCompletion] [int] NULL,
	[UserStoryID] [int] NOT NULL,
 CONSTRAINT [PK_ProjectTasks] PRIMARY KEY CLUSTERED 
(
	[ProjectTaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource]    Script Date: 09-04-2023 10:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[ResourceID] [int] IDENTITY(1,1) NOT NULL,
	[ResourceName] [nvarchar](max) NULL,
	[Destination] [nvarchar](max) NULL,
	[ManagerID] [int] NULL,
	[ContactNo] [nvarchar](max) NULL,
	[EmailID] [nvarchar](max) NULL,
	[SkillSets] [nvarchar](max) NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserStories]    Script Date: 09-04-2023 10:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStories](
	[UserStoryID] [int] IDENTITY(1,1) NOT NULL,
	[Story] [nvarchar](max) NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK_UserStories] PRIMARY KEY CLUSTERED 
(
	[UserStoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230122033718_firstTest', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230129051503_Customer', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230212041355_Resource', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230212041704_Rasource1', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230219041010_key', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230225161343_initial', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230318040253_ProjectsTb', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230318040554_Projectsadd', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230325041056_allresourcemodel', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230325041349_alltableres', N'7.0.2')
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Address], [Company_name], [Designation]) VALUES (1, N'string', N'string', N'string', N'string')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Address], [Company_name], [Designation]) VALUES (2, N'Sarnadeep', N'Rajbandh', N'TCS', N'SD')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[ManagerComments] ON 

INSERT [dbo].[ManagerComments] ([ManagerCommentID], [Comments], [ProjectTaskID]) VALUES (1, N'Type a comment into the comment field.', 1)
SET IDENTITY_INSERT [dbo].[ManagerComments] OFF
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ClientName]) VALUES (1, N'PIre COC', CAST(N'2018-01-27 00:00:00.0000000' AS DateTime2), CAST(N'2018-01-13 00:00:00.0000000' AS DateTime2), N'PIRE')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ClientName]) VALUES (3, N'PIre COC1', CAST(N'2018-01-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-01-30 00:00:00.0000000' AS DateTime2), N'PIRE')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ClientName]) VALUES (4, N'PIre COC2', CAST(N'2018-01-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-01-30 00:00:00.0000000' AS DateTime2), N'PIRE')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ClientName]) VALUES (5, N'PIRE Sim-DWI', CAST(N'2018-01-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-01-30 00:00:00.0000000' AS DateTime2), N'PIRE')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ClientName]) VALUES (6, N'Sharp Mentors', CAST(N'2018-01-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-01-30 00:00:00.0000000' AS DateTime2), N'PIRE')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ClientName]) VALUES (7, N'Salesfully', CAST(N'2018-01-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-01-30 00:00:00.0000000' AS DateTime2), N'PIRE')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ClientName]) VALUES (8, N'SignaPayHub', CAST(N'2018-01-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-01-30 00:00:00.0000000' AS DateTime2), N'PIRE')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ClientName]) VALUES (9, N'walletally', CAST(N'2018-01-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-01-30 00:00:00.0000000' AS DateTime2), N'PIRE')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ClientName]) VALUES (10, N'Pet’s', CAST(N'2018-01-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-01-30 00:00:00.0000000' AS DateTime2), N'PIRE')
INSERT [dbo].[Projects] ([ProjectID], [ProjectName], [StartDate], [EndDate], [ClientName]) VALUES (16, N'Java Project', CAST(N'2018-01-17 00:00:00.0000000' AS DateTime2), CAST(N'2018-01-17 00:00:00.0000000' AS DateTime2), N'Java Project')
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[ProjectTasks] ON 

INSERT [dbo].[ProjectTasks] ([ProjectTaskID], [AssignedTo], [TaskStartDate], [TaskEndDate], [TaskCompletion], [UserStoryID]) VALUES (1, 1, CAST(N'2018-07-27 13:03:44.7300000' AS DateTime2), CAST(N'2018-07-30 13:03:44.7300000' AS DateTime2), 1, 1)
INSERT [dbo].[ProjectTasks] ([ProjectTaskID], [AssignedTo], [TaskStartDate], [TaskEndDate], [TaskCompletion], [UserStoryID]) VALUES (2, 2, CAST(N'2018-07-27 13:03:44.7300000' AS DateTime2), CAST(N'2018-07-30 13:03:44.7300000' AS DateTime2), 1, 1)
INSERT [dbo].[ProjectTasks] ([ProjectTaskID], [AssignedTo], [TaskStartDate], [TaskEndDate], [TaskCompletion], [UserStoryID]) VALUES (1002, 3, CAST(N'2020-02-02 00:00:00.0000000' AS DateTime2), CAST(N'2020-01-01 00:00:00.0000000' AS DateTime2), 34, 1)
INSERT [dbo].[ProjectTasks] ([ProjectTaskID], [AssignedTo], [TaskStartDate], [TaskEndDate], [TaskCompletion], [UserStoryID]) VALUES (1005, 7, CAST(N'2020-03-13 00:00:00.0000000' AS DateTime2), CAST(N'2020-03-13 00:00:00.0000000' AS DateTime2), 1, 26)
SET IDENTITY_INSERT [dbo].[ProjectTasks] OFF
SET IDENTITY_INSERT [dbo].[Resource] ON 

INSERT [dbo].[Resource] ([ResourceID], [ResourceName], [Destination], [ManagerID], [ContactNo], [EmailID], [SkillSets]) VALUES (1, N'Sarnadeep Mondal', N'DBO', 1, N'8597547101', N'sarnadeepmondal@gmail.com', N'.net core')
INSERT [dbo].[Resource] ([ResourceID], [ResourceName], [Destination], [ManagerID], [ContactNo], [EmailID], [SkillSets]) VALUES (2, N'Rahul Mondal', N'Dev', 1, N'9574081048', N'rahul@gmail.com', N'c#')
INSERT [dbo].[Resource] ([ResourceID], [ResourceName], [Destination], [ManagerID], [ContactNo], [EmailID], [SkillSets]) VALUES (3, N'Chandan Dey', N'Application Dev', 1, N'9832166334', N'cdey@gmai.com', N'Full Stack')
INSERT [dbo].[Resource] ([ResourceID], [ResourceName], [Destination], [ManagerID], [ContactNo], [EmailID], [SkillSets]) VALUES (4, N'Ram', N'DBA', 1, N'8595547101', N'ram@gmail.com', N'full')
INSERT [dbo].[Resource] ([ResourceID], [ResourceName], [Destination], [ManagerID], [ContactNo], [EmailID], [SkillSets]) VALUES (5, N'Ram', N'DBA', 1, N'8595547101', N'ram@gmail.com', N'full')
INSERT [dbo].[Resource] ([ResourceID], [ResourceName], [Destination], [ManagerID], [ContactNo], [EmailID], [SkillSets]) VALUES (6, N'Cd', N'Azure Dev', 2, N'9832', N'Test@gmail.com', N'Azure')
INSERT [dbo].[Resource] ([ResourceID], [ResourceName], [Destination], [ManagerID], [ContactNo], [EmailID], [SkillSets]) VALUES (7, N'Bappa', N'Java Dev', 1, N'9832687451', N'Test@gmail.com', N'Java')
SET IDENTITY_INSERT [dbo].[Resource] OFF
SET IDENTITY_INSERT [dbo].[UserStories] ON 

INSERT [dbo].[UserStories] ([UserStoryID], [Story], [ProjectID]) VALUES (1, N'Pire COC', 1)
INSERT [dbo].[UserStories] ([UserStoryID], [Story], [ProjectID]) VALUES (24, N'Pire COC', 1)
INSERT [dbo].[UserStories] ([UserStoryID], [Story], [ProjectID]) VALUES (25, N'Pire COC', 1)
INSERT [dbo].[UserStories] ([UserStoryID], [Story], [ProjectID]) VALUES (26, N'Mavan Project ', 16)
SET IDENTITY_INSERT [dbo].[UserStories] OFF
