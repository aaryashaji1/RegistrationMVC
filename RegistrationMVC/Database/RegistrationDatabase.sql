USE [RegistrationMVC]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 6/28/2021 6:10:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Address] [varchar](25) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Dob] [date] NOT NULL,
	[Pincode] [int] NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Address], [Gender], [Dob], [Pincode], [Username], [Password]) VALUES (1, N'Anu', N'Kalady', N'Female', CAST(N'1996-02-10' AS Date), 683587, N'anu', N'anu1996')
INSERT [dbo].[Student] ([Id], [Name], [Address], [Gender], [Dob], [Pincode], [Username], [Password]) VALUES (2, N'Devu', N'Angamaly', N'Female', CAST(N'1998-10-06' AS Date), 678954, N'devu', N'devu1996')
INSERT [dbo].[Student] ([Id], [Name], [Address], [Gender], [Dob], [Pincode], [Username], [Password]) VALUES (3, N'Balu', N'Kannur', N'Male', CAST(N'1997-09-01' AS Date), 675432, N'balu', N'balu1234')
INSERT [dbo].[Student] ([Id], [Name], [Address], [Gender], [Dob], [Pincode], [Username], [Password]) VALUES (4, N'Malu', N'Perumbavoor', N'Female', CAST(N'1995-01-12' AS Date), 675432, N'malu', N'malu1996')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
/****** Object:  StoredProcedure [dbo].[StudentRead]    Script Date: 6/28/2021 6:10:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StudentRead]
	@Username VARCHAR(20)
	,	@Password VARCHAR(20)
	
AS
BEGIN
SELECT
	[Name]
	,	[Address]
	,	[Gender]
	,	[Dob]
	,	[Pincode]
FROM	[dbo].[Student]	
WHERE	[Username]=@Username AND [Password]=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[StudentSave]    Script Date: 6/28/2021 6:10:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StudentSave]
	@Name	VARCHAR(20)
	,	@Address	VARCHAR(25)
	,	@Gender		VARCHAR(10)
	,	@Dob		DATE
	,	@Pincode	INT
	,	@Username	VARCHAR(20)
	,	@Password	VARCHAR(20)
AS
BEGIN
INSERT INTO [dbo].[Student]
(
	[Name]
	,	[Address]
	,	[Gender]
	,	[Dob]
	,	[Pincode]
	,	[Username]
	,	[Password]
)
VALUES
(
	@Name
	,	@Address
	,	@Gender
	,	@Dob
	,	@Pincode
	,	@Username
	,	@Password
)
END
GO
