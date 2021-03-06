USE [master]
GO
/****** Object:  Database [UmbracoShowTellDemo]    Script Date: 17/02/2017 14:38:48 ******/
CREATE DATABASE [UmbracoShowTellDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UmbracoShowTellDemo', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS2012\MSSQL\DATA\UmbracoShowTellDemo.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UmbracoShowTellDemo_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS2012\MSSQL\DATA\UmbracoShowTellDemo_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UmbracoShowTellDemo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UmbracoShowTellDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UmbracoShowTellDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET  MULTI_USER 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UmbracoShowTellDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UmbracoShowTellDemo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UmbracoShowTellDemo]
GO
/****** Object:  Table [dbo].[cmsContent]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContent](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[contentType] [int] NOT NULL,
 CONSTRAINT [PK_cmsContent] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentVersion]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[VersionId] [uniqueidentifier] NOT NULL,
	[VersionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentXml]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentXml](
	[nodeId] [int] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataType]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cmsDataType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataTypePreValues]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataTypePreValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datatypeNodeId] [int] NOT NULL,
	[value] [ntext] NULL,
	[sortorder] [int] NOT NULL,
	[alias] [nvarchar](50) NULL,
 CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocument]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[documentUser] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[releaseDate] [datetime] NULL,
	[expireDate] [datetime] NULL,
	[updateDate] [datetime] NOT NULL,
	[templateId] [int] NULL,
	[newest] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocument] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroScriptType] [nvarchar](255) NULL,
	[macroScriptAssembly] [nvarchar](255) NULL,
	[macroXSLT] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroPython] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPreviewXml]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPreviewXml](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyData]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contentNodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NULL,
	[propertytypeid] [int] NOT NULL,
	[dataInt] [int] NULL,
	[dataDecimal] [decimal](38, 6) NULL,
	[dataDate] [datetime] NULL,
	[dataNvarchar] [nvarchar](500) NULL,
	[dataNtext] [ntext] NULL,
 CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[group] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTask]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTask](
	[closed] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskTypeId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[parentUserId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_cmsTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTaskType]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTaskType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsTaskType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
	[design] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDeployChecksum]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDeployChecksum](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entityType] [nvarchar](32) NOT NULL,
	[entityGuid] [uniqueidentifier] NULL,
	[entityPath] [nvarchar](256) NULL,
	[localChecksum] [nvarchar](32) NOT NULL,
	[compositeChecksum] [nvarchar](32) NULL,
 CONSTRAINT [PK_umbracoDeployChecksum] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDeployDependency]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDeployDependency](
	[sourceId] [int] NOT NULL,
	[targetId] [int] NOT NULL,
	[mode] [int] NOT NULL,
 CONSTRAINT [PK_umbracoDeployDependency] PRIMARY KEY CLUSTERED 
(
	[sourceId] ASC,
	[targetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDomains]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](10) NULL,
	[languageCultureName] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[NodeId] [int] NOT NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoMigration]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMigration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[version] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_umbracoMigration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trashed] [bit] NOT NULL,
	[parentID] [int] NOT NULL,
	[nodeUser] [int] NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_structure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NOT NULL,
	[childObjectType] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userType] [int] NOT NULL,
	[startStructureID] [int] NOT NULL,
	[startMediaID] [int] NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2app]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2app](
	[user] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user2app] PRIMARY KEY CLUSTERED 
(
	[user] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodePermission]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodePermission](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserType]    Script Date: 17/02/2017 14:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userTypeAlias] [nvarchar](50) NULL,
	[userTypeName] [nvarchar](255) NOT NULL,
	[userTypeDefaultPermissions] [nvarchar](50) NULL,
 CONSTRAINT [PK_umbracoUserType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cmsContent] ON 

INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (1, 1059, 1056)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (2, 1060, 1057)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (3, 1061, 1058)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (4, 1062, 1058)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (5, 1063, 1058)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (6, 1064, 1057)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (7, 1065, 1058)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (8, 1066, 1058)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (9, 1067, 1058)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (10, 1068, 1057)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (11, 1069, 1058)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (12, 1070, 1058)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (13, 1071, 1055)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (14, 1072, 1054)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (15, 1073, 1054)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (16, 1074, 1054)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (17, 1075, 1057)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (18, 1078, 1079)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (19, 1085, 1084)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (20, 1087, 1083)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (21, 1088, 1083)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (22, 1089, 1083)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (23, 1091, 1090)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (24, 1092, 1090)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (25, 1093, 1083)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (26, 1094, 1083)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (27, 1095, 1083)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (28, 1099, 1096)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (29, 1103, 1096)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (30, 1104, 1101)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (31, 1105, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (32, 1110, 1108)
SET IDENTITY_INSERT [dbo].[cmsContent] OFF
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (535, 1054, N'BlogPost', N'icon-edit', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (536, 1055, N'BlogPostRepository', N'.sprTreeFolder', N'folder.png', N'', 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (537, 1056, N'Home', N'icon-home', N'folder.png', N'', 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (538, 1057, N'LandingPage', N'icon-stamp', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (539, 1058, N'TextPage', N'icon-document', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (541, 1079, N'LandingPage1', N'icon-stamp', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (542, 1083, N'spotlight', N'icon-lightbulb-active', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (543, 1084, N'LandingPage2', N'icon-stamp', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (544, 1090, N'dataFolder', N'icon-folder', N'folder.png', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (545, 1096, N'landingPage3', N'icon-stamp', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (546, 1101, N'landingPage4', N'icon-stamp', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (547, 1107, N'spotlightWithReuse', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (548, 1108, N'landingPage5', N'icon-stamp', N'folder.png', N'', 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1107)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1055, 1054, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1056, 1057, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1056, 1079, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1056, 1084, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1056, 1096, 3)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1056, 1101, 4)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1056, 1108, 5)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1057, 1058, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1079, 1058, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1084, 1058, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1084, 1083, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1090, 1083, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1090, 1090, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1096, 1058, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1096, 1083, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1101, 1058, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1101, 1083, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1108, 1058, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1108, 1083, 1)
SET IDENTITY_INSERT [dbo].[cmsContentVersion] ON 

INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1, 1059, N'd9255190-863f-4001-94d5-f78978058528', CAST(0x0000A71C01195954 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (2, 1060, N'0d3cd253-9456-4fe2-bc38-6aef71456835', CAST(0x0000A71C01195978 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (3, 1061, N'27a6e815-a338-48c2-b1ca-2e35d6241375', CAST(0x0000A71C0119597D AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (4, 1062, N'562a5119-390d-4581-ba51-0b644e85641a', CAST(0x0000A71C01195980 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (5, 1063, N'68e8b829-782c-455f-9e90-8d1268cf63c8', CAST(0x0000A71C01195983 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (6, 1064, N'51782a83-742a-4a6d-a62e-ecc5cbdab9a3', CAST(0x0000A71C01195986 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (7, 1065, N'9bc8b176-c4be-4431-9ae3-7ea26784d9ec', CAST(0x0000A71C01195989 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (8, 1066, N'74d1096f-b6e8-45d4-9629-bba0a27a43b5', CAST(0x0000A71C0119598C AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (9, 1067, N'4aee1ab8-570b-4c5a-aa74-9969fd17c4f7', CAST(0x0000A71C0119598F AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (10, 1068, N'ca325e72-9edb-48e2-a3e1-092a4f9a404b', CAST(0x0000A71C01195992 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (11, 1069, N'c29aa415-7c26-49bf-a63e-e4e46e1b8d3e', CAST(0x0000A71C01195996 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (12, 1070, N'a5cc4e48-41c9-43bd-b3e8-b207a2322212', CAST(0x0000A71C01195999 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (13, 1071, N'865859a9-0109-4170-b1bc-5f4f58e1e08f', CAST(0x0000A71C0119599C AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (14, 1072, N'c17b52dc-8df4-4a0d-bdbb-ec138ec5f4fe', CAST(0x0000A71C0119599F AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (15, 1073, N'2dde0380-0303-43d1-85dd-1ccfbf4d8e7f', CAST(0x0000A71C011959A2 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (16, 1074, N'407d3292-e4fd-42d8-8257-2151894ec6e9', CAST(0x0000A71C011959A5 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (17, 1075, N'9760a023-eb19-4e5f-b81e-51e602075802', CAST(0x0000A71C011959A9 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (18, 1059, N'c30c2e0b-f429-4156-9346-045bdf58f700', CAST(0x0000A71C01195A07 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (19, 1060, N'd9ebcd2a-c1c6-4579-b3f7-5c6e349f4d18', CAST(0x0000A71C01195A13 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (20, 1064, N'1c86c387-bb0d-4c7b-8f10-a139f934ace6', CAST(0x0000A71C01195A19 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (21, 1068, N'51fdc01a-6fc8-45ac-be9b-9b16ba451cca', CAST(0x0000A71C01195A1D AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (22, 1071, N'702f0071-7da4-4f56-89e9-a5f4630d7d99', CAST(0x0000A71C01195A22 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (23, 1075, N'28f7948f-7bed-42fe-aa91-57f94acd4d99', CAST(0x0000A71C01195A25 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (24, 1072, N'de2da6e2-6981-4030-a76c-ac744a4a86ae', CAST(0x0000A71C01195A2A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (25, 1069, N'b29bd2cd-8163-4c4d-bddf-bf489ca0fb18', CAST(0x0000A71C01195A2E AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (26, 1065, N'd7f768d6-3057-4110-9916-4e999b5dbafd', CAST(0x0000A71C01195A31 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (27, 1061, N'61997560-db26-4b27-966c-36d81b685cc7', CAST(0x0000A71C01195A35 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (28, 1073, N'a4641bda-93e5-446f-a7f4-7b47fc800858', CAST(0x0000A71C01195A38 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (29, 1070, N'14c287e4-ca79-4d66-be5b-5286d9a9d493', CAST(0x0000A71C01195A3B AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (30, 1066, N'3574fa7e-cc26-41e7-8466-887df2b8fd20', CAST(0x0000A71C01195A3F AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (31, 1062, N'ef902dde-95ad-4e77-bd89-6ed75cd7f6fc', CAST(0x0000A71C01195A42 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (32, 1074, N'd2aecbc2-f12b-4cd8-bcdc-2412ed714f12', CAST(0x0000A71C01195A45 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (33, 1067, N'b7b69255-d650-4f24-bf38-38ef5ccd6c3b', CAST(0x0000A71C01195A48 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (34, 1063, N'533820d6-3742-46db-a6cf-e82e97a92e8e', CAST(0x0000A71C01195A4C AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (35, 1078, N'33ade3d5-95d8-44f9-acd3-37459ef6e3b3', CAST(0x0000A71C011C8ED6 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (36, 1078, N'5aebe1df-135e-4b8a-974e-dc45ddf50495', CAST(0x0000A71C011CB144 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (37, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', CAST(0x0000A71C012029D0 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (38, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', CAST(0x0000A71C01202A00 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (39, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', CAST(0x0000A71C0123D7F5 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (40, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', CAST(0x0000A71D00BD02E9 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (41, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', CAST(0x0000A71D00BD0C55 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (42, 1085, N'5bf223a0-074a-45c2-a932-839dacdc1036', CAST(0x0000A71D00BDBA30 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (43, 1085, N'4a406469-4921-446a-b23b-467d1e03e2d2', CAST(0x0000A71D00BDBA46 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (44, 1087, N'c894e732-9cf0-4fd0-bf01-68794f4dde60', CAST(0x0000A71D00C0B38A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (45, 1088, N'1813b682-bf12-4ff1-a2e4-f1d8dd3e0617', CAST(0x0000A71D00C0D44F AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (46, 1089, N'566c793d-4113-4e5d-93b5-11eca289e810', CAST(0x0000A71D00C0F261 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (47, 1091, N'17f97338-dfae-4a3a-a7b6-5d46928e532d', CAST(0x0000A71D00C2784D AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (48, 1092, N'ca52ee63-d72b-4e63-b9a6-c2a16aa92dbf', CAST(0x0000A71D00C2D46D AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (49, 1093, N'218fe7d6-b9a8-4ba9-a66f-19cafc6659cd', CAST(0x0000A71D00C2AE35 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (50, 1094, N'38f8a85c-0c5a-4189-9a93-1da12de97b4d', CAST(0x0000A71D00C2B9F7 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (51, 1095, N'55d8493f-4361-4f55-b932-8cd055870f52', CAST(0x0000A71D00C2C28A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (52, 1093, N'c6c04869-5d93-421a-9fb7-00f10b5e4128', CAST(0x0000A71D00C2D47A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (53, 1094, N'4a24ed8f-ab2b-43a7-8348-10a5cf157902', CAST(0x0000A71D00C2D480 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (54, 1095, N'9d9032b1-4d74-4f45-945e-41c44c15bc2f', CAST(0x0000A71D00C2D482 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (55, 1099, N'b46f4dd7-13d1-47ca-a1ab-7ccd73e37a5a', CAST(0x0000A71D00C43EE3 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (56, 1099, N'8fdfdf79-7dd5-43f7-8670-63f4746dcb29', CAST(0x0000A71D00C446EB AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (57, 1099, N'7ee88b3c-551a-467e-b679-3c6cd0aee4cc', CAST(0x0000A71D00C44DFE AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (58, 1099, N'd96badbf-9d97-4279-a2f3-165cf6214600', CAST(0x0000A71D00C44E34 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (59, 1099, N'98ee47c7-570b-459c-9408-2ee694716008', CAST(0x0000A71D00C46F04 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (60, 1099, N'91740449-db8e-4d58-a46b-4d29f312935b', CAST(0x0000A71D00C47A12 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (61, 1099, N'8acfbfe6-42d4-4b46-851a-acc0919de92c', CAST(0x0000A71D00C486C8 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (62, 1103, N'afb38f93-d58e-44bb-baaa-e78fd8ed6840', CAST(0x0000A71D00C7F81A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (63, 1103, N'18fad8cd-b003-48c2-900e-fdd619dbe4b7', CAST(0x0000A71D00C83AAB AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (65, 1103, N'c6739934-6b4c-440e-8597-157f7ae2e38a', CAST(0x0000A71D00C88944 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (66, 1104, N'2c57f5b1-5bd4-42e9-ad96-8b66ae363efb', CAST(0x0000A71D00C8A31C AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (67, 1104, N'a6357037-80e4-4f2c-a7b3-abe131038ac0', CAST(0x0000A71D00C967AA AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (68, 1104, N'40401c82-6609-4dcc-a4c9-52105593db38', CAST(0x0000A71D00C9D1D3 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (69, 1105, N'bc94b644-70e2-449c-8884-d784622aeb6c', CAST(0x0000A71D00CAD3C9 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (70, 1104, N'31ca523c-8d13-4ccf-ae78-80ee8ff2806a', CAST(0x0000A71D00CB05A1 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (71, 1104, N'5dcac874-a96b-457a-a495-d2ef9703fd16', CAST(0x0000A71D00CB3CCA AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (72, 1110, N'3ccd93a5-0c2d-406d-87c8-b721ab07d5dc', CAST(0x0000A71D00EE1E50 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (73, 1110, N'21b2af43-0c44-423b-83e6-1d891a1cb7ba', CAST(0x0000A71D00EE2DE1 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (74, 1110, N'cb2fe7e6-380d-4fa4-910b-0ea54ff85618', CAST(0x0000A71D00EE86EB AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (75, 1110, N'4670a873-ac2d-42a6-b3ce-eae68eb9ba26', CAST(0x0000A71D00EE8733 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (76, 1110, N'66f9ff83-3fe1-40a3-9925-36634eca6109', CAST(0x0000A71D00EE9A12 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (77, 1110, N'e5ea1d92-e915-49bd-b360-a89e3047006f', CAST(0x0000A71D00EEE411 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (78, 1110, N'3784abc6-6700-42d2-94bd-22187c968d0f', CAST(0x0000A71D00EF3FE3 AS DateTime))
SET IDENTITY_INSERT [dbo].[cmsContentVersion] OFF
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1059, N'<Home id="1059" key="fe969938-1e65-45e8-b8f3-60a2a4e879fe" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Home" urlName="home" path="-1,1059" isDoc="" nodeType="1056" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1052" nodeTypeAlias="Home"><siteLogo><![CDATA[/media/1042/logo.jpg]]></siteLogo><siteTitle><![CDATA[Fanoe - Umbraco Starter Kit]]></siteTitle><siteDescription><![CDATA[This is an official Umbraco Starter kit. It shows of the newest features in Umbraco and is the perfect place to start for newcomers.. Everything is made to be taken apart. It''s your own little playground. Enjoy!]]></siteDescription><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "config": {},
              "styles": {
                "margin-bottom": "60px"
              },
              "controls": [
                {
                  "value": "Welcome to Fanoe",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "This is the new default starter kit for Umbraco, we enjoy building things that not only look great, but also work great.",
                  "editor": {
                    "name": "Banner Tagline",
                    "alias": "banner_tagline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 25px; line-height: 35px; font-weight: normal; text-align:center",
                      "markup": "<h2 style=''font-weight: 100; font-size: 40px;text-align:center''>#value#</h2>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>The starter kit</h2>\n<p>Congratulations on getting up and running with the “Fanoe” starter kit. It''s a great way to get to know the Grid datatype.</p>\n<p><a href=\"/{localLink:1078}\" title=\"The starter kit\">Learn about the starter kit →</a><a href=\"/{localLink:1078}\" title=\"The Starterkit\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Learn the basics</h2>\n<p>To get started on the right foot make sure to check out our documentation - from tutorials to API reference.</p>\n<p><a href=\"/{localLink:1079}\" title=\"Basics\">Off to the docs →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Master classes</h2>\n<p>The best way to learn Umbraco is through the Master classes that’s running every month in most regions.</p>\n<p><a href=\"/{localLink:1080}\" title=\"Masterclasses\">Learn about the masterclasses →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1044/14441035391_7ee1d0d166_h_darken.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d28a05da-2404-c1e7-6265-01b07fc5f722"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Umbraco Forms</h1>\n<p>With our add-on product Umbraco Forms it’s a breeze to create any type of form you can imagine.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Package repository</h1>\n<p>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "5362ea7d-e729-078b-e717-a1e7aa69fd4b"
        },
        {
          "name": "Full width image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1127,
                    "image": "/media/1046/14386124825_d43f359900_h_cropped.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "953b3802-6b4f-20ed-66f9-9a855e9afdd4"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Sharing is caring</h2>\n<p>Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Born global, loving local</h2>\n<p>If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community. You can do just that through the many local user groups and meetups</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "29cac0ff-d8e9-605b-9e7b-6809dce55edd"
        },
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">CodeGarden</h1>\n<h5 style=\"text-align: center;\">Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0093bd05-735a-9623-8509-28085818745c"
        }
      ]
    }
  ]
}]]></content></Home>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1060, N'<LandingPage id="1060" key="ffb4eed3-a064-4ea8-8478-d89a0a06e710" parentID="1059" level="2" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Learn" urlName="learn" path="-1,1059,1060" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1061, N'<TextPage id="1061" key="f2f2288d-d7b3-4e85-9a80-c00c3213de65" parentID="1060" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="The starter kit" urlName="the-starter-kit" path="-1,1059,1060,1061" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Fanø",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Fanø is a Danish island in the North Sea off the coast of southwestern Denmark, and is the very northernmost of the Danish Wadden Sea Islands. Fanø municipality is the municipality that covers the island and its seat is the town of Nordby.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1012/fanoe-denmark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "789b4b02-6a1e-bbff-9435-939d83f6e895"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 dir=\"ltr\"><span><span>How is this starter kit made?</span></span></h1>\n<p dir=\"ltr\"><span>Congratulations on getting up and running with Umbraco and the “Fanoe” starter kit. The idea with this starter kit is to let you explore some of the simple things Umbraco can do for a typical content powered website using “The Grid” feature.</span></p>\n<p><span>To get the most out of this starter kit and get started on the right foot, make sure to watch the “Grid” tutorial on Umbraco.TV which will take you through how the entire starter kit was made. From implementing the HTML mockups in Umbraco and using the powerful features in the Grid to give maximum freedom and flexibility for editors - without compromising the design.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f0013b7-f55e-cdd9-6ed9-7ad2f8696157"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "While walking around on Fanø, you will notice that almost all traditional houses have a little window above the front door with a model boat.\nThis is a very traditional good luck charm for the men away at sea. The economy of the island was almost entirely based on fishing and every family home has the model boat to ensure the safe return of sailors",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "3bd5271f-c171-8435-ba19-00008abd3af5"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1062, N'<TextPage id="1062" key="19810dc0-8fc8-4a01-9261-b2c8e2b83311" parentID="1060" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Basics" urlName="basics" path="-1,1059,1060,1062" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Learn the basics",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">While we recommend everyone to get an Umbraco.TV subscription to learn the ins and outs of Umbraco, maybe you prefer a more traditional tutorial or detailed technical documentation.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1047/9027509991_ff12bd87e4_b_small_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "97df8f64-dc98-40a9-e5f3-ac065983d6bd"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Create a basic website in Umbraco</h1>\n<p style=\"text-align: center;\">At Our Umbraco you’ll find both and we definitely recommend reading the guide on <a href=\"http://our.umbraco.org/documentation/Using-Umbraco/Creating-Basic-Site/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">creating a basic website in Umbraco</a><a href=\"#\" target=\"_blank\" title=\"Create a basic website in Umbraco\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "070e60ae-26d9-a277-5b04-97a52f73e34d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Sharpen those Razor skills</span></h2>\n<p dir=\"ltr\"><span>Umbraco uses Razor - a templating engine from Microsoft - as the main way to generate pages. If you’ve never used it before and in particular if you’ve never used ASP.NET before, It might seem a little daunting, but fear not. The template editor in the back office provides snippets and a Query Builder to get you up to speed.</span></p>\n<p dir=\"ltr\"><span>Once you know the basics, it’s also nice to know that there’s <a href=\"http://our.umbraco.org/projects/developer-tools/umbraco-v6-mvc-razor-cheatsheets/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">cheat sheets</a> covering the most common methods - ready to print out for office decoration.</span></p>\n<h2 dir=\"ltr\"><span>Extend with the API</span></h2>\n<p dir=\"ltr\"><span>If you want to extend Umbraco even further, you can use our .NET API to programmatically create Content, Media, Members and anything else that’s possible through the back office. For a quick start, <a href=\"http://umbraco.com/follow-us/blog-archive/2013/1/22/introducing-contentservice-aka-the-v6-api/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">you can follow this tutorial</a></span><span> and for full reference, don’t miss <a href=\"http://our.umbraco.org/documentation/reference/Management-v6/Services/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">the thorough documentation on Our</a>.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "16f56cd2-374c-8c6c-c91c-7d65b8b264cd"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1063, N'<TextPage id="1063" key="90b0cb02-1447-48ff-912b-fc3bc8cdd3cd" parentID="1060" level="3" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Masterclasses" urlName="masterclasses" path="-1,1059,1060,1063" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Masterclasses",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">The best and fastest way to learn Umbraco is through the official Master classes that are running every month in most regions.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1022/9686845888_e2d216ce81_b_dark_small.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2d34e33a-a1ef-04d5-9445-e1f1633bc362"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h3 style=\"text-align: center;\">The masterclasses are ran by either the Umbraco HQ or by the most experienced community heroes and use thoroughly tested materials to ensure you’ll return as a fully skilled Umbraco craftsperson.</h3>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "blue"
          },
          "id": "5312fa7b-3d5c-e9c0-4d0c-f6ae5d73e168"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Get it right from the beginning</span></h2>\n<p dir=\"ltr\"><span>While Umbraco is a simple tool, it’s important that you use it the right way. The Level 1 master class is designed to make sure that any Web Developer - also with no previous ASP.NET knowledge - can create advanced multi-lingual sites by the end of the course.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Become an expert</span></h2>\n<p dir=\"ltr\"><span>Once you know the basics, you can step up your game by attending the Level 2 master class. While the first masterclass is focused on implementing a site, this Masterclass will teach you how the .net APIs work and how to integrate and extend Umbraco. Whether that’s creating content programmatically or integrating a third party e-commerce engine or CRM.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Worth the investment</span></h2>\n<p dir=\"ltr\"><span>All attendees at the official Umbraco Masterclasses receive a certification which is the best way to make yourself noticed in the Umbraco ecosystem. So whether you’re looking to move up in the ranks of your company or are a free agent, you shouldn’t be doing Umbraco without becoming certified. The investment will come back many times, so make sure to <a href=\"http://umbraco.com/products/training/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\" target=\"_blank\" title=\"Masterclasses\">keep an eye out for a Masterclass near you</a>.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "a3ddf743-1622-7eec-6ea4-08caef854559"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1064, N'<LandingPage id="1064" key="7df2df79-2df6-493e-85b4-62340dd6dfd6" parentID="1059" level="2" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Explore" urlName="explore" path="-1,1059,1064" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1065, N'<TextPage id="1065" key="61d90ec6-b3a8-4c44-959a-9efee4f73dbd" parentID="1064" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Our Umbraco" urlName="our-umbraco" path="-1,1059,1064,1065" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Sharing is caring",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1048/sharingiscaring_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0efee164-ea45-3657-66c2-04db5cbdcd37"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>Get help</h2>\n<p>If you’re stuck in your Umbraco project, the friendly forum is the place to visit. We take pride in keeping a friendly atmosphere in our forums despite the rapid growth of the project, so remember that the easier and friendlier you ask the more likely you are to get a quality reply.</p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Karma<br /></span></h2>\n<p dir=\"ltr\">On “Our” we have a virtual currency called “Karma” - think of it as likes worth counting. When you give people help, they can appreciate this by giving you a virtual high five. In addition to the joy of knowing that your help meant something, you also get karma points and while money doesn’t buy you happiness, a little bit of karma can. </p>\n<p dir=\"ltr\"><span>In other words, don’t forget to say thanks - it doesn’t cost you anything!</span></p>\n<p dir=\"ltr\"> </p>\n<h2 dir=\"ltr\"><span>Give back<br /></span></h2>\n<p dir=\"ltr\">Once you’ve become better at Umbraco, remember to set aside a little bit of time to be the help you got. It’ll keep the snowball effect rolling and by pulling together as a community, it doesn’t take much effort from everybody to make Umbraco community the best in the industry when it comes to get a fast and friendly quality response.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "0e64a81c-519d-ed35-7e28-35e2d441a044"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.54,
                      "top": 0.34082397003745318
                    },
                    "id": 1130,
                    "image": "/media/1049/9027510123_92a91b5cf4_b_dark.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "1efceb16-6a36-e18b-905a-b372c3d8b5e1"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1066, N'<TextPage id="1066" key="db304a88-9f5b-447b-b1f1-5788faf2ef04" parentID="1064" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Codegarden" urlName="codegarden" path="-1,1059,1064,1066" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "CodeGarden",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1014/9017002308_81dfd2c1d5_b_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d851bdc5-cb0c-e982-a1aa-f1cdda3e39c0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Well, it used to be a conference</span></h2>\n<p dir=\"ltr\"><span>but today we like to think of it more as a “festival”. Lasting three days from early mornings to late evenings, it’s packed with a combination of learning everything about Umbraco to the who’s who in the community in a laid back atmosphere where you’ll feel at home.</span></p>\n<h2 dir=\"ltr\"><span>Great sessions</span></h2>\n<p dir=\"ltr\"><span>At Umbraco you’ll find sessions that’ll take your skills to the next level. From large-scale implementation to highly specialized sites, you really shouldn’t miss out on the opportunity to learn from those who have come before you.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "afbe6cbd-a903-1c91-4d7e-fafa73515de6"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5056179775280899
                    },
                    "id": 1123,
                    "image": "/media/1015/14257753719_2c02b94030_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1015%2F14257753719_2c02b94030_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "4bbedf99-360e-905c-2bd3-71b458ab4647"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "In raw numbers, Codegarden is: 500+ attendees, 3 packed days, 20+ sessions, 26 passionate speakers, 3 workshops, 1 keynote, a hack room, 2 rounds of bingo and 3563 cups of fair trade coffee",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "6bfba7ba-f732-8193-3d38-2980e262142d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Influence the project</span></h2>\n<p dir=\"ltr\"><span>Aside from the regular sessions and workshops CodeGarden also provides a unique approach to conferencing. It is called Open Space Technology and is all about networking, problem solving. This means you are not just limited to the scheduled topics but can put your own passions on the agenda and influence the future of the project.</span></p>\n<h2 dir=\"ltr\"><span>Loads of fun</span></h2>\n<p dir=\"ltr\"><span>In the community we value having a great time, so CodeGarden evenings are packed with social events. From canal tours of Copenhagen (with free beer and champagne) to evening parties and the infamous Umbraco bingo and dinner which can’t be described in words.</span></p>\n<h2 dir=\"ltr\"><span>Get your ticket</span></h2>\n<p><span>CodeGarden always ends up selling out, so make sure to reserve your ticket. The earlier you order the cheaper it is and if you’re on a stretch budget there’s a big chance that a friendly local Umbracian will have a couch to spare.<br /></span></p>\n<p><span><a href=\"http://umbraco.com/cg15/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Buy ticket for Codegarden</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "edebcf94-a4b1-fec5-5bc6-f8f677b03b16"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.605,
                      "top": 0.33333333333333331
                    },
                    "id": 1124,
                    "image": "/media/1016/14435759945_a2c58e9ed6_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1016%2F14435759945_a2c58e9ed6_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "96ec2067-0a50-459a-4d95-714b5b8ac4b6"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1067, N'<TextPage id="1067" key="a8dc7604-6d87-404a-adbf-2c4e5cd3e089" parentID="1064" level="3" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Meetup groups" urlName="meetup-groups" path="-1,1059,1064,1067" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Born global, loving local",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community and finally - if you can’t come to the community, why not have the community come to you by starting a local user group?</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1017/14359779226_df7329d607_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "3dd3ea61-c394-5ce1-91d8-93f4a41b0dc0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco Meetups</span></h2>\n<p dir=\"ltr\"><span>From London to New York, from Denmark in the north to Australia in the south - there’s local Umbraco User groups all over the world that <a href=\"http://our.umbraco.org/events/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">arrange regular meetups</a>. The format is usually a laid back atmosphere where people share their knowledge and new people are always welcome. So make sure to <a href=\"http://umbraco.meetup.com/\">check out Meetup.com for a local group</a> and if you’re not lucky, why not start one - it’s not that hard.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Local Festivals</span></h2>\n<p dir=\"ltr\"><span>Inspired by CodeGarden, there’s more and more annual local Umbraco events. Originated from the community in the United Kingdom, there’s “Umbraco Festivals” going on in many countries around the world. These are one day events packed with sessions that often combine advanced Umbraco topics with discussing how local awareness can be improved. And as they are driven by the community and often sponsored by local Umbraco partners, they’re usually very inexpensive events to attend.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f2b5540-7c52-4631-3877-6be5f61f6a12"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49583333333333335,
                      "top": 0.53
                    },
                    "id": 1126,
                    "image": "/media/1018/10818851674_e375a8751e_b.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1018%2F10818851674_e375a8751e_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "102d5bec-3fb5-4d1a-cd9f-2baeeb5cdc44"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1068, N'<LandingPage id="1068" key="e61ade6c-823c-4287-9fbd-b280281745e5" parentID="1059" level="2" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Extend" urlName="extend" path="-1,1059,1068" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1069, N'<TextPage id="1069" key="7a559f1d-7682-403c-ae2b-5d19a678ee4c" parentID="1068" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Umbraco Forms" urlName="umbraco-forms" path="-1,1059,1068,1069" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Umbraco forms",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">With our add-on product Umbraco Forms it’s a breeze to create anything from simple contact forms to advanced questionnaires.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "0a170745-ecbd-f642-0e5c-8475e6fae812"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">You won''t need to write a single line of code.</h1>\n<p style=\"text-align: center;\">Instead, you can create, edit and administer your form via a user interface that is a fully integrated part of Umbraco.</p>\n<p style=\"text-align: center;\"> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "<iframe src=\"//player.vimeo.com/video/110229004\" width=\"360\" height=\"203\" frameborder=\"0\" title=\"Form installer intro\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": "/App_Plugins/Grid/Editors/Render/embed_videowrapper.cshtml",
                    "icon": "icon-movie-alt"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "17022257-5f35-360f-8cec-f574221fc457"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1>Why does Umbraco Forms cost money?</h1>\n<p>At the Umbraco HQ we employ 15 full-time employees to ensure that the core is of the highest quality and constantly evolves. As we believe in keeping great ideas sustainable, we’ve never taken outside investment, but solely rely on income from products that enhance - but don’t limit - the open source core. We believe this is the best, long term solution and we hope you agree.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "190b7767-6b42-cd23-1d01-ad7e2ff24a6d"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1070, N'<TextPage id="1070" key="fbda6122-4271-4b47-beb7-4b2f71e673d5" parentID="1068" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Package repository" urlName="package-repository" path="-1,1059,1068,1070" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Package repository",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1024/14448232381_8f994d2adc_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0fc8f95c-1db8-6d29-788c-58a23c47634a"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Swim in the ocean of packages</span></h2>\n<p dir=\"ltr\"><span>From complete e-commerce platforms to integration with 3rd party services such as MailChimp and YouTube to developer tools that’ll boost your productivity.</span></p>\n<p dir=\"ltr\"><span>While you can download the packages on Our, you can also browse and install them directly from within the backoffice - called the “Package Repository” (yes, we should find a sexier name!). Those packages are filtered to ensure they’ll work with your Umbraco installation (based on version) and only packages that have been approved by at least 15 community people make the cut.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "9bc7883d-fd02-84d2-a790-9e0174b22e77"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "If you like the package, make sure to give it a high five.",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "a01e8642-d4a9-30d4-d8ef-ae31a0f7f83e"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1120,
                    "image": "/media/1038/screen-shot-2014-12-01-at-121327.png",
                    "paragraph": "Once you’ve installed a package, make sure to give feedback. Whether the install was successful or not, it’ll help the next person trying to give it a go. At Our Umbraco you can report compatibility with a few simple clicks.",
                    "headline": "Give feedback"
                  },
                  "editor": {
                    "name": "Image w/ text right",
                    "alias": "media_text_right",
                    "view": "/App_Plugins/Grid/Editors/Views/media_with_description.html",
                    "render": "/App_Plugins/Grid/Editors/Render/media_text_right.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "96916694-116a-637c-2319-a5b077e80bd9"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1071, N'<BlogPostRepository id="1071" key="2d70dc1c-3c95-4475-8e4c-ea5f25b6698c" parentID="1059" level="2" creatorID="0" sortOrder="3" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Blog" urlName="blog" path="-1,1059,1071" isDoc="" nodeType="1055" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1050" nodeTypeAlias="BlogPostRepository"><umbracoNaviHide>1</umbracoNaviHide></BlogPostRepository>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1072, N'<BlogPost id="1072" key="0afcd916-446a-4ae1-b089-b26227e7fbda" parentID="1071" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Tall trees have deep roots" urlName="tall-trees-have-deep-roots" path="-1,1059,1071,1072" isDoc="" nodeType="1054" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1051" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\" dir=\"ltr\"><span>Tall trees have deep roots</span></h1>\n<h5 style=\"text-align: center;\" dir=\"ltr\"><span>You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2bd04b6a-0561-05c8-aa48-7ee47fde287f"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>The origins of the roots</span></h2>\n<p dir=\"ltr\"><span>date back to 2003 where the first version of Umbraco saw its light. Back then nobody could predict what it would become and especially not Niels Hartvig who simply designed and built Umbraco as a tool to quickly produce sites for his freelance clients and make sure they had a user-friendly way of updating it.</span></p>\n<p dir=\"ltr\"><span>But in 2004 he decided to open source the work and with help of friends Kasper Bumbech and Anders Pollas with whom he shared office space, the first version of Umbraco as open source saw the light of the day on February 16th 2005.</span></p>\n<p><span>In the early days, the community was purely virtual and since it was the days before Facebook and Twitter, the early adopters communicated through a Yahoo Mailinglist. From the seeds of talking Umbraco via email, the idea of an Umbraco conference surfaced and in March 2005, <a href=\"https://groups.yahoo.com/neo/groups/umbraco/conversations/messages/195\" target=\"_blank\" title=\"Codegarden was born\">CodeGarden was born…</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "7a2e4652-8523-3ade-053d-f7873c9c8020"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1108,
                    "image": "/media/1027/14434411872_8e663d6de0_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "5fc9f47f-3ac1-4627-df26-2922b584e288"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Since v1 of CodeGarden in 2005</span></h2>\n<p dir=\"ltr\"><span>thousands of people have attended what is considered a must experience event for any “Umbracian”; it’s where everything Umbraco comes to life. From seeing the latest progress, sharing knowledge with fellow community members, having memorable times in the wonderful city of Copenhagen and returning energized with new knowledge and inspiration.</span></p>\n<p dir=\"ltr\"><span>But more than anything, it’s the special vibe that has always been a keystone in everything that surrounds Umbraco. As coined by Hudson Maul back in 2006 - it’s “The Friendly CMS”.</span></p>\n<h2 dir=\"ltr\"><br /><br /></h2>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "84b00350-7168-7858-0b37-e452f05d7664"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.]]></introduction></BlogPost>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1073, N'<BlogPost id="1073" key="fb10eb0f-4d5d-4a37-bdd1-93e4730a8b8b" parentID="1071" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Different Flowers Make a Bouquet" urlName="different-flowers-make-a-bouquet" path="-1,1059,1071,1073" isDoc="" nodeType="1054" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1051" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Different Flowers Make a Bouquet</h1>\n<h5 style=\"text-align: center;\">It may only take two to tango, but a party worth remembering is a completely different story.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1031/9026528992_d38fbc2e28_o_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "63d1f52a-a6be-2459-a337-22f97cdb15bb"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco is a huge family </span></h2>\n<p dir=\"ltr\"><span>including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.</span></p>\n<p dir=\"ltr\"><span>Without diversity, status quo becomes king. At Umbraco we don’t believe in the status quo. We believe it’s the sum of our differences - whether designer, developer or editor, whether nationality, religion or gender, heck, whether Apple or PC - that it’s the nutrition for moving forward.</span></p>\n<p dir=\"ltr\"><span>When you open your eyes for the qualities in other people, you open up an astounding opportunity to learn. Our world - and our differences - is a buffet of eye-opening knowledge just waiting for you. So make sure to treat everyone friendly and with the highest respect. Don''t be the judge.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "8e82e5c1-8583-3d32-2742-c02b96060643"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1113,
                    "image": "/media/1032/9039247947_e15a9d8850_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "d8ceaabf-535b-16db-e4ae-522fc0555846"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[It may only take two to tango, but a party worth remembering is a completely different story. Including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.]]></introduction></BlogPost>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1074, N'<BlogPost id="1074" key="98b39820-427c-43b5-9ea5-7258d9383209" parentID="1071" level="3" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Only the curious have something to find" urlName="only-the-curious-have-something-to-find" path="-1,1059,1071,1074" isDoc="" nodeType="1054" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1051" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49514563106796117,
                      "top": 0.19
                    },
                    "id": 1115,
                    "image": "/media/1033/whole-earth-catalog.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "ec390b52-0259-8b7f-fc86-56374ea6ca63"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: left;\" dir=\"ltr\"><span>Only the curious have something to find</span></h1>\n<p>A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.</p>\n<p dir=\"ltr\"><span>Yet, we all dream about - and need - a little adventure every now and then. At the Umbraco community we praise those who dare to play and take risks. At the many Umbraco events around the world, brave people share their ideas through opinionated talks and at Our Umbraco courageous coders share their packages that extend the feature set of Umbraco.</span></p>\n<p dir=\"ltr\"><span>You should as well. After all, what do you </span><span>really</span><span> have to lose? Nothing compared to what you have to gain: becoming a better craftsperson, inspiring others and the satisfaction of seeing the download number of your work increase week after week. If we don’t strive for moving forward - whether professionals or amateurs - then what’s the point?</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "“Once you stop learning, you start dying”\n- Albert Einstein",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "bdc66e02-87e6-7aa6-34a8-c0e5f834af79"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.]]></introduction></BlogPost>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1075, N'<LandingPage id="1075" key="f14745f4-ba09-403a-8ba5-1ebe2ec6b793" parentID="1059" level="2" creatorID="0" sortOrder="4" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Contact" urlName="contact" path="-1,1059,1075" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}]]></content></LandingPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1078, N'<LandingPage1 id="1078" key="22388436-2fa9-49d1-a6cf-395fec8cef96" parentID="1059" level="2" creatorID="0" sortOrder="5" createDate="2017-02-16T17:16:02" updateDate="2017-02-16T17:42:34" nodeName="Contact (1)" urlName="contact-1" path="-1,1059,1078" isDoc="" nodeType="1079" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1082" nodeTypeAlias="LandingPage1"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content><signpostLink1><![CDATA[[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]]]></signpostLink1><signpostLink2><![CDATA[[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]]]></signpostLink2><signpostCopy2><![CDATA[For getting help with implementing Umbraco, look at our list of Certified Umbraco partner]]></signpostCopy2><signpostHeading1><![CDATA[The forum]]></signpostHeading1><signpostHeading2><![CDATA[Getting help]]></signpostHeading2><signpostLink3><![CDATA[[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]]]></signpostLink3><signpostCopy3><![CDATA[For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ]]></signpostCopy3><signpostHeading3><![CDATA[Get in touch]]></signpostHeading3><signpostCopy1><![CDATA[For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.]]></signpostCopy1></LandingPage1>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1085, N'<LandingPage2 id="1085" key="b17f9c56-7f8d-4e5b-8240-bc179b1ac881" parentID="1059" level="2" creatorID="0" sortOrder="6" createDate="2017-02-17T11:28:10" updateDate="2017-02-17T11:30:46" nodeName="Contact (2)" urlName="contact-2" path="-1,1059,1085" isDoc="" nodeType="1084" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1086" nodeTypeAlias="LandingPage2"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></LandingPage2>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1087, N'<spotlight id="1087" key="8a3edea7-93aa-4f78-b33f-9e02223fda14" parentID="1085" level="3" creatorID="0" sortOrder="0" createDate="2017-02-17T11:41:36" updateDate="2017-02-17T11:41:36" nodeName="The forum" urlName="the-forum" path="-1,1059,1085,1087" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.]]></copy><heading><![CDATA[The forum]]></heading><link><![CDATA[[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1088, N'<spotlight id="1088" key="3fbe2a82-20f8-4da4-b019-14615eb014cb" parentID="1085" level="3" creatorID="0" sortOrder="1" createDate="2017-02-17T11:42:04" updateDate="2017-02-17T11:42:04" nodeName="Getting help" urlName="getting-help" path="-1,1059,1085,1088" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For getting help with implementing Umbraco, look at our list of Certified Umbraco partner]]></copy><heading><![CDATA[Getting help]]></heading><link><![CDATA[[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1089, N'<spotlight id="1089" key="9fcf83eb-e65a-445a-92af-2ab337cf47f8" parentID="1085" level="3" creatorID="0" sortOrder="2" createDate="2017-02-17T11:42:29" updateDate="2017-02-17T11:42:29" nodeName="Get in touch" urlName="get-in-touch" path="-1,1059,1085,1089" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ]]></copy><heading><![CDATA[Get in touch]]></heading><link><![CDATA[[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1091, N'<dataFolder id="1091" key="12b0085e-9959-474b-a9bc-6da1d6fecea3" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2017-02-17T11:48:02" updateDate="2017-02-17T11:48:02" nodeName="Data" urlName="data" path="-1,1091" isDoc="" nodeType="1090" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="dataFolder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1092, N'<dataFolder id="1092" key="00a48818-8aac-4703-930f-3861c77f268f" parentID="1091" level="2" creatorID="0" sortOrder="0" createDate="2017-02-17T11:48:35" updateDate="2017-02-17T11:49:21" nodeName="Spotlights" urlName="spotlights" path="-1,1091,1092" isDoc="" nodeType="1090" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="dataFolder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1093, N'<spotlight id="1093" key="75fcff75-75dc-434f-acaf-4ab0d38418bc" parentID="1092" level="3" creatorID="0" sortOrder="0" createDate="2017-02-17T11:48:48" updateDate="2017-02-17T11:49:21" nodeName="The forum" urlName="the-forum" path="-1,1091,1092,1093" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.]]></copy><heading><![CDATA[The forum]]></heading><link><![CDATA[[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1094, N'<spotlight id="1094" key="44633af8-dad4-47de-8298-09938516b8e5" parentID="1092" level="3" creatorID="0" sortOrder="1" createDate="2017-02-17T11:48:58" updateDate="2017-02-17T11:49:21" nodeName="Getting help" urlName="getting-help" path="-1,1091,1092,1094" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For getting help with implementing Umbraco, look at our list of Certified Umbraco partner]]></copy><heading><![CDATA[Getting help]]></heading><link><![CDATA[[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1095, N'<spotlight id="1095" key="82c4d7ef-1542-4a76-b405-dec62ace9b54" parentID="1092" level="3" creatorID="0" sortOrder="2" createDate="2017-02-17T11:49:05" updateDate="2017-02-17T11:49:21" nodeName="Get in touch" urlName="get-in-touch" path="-1,1091,1092,1095" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ]]></copy><heading><![CDATA[Get in touch]]></heading><link><![CDATA[[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1099, N'<landingPage3 id="1099" key="0f8cc586-bb24-47dd-ba82-140f45fa4913" parentID="1059" level="2" creatorID="0" sortOrder="7" createDate="2017-02-17T11:54:30" updateDate="2017-02-17T11:55:31" nodeName="Contact (3)" urlName="contact-3" path="-1,1059,1099" isDoc="" nodeType="1096" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1097" nodeTypeAlias="landingPage3"><umbracoNaviHide>1</umbracoNaviHide><spotlights><![CDATA[1093,1094,1095]]></spotlights><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></landingPage3>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1103, N'<landingPage3 id="1103" key="a76fbb69-18b0-41bf-b66c-055910773f0d" parentID="1059" level="2" creatorID="0" sortOrder="8" createDate="2017-02-17T12:08:03" updateDate="2017-02-17T12:09:00" nodeName="Contact (4)" urlName="contact-4" path="-1,1059,1103" isDoc="" nodeType="1096" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1097" nodeTypeAlias="landingPage3"><umbracoNaviHide>1</umbracoNaviHide><spotlights><![CDATA[1093,1094,1095]]></spotlights><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></landingPage3>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1104, N'<landingPage4 id="1104" key="f33517f9-bf0b-4ed4-9351-1e4708e319e3" parentID="1059" level="2" creatorID="0" sortOrder="8" createDate="2017-02-17T12:10:24" updateDate="2017-02-17T12:19:57" nodeName="Contact (4)" urlName="contact-4" path="-1,1059,1104" isDoc="" nodeType="1101" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1102" nodeTypeAlias="landingPage4"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ],
              "active": false
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e",
          "active": true
        }
      ]
    }
  ]
}]]></content><spotlights><![CDATA[[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]]]></spotlights></landingPage4>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1105, N'<Image id="1105" key="87ab44c9-5375-4b0b-90d6-68292d285047" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2017-02-17T12:18:28" updateDate="2017-02-17T12:18:28" nodeName="1912289_753997844648209_7099291360101379579_o.jpg" urlName="1912289_753997844648209_7099291360101379579_ojpg" path="-1,1105" isDoc="" nodeType="1032" writerName="Andy Butland" writerID="0" version="bc94b644-70e2-449c-8884-d784622aeb6c" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1050/1912289_753997844648209_7099291360101379579_o.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[1229]]></umbracoWidth><umbracoHeight><![CDATA[469]]></umbracoHeight><umbracoBytes><![CDATA[122310]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1110, N'<landingPage5 id="1110" key="2f832d14-f485-45e0-aa01-de260768a5b7" parentID="1059" level="2" creatorID="0" sortOrder="9" createDate="2017-02-17T14:26:57" updateDate="2017-02-17T14:31:04" nodeName="Contact (5)" urlName="contact-5" path="-1,1059,1110" isDoc="" nodeType="1108" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1111" nodeTypeAlias="landingPage5"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}]]></content><spotlights><![CDATA[[{"name":"The forum","ncContentTypeAlias":"spotlightWithReuse","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]","pickedSpotlight":""},{"name":"Getting help","ncContentTypeAlias":"spotlightWithReuse","heading":"Getting help","copy":"","link":"","pickedSpotlight":"1094"},{"name":"Item 3","ncContentTypeAlias":"spotlightWithReuse","heading":"Get in touch","copy":"","link":"","pickedSpotlight":"1095"}]]]></spotlights></landingPage5>')
SET IDENTITY_INSERT [dbo].[cmsDataType] ON 

INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-28, -97, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-27, -96, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-26, -95, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (1, -49, N'Umbraco.TrueFalse', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (2, -51, N'Umbraco.Integer', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (3, -87, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (4, -88, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (5, -89, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (6, -90, N'Umbraco.UploadField', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (7, -92, N'Umbraco.NoEdit', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (8, -36, N'Umbraco.DateTime', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (9, -37, N'Umbraco.ColorPickerAlias', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (11, -39, N'Umbraco.DropDownMultiple', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (12, -40, N'Umbraco.RadioButtonList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (13, -41, N'Umbraco.Date', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (14, -42, N'Umbraco.DropDown', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (15, -43, N'Umbraco.CheckBoxList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (16, 1034, N'Umbraco.ContentPickerAlias', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (17, 1035, N'Umbraco.MultipleMediaPicker', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (18, 1036, N'Umbraco.MemberPicker', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (21, 1040, N'Umbraco.RelatedLinks', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (22, 1041, N'Umbraco.Tags', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (24, 1043, N'Umbraco.ImageCropper', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (25, 1045, N'Umbraco.MultipleMediaPicker', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (26, 1046, N'Umbraco.Grid', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (27, 1047, N'Umbraco.Grid', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (28, 1048, N'Umbraco.Grid', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (29, 1080, N'RJP.MultiUrlPicker', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (30, 1081, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (31, 1098, N'Umbraco.MultiNodeTreePicker', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (32, 1100, N'Our.Umbraco.NestedContent', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (33, 1106, N'Umbraco.ContentPickerAlias', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (34, 1109, N'Our.Umbraco.NestedContent', N'Ntext')
SET IDENTITY_INSERT [dbo].[cmsDataType] OFF
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] ON 

INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-9, -96, N'[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]', 5, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-8, -96, N'[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}]', 4, N'layouts')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-7, -96, N'desc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-6, -96, N'updateDate', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-5, -96, N'100', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-4, -97, N'[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]', 4, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-3, -97, N'asc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-2, -97, N'username', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-1, -97, N'10', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (3, -87, N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (4, 1041, N'default', 0, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (5, 1045, N'1', 0, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (6, 1046, N'{
  "styles": [
    {
      "label": "Set a background image",
      "description": "Set a row background",
      "key": "background-image",
      "view": "imagepicker",
      "modifier": "url({0})",
      "applyTo": "row"
    }
  ],
  "config": [
    {
      "label": "Background color",
      "description": "Choose background color",
      "key": "class",
      "view": "radiobuttonlist",
      "applyTo": "row",
      "prevalues": [
        "light",
        "dark",
        "yellow",
        "blue",
        "purple",
        "full",
        "full triangle"
      ]
    }
  ],
  "columns": 12,
  "templates": [
    {
      "name": "1 column layout",
      "sections": [
        {
          "grid": 12
        }
      ]
    }
  ],
  "layouts": [
    {
      "name": "Article",
      "areas": [
        {
          "grid": 3,
          "allowAll": false,
          "allowed": [
            "media_round",
            "paragraph"
          ]
        },
        {
          "grid": 1,
          "allowAll": false,
          "allowed": []
        },
        {
          "grid": 8,
          "allowAll": false,
          "allowed": [
            "abstract",
            "paragraph",
            "rte",
            "headline"
          ]
        }
      ]
    },
    {
      "name": "Banner",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "rte",
            "banner_headline",
            "headline",
            "abstract",
            "paragraph",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "Image wide",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "media_wide_cropped",
            "media_wide"
          ]
        }
      ]
    },
    {
      "name": "Article full width",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "media_text_right",
            "headline",
            "abstract",
            "paragraph",
            "quote",
            "media",
            "code",
            "rte",
            "embed",
            "headline_centered"
          ]
        }
      ]
    },
    {
      "name": "Article two col",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "headline",
            "quote"
          ]
        },
        {
          "grid": 6,
          "allowAll": false,
          "allowed": [
            "abstract",
            "media",
            "code",
            "quote",
            "paragraph"
          ]
        },
        {
          "grid": 6,
          "allowAll": false,
          "allowed": [
            "quote",
            "code",
            "media",
            "paragraph"
          ]
        }
      ]
    }
  ]
}', 1, N'items')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (7, 1046, N'{
  "toolbar": [
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "bullist",
    "numlist",
    "link"
  ],
  "stylesheets": [
    "rte"
  ],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 2, N'rte')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (8, 1047, N'{
  "styles": [
    {
      "label": "Set a background image",
      "description": "Set a row background",
      "key": "background-image",
      "view": "imagepicker",
      "modifier": "url({0})",
      "applyTo": "row"
    },
    {
      "label": "Add spacing",
      "description": "Add spacing under element",
      "key": "margin-bottom",
      "view": "textstring"
    }
  ],
  "config": [
    {
      "label": "Background color",
      "description": "Choose background color",
      "key": "class",
      "view": "radiobuttonlist",
      "applyTo": "row",
      "prevalues": [
        "light",
        "dark",
        "yellow",
        "blue",
        "purple",
        "full",
        "full triangle"
      ]
    }
  ],
  "columns": 12,
  "templates": [
    {
      "name": "1 column layout",
      "sections": [
        {
          "grid": 12
        }
      ]
    }
  ],
  "layouts": [
    {
      "name": "Banner",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "rte",
            "banner_headline",
            "banner_tagline"
          ]
        },
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "media"
          ]
        },
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "media"
          ]
        },
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "media"
          ]
        }
      ]
    },
    {
      "name": "Full width content",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "Two column",
      "areas": [
        {
          "grid": 6,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        },
        {
          "grid": 6,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "Three column",
      "areas": [
        {
          "grid": 4
        },
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "headline",
            "headline_centered",
            "paragraph",
            "media_round"
          ]
        },
        {
          "grid": 4
        }
      ]
    },
    {
      "name": "40/60",
      "areas": [
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        },
        {
          "grid": 8,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "60/40",
      "areas": [
        {
          "grid": 8,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        },
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round"
          ]
        }
      ]
    },
    {
      "name": "Full width image",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "media_wide_cropped",
            "media_wide"
          ]
        }
      ]
    }
  ]
}', 1, N'items')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (9, 1047, N'{
  "toolbar": [
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "link"
  ],
  "stylesheets": [
    "rte"
  ],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 2, N'rte')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (10, 1048, N'{
  "styles": [
    {
      "label": "Set a background image",
      "description": "Set a row background",
      "key": "background-image",
      "view": "imagepicker",
      "modifier": "url({0})",
      "applyTo": "row"
    }
  ],
  "config": [
    {
      "label": "Background color",
      "description": "Choose background color",
      "key": "class",
      "view": "radiobuttonlist",
      "applyTo": "row",
      "prevalues": [
        "light",
        "dark",
        "yellow",
        "blue",
        "purple",
        "full",
        "full triangle"
      ]
    }
  ],
  "columns": 12,
  "templates": [
    {
      "name": "1 column layout",
      "sections": [
        {
          "grid": 12
        }
      ]
    }
  ],
  "layouts": [
    {
      "name": "Headline",
      "areas": [
        {
          "grid": 12,
          "editors": [
            "headline"
          ]
        }
      ]
    },
    {
      "name": "Article",
      "areas": [
        {
          "grid": 4
        },
        {
          "grid": 8
        }
      ]
    },
    {
      "name": "Wide image",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "media_wide",
            "media_wide_cropped"
          ]
        }
      ]
    },
    {
      "name": "Image w. text",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "banner_headline",
            "rte",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "Article Wide",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "headline",
            "abstract",
            "code",
            "quote",
            "embed",
            "media",
            "media_text_right",
            "rte",
            "paragraph"
          ]
        }
      ]
    }
  ]
}', 1, N'items')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (11, 1048, N'{
  "toolbar": [
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "bullist",
    "numlist",
    "link"
  ],
  "stylesheets": [
    "rte"
  ],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 2, N'rte')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (14, 1098, N'{
  "type": "content",
  "id": 1092
}', 1, N'startNode')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (15, 1098, N'Spotlight', 2, N'filter')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (16, 1098, N'0', 3, N'minNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (17, 1098, N'3', 4, N'maxNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (18, 1098, N'0', 5, N'showOpenButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (19, 1098, N'0', 6, N'showEditButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (20, 1098, N'0', 7, N'showPathOnHover')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (21, 1100, N'[
  {
    "ncAlias": "spotlight",
    "ncTabAlias": "Content",
    "nameTemplate": "{{heading}}"
  }
]', 1, N'contentTypes')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (22, 1100, N'0', 2, N'minItems')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (23, 1100, N'3', 3, N'maxItems')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (24, 1100, N'1', 4, N'confirmDeletes')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (25, 1100, N'1', 5, N'showIcons')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (26, 1100, NULL, 6, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (27, 1106, N'0', 1, N'showOpenButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (28, 1106, N'0', 2, N'showEditButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (29, 1106, N'1092', 3, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (30, 1106, N'0', 4, N'showPathOnHover')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (31, 1109, N'[
  {
    "ncAlias": "spotlightWithReuse",
    "ncTabAlias": "Content",
    "nameTemplate": "{{heading}}"
  }
]', 1, N'contentTypes')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (32, 1109, N'0', 2, N'minItems')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (33, 1109, N'3', 3, N'maxItems')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (34, 1109, N'1', 4, N'confirmDeletes')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (35, 1109, N'1', 5, N'showIcons')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (36, 1109, NULL, 6, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (37, 1080, N'0', 1, N'minNumberOfItems')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (38, 1080, N'1', 2, N'maxNumberOfItems')
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] OFF
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1093, 1, 0, N'c6c04869-5d93-421a-9fb7-00f10b5e4128', N'The forum', NULL, NULL, CAST(0x0000A71D00C2D47A AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 1, 0, N'c30c2e0b-f429-4156-9346-045bdf58f700', N'Home', NULL, NULL, CAST(0x0000A71C01195A07 AS DateTime), 1052, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1068, 0, 0, N'ca325e72-9edb-48e2-a3e1-092a4f9a404b', N'Extend', NULL, NULL, CAST(0x0000A71C01195992 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1062, 0, 0, N'562a5119-390d-4581-ba51-0b644e85641a', N'Basics', NULL, NULL, CAST(0x0000A71C01195980 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1110, 0, 0, N'cb2fe7e6-380d-4fa4-910b-0ea54ff85618', N'Contact (5)', NULL, NULL, CAST(0x0000A71D00EE86EB AS DateTime), 1111, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1094, 1, 0, N'4a24ed8f-ab2b-43a7-8348-10a5cf157902', N'Getting help', NULL, NULL, CAST(0x0000A71D00C2D480 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1089, 1, 0, N'566c793d-4113-4e5d-93b5-11eca289e810', N'Get in touch', NULL, NULL, CAST(0x0000A71D00C0F261 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1078, 1, 0, N'220bf527-65d3-4221-90ef-141b42ff00f6', N'Contact (1)', NULL, NULL, CAST(0x0000A71C0123D7F5 AS DateTime), 1082, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1103, 0, 0, N'c6739934-6b4c-440e-8597-157f7ae2e38a', N'Contact (4)', NULL, NULL, CAST(0x0000A71D00C88944 AS DateTime), 1097, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'd96badbf-9d97-4279-a2f3-165cf6214600', N'Contact (3)', NULL, NULL, CAST(0x0000A71D00C44E34 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1093, 0, 0, N'218fe7d6-b9a8-4ba9-a66f-19cafc6659cd', N'The forum', NULL, NULL, CAST(0x0000A71D00C2AE35 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1073, 0, 0, N'2dde0380-0303-43d1-85dd-1ccfbf4d8e7f', N'Different Flowers Make a Bouquet', NULL, NULL, CAST(0x0000A71C011959A2 AS DateTime), 1051, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1110, 0, 0, N'21b2af43-0c44-423b-83e6-1d891a1cb7ba', N'Contact (5)', NULL, NULL, CAST(0x0000A71D00EE2DE1 AS DateTime), 1102, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1094, 0, 0, N'38f8a85c-0c5a-4189-9a93-1da12de97b4d', N'Getting help', NULL, NULL, CAST(0x0000A71D00C2B9F7 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1074, 0, 0, N'407d3292-e4fd-42d8-8257-2151894ec6e9', N'Only the curious have something to find', NULL, NULL, CAST(0x0000A71C011959A5 AS DateTime), 1051, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1110, 1, 0, N'3784abc6-6700-42d2-94bd-22187c968d0f', N'Contact (5)', NULL, NULL, CAST(0x0000A71D00EF3FE3 AS DateTime), 1111, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1074, 1, 0, N'd2aecbc2-f12b-4cd8-bcdc-2412ed714f12', N'Only the curious have something to find', NULL, NULL, CAST(0x0000A71C01195A45 AS DateTime), 1051, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'27a6e815-a338-48c2-b1ca-2e35d6241375', N'The starter kit', NULL, NULL, CAST(0x0000A71C0119597D AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'98ee47c7-570b-459c-9408-2ee694716008', N'Contact (3)', NULL, NULL, CAST(0x0000A71D00C46F04 AS DateTime), 1097, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1110, 0, 0, N'66f9ff83-3fe1-40a3-9925-36634eca6109', N'Contact (5)', NULL, NULL, CAST(0x0000A71D00EE9A12 AS DateTime), 1111, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 1, 0, N'61997560-db26-4b27-966c-36d81b685cc7', N'The starter kit', NULL, NULL, CAST(0x0000A71C01195A35 AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1078, 0, 0, N'33ade3d5-95d8-44f9-acd3-37459ef6e3b3', N'Contact (1)', NULL, NULL, CAST(0x0000A71C011C8ED6 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1067, 1, 0, N'b7b69255-d650-4f24-bf38-38ef5ccd6c3b', N'Meetup groups', NULL, NULL, CAST(0x0000A71C01195A48 AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'7ee88b3c-551a-467e-b679-3c6cd0aee4cc', N'Contact (3)', NULL, NULL, CAST(0x0000A71D00C44DFE AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1095, 1, 0, N'9d9032b1-4d74-4f45-945e-41c44c15bc2f', N'Get in touch', NULL, NULL, CAST(0x0000A71D00C2D482 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1085, 1, 0, N'4a406469-4921-446a-b23b-467d1e03e2d2', N'Contact (2)', NULL, NULL, CAST(0x0000A71D00BDBA46 AS DateTime), 1086, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'91740449-db8e-4d58-a46b-4d29f312935b', N'Contact (3)', NULL, NULL, CAST(0x0000A71D00C47A12 AS DateTime), 1097, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1065, 1, 0, N'd7f768d6-3057-4110-9916-4e999b5dbafd', N'Our Umbraco', NULL, NULL, CAST(0x0000A71C01195A31 AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1075, 0, 0, N'9760a023-eb19-4e5f-b81e-51e602075802', N'Contact', NULL, NULL, CAST(0x0000A71C011959A9 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1104, 0, 0, N'40401c82-6609-4dcc-a4c9-52105593db38', N'Contact (4)', NULL, NULL, CAST(0x0000A71D00C9D1D3 AS DateTime), 1102, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 1, 0, N'14c287e4-ca79-4d66-be5b-5286d9a9d493', N'Package repository', NULL, NULL, CAST(0x0000A71C01195A3B AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1075, 1, 0, N'28f7948f-7bed-42fe-aa91-57f94acd4d99', N'Contact', NULL, NULL, CAST(0x0000A71C01195A25 AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 1, 0, N'd9ebcd2a-c1c6-4579-b3f7-5c6e349f4d18', N'Learn', NULL, NULL, CAST(0x0000A71C01195A13 AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1091, 1, 0, N'17f97338-dfae-4a3a-a7b6-5d46928e532d', N'Data', NULL, NULL, CAST(0x0000A71D00C2784D AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1071, 0, 0, N'865859a9-0109-4170-b1bc-5f4f58e1e08f', N'Blog', NULL, NULL, CAST(0x0000A71C0119599C AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'8fdfdf79-7dd5-43f7-8670-63f4746dcb29', N'Contact (3)', NULL, NULL, CAST(0x0000A71D00C446EB AS DateTime), 1086, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 1, 0, N'c894e732-9cf0-4fd0-bf01-68794f4dde60', N'The forum', NULL, NULL, CAST(0x0000A71D00C0B38A AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'0d3cd253-9456-4fe2-bc38-6aef71456835', N'Learn', NULL, NULL, CAST(0x0000A71C01195978 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1062, 1, 0, N'ef902dde-95ad-4e77-bd89-6ed75cd7f6fc', N'Basics', NULL, NULL, CAST(0x0000A71C01195A42 AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1078, 0, 0, N'bca0c717-9af0-46c2-ac2f-7592835d5928', N'Contact (1)', NULL, NULL, CAST(0x0000A71C01202A00 AS DateTime), 1082, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1073, 1, 0, N'a4641bda-93e5-446f-a7f4-7b47fc800858', N'Different Flowers Make a Bouquet', NULL, NULL, CAST(0x0000A71C01195A38 AS DateTime), 1051, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'b46f4dd7-13d1-47ca-a1ab-7ccd73e37a5a', N'Contact (2) (1)', NULL, NULL, CAST(0x0000A71D00C43EE3 AS DateTime), 1086, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1065, 0, 0, N'9bc8b176-c4be-4431-9ae3-7ea26784d9ec', N'Our Umbraco', NULL, NULL, CAST(0x0000A71C01195989 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1104, 0, 0, N'31ca523c-8d13-4ccf-ae78-80ee8ff2806a', N'Contact (4)', NULL, NULL, CAST(0x0000A71D00CB05A1 AS DateTime), 1102, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1085, 0, 0, N'5bf223a0-074a-45c2-a932-839dacdc1036', N'Contact (2)', NULL, NULL, CAST(0x0000A71D00BDBA30 AS DateTime), 1086, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1066, 1, 0, N'3574fa7e-cc26-41e7-8466-887df2b8fd20', N'Codegarden', NULL, NULL, CAST(0x0000A71C01195A3F AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1104, 0, 0, N'2c57f5b1-5bd4-42e9-ad96-8b66ae363efb', N'Contact (4)', NULL, NULL, CAST(0x0000A71D00C8A31C AS DateTime), 1102, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1095, 0, 0, N'55d8493f-4361-4f55-b932-8cd055870f52', N'Get in touch', NULL, NULL, CAST(0x0000A71D00C2C28A AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1063, 0, 0, N'68e8b829-782c-455f-9e90-8d1268cf63c8', N'Masterclasses', NULL, NULL, CAST(0x0000A71C01195983 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1067, 0, 0, N'4aee1ab8-570b-4c5a-aa74-9969fd17c4f7', N'Meetup groups', NULL, NULL, CAST(0x0000A71C0119598F AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1068, 1, 0, N'51fdc01a-6fc8-45ac-be9b-9b16ba451cca', N'Extend', NULL, NULL, CAST(0x0000A71C01195A1D AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1078, 0, 0, N'3f0beda6-befa-44fc-a0ea-9d911608f446', N'Contact (1)', NULL, NULL, CAST(0x0000A71C012029D0 AS DateTime), 1082, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1064, 1, 0, N'1c86c387-bb0d-4c7b-8f10-a139f934ace6', N'Explore', NULL, NULL, CAST(0x0000A71C01195A19 AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1071, 1, 0, N'702f0071-7da4-4f56-89e9-a5f4630d7d99', N'Blog', NULL, NULL, CAST(0x0000A71C01195A22 AS DateTime), 1050, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1110, 0, 0, N'e5ea1d92-e915-49bd-b360-a89e3047006f', N'Contact (5)', NULL, NULL, CAST(0x0000A71D00EEE411 AS DateTime), 1111, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1104, 0, 0, N'a6357037-80e4-4f2c-a7b3-abe131038ac0', N'Contact (4)', NULL, NULL, CAST(0x0000A71D00C967AA AS DateTime), 1102, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1072, 1, 0, N'de2da6e2-6981-4030-a76c-ac744a4a86ae', N'Tall trees have deep roots', NULL, NULL, CAST(0x0000A71C01195A2A AS DateTime), 1051, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 1, 0, N'8acfbfe6-42d4-4b46-851a-acc0919de92c', N'Contact (3)', NULL, NULL, CAST(0x0000A71D00C486C8 AS DateTime), 1097, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 0, 0, N'a5cc4e48-41c9-43bd-b3e8-b207a2322212', N'Package repository', NULL, NULL, CAST(0x0000A71C01195999 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1110, 0, 0, N'3ccd93a5-0c2d-406d-87c8-b721ab07d5dc', N'Contact (4) (1)', NULL, NULL, CAST(0x0000A71D00EE1E50 AS DateTime), 1102, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1066, 0, 0, N'74d1096f-b6e8-45d4-9629-bba0a27a43b5', N'Codegarden', NULL, NULL, CAST(0x0000A71C0119598C AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1069, 1, 0, N'b29bd2cd-8163-4c4d-bddf-bf489ca0fb18', N'Umbraco Forms', NULL, NULL, CAST(0x0000A71C01195A2E AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1092, 1, 0, N'ca52ee63-d72b-4e63-b9a6-c2a16aa92dbf', N'Spotlights', NULL, NULL, CAST(0x0000A71D00C2D46D AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1104, 1, 0, N'5dcac874-a96b-457a-a495-d2ef9703fd16', N'Contact (4)', NULL, NULL, CAST(0x0000A71D00CB3CCA AS DateTime), 1102, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1078, 0, 0, N'5aebe1df-135e-4b8a-974e-dc45ddf50495', N'Contact (1)', NULL, NULL, CAST(0x0000A71C011CB144 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1085, 0, 0, N'a0ea3110-79f1-4a52-b81b-e449670f277c', N'Contact (2)', NULL, NULL, CAST(0x0000A71D00BD0C55 AS DateTime), 1082, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1069, 0, 0, N'c29aa415-7c26-49bf-a63e-e4e46e1b8d3e', N'Umbraco Forms', NULL, NULL, CAST(0x0000A71C01195996 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1085, 0, 0, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', N'Contact (1) (1)', NULL, NULL, CAST(0x0000A71D00BD02E9 AS DateTime), 1082, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1103, 0, 0, N'afb38f93-d58e-44bb-baaa-e78fd8ed6840', N'Contact (3) (1)', NULL, NULL, CAST(0x0000A71D00C7F81A AS DateTime), 1097, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1063, 1, 0, N'533820d6-3742-46db-a6cf-e82e97a92e8e', N'Masterclasses', NULL, NULL, CAST(0x0000A71C01195A4C AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1110, 0, 0, N'4670a873-ac2d-42a6-b3ce-eae68eb9ba26', N'Contact (5)', NULL, NULL, CAST(0x0000A71D00EE8733 AS DateTime), 1111, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1072, 0, 0, N'c17b52dc-8df4-4a0d-bdbb-ec138ec5f4fe', N'Tall trees have deep roots', NULL, NULL, CAST(0x0000A71C0119599F AS DateTime), 1051, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1064, 0, 0, N'51782a83-742a-4a6d-a62e-ecc5cbdab9a3', N'Explore', NULL, NULL, CAST(0x0000A71C01195986 AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1088, 1, 0, N'1813b682-bf12-4ff1-a2e4-f1d8dd3e0617', N'Getting help', NULL, NULL, CAST(0x0000A71D00C0D44F AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 0, 0, N'd9255190-863f-4001-94d5-f78978058528', N'Home', NULL, NULL, CAST(0x0000A71C01195954 AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1103, 0, 0, N'18fad8cd-b003-48c2-900e-fdd619dbe4b7', N'Contact (4)', NULL, NULL, CAST(0x0000A71D00C83AAB AS DateTime), 1097, 0)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1054, 1051, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1055, 1050, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1056, 1052, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1057, 1053, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1058, 1053, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1079, 1082, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1084, 1086, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1096, 1097, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1101, 1102, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1108, 1111, 1)
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1059, N'c30c2e0b-f429-4156-9346-045bdf58f700', CAST(0x0000A71C01195A10 AS DateTime), N'<Home id="1059" key="fe969938-1e65-45e8-b8f3-60a2a4e879fe" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Home" urlName="home" path="-1,1059" isDoc="" nodeType="1056" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1052" nodeTypeAlias="Home"><siteLogo><![CDATA[/media/1042/logo.jpg]]></siteLogo><siteTitle><![CDATA[Fanoe - Umbraco Starter Kit]]></siteTitle><siteDescription><![CDATA[This is an official Umbraco Starter kit. It shows of the newest features in Umbraco and is the perfect place to start for newcomers.. Everything is made to be taken apart. It''s your own little playground. Enjoy!]]></siteDescription><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "config": {},
              "styles": {
                "margin-bottom": "60px"
              },
              "controls": [
                {
                  "value": "Welcome to Fanoe",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "This is the new default starter kit for Umbraco, we enjoy building things that not only look great, but also work great.",
                  "editor": {
                    "name": "Banner Tagline",
                    "alias": "banner_tagline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 25px; line-height: 35px; font-weight: normal; text-align:center",
                      "markup": "<h2 style=''font-weight: 100; font-size: 40px;text-align:center''>#value#</h2>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>The starter kit</h2>\n<p>Congratulations on getting up and running with the “Fanoe” starter kit. It''s a great way to get to know the Grid datatype.</p>\n<p><a href=\"/{localLink:1078}\" title=\"The starter kit\">Learn about the starter kit →</a><a href=\"/{localLink:1078}\" title=\"The Starterkit\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Learn the basics</h2>\n<p>To get started on the right foot make sure to check out our documentation - from tutorials to API reference.</p>\n<p><a href=\"/{localLink:1079}\" title=\"Basics\">Off to the docs →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Master classes</h2>\n<p>The best way to learn Umbraco is through the Master classes that’s running every month in most regions.</p>\n<p><a href=\"/{localLink:1080}\" title=\"Masterclasses\">Learn about the masterclasses →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1044/14441035391_7ee1d0d166_h_darken.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d28a05da-2404-c1e7-6265-01b07fc5f722"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Umbraco Forms</h1>\n<p>With our add-on product Umbraco Forms it’s a breeze to create any type of form you can imagine.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Package repository</h1>\n<p>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "5362ea7d-e729-078b-e717-a1e7aa69fd4b"
        },
        {
          "name": "Full width image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1127,
                    "image": "/media/1046/14386124825_d43f359900_h_cropped.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "953b3802-6b4f-20ed-66f9-9a855e9afdd4"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Sharing is caring</h2>\n<p>Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Born global, loving local</h2>\n<p>If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community. You can do just that through the many local user groups and meetups</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "29cac0ff-d8e9-605b-9e7b-6809dce55edd"
        },
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">CodeGarden</h1>\n<h5 style=\"text-align: center;\">Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0093bd05-735a-9623-8509-28085818745c"
        }
      ]
    }
  ]
}]]></content></Home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1059, N'd9255190-863f-4001-94d5-f78978058528', CAST(0x0000A71C01195965 AS DateTime), N'<Home id="1059" key="fe969938-1e65-45e8-b8f3-60a2a4e879fe" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Home" urlName="home" path="-1,1059" isDoc="" nodeType="1056" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1052" nodeTypeAlias="Home"><siteDescription><![CDATA[This is an official Umbraco Starter kit. It shows of the newest features in Umbraco and is the perfect place to start for newcomers.. Everything is made to be taken apart. It''s your own little playground. Enjoy!]]></siteDescription><siteTitle><![CDATA[Fanoe - Umbraco Starter Kit]]></siteTitle><siteLogo><![CDATA[/media/1042/logo.jpg]]></siteLogo><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "config": {},
              "styles": {
                "margin-bottom": "60px"
              },
              "controls": [
                {
                  "value": "Welcome to Fanoe",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "This is the new default starter kit for Umbraco, we enjoy building things that not only look great, but also work great.",
                  "editor": {
                    "name": "Banner Tagline",
                    "alias": "banner_tagline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 25px; line-height: 35px; font-weight: normal; text-align:center",
                      "markup": "<h2 style=''font-weight: 100; font-size: 40px;text-align:center''>#value#</h2>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>The starter kit</h2>\n<p>Congratulations on getting up and running with the “Fanoe” starter kit. It''s a great way to get to know the Grid datatype.</p>\n<p><a href=\"/{localLink:1078}\" title=\"The starter kit\">Learn about the starter kit →</a><a href=\"/{localLink:1078}\" title=\"The Starterkit\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Learn the basics</h2>\n<p>To get started on the right foot make sure to check out our documentation - from tutorials to API reference.</p>\n<p><a href=\"/{localLink:1079}\" title=\"Basics\">Off to the docs →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Master classes</h2>\n<p>The best way to learn Umbraco is through the Master classes that’s running every month in most regions.</p>\n<p><a href=\"/{localLink:1080}\" title=\"Masterclasses\">Learn about the masterclasses →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1044/14441035391_7ee1d0d166_h_darken.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d28a05da-2404-c1e7-6265-01b07fc5f722"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Umbraco Forms</h1>\n<p>With our add-on product Umbraco Forms it’s a breeze to create any type of form you can imagine.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Package repository</h1>\n<p>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "5362ea7d-e729-078b-e717-a1e7aa69fd4b"
        },
        {
          "name": "Full width image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1127,
                    "image": "/media/1046/14386124825_d43f359900_h_cropped.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "953b3802-6b4f-20ed-66f9-9a855e9afdd4"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Sharing is caring</h2>\n<p>Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Born global, loving local</h2>\n<p>If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community. You can do just that through the many local user groups and meetups</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "29cac0ff-d8e9-605b-9e7b-6809dce55edd"
        },
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">CodeGarden</h1>\n<h5 style=\"text-align: center;\">Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0093bd05-735a-9623-8509-28085818745c"
        }
      ]
    }
  ]
}]]></content></Home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'd9ebcd2a-c1c6-4579-b3f7-5c6e349f4d18', CAST(0x0000A71C01195A17 AS DateTime), N'<LandingPage id="1060" key="ffb4eed3-a064-4ea8-8478-d89a0a06e710" parentID="1059" level="2" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Learn" urlName="learn" path="-1,1059,1060" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'0d3cd253-9456-4fe2-bc38-6aef71456835', CAST(0x0000A71C0119597B AS DateTime), N'<LandingPage id="1060" key="ffb4eed3-a064-4ea8-8478-d89a0a06e710" parentID="1059" level="2" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Learn" urlName="learn" path="-1,1059,1060" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'27a6e815-a338-48c2-b1ca-2e35d6241375', CAST(0x0000A71C01195980 AS DateTime), N'<TextPage id="1061" key="f2f2288d-d7b3-4e85-9a80-c00c3213de65" parentID="1060" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="The starter kit" urlName="the-starter-kit" path="-1,1059,1060,1061" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Fanø",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Fanø is a Danish island in the North Sea off the coast of southwestern Denmark, and is the very northernmost of the Danish Wadden Sea Islands. Fanø municipality is the municipality that covers the island and its seat is the town of Nordby.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1012/fanoe-denmark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "789b4b02-6a1e-bbff-9435-939d83f6e895"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 dir=\"ltr\"><span><span>How is this starter kit made?</span></span></h1>\n<p dir=\"ltr\"><span>Congratulations on getting up and running with Umbraco and the “Fanoe” starter kit. The idea with this starter kit is to let you explore some of the simple things Umbraco can do for a typical content powered website using “The Grid” feature.</span></p>\n<p><span>To get the most out of this starter kit and get started on the right foot, make sure to watch the “Grid” tutorial on Umbraco.TV which will take you through how the entire starter kit was made. From implementing the HTML mockups in Umbraco and using the powerful features in the Grid to give maximum freedom and flexibility for editors - without compromising the design.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f0013b7-f55e-cdd9-6ed9-7ad2f8696157"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "While walking around on Fanø, you will notice that almost all traditional houses have a little window above the front door with a model boat.\nThis is a very traditional good luck charm for the men away at sea. The economy of the island was almost entirely based on fishing and every family home has the model boat to ensure the safe return of sailors",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "3bd5271f-c171-8435-ba19-00008abd3af5"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'61997560-db26-4b27-966c-36d81b685cc7', CAST(0x0000A71C01195A37 AS DateTime), N'<TextPage id="1061" key="f2f2288d-d7b3-4e85-9a80-c00c3213de65" parentID="1060" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="The starter kit" urlName="the-starter-kit" path="-1,1059,1060,1061" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Fanø",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Fanø is a Danish island in the North Sea off the coast of southwestern Denmark, and is the very northernmost of the Danish Wadden Sea Islands. Fanø municipality is the municipality that covers the island and its seat is the town of Nordby.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1012/fanoe-denmark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "789b4b02-6a1e-bbff-9435-939d83f6e895"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 dir=\"ltr\"><span><span>How is this starter kit made?</span></span></h1>\n<p dir=\"ltr\"><span>Congratulations on getting up and running with Umbraco and the “Fanoe” starter kit. The idea with this starter kit is to let you explore some of the simple things Umbraco can do for a typical content powered website using “The Grid” feature.</span></p>\n<p><span>To get the most out of this starter kit and get started on the right foot, make sure to watch the “Grid” tutorial on Umbraco.TV which will take you through how the entire starter kit was made. From implementing the HTML mockups in Umbraco and using the powerful features in the Grid to give maximum freedom and flexibility for editors - without compromising the design.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f0013b7-f55e-cdd9-6ed9-7ad2f8696157"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "While walking around on Fanø, you will notice that almost all traditional houses have a little window above the front door with a model boat.\nThis is a very traditional good luck charm for the men away at sea. The economy of the island was almost entirely based on fishing and every family home has the model boat to ensure the safe return of sailors",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "3bd5271f-c171-8435-ba19-00008abd3af5"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1062, N'562a5119-390d-4581-ba51-0b644e85641a', CAST(0x0000A71C01195983 AS DateTime), N'<TextPage id="1062" key="19810dc0-8fc8-4a01-9261-b2c8e2b83311" parentID="1060" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Basics" urlName="basics" path="-1,1059,1060,1062" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Learn the basics",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">While we recommend everyone to get an Umbraco.TV subscription to learn the ins and outs of Umbraco, maybe you prefer a more traditional tutorial or detailed technical documentation.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1047/9027509991_ff12bd87e4_b_small_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "97df8f64-dc98-40a9-e5f3-ac065983d6bd"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Create a basic website in Umbraco</h1>\n<p style=\"text-align: center;\">At Our Umbraco you’ll find both and we definitely recommend reading the guide on <a href=\"http://our.umbraco.org/documentation/Using-Umbraco/Creating-Basic-Site/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">creating a basic website in Umbraco</a><a href=\"#\" target=\"_blank\" title=\"Create a basic website in Umbraco\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "070e60ae-26d9-a277-5b04-97a52f73e34d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Sharpen those Razor skills</span></h2>\n<p dir=\"ltr\"><span>Umbraco uses Razor - a templating engine from Microsoft - as the main way to generate pages. If you’ve never used it before and in particular if you’ve never used ASP.NET before, It might seem a little daunting, but fear not. The template editor in the back office provides snippets and a Query Builder to get you up to speed.</span></p>\n<p dir=\"ltr\"><span>Once you know the basics, it’s also nice to know that there’s <a href=\"http://our.umbraco.org/projects/developer-tools/umbraco-v6-mvc-razor-cheatsheets/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">cheat sheets</a> covering the most common methods - ready to print out for office decoration.</span></p>\n<h2 dir=\"ltr\"><span>Extend with the API</span></h2>\n<p dir=\"ltr\"><span>If you want to extend Umbraco even further, you can use our .NET API to programmatically create Content, Media, Members and anything else that’s possible through the back office. For a quick start, <a href=\"http://umbraco.com/follow-us/blog-archive/2013/1/22/introducing-contentservice-aka-the-v6-api/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">you can follow this tutorial</a></span><span> and for full reference, don’t miss <a href=\"http://our.umbraco.org/documentation/reference/Management-v6/Services/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">the thorough documentation on Our</a>.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "16f56cd2-374c-8c6c-c91c-7d65b8b264cd"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1062, N'ef902dde-95ad-4e77-bd89-6ed75cd7f6fc', CAST(0x0000A71C01195A44 AS DateTime), N'<TextPage id="1062" key="19810dc0-8fc8-4a01-9261-b2c8e2b83311" parentID="1060" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Basics" urlName="basics" path="-1,1059,1060,1062" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Learn the basics",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">While we recommend everyone to get an Umbraco.TV subscription to learn the ins and outs of Umbraco, maybe you prefer a more traditional tutorial or detailed technical documentation.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1047/9027509991_ff12bd87e4_b_small_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "97df8f64-dc98-40a9-e5f3-ac065983d6bd"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Create a basic website in Umbraco</h1>\n<p style=\"text-align: center;\">At Our Umbraco you’ll find both and we definitely recommend reading the guide on <a href=\"http://our.umbraco.org/documentation/Using-Umbraco/Creating-Basic-Site/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">creating a basic website in Umbraco</a><a href=\"#\" target=\"_blank\" title=\"Create a basic website in Umbraco\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "070e60ae-26d9-a277-5b04-97a52f73e34d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Sharpen those Razor skills</span></h2>\n<p dir=\"ltr\"><span>Umbraco uses Razor - a templating engine from Microsoft - as the main way to generate pages. If you’ve never used it before and in particular if you’ve never used ASP.NET before, It might seem a little daunting, but fear not. The template editor in the back office provides snippets and a Query Builder to get you up to speed.</span></p>\n<p dir=\"ltr\"><span>Once you know the basics, it’s also nice to know that there’s <a href=\"http://our.umbraco.org/projects/developer-tools/umbraco-v6-mvc-razor-cheatsheets/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">cheat sheets</a> covering the most common methods - ready to print out for office decoration.</span></p>\n<h2 dir=\"ltr\"><span>Extend with the API</span></h2>\n<p dir=\"ltr\"><span>If you want to extend Umbraco even further, you can use our .NET API to programmatically create Content, Media, Members and anything else that’s possible through the back office. For a quick start, <a href=\"http://umbraco.com/follow-us/blog-archive/2013/1/22/introducing-contentservice-aka-the-v6-api/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">you can follow this tutorial</a></span><span> and for full reference, don’t miss <a href=\"http://our.umbraco.org/documentation/reference/Management-v6/Services/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">the thorough documentation on Our</a>.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "16f56cd2-374c-8c6c-c91c-7d65b8b264cd"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1063, N'68e8b829-782c-455f-9e90-8d1268cf63c8', CAST(0x0000A71C01195986 AS DateTime), N'<TextPage id="1063" key="90b0cb02-1447-48ff-912b-fc3bc8cdd3cd" parentID="1060" level="3" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Masterclasses" urlName="masterclasses" path="-1,1059,1060,1063" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Masterclasses",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">The best and fastest way to learn Umbraco is through the official Master classes that are running every month in most regions.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1022/9686845888_e2d216ce81_b_dark_small.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2d34e33a-a1ef-04d5-9445-e1f1633bc362"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h3 style=\"text-align: center;\">The masterclasses are ran by either the Umbraco HQ or by the most experienced community heroes and use thoroughly tested materials to ensure you’ll return as a fully skilled Umbraco craftsperson.</h3>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "blue"
          },
          "id": "5312fa7b-3d5c-e9c0-4d0c-f6ae5d73e168"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Get it right from the beginning</span></h2>\n<p dir=\"ltr\"><span>While Umbraco is a simple tool, it’s important that you use it the right way. The Level 1 master class is designed to make sure that any Web Developer - also with no previous ASP.NET knowledge - can create advanced multi-lingual sites by the end of the course.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Become an expert</span></h2>\n<p dir=\"ltr\"><span>Once you know the basics, you can step up your game by attending the Level 2 master class. While the first masterclass is focused on implementing a site, this Masterclass will teach you how the .net APIs work and how to integrate and extend Umbraco. Whether that’s creating content programmatically or integrating a third party e-commerce engine or CRM.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Worth the investment</span></h2>\n<p dir=\"ltr\"><span>All attendees at the official Umbraco Masterclasses receive a certification which is the best way to make yourself noticed in the Umbraco ecosystem. So whether you’re looking to move up in the ranks of your company or are a free agent, you shouldn’t be doing Umbraco without becoming certified. The investment will come back many times, so make sure to <a href=\"http://umbraco.com/products/training/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\" target=\"_blank\" title=\"Masterclasses\">keep an eye out for a Masterclass near you</a>.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "a3ddf743-1622-7eec-6ea4-08caef854559"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1063, N'533820d6-3742-46db-a6cf-e82e97a92e8e', CAST(0x0000A71C01195A4E AS DateTime), N'<TextPage id="1063" key="90b0cb02-1447-48ff-912b-fc3bc8cdd3cd" parentID="1060" level="3" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Masterclasses" urlName="masterclasses" path="-1,1059,1060,1063" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Masterclasses",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">The best and fastest way to learn Umbraco is through the official Master classes that are running every month in most regions.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1022/9686845888_e2d216ce81_b_dark_small.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2d34e33a-a1ef-04d5-9445-e1f1633bc362"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h3 style=\"text-align: center;\">The masterclasses are ran by either the Umbraco HQ or by the most experienced community heroes and use thoroughly tested materials to ensure you’ll return as a fully skilled Umbraco craftsperson.</h3>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "blue"
          },
          "id": "5312fa7b-3d5c-e9c0-4d0c-f6ae5d73e168"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Get it right from the beginning</span></h2>\n<p dir=\"ltr\"><span>While Umbraco is a simple tool, it’s important that you use it the right way. The Level 1 master class is designed to make sure that any Web Developer - also with no previous ASP.NET knowledge - can create advanced multi-lingual sites by the end of the course.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Become an expert</span></h2>\n<p dir=\"ltr\"><span>Once you know the basics, you can step up your game by attending the Level 2 master class. While the first masterclass is focused on implementing a site, this Masterclass will teach you how the .net APIs work and how to integrate and extend Umbraco. Whether that’s creating content programmatically or integrating a third party e-commerce engine or CRM.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Worth the investment</span></h2>\n<p dir=\"ltr\"><span>All attendees at the official Umbraco Masterclasses receive a certification which is the best way to make yourself noticed in the Umbraco ecosystem. So whether you’re looking to move up in the ranks of your company or are a free agent, you shouldn’t be doing Umbraco without becoming certified. The investment will come back many times, so make sure to <a href=\"http://umbraco.com/products/training/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\" target=\"_blank\" title=\"Masterclasses\">keep an eye out for a Masterclass near you</a>.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "a3ddf743-1622-7eec-6ea4-08caef854559"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1064, N'1c86c387-bb0d-4c7b-8f10-a139f934ace6', CAST(0x0000A71C01195A1C AS DateTime), N'<LandingPage id="1064" key="7df2df79-2df6-493e-85b4-62340dd6dfd6" parentID="1059" level="2" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Explore" urlName="explore" path="-1,1059,1064" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1064, N'51782a83-742a-4a6d-a62e-ecc5cbdab9a3', CAST(0x0000A71C01195989 AS DateTime), N'<LandingPage id="1064" key="7df2df79-2df6-493e-85b4-62340dd6dfd6" parentID="1059" level="2" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Explore" urlName="explore" path="-1,1059,1064" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1065, N'd7f768d6-3057-4110-9916-4e999b5dbafd', CAST(0x0000A71C01195A34 AS DateTime), N'<TextPage id="1065" key="61d90ec6-b3a8-4c44-959a-9efee4f73dbd" parentID="1064" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Our Umbraco" urlName="our-umbraco" path="-1,1059,1064,1065" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Sharing is caring",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1048/sharingiscaring_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0efee164-ea45-3657-66c2-04db5cbdcd37"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>Get help</h2>\n<p>If you’re stuck in your Umbraco project, the friendly forum is the place to visit. We take pride in keeping a friendly atmosphere in our forums despite the rapid growth of the project, so remember that the easier and friendlier you ask the more likely you are to get a quality reply.</p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Karma<br /></span></h2>\n<p dir=\"ltr\">On “Our” we have a virtual currency called “Karma” - think of it as likes worth counting. When you give people help, they can appreciate this by giving you a virtual high five. In addition to the joy of knowing that your help meant something, you also get karma points and while money doesn’t buy you happiness, a little bit of karma can. </p>\n<p dir=\"ltr\"><span>In other words, don’t forget to say thanks - it doesn’t cost you anything!</span></p>\n<p dir=\"ltr\"> </p>\n<h2 dir=\"ltr\"><span>Give back<br /></span></h2>\n<p dir=\"ltr\">Once you’ve become better at Umbraco, remember to set aside a little bit of time to be the help you got. It’ll keep the snowball effect rolling and by pulling together as a community, it doesn’t take much effort from everybody to make Umbraco community the best in the industry when it comes to get a fast and friendly quality response.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "0e64a81c-519d-ed35-7e28-35e2d441a044"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.54,
                      "top": 0.34082397003745318
                    },
                    "id": 1130,
                    "image": "/media/1049/9027510123_92a91b5cf4_b_dark.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "1efceb16-6a36-e18b-905a-b372c3d8b5e1"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1065, N'9bc8b176-c4be-4431-9ae3-7ea26784d9ec', CAST(0x0000A71C0119598C AS DateTime), N'<TextPage id="1065" key="61d90ec6-b3a8-4c44-959a-9efee4f73dbd" parentID="1064" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Our Umbraco" urlName="our-umbraco" path="-1,1059,1064,1065" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Sharing is caring",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1048/sharingiscaring_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0efee164-ea45-3657-66c2-04db5cbdcd37"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>Get help</h2>\n<p>If you’re stuck in your Umbraco project, the friendly forum is the place to visit. We take pride in keeping a friendly atmosphere in our forums despite the rapid growth of the project, so remember that the easier and friendlier you ask the more likely you are to get a quality reply.</p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Karma<br /></span></h2>\n<p dir=\"ltr\">On “Our” we have a virtual currency called “Karma” - think of it as likes worth counting. When you give people help, they can appreciate this by giving you a virtual high five. In addition to the joy of knowing that your help meant something, you also get karma points and while money doesn’t buy you happiness, a little bit of karma can. </p>\n<p dir=\"ltr\"><span>In other words, don’t forget to say thanks - it doesn’t cost you anything!</span></p>\n<p dir=\"ltr\"> </p>\n<h2 dir=\"ltr\"><span>Give back<br /></span></h2>\n<p dir=\"ltr\">Once you’ve become better at Umbraco, remember to set aside a little bit of time to be the help you got. It’ll keep the snowball effect rolling and by pulling together as a community, it doesn’t take much effort from everybody to make Umbraco community the best in the industry when it comes to get a fast and friendly quality response.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "0e64a81c-519d-ed35-7e28-35e2d441a044"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.54,
                      "top": 0.34082397003745318
                    },
                    "id": 1130,
                    "image": "/media/1049/9027510123_92a91b5cf4_b_dark.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "1efceb16-6a36-e18b-905a-b372c3d8b5e1"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1066, N'3574fa7e-cc26-41e7-8466-887df2b8fd20', CAST(0x0000A71C01195A40 AS DateTime), N'<TextPage id="1066" key="db304a88-9f5b-447b-b1f1-5788faf2ef04" parentID="1064" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Codegarden" urlName="codegarden" path="-1,1059,1064,1066" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "CodeGarden",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1014/9017002308_81dfd2c1d5_b_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d851bdc5-cb0c-e982-a1aa-f1cdda3e39c0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Well, it used to be a conference</span></h2>\n<p dir=\"ltr\"><span>but today we like to think of it more as a “festival”. Lasting three days from early mornings to late evenings, it’s packed with a combination of learning everything about Umbraco to the who’s who in the community in a laid back atmosphere where you’ll feel at home.</span></p>\n<h2 dir=\"ltr\"><span>Great sessions</span></h2>\n<p dir=\"ltr\"><span>At Umbraco you’ll find sessions that’ll take your skills to the next level. From large-scale implementation to highly specialized sites, you really shouldn’t miss out on the opportunity to learn from those who have come before you.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "afbe6cbd-a903-1c91-4d7e-fafa73515de6"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5056179775280899
                    },
                    "id": 1123,
                    "image": "/media/1015/14257753719_2c02b94030_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1015%2F14257753719_2c02b94030_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "4bbedf99-360e-905c-2bd3-71b458ab4647"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "In raw numbers, Codegarden is: 500+ attendees, 3 packed days, 20+ sessions, 26 passionate speakers, 3 workshops, 1 keynote, a hack room, 2 rounds of bingo and 3563 cups of fair trade coffee",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "6bfba7ba-f732-8193-3d38-2980e262142d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Influence the project</span></h2>\n<p dir=\"ltr\"><span>Aside from the regular sessions and workshops CodeGarden also provides a unique approach to conferencing. It is called Open Space Technology and is all about networking, problem solving. This means you are not just limited to the scheduled topics but can put your own passions on the agenda and influence the future of the project.</span></p>\n<h2 dir=\"ltr\"><span>Loads of fun</span></h2>\n<p dir=\"ltr\"><span>In the community we value having a great time, so CodeGarden evenings are packed with social events. From canal tours of Copenhagen (with free beer and champagne) to evening parties and the infamous Umbraco bingo and dinner which can’t be described in words.</span></p>\n<h2 dir=\"ltr\"><span>Get your ticket</span></h2>\n<p><span>CodeGarden always ends up selling out, so make sure to reserve your ticket. The earlier you order the cheaper it is and if you’re on a stretch budget there’s a big chance that a friendly local Umbracian will have a couch to spare.<br /></span></p>\n<p><span><a href=\"http://umbraco.com/cg15/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Buy ticket for Codegarden</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "edebcf94-a4b1-fec5-5bc6-f8f677b03b16"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.605,
                      "top": 0.33333333333333331
                    },
                    "id": 1124,
                    "image": "/media/1016/14435759945_a2c58e9ed6_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1016%2F14435759945_a2c58e9ed6_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "96ec2067-0a50-459a-4d95-714b5b8ac4b6"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1066, N'74d1096f-b6e8-45d4-9629-bba0a27a43b5', CAST(0x0000A71C0119598F AS DateTime), N'<TextPage id="1066" key="db304a88-9f5b-447b-b1f1-5788faf2ef04" parentID="1064" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Codegarden" urlName="codegarden" path="-1,1059,1064,1066" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "CodeGarden",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1014/9017002308_81dfd2c1d5_b_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d851bdc5-cb0c-e982-a1aa-f1cdda3e39c0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Well, it used to be a conference</span></h2>\n<p dir=\"ltr\"><span>but today we like to think of it more as a “festival”. Lasting three days from early mornings to late evenings, it’s packed with a combination of learning everything about Umbraco to the who’s who in the community in a laid back atmosphere where you’ll feel at home.</span></p>\n<h2 dir=\"ltr\"><span>Great sessions</span></h2>\n<p dir=\"ltr\"><span>At Umbraco you’ll find sessions that’ll take your skills to the next level. From large-scale implementation to highly specialized sites, you really shouldn’t miss out on the opportunity to learn from those who have come before you.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "afbe6cbd-a903-1c91-4d7e-fafa73515de6"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5056179775280899
                    },
                    "id": 1123,
                    "image": "/media/1015/14257753719_2c02b94030_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1015%2F14257753719_2c02b94030_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "4bbedf99-360e-905c-2bd3-71b458ab4647"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "In raw numbers, Codegarden is: 500+ attendees, 3 packed days, 20+ sessions, 26 passionate speakers, 3 workshops, 1 keynote, a hack room, 2 rounds of bingo and 3563 cups of fair trade coffee",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "6bfba7ba-f732-8193-3d38-2980e262142d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Influence the project</span></h2>\n<p dir=\"ltr\"><span>Aside from the regular sessions and workshops CodeGarden also provides a unique approach to conferencing. It is called Open Space Technology and is all about networking, problem solving. This means you are not just limited to the scheduled topics but can put your own passions on the agenda and influence the future of the project.</span></p>\n<h2 dir=\"ltr\"><span>Loads of fun</span></h2>\n<p dir=\"ltr\"><span>In the community we value having a great time, so CodeGarden evenings are packed with social events. From canal tours of Copenhagen (with free beer and champagne) to evening parties and the infamous Umbraco bingo and dinner which can’t be described in words.</span></p>\n<h2 dir=\"ltr\"><span>Get your ticket</span></h2>\n<p><span>CodeGarden always ends up selling out, so make sure to reserve your ticket. The earlier you order the cheaper it is and if you’re on a stretch budget there’s a big chance that a friendly local Umbracian will have a couch to spare.<br /></span></p>\n<p><span><a href=\"http://umbraco.com/cg15/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Buy ticket for Codegarden</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "edebcf94-a4b1-fec5-5bc6-f8f677b03b16"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.605,
                      "top": 0.33333333333333331
                    },
                    "id": 1124,
                    "image": "/media/1016/14435759945_a2c58e9ed6_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1016%2F14435759945_a2c58e9ed6_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "96ec2067-0a50-459a-4d95-714b5b8ac4b6"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1067, N'b7b69255-d650-4f24-bf38-38ef5ccd6c3b', CAST(0x0000A71C01195A4B AS DateTime), N'<TextPage id="1067" key="a8dc7604-6d87-404a-adbf-2c4e5cd3e089" parentID="1064" level="3" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Meetup groups" urlName="meetup-groups" path="-1,1059,1064,1067" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Born global, loving local",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community and finally - if you can’t come to the community, why not have the community come to you by starting a local user group?</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1017/14359779226_df7329d607_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "3dd3ea61-c394-5ce1-91d8-93f4a41b0dc0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco Meetups</span></h2>\n<p dir=\"ltr\"><span>From London to New York, from Denmark in the north to Australia in the south - there’s local Umbraco User groups all over the world that <a href=\"http://our.umbraco.org/events/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">arrange regular meetups</a>. The format is usually a laid back atmosphere where people share their knowledge and new people are always welcome. So make sure to <a href=\"http://umbraco.meetup.com/\">check out Meetup.com for a local group</a> and if you’re not lucky, why not start one - it’s not that hard.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Local Festivals</span></h2>\n<p dir=\"ltr\"><span>Inspired by CodeGarden, there’s more and more annual local Umbraco events. Originated from the community in the United Kingdom, there’s “Umbraco Festivals” going on in many countries around the world. These are one day events packed with sessions that often combine advanced Umbraco topics with discussing how local awareness can be improved. And as they are driven by the community and often sponsored by local Umbraco partners, they’re usually very inexpensive events to attend.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f2b5540-7c52-4631-3877-6be5f61f6a12"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49583333333333335,
                      "top": 0.53
                    },
                    "id": 1126,
                    "image": "/media/1018/10818851674_e375a8751e_b.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1018%2F10818851674_e375a8751e_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "102d5bec-3fb5-4d1a-cd9f-2baeeb5cdc44"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1067, N'4aee1ab8-570b-4c5a-aa74-9969fd17c4f7', CAST(0x0000A71C01195992 AS DateTime), N'<TextPage id="1067" key="a8dc7604-6d87-404a-adbf-2c4e5cd3e089" parentID="1064" level="3" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Meetup groups" urlName="meetup-groups" path="-1,1059,1064,1067" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Born global, loving local",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community and finally - if you can’t come to the community, why not have the community come to you by starting a local user group?</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1017/14359779226_df7329d607_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "3dd3ea61-c394-5ce1-91d8-93f4a41b0dc0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco Meetups</span></h2>\n<p dir=\"ltr\"><span>From London to New York, from Denmark in the north to Australia in the south - there’s local Umbraco User groups all over the world that <a href=\"http://our.umbraco.org/events/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">arrange regular meetups</a>. The format is usually a laid back atmosphere where people share their knowledge and new people are always welcome. So make sure to <a href=\"http://umbraco.meetup.com/\">check out Meetup.com for a local group</a> and if you’re not lucky, why not start one - it’s not that hard.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Local Festivals</span></h2>\n<p dir=\"ltr\"><span>Inspired by CodeGarden, there’s more and more annual local Umbraco events. Originated from the community in the United Kingdom, there’s “Umbraco Festivals” going on in many countries around the world. These are one day events packed with sessions that often combine advanced Umbraco topics with discussing how local awareness can be improved. And as they are driven by the community and often sponsored by local Umbraco partners, they’re usually very inexpensive events to attend.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f2b5540-7c52-4631-3877-6be5f61f6a12"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49583333333333335,
                      "top": 0.53
                    },
                    "id": 1126,
                    "image": "/media/1018/10818851674_e375a8751e_b.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1018%2F10818851674_e375a8751e_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "102d5bec-3fb5-4d1a-cd9f-2baeeb5cdc44"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1068, N'ca325e72-9edb-48e2-a3e1-092a4f9a404b', CAST(0x0000A71C01195995 AS DateTime), N'<LandingPage id="1068" key="e61ade6c-823c-4287-9fbd-b280281745e5" parentID="1059" level="2" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Extend" urlName="extend" path="-1,1059,1068" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1068, N'51fdc01a-6fc8-45ac-be9b-9b16ba451cca', CAST(0x0000A71C01195A20 AS DateTime), N'<LandingPage id="1068" key="e61ade6c-823c-4287-9fbd-b280281745e5" parentID="1059" level="2" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Extend" urlName="extend" path="-1,1059,1068" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1069, N'b29bd2cd-8163-4c4d-bddf-bf489ca0fb18', CAST(0x0000A71C01195A31 AS DateTime), N'<TextPage id="1069" key="7a559f1d-7682-403c-ae2b-5d19a678ee4c" parentID="1068" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Umbraco Forms" urlName="umbraco-forms" path="-1,1059,1068,1069" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Umbraco forms",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">With our add-on product Umbraco Forms it’s a breeze to create anything from simple contact forms to advanced questionnaires.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "0a170745-ecbd-f642-0e5c-8475e6fae812"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">You won''t need to write a single line of code.</h1>\n<p style=\"text-align: center;\">Instead, you can create, edit and administer your form via a user interface that is a fully integrated part of Umbraco.</p>\n<p style=\"text-align: center;\"> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "<iframe src=\"//player.vimeo.com/video/110229004\" width=\"360\" height=\"203\" frameborder=\"0\" title=\"Form installer intro\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": "/App_Plugins/Grid/Editors/Render/embed_videowrapper.cshtml",
                    "icon": "icon-movie-alt"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "17022257-5f35-360f-8cec-f574221fc457"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1>Why does Umbraco Forms cost money?</h1>\n<p>At the Umbraco HQ we employ 15 full-time employees to ensure that the core is of the highest quality and constantly evolves. As we believe in keeping great ideas sustainable, we’ve never taken outside investment, but solely rely on income from products that enhance - but don’t limit - the open source core. We believe this is the best, long term solution and we hope you agree.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "190b7767-6b42-cd23-1d01-ad7e2ff24a6d"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1069, N'c29aa415-7c26-49bf-a63e-e4e46e1b8d3e', CAST(0x0000A71C01195998 AS DateTime), N'<TextPage id="1069" key="7a559f1d-7682-403c-ae2b-5d19a678ee4c" parentID="1068" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Umbraco Forms" urlName="umbraco-forms" path="-1,1059,1068,1069" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Umbraco forms",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">With our add-on product Umbraco Forms it’s a breeze to create anything from simple contact forms to advanced questionnaires.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "0a170745-ecbd-f642-0e5c-8475e6fae812"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">You won''t need to write a single line of code.</h1>\n<p style=\"text-align: center;\">Instead, you can create, edit and administer your form via a user interface that is a fully integrated part of Umbraco.</p>\n<p style=\"text-align: center;\"> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "<iframe src=\"//player.vimeo.com/video/110229004\" width=\"360\" height=\"203\" frameborder=\"0\" title=\"Form installer intro\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": "/App_Plugins/Grid/Editors/Render/embed_videowrapper.cshtml",
                    "icon": "icon-movie-alt"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "17022257-5f35-360f-8cec-f574221fc457"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1>Why does Umbraco Forms cost money?</h1>\n<p>At the Umbraco HQ we employ 15 full-time employees to ensure that the core is of the highest quality and constantly evolves. As we believe in keeping great ideas sustainable, we’ve never taken outside investment, but solely rely on income from products that enhance - but don’t limit - the open source core. We believe this is the best, long term solution and we hope you agree.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "190b7767-6b42-cd23-1d01-ad7e2ff24a6d"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'14c287e4-ca79-4d66-be5b-5286d9a9d493', CAST(0x0000A71C01195A3D AS DateTime), N'<TextPage id="1070" key="fbda6122-4271-4b47-beb7-4b2f71e673d5" parentID="1068" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Package repository" urlName="package-repository" path="-1,1059,1068,1070" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Package repository",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1024/14448232381_8f994d2adc_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0fc8f95c-1db8-6d29-788c-58a23c47634a"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Swim in the ocean of packages</span></h2>\n<p dir=\"ltr\"><span>From complete e-commerce platforms to integration with 3rd party services such as MailChimp and YouTube to developer tools that’ll boost your productivity.</span></p>\n<p dir=\"ltr\"><span>While you can download the packages on Our, you can also browse and install them directly from within the backoffice - called the “Package Repository” (yes, we should find a sexier name!). Those packages are filtered to ensure they’ll work with your Umbraco installation (based on version) and only packages that have been approved by at least 15 community people make the cut.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "9bc7883d-fd02-84d2-a790-9e0174b22e77"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "If you like the package, make sure to give it a high five.",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "a01e8642-d4a9-30d4-d8ef-ae31a0f7f83e"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1120,
                    "image": "/media/1038/screen-shot-2014-12-01-at-121327.png",
                    "paragraph": "Once you’ve installed a package, make sure to give feedback. Whether the install was successful or not, it’ll help the next person trying to give it a go. At Our Umbraco you can report compatibility with a few simple clicks.",
                    "headline": "Give feedback"
                  },
                  "editor": {
                    "name": "Image w/ text right",
                    "alias": "media_text_right",
                    "view": "/App_Plugins/Grid/Editors/Views/media_with_description.html",
                    "render": "/App_Plugins/Grid/Editors/Render/media_text_right.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "96916694-116a-637c-2319-a5b077e80bd9"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'a5cc4e48-41c9-43bd-b3e8-b207a2322212', CAST(0x0000A71C0119599B AS DateTime), N'<TextPage id="1070" key="fbda6122-4271-4b47-beb7-4b2f71e673d5" parentID="1068" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Package repository" urlName="package-repository" path="-1,1059,1068,1070" isDoc="" nodeType="1058" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Package repository",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1024/14448232381_8f994d2adc_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0fc8f95c-1db8-6d29-788c-58a23c47634a"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Swim in the ocean of packages</span></h2>\n<p dir=\"ltr\"><span>From complete e-commerce platforms to integration with 3rd party services such as MailChimp and YouTube to developer tools that’ll boost your productivity.</span></p>\n<p dir=\"ltr\"><span>While you can download the packages on Our, you can also browse and install them directly from within the backoffice - called the “Package Repository” (yes, we should find a sexier name!). Those packages are filtered to ensure they’ll work with your Umbraco installation (based on version) and only packages that have been approved by at least 15 community people make the cut.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "9bc7883d-fd02-84d2-a790-9e0174b22e77"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "If you like the package, make sure to give it a high five.",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "a01e8642-d4a9-30d4-d8ef-ae31a0f7f83e"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1120,
                    "image": "/media/1038/screen-shot-2014-12-01-at-121327.png",
                    "paragraph": "Once you’ve installed a package, make sure to give feedback. Whether the install was successful or not, it’ll help the next person trying to give it a go. At Our Umbraco you can report compatibility with a few simple clicks.",
                    "headline": "Give feedback"
                  },
                  "editor": {
                    "name": "Image w/ text right",
                    "alias": "media_text_right",
                    "view": "/App_Plugins/Grid/Editors/Views/media_with_description.html",
                    "render": "/App_Plugins/Grid/Editors/Render/media_text_right.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "96916694-116a-637c-2319-a5b077e80bd9"
        }
      ]
    }
  ]
}]]></content></TextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1071, N'865859a9-0109-4170-b1bc-5f4f58e1e08f', CAST(0x0000A71C0119599E AS DateTime), N'<BlogPostRepository id="1071" key="2d70dc1c-3c95-4475-8e4c-ea5f25b6698c" parentID="1059" level="2" creatorID="0" sortOrder="3" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Blog" urlName="blog" path="-1,1059,1071" isDoc="" nodeType="1055" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1050" nodeTypeAlias="BlogPostRepository"><umbracoNaviHide>1</umbracoNaviHide></BlogPostRepository>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1071, N'702f0071-7da4-4f56-89e9-a5f4630d7d99', CAST(0x0000A71C01195A24 AS DateTime), N'<BlogPostRepository id="1071" key="2d70dc1c-3c95-4475-8e4c-ea5f25b6698c" parentID="1059" level="2" creatorID="0" sortOrder="3" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Blog" urlName="blog" path="-1,1059,1071" isDoc="" nodeType="1055" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1050" nodeTypeAlias="BlogPostRepository"><umbracoNaviHide>1</umbracoNaviHide></BlogPostRepository>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1072, N'de2da6e2-6981-4030-a76c-ac744a4a86ae', CAST(0x0000A71C01195A2D AS DateTime), N'<BlogPost id="1072" key="0afcd916-446a-4ae1-b089-b26227e7fbda" parentID="1071" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Tall trees have deep roots" urlName="tall-trees-have-deep-roots" path="-1,1059,1071,1072" isDoc="" nodeType="1054" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1051" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\" dir=\"ltr\"><span>Tall trees have deep roots</span></h1>\n<h5 style=\"text-align: center;\" dir=\"ltr\"><span>You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2bd04b6a-0561-05c8-aa48-7ee47fde287f"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>The origins of the roots</span></h2>\n<p dir=\"ltr\"><span>date back to 2003 where the first version of Umbraco saw its light. Back then nobody could predict what it would become and especially not Niels Hartvig who simply designed and built Umbraco as a tool to quickly produce sites for his freelance clients and make sure they had a user-friendly way of updating it.</span></p>\n<p dir=\"ltr\"><span>But in 2004 he decided to open source the work and with help of friends Kasper Bumbech and Anders Pollas with whom he shared office space, the first version of Umbraco as open source saw the light of the day on February 16th 2005.</span></p>\n<p><span>In the early days, the community was purely virtual and since it was the days before Facebook and Twitter, the early adopters communicated through a Yahoo Mailinglist. From the seeds of talking Umbraco via email, the idea of an Umbraco conference surfaced and in March 2005, <a href=\"https://groups.yahoo.com/neo/groups/umbraco/conversations/messages/195\" target=\"_blank\" title=\"Codegarden was born\">CodeGarden was born…</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "7a2e4652-8523-3ade-053d-f7873c9c8020"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1108,
                    "image": "/media/1027/14434411872_8e663d6de0_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "5fc9f47f-3ac1-4627-df26-2922b584e288"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Since v1 of CodeGarden in 2005</span></h2>\n<p dir=\"ltr\"><span>thousands of people have attended what is considered a must experience event for any “Umbracian”; it’s where everything Umbraco comes to life. From seeing the latest progress, sharing knowledge with fellow community members, having memorable times in the wonderful city of Copenhagen and returning energized with new knowledge and inspiration.</span></p>\n<p dir=\"ltr\"><span>But more than anything, it’s the special vibe that has always been a keystone in everything that surrounds Umbraco. As coined by Hudson Maul back in 2006 - it’s “The Friendly CMS”.</span></p>\n<h2 dir=\"ltr\"><br /><br /></h2>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "84b00350-7168-7858-0b37-e452f05d7664"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.]]></introduction></BlogPost>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1072, N'c17b52dc-8df4-4a0d-bdbb-ec138ec5f4fe', CAST(0x0000A71C011959A1 AS DateTime), N'<BlogPost id="1072" key="0afcd916-446a-4ae1-b089-b26227e7fbda" parentID="1071" level="3" creatorID="0" sortOrder="0" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Tall trees have deep roots" urlName="tall-trees-have-deep-roots" path="-1,1059,1071,1072" isDoc="" nodeType="1054" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1051" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\" dir=\"ltr\"><span>Tall trees have deep roots</span></h1>\n<h5 style=\"text-align: center;\" dir=\"ltr\"><span>You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2bd04b6a-0561-05c8-aa48-7ee47fde287f"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>The origins of the roots</span></h2>\n<p dir=\"ltr\"><span>date back to 2003 where the first version of Umbraco saw its light. Back then nobody could predict what it would become and especially not Niels Hartvig who simply designed and built Umbraco as a tool to quickly produce sites for his freelance clients and make sure they had a user-friendly way of updating it.</span></p>\n<p dir=\"ltr\"><span>But in 2004 he decided to open source the work and with help of friends Kasper Bumbech and Anders Pollas with whom he shared office space, the first version of Umbraco as open source saw the light of the day on February 16th 2005.</span></p>\n<p><span>In the early days, the community was purely virtual and since it was the days before Facebook and Twitter, the early adopters communicated through a Yahoo Mailinglist. From the seeds of talking Umbraco via email, the idea of an Umbraco conference surfaced and in March 2005, <a href=\"https://groups.yahoo.com/neo/groups/umbraco/conversations/messages/195\" target=\"_blank\" title=\"Codegarden was born\">CodeGarden was born…</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "7a2e4652-8523-3ade-053d-f7873c9c8020"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1108,
                    "image": "/media/1027/14434411872_8e663d6de0_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "5fc9f47f-3ac1-4627-df26-2922b584e288"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Since v1 of CodeGarden in 2005</span></h2>\n<p dir=\"ltr\"><span>thousands of people have attended what is considered a must experience event for any “Umbracian”; it’s where everything Umbraco comes to life. From seeing the latest progress, sharing knowledge with fellow community members, having memorable times in the wonderful city of Copenhagen and returning energized with new knowledge and inspiration.</span></p>\n<p dir=\"ltr\"><span>But more than anything, it’s the special vibe that has always been a keystone in everything that surrounds Umbraco. As coined by Hudson Maul back in 2006 - it’s “The Friendly CMS”.</span></p>\n<h2 dir=\"ltr\"><br /><br /></h2>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "84b00350-7168-7858-0b37-e452f05d7664"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.]]></introduction></BlogPost>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1073, N'2dde0380-0303-43d1-85dd-1ccfbf4d8e7f', CAST(0x0000A71C011959A4 AS DateTime), N'<BlogPost id="1073" key="fb10eb0f-4d5d-4a37-bdd1-93e4730a8b8b" parentID="1071" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Different Flowers Make a Bouquet" urlName="different-flowers-make-a-bouquet" path="-1,1059,1071,1073" isDoc="" nodeType="1054" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1051" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Different Flowers Make a Bouquet</h1>\n<h5 style=\"text-align: center;\">It may only take two to tango, but a party worth remembering is a completely different story.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1031/9026528992_d38fbc2e28_o_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "63d1f52a-a6be-2459-a337-22f97cdb15bb"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco is a huge family </span></h2>\n<p dir=\"ltr\"><span>including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.</span></p>\n<p dir=\"ltr\"><span>Without diversity, status quo becomes king. At Umbraco we don’t believe in the status quo. We believe it’s the sum of our differences - whether designer, developer or editor, whether nationality, religion or gender, heck, whether Apple or PC - that it’s the nutrition for moving forward.</span></p>\n<p dir=\"ltr\"><span>When you open your eyes for the qualities in other people, you open up an astounding opportunity to learn. Our world - and our differences - is a buffet of eye-opening knowledge just waiting for you. So make sure to treat everyone friendly and with the highest respect. Don''t be the judge.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "8e82e5c1-8583-3d32-2742-c02b96060643"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1113,
                    "image": "/media/1032/9039247947_e15a9d8850_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "d8ceaabf-535b-16db-e4ae-522fc0555846"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[It may only take two to tango, but a party worth remembering is a completely different story. Including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.]]></introduction></BlogPost>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1073, N'a4641bda-93e5-446f-a7f4-7b47fc800858', CAST(0x0000A71C01195A3A AS DateTime), N'<BlogPost id="1073" key="fb10eb0f-4d5d-4a37-bdd1-93e4730a8b8b" parentID="1071" level="3" creatorID="0" sortOrder="1" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Different Flowers Make a Bouquet" urlName="different-flowers-make-a-bouquet" path="-1,1059,1071,1073" isDoc="" nodeType="1054" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1051" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Different Flowers Make a Bouquet</h1>\n<h5 style=\"text-align: center;\">It may only take two to tango, but a party worth remembering is a completely different story.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1031/9026528992_d38fbc2e28_o_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "63d1f52a-a6be-2459-a337-22f97cdb15bb"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco is a huge family </span></h2>\n<p dir=\"ltr\"><span>including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.</span></p>\n<p dir=\"ltr\"><span>Without diversity, status quo becomes king. At Umbraco we don’t believe in the status quo. We believe it’s the sum of our differences - whether designer, developer or editor, whether nationality, religion or gender, heck, whether Apple or PC - that it’s the nutrition for moving forward.</span></p>\n<p dir=\"ltr\"><span>When you open your eyes for the qualities in other people, you open up an astounding opportunity to learn. Our world - and our differences - is a buffet of eye-opening knowledge just waiting for you. So make sure to treat everyone friendly and with the highest respect. Don''t be the judge.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "8e82e5c1-8583-3d32-2742-c02b96060643"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1113,
                    "image": "/media/1032/9039247947_e15a9d8850_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "d8ceaabf-535b-16db-e4ae-522fc0555846"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[It may only take two to tango, but a party worth remembering is a completely different story. Including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.]]></introduction></BlogPost>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1074, N'407d3292-e4fd-42d8-8257-2151894ec6e9', CAST(0x0000A71C011959A8 AS DateTime), N'<BlogPost id="1074" key="98b39820-427c-43b5-9ea5-7258d9383209" parentID="1071" level="3" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Only the curious have something to find" urlName="only-the-curious-have-something-to-find" path="-1,1059,1071,1074" isDoc="" nodeType="1054" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1051" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49514563106796117,
                      "top": 0.19
                    },
                    "id": 1115,
                    "image": "/media/1033/whole-earth-catalog.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "ec390b52-0259-8b7f-fc86-56374ea6ca63"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: left;\" dir=\"ltr\"><span>Only the curious have something to find</span></h1>\n<p>A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.</p>\n<p dir=\"ltr\"><span>Yet, we all dream about - and need - a little adventure every now and then. At the Umbraco community we praise those who dare to play and take risks. At the many Umbraco events around the world, brave people share their ideas through opinionated talks and at Our Umbraco courageous coders share their packages that extend the feature set of Umbraco.</span></p>\n<p dir=\"ltr\"><span>You should as well. After all, what do you </span><span>really</span><span> have to lose? Nothing compared to what you have to gain: becoming a better craftsperson, inspiring others and the satisfaction of seeing the download number of your work increase week after week. If we don’t strive for moving forward - whether professionals or amateurs - then what’s the point?</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "“Once you stop learning, you start dying”\n- Albert Einstein",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "bdc66e02-87e6-7aa6-34a8-c0e5f834af79"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.]]></introduction></BlogPost>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1074, N'd2aecbc2-f12b-4cd8-bcdc-2412ed714f12', CAST(0x0000A71C01195A47 AS DateTime), N'<BlogPost id="1074" key="98b39820-427c-43b5-9ea5-7258d9383209" parentID="1071" level="3" creatorID="0" sortOrder="2" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Only the curious have something to find" urlName="only-the-curious-have-something-to-find" path="-1,1059,1071,1074" isDoc="" nodeType="1054" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1051" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49514563106796117,
                      "top": 0.19
                    },
                    "id": 1115,
                    "image": "/media/1033/whole-earth-catalog.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "ec390b52-0259-8b7f-fc86-56374ea6ca63"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: left;\" dir=\"ltr\"><span>Only the curious have something to find</span></h1>\n<p>A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.</p>\n<p dir=\"ltr\"><span>Yet, we all dream about - and need - a little adventure every now and then. At the Umbraco community we praise those who dare to play and take risks. At the many Umbraco events around the world, brave people share their ideas through opinionated talks and at Our Umbraco courageous coders share their packages that extend the feature set of Umbraco.</span></p>\n<p dir=\"ltr\"><span>You should as well. After all, what do you </span><span>really</span><span> have to lose? Nothing compared to what you have to gain: becoming a better craftsperson, inspiring others and the satisfaction of seeing the download number of your work increase week after week. If we don’t strive for moving forward - whether professionals or amateurs - then what’s the point?</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "“Once you stop learning, you start dying”\n- Albert Einstein",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "bdc66e02-87e6-7aa6-34a8-c0e5f834af79"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.]]></introduction></BlogPost>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1075, N'9760a023-eb19-4e5f-b81e-51e602075802', CAST(0x0000A71C011959AB AS DateTime), N'<LandingPage id="1075" key="f14745f4-ba09-403a-8ba5-1ebe2ec6b793" parentID="1059" level="2" creatorID="0" sortOrder="4" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:21" nodeName="Contact" urlName="contact" path="-1,1059,1075" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}]]></content></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1075, N'28f7948f-7bed-42fe-aa91-57f94acd4d99', CAST(0x0000A71C01195A28 AS DateTime), N'<LandingPage id="1075" key="f14745f4-ba09-403a-8ba5-1ebe2ec6b793" parentID="1059" level="2" creatorID="0" sortOrder="4" createDate="2017-02-16T17:04:21" updateDate="2017-02-16T17:04:22" nodeName="Contact" urlName="contact" path="-1,1059,1075" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}]]></content></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', CAST(0x0000A71C0123D7FF AS DateTime), N'<LandingPage1 id="1078" key="22388436-2fa9-49d1-a6cf-395fec8cef96" parentID="1059" level="2" creatorID="0" sortOrder="5" createDate="2017-02-16T17:16:02" updateDate="2017-02-16T17:42:34" nodeName="Contact (1)" urlName="contact-1" path="-1,1059,1078" isDoc="" nodeType="1079" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1082" nodeTypeAlias="LandingPage1"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content><signpostLink1><![CDATA[[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]]]></signpostLink1><signpostLink2><![CDATA[[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]]]></signpostLink2><signpostCopy2><![CDATA[For getting help with implementing Umbraco, look at our list of Certified Umbraco partner]]></signpostCopy2><signpostHeading1><![CDATA[The forum]]></signpostHeading1><signpostHeading2><![CDATA[Getting help]]></signpostHeading2><signpostLink3><![CDATA[[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]]]></signpostLink3><signpostCopy3><![CDATA[For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ]]></signpostCopy3><signpostHeading3><![CDATA[Get in touch]]></signpostHeading3><signpostCopy1><![CDATA[For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.]]></signpostCopy1></LandingPage1>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1078, N'33ade3d5-95d8-44f9-acd3-37459ef6e3b3', CAST(0x0000A71C011C8EDD AS DateTime), N'<LandingPage id="1078" key="22388436-2fa9-49d1-a6cf-395fec8cef96" parentID="1059" level="2" creatorID="0" sortOrder="5" createDate="2017-02-16T17:16:02" updateDate="2017-02-16T17:16:02" nodeName="Contact (1)" urlName="contact-1" path="-1,1059,1078" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}]]></content></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', CAST(0x0000A71C01202A05 AS DateTime), N'<LandingPage1 id="1078" key="22388436-2fa9-49d1-a6cf-395fec8cef96" parentID="1059" level="2" creatorID="0" sortOrder="5" createDate="2017-02-16T17:16:02" updateDate="2017-02-16T17:29:10" nodeName="Contact (1)" urlName="contact-1" path="-1,1059,1078" isDoc="" nodeType="1079" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1082" nodeTypeAlias="LandingPage1"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></LandingPage1>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', CAST(0x0000A71C012029DF AS DateTime), N'<LandingPage1 id="1078" key="22388436-2fa9-49d1-a6cf-395fec8cef96" parentID="1059" level="2" creatorID="0" sortOrder="5" createDate="2017-02-16T17:16:02" updateDate="2017-02-16T17:29:10" nodeName="Contact (1)" urlName="contact-1" path="-1,1059,1078" isDoc="" nodeType="1079" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1082" nodeTypeAlias="LandingPage1"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></LandingPage1>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1078, N'5aebe1df-135e-4b8a-974e-dc45ddf50495', CAST(0x0000A71C011CB148 AS DateTime), N'<LandingPage id="1078" key="22388436-2fa9-49d1-a6cf-395fec8cef96" parentID="1059" level="2" creatorID="0" sortOrder="5" createDate="2017-02-16T17:16:02" updateDate="2017-02-16T17:16:32" nodeName="Contact (1)" urlName="contact-1" path="-1,1059,1078" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1085, N'4a406469-4921-446a-b23b-467d1e03e2d2', CAST(0x0000A71D00BDBA4A AS DateTime), N'<LandingPage2 id="1085" key="b17f9c56-7f8d-4e5b-8240-bc179b1ac881" parentID="1059" level="2" creatorID="0" sortOrder="6" createDate="2017-02-17T11:28:10" updateDate="2017-02-17T11:30:46" nodeName="Contact (2)" urlName="contact-2" path="-1,1059,1085" isDoc="" nodeType="1084" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1086" nodeTypeAlias="LandingPage2"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></LandingPage2>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1085, N'5bf223a0-074a-45c2-a932-839dacdc1036', CAST(0x0000A71D00BDBA3A AS DateTime), N'<LandingPage2 id="1085" key="b17f9c56-7f8d-4e5b-8240-bc179b1ac881" parentID="1059" level="2" creatorID="0" sortOrder="6" createDate="2017-02-17T11:28:10" updateDate="2017-02-17T11:30:46" nodeName="Contact (2)" urlName="contact-2" path="-1,1059,1085" isDoc="" nodeType="1084" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1086" nodeTypeAlias="LandingPage2"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></LandingPage2>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', CAST(0x0000A71D00BD0C5C AS DateTime), N'<LandingPage1 id="1085" key="b17f9c56-7f8d-4e5b-8240-bc179b1ac881" parentID="1059" level="2" creatorID="0" sortOrder="6" createDate="2017-02-17T11:28:10" updateDate="2017-02-17T11:28:18" nodeName="Contact (2)" urlName="contact-2" path="-1,1059,1085" isDoc="" nodeType="1079" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1082" nodeTypeAlias="LandingPage1"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content><signpostLink1><![CDATA[[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]]]></signpostLink1><signpostLink2><![CDATA[[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]]]></signpostLink2><signpostCopy2><![CDATA[For getting help with implementing Umbraco, look at our list of Certified Umbraco partner]]></signpostCopy2><signpostHeading1><![CDATA[The forum]]></signpostHeading1><signpostHeading2><![CDATA[Getting help]]></signpostHeading2><signpostLink3><![CDATA[[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]]]></signpostLink3><signpostCopy3><![CDATA[For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ]]></signpostCopy3><signpostHeading3><![CDATA[Get in touch]]></signpostHeading3><signpostCopy1><![CDATA[For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.]]></signpostCopy1></LandingPage1>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', CAST(0x0000A71D00BD02FA AS DateTime), N'<LandingPage1 id="1085" key="b17f9c56-7f8d-4e5b-8240-bc179b1ac881" parentID="1059" level="2" creatorID="0" sortOrder="6" createDate="2017-02-17T11:28:10" updateDate="2017-02-17T11:28:10" nodeName="Contact (1) (1)" urlName="contact-1-1" path="-1,1059,1085" isDoc="" nodeType="1079" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1082" nodeTypeAlias="LandingPage1"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content><signpostLink1><![CDATA[[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]]]></signpostLink1><signpostLink2><![CDATA[[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]]]></signpostLink2><signpostCopy2><![CDATA[For getting help with implementing Umbraco, look at our list of Certified Umbraco partner]]></signpostCopy2><signpostHeading1><![CDATA[The forum]]></signpostHeading1><signpostHeading2><![CDATA[Getting help]]></signpostHeading2><signpostLink3><![CDATA[[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]]]></signpostLink3><signpostCopy3><![CDATA[For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ]]></signpostCopy3><signpostHeading3><![CDATA[Get in touch]]></signpostHeading3><signpostCopy1><![CDATA[For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.]]></signpostCopy1></LandingPage1>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1087, N'c894e732-9cf0-4fd0-bf01-68794f4dde60', CAST(0x0000A71D00C0B395 AS DateTime), N'<spotlight id="1087" key="8a3edea7-93aa-4f78-b33f-9e02223fda14" parentID="1085" level="3" creatorID="0" sortOrder="0" createDate="2017-02-17T11:41:36" updateDate="2017-02-17T11:41:36" nodeName="The forum" urlName="the-forum" path="-1,1059,1085,1087" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.]]></copy><heading><![CDATA[The forum]]></heading><link><![CDATA[[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1088, N'1813b682-bf12-4ff1-a2e4-f1d8dd3e0617', CAST(0x0000A71D00C0D458 AS DateTime), N'<spotlight id="1088" key="3fbe2a82-20f8-4da4-b019-14615eb014cb" parentID="1085" level="3" creatorID="0" sortOrder="1" createDate="2017-02-17T11:42:04" updateDate="2017-02-17T11:42:04" nodeName="Getting help" urlName="getting-help" path="-1,1059,1085,1088" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For getting help with implementing Umbraco, look at our list of Certified Umbraco partner]]></copy><heading><![CDATA[Getting help]]></heading><link><![CDATA[[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1089, N'566c793d-4113-4e5d-93b5-11eca289e810', CAST(0x0000A71D00C0F26A AS DateTime), N'<spotlight id="1089" key="9fcf83eb-e65a-445a-92af-2ab337cf47f8" parentID="1085" level="3" creatorID="0" sortOrder="2" createDate="2017-02-17T11:42:29" updateDate="2017-02-17T11:42:29" nodeName="Get in touch" urlName="get-in-touch" path="-1,1059,1085,1089" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ]]></copy><heading><![CDATA[Get in touch]]></heading><link><![CDATA[[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1091, N'17f97338-dfae-4a3a-a7b6-5d46928e532d', CAST(0x0000A71D00C27857 AS DateTime), N'<dataFolder id="1091" key="12b0085e-9959-474b-a9bc-6da1d6fecea3" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2017-02-17T11:48:02" updateDate="2017-02-17T11:48:02" nodeName="Data" urlName="data" path="-1,1091" isDoc="" nodeType="1090" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="dataFolder" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1092, N'ca52ee63-d72b-4e63-b9a6-c2a16aa92dbf', CAST(0x0000A71D00C2D478 AS DateTime), N'<dataFolder id="1092" key="00a48818-8aac-4703-930f-3861c77f268f" parentID="1091" level="2" creatorID="0" sortOrder="0" createDate="2017-02-17T11:48:35" updateDate="2017-02-17T11:49:21" nodeName="Spotlights" urlName="spotlights" path="-1,1091,1092" isDoc="" nodeType="1090" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="dataFolder" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1093, N'c6c04869-5d93-421a-9fb7-00f10b5e4128', CAST(0x0000A71D00C2D47F AS DateTime), N'<spotlight id="1093" key="75fcff75-75dc-434f-acaf-4ab0d38418bc" parentID="1092" level="3" creatorID="0" sortOrder="0" createDate="2017-02-17T11:48:48" updateDate="2017-02-17T11:49:21" nodeName="The forum" urlName="the-forum" path="-1,1091,1092,1093" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.]]></copy><heading><![CDATA[The forum]]></heading><link><![CDATA[[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1093, N'218fe7d6-b9a8-4ba9-a66f-19cafc6659cd', CAST(0x0000A71D00C2AE38 AS DateTime), N'<spotlight id="1093" key="75fcff75-75dc-434f-acaf-4ab0d38418bc" parentID="1092" level="3" creatorID="0" sortOrder="0" createDate="2017-02-17T11:48:48" updateDate="2017-02-17T11:48:48" nodeName="The forum" urlName="the-forum" path="-1,1091,1092,1093" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.]]></copy><heading><![CDATA[The forum]]></heading><link><![CDATA[[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1094, N'4a24ed8f-ab2b-43a7-8348-10a5cf157902', CAST(0x0000A71D00C2D481 AS DateTime), N'<spotlight id="1094" key="44633af8-dad4-47de-8298-09938516b8e5" parentID="1092" level="3" creatorID="0" sortOrder="1" createDate="2017-02-17T11:48:58" updateDate="2017-02-17T11:49:21" nodeName="Getting help" urlName="getting-help" path="-1,1091,1092,1094" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For getting help with implementing Umbraco, look at our list of Certified Umbraco partner]]></copy><heading><![CDATA[Getting help]]></heading><link><![CDATA[[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1094, N'38f8a85c-0c5a-4189-9a93-1da12de97b4d', CAST(0x0000A71D00C2BA52 AS DateTime), N'<spotlight id="1094" key="44633af8-dad4-47de-8298-09938516b8e5" parentID="1092" level="3" creatorID="0" sortOrder="1" createDate="2017-02-17T11:48:58" updateDate="2017-02-17T11:48:58" nodeName="Getting help" urlName="getting-help" path="-1,1091,1092,1094" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For getting help with implementing Umbraco, look at our list of Certified Umbraco partner]]></copy><heading><![CDATA[Getting help]]></heading><link><![CDATA[[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1095, N'9d9032b1-4d74-4f45-945e-41c44c15bc2f', CAST(0x0000A71D00C2D483 AS DateTime), N'<spotlight id="1095" key="82c4d7ef-1542-4a76-b405-dec62ace9b54" parentID="1092" level="3" creatorID="0" sortOrder="2" createDate="2017-02-17T11:49:05" updateDate="2017-02-17T11:49:21" nodeName="Get in touch" urlName="get-in-touch" path="-1,1091,1092,1095" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ]]></copy><heading><![CDATA[Get in touch]]></heading><link><![CDATA[[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1095, N'55d8493f-4361-4f55-b932-8cd055870f52', CAST(0x0000A71D00C2C28D AS DateTime), N'<spotlight id="1095" key="82c4d7ef-1542-4a76-b405-dec62ace9b54" parentID="1092" level="3" creatorID="0" sortOrder="2" createDate="2017-02-17T11:49:05" updateDate="2017-02-17T11:49:05" nodeName="Get in touch" urlName="get-in-touch" path="-1,1091,1092,1095" isDoc="" nodeType="1083" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="0" nodeTypeAlias="spotlight"><copy><![CDATA[For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ]]></copy><heading><![CDATA[Get in touch]]></heading><link><![CDATA[[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]]]></link></spotlight>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'd96badbf-9d97-4279-a2f3-165cf6214600', CAST(0x0000A71D00C44E3D AS DateTime), N'<LandingPage id="1099" key="0f8cc586-bb24-47dd-ba82-140f45fa4913" parentID="1059" level="2" creatorID="0" sortOrder="7" createDate="2017-02-17T11:54:30" updateDate="2017-02-17T11:54:43" nodeName="Contact (3)" urlName="contact-3" path="-1,1059,1099" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'98ee47c7-570b-459c-9408-2ee694716008', CAST(0x0000A71D00C46F0C AS DateTime), N'<landingPage3 id="1099" key="0f8cc586-bb24-47dd-ba82-140f45fa4913" parentID="1059" level="2" creatorID="0" sortOrder="7" createDate="2017-02-17T11:54:30" updateDate="2017-02-17T11:55:11" nodeName="Contact (3)" urlName="contact-3" path="-1,1059,1099" isDoc="" nodeType="1096" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1097" nodeTypeAlias="landingPage3"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></landingPage3>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'7ee88b3c-551a-467e-b679-3c6cd0aee4cc', CAST(0x0000A71D00C44E0B AS DateTime), N'<LandingPage id="1099" key="0f8cc586-bb24-47dd-ba82-140f45fa4913" parentID="1059" level="2" creatorID="0" sortOrder="7" createDate="2017-02-17T11:54:30" updateDate="2017-02-17T11:54:43" nodeName="Contact (3)" urlName="contact-3" path="-1,1059,1099" isDoc="" nodeType="1057" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1053" nodeTypeAlias="LandingPage"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></LandingPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'91740449-db8e-4d58-a46b-4d29f312935b', CAST(0x0000A71D00C47A1E AS DateTime), N'<landingPage3 id="1099" key="0f8cc586-bb24-47dd-ba82-140f45fa4913" parentID="1059" level="2" creatorID="0" sortOrder="7" createDate="2017-02-17T11:54:30" updateDate="2017-02-17T11:55:21" nodeName="Contact (3)" urlName="contact-3" path="-1,1059,1099" isDoc="" nodeType="1096" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1097" nodeTypeAlias="landingPage3"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></landingPage3>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'8fdfdf79-7dd5-43f7-8670-63f4746dcb29', CAST(0x0000A71D00C446F2 AS DateTime), N'<LandingPage2 id="1099" key="0f8cc586-bb24-47dd-ba82-140f45fa4913" parentID="1059" level="2" creatorID="0" sortOrder="7" createDate="2017-02-17T11:54:30" updateDate="2017-02-17T11:54:37" nodeName="Contact (3)" urlName="contact-3" path="-1,1059,1099" isDoc="" nodeType="1084" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1086" nodeTypeAlias="LandingPage2"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></LandingPage2>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'b46f4dd7-13d1-47ca-a1ab-7ccd73e37a5a', CAST(0x0000A71D00C43EF1 AS DateTime), N'<LandingPage2 id="1099" key="0f8cc586-bb24-47dd-ba82-140f45fa4913" parentID="1059" level="2" creatorID="0" sortOrder="7" createDate="2017-02-17T11:54:30" updateDate="2017-02-17T11:54:30" nodeName="Contact (2) (1)" urlName="contact-2-1" path="-1,1059,1099" isDoc="" nodeType="1084" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1086" nodeTypeAlias="LandingPage2"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></LandingPage2>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'8acfbfe6-42d4-4b46-851a-acc0919de92c', CAST(0x0000A71D00C486D2 AS DateTime), N'<landingPage3 id="1099" key="0f8cc586-bb24-47dd-ba82-140f45fa4913" parentID="1059" level="2" creatorID="0" sortOrder="7" createDate="2017-02-17T11:54:30" updateDate="2017-02-17T11:55:31" nodeName="Contact (3)" urlName="contact-3" path="-1,1059,1099" isDoc="" nodeType="1096" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1097" nodeTypeAlias="landingPage3"><umbracoNaviHide>1</umbracoNaviHide><spotlights><![CDATA[1093,1094,1095]]></spotlights><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></landingPage3>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1103, N'afb38f93-d58e-44bb-baaa-e78fd8ed6840', CAST(0x0000A71D00C7F82B AS DateTime), N'<landingPage3 id="1103" key="a76fbb69-18b0-41bf-b66c-055910773f0d" parentID="1059" level="2" creatorID="0" sortOrder="8" createDate="2017-02-17T12:08:03" updateDate="2017-02-17T12:08:03" nodeName="Contact (3) (1)" urlName="contact-3-1" path="-1,1059,1103" isDoc="" nodeType="1096" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1097" nodeTypeAlias="landingPage3"><umbracoNaviHide>1</umbracoNaviHide><spotlights><![CDATA[1093,1094,1095]]></spotlights><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></landingPage3>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1103, N'18fad8cd-b003-48c2-900e-fdd619dbe4b7', CAST(0x0000A71D00C83AB7 AS DateTime), N'<landingPage3 id="1103" key="a76fbb69-18b0-41bf-b66c-055910773f0d" parentID="1059" level="2" creatorID="0" sortOrder="8" createDate="2017-02-17T12:08:03" updateDate="2017-02-17T12:09:00" nodeName="Contact (4)" urlName="contact-4" path="-1,1059,1103" isDoc="" nodeType="1096" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1097" nodeTypeAlias="landingPage3"><umbracoNaviHide>1</umbracoNaviHide><spotlights><![CDATA[1093,1094,1095]]></spotlights><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}]]></content></landingPage3>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1104, N'40401c82-6609-4dcc-a4c9-52105593db38', CAST(0x0000A71D00C9D1DC AS DateTime), N'<landingPage4 id="1104" key="f33517f9-bf0b-4ed4-9351-1e4708e319e3" parentID="1059" level="2" creatorID="0" sortOrder="8" createDate="2017-02-17T12:10:24" updateDate="2017-02-17T12:14:48" nodeName="Contact (4)" urlName="contact-4" path="-1,1059,1104" isDoc="" nodeType="1101" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1102" nodeTypeAlias="landingPage4"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}]]></content><spotlights><![CDATA[[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Item 3","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]]]></spotlights></landingPage4>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1104, N'31ca523c-8d13-4ccf-ae78-80ee8ff2806a', CAST(0x0000A71D00CB05AC AS DateTime), N'<landingPage4 id="1104" key="f33517f9-bf0b-4ed4-9351-1e4708e319e3" parentID="1059" level="2" creatorID="0" sortOrder="8" createDate="2017-02-17T12:10:24" updateDate="2017-02-17T12:19:10" nodeName="Contact (4)" urlName="contact-4" path="-1,1059,1104" isDoc="" nodeType="1101" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1102" nodeTypeAlias="landingPage4"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e",
          "active": true
        }
      ]
    }
  ]
}]]></content><spotlights><![CDATA[[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]]]></spotlights></landingPage4>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1104, N'2c57f5b1-5bd4-42e9-ad96-8b66ae363efb', CAST(0x0000A71D00C8A323 AS DateTime), N'<landingPage4 id="1104" key="f33517f9-bf0b-4ed4-9351-1e4708e319e3" parentID="1059" level="2" creatorID="0" sortOrder="8" createDate="2017-02-17T12:10:24" updateDate="2017-02-17T12:10:29" nodeName="Contact (4)" urlName="contact-4" path="-1,1059,1104" isDoc="" nodeType="1101" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1102" nodeTypeAlias="landingPage4"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": []
    }
  ]
}]]></content></landingPage4>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1104, N'a6357037-80e4-4f2c-a7b3-abe131038ac0', CAST(0x0000A71D00C967B4 AS DateTime), N'<landingPage4 id="1104" key="f33517f9-bf0b-4ed4-9351-1e4708e319e3" parentID="1059" level="2" creatorID="0" sortOrder="8" createDate="2017-02-17T12:10:24" updateDate="2017-02-17T12:13:17" nodeName="Contact (4)" urlName="contact-4" path="-1,1059,1104" isDoc="" nodeType="1101" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1102" nodeTypeAlias="landingPage4"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ],
              "active": false
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e",
          "active": true
        }
      ]
    }
  ]
}]]></content></landingPage4>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1104, N'5dcac874-a96b-457a-a495-d2ef9703fd16', CAST(0x0000A71D00CB3CD4 AS DateTime), N'<landingPage4 id="1104" key="f33517f9-bf0b-4ed4-9351-1e4708e319e3" parentID="1059" level="2" creatorID="0" sortOrder="8" createDate="2017-02-17T12:10:24" updateDate="2017-02-17T12:19:57" nodeName="Contact (4)" urlName="contact-4" path="-1,1059,1104" isDoc="" nodeType="1101" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1102" nodeTypeAlias="landingPage4"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ],
              "active": false
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e",
          "active": true
        }
      ]
    }
  ]
}]]></content><spotlights><![CDATA[[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]]]></spotlights></landingPage4>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1110, N'cb2fe7e6-380d-4fa4-910b-0ea54ff85618', CAST(0x0000A71D00EE86FA AS DateTime), N'<landingPage5 id="1110" key="2f832d14-f485-45e0-aa01-de260768a5b7" parentID="1059" level="2" creatorID="0" sortOrder="9" createDate="2017-02-17T14:26:57" updateDate="2017-02-17T14:28:27" nodeName="Contact (5)" urlName="contact-5" path="-1,1059,1110" isDoc="" nodeType="1108" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1111" nodeTypeAlias="landingPage5"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}]]></content><spotlights><![CDATA[[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]]]></spotlights></landingPage5>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1110, N'21b2af43-0c44-423b-83e6-1d891a1cb7ba', CAST(0x0000A71D00EE2DE8 AS DateTime), N'<landingPage4 id="1110" key="2f832d14-f485-45e0-aa01-de260768a5b7" parentID="1059" level="2" creatorID="0" sortOrder="9" createDate="2017-02-17T14:26:57" updateDate="2017-02-17T14:27:11" nodeName="Contact (5)" urlName="contact-5" path="-1,1059,1110" isDoc="" nodeType="1101" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1102" nodeTypeAlias="landingPage4"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}]]></content><spotlights><![CDATA[[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]]]></spotlights></landingPage4>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1110, N'3784abc6-6700-42d2-94bd-22187c968d0f', CAST(0x0000A71D00EF3FED AS DateTime), N'<landingPage5 id="1110" key="2f832d14-f485-45e0-aa01-de260768a5b7" parentID="1059" level="2" creatorID="0" sortOrder="9" createDate="2017-02-17T14:26:57" updateDate="2017-02-17T14:31:04" nodeName="Contact (5)" urlName="contact-5" path="-1,1059,1110" isDoc="" nodeType="1108" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1111" nodeTypeAlias="landingPage5"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}]]></content><spotlights><![CDATA[[{"name":"The forum","ncContentTypeAlias":"spotlightWithReuse","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]","pickedSpotlight":""},{"name":"Getting help","ncContentTypeAlias":"spotlightWithReuse","heading":"Getting help","copy":"","link":"","pickedSpotlight":"1094"},{"name":"Item 3","ncContentTypeAlias":"spotlightWithReuse","heading":"Get in touch","copy":"","link":"","pickedSpotlight":"1095"}]]]></spotlights></landingPage5>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1110, N'66f9ff83-3fe1-40a3-9925-36634eca6109', CAST(0x0000A71D00EE9A1D AS DateTime), N'<landingPage5 id="1110" key="2f832d14-f485-45e0-aa01-de260768a5b7" parentID="1059" level="2" creatorID="0" sortOrder="9" createDate="2017-02-17T14:26:57" updateDate="2017-02-17T14:28:43" nodeName="Contact (5)" urlName="contact-5" path="-1,1059,1110" isDoc="" nodeType="1108" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1111" nodeTypeAlias="landingPage5"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}]]></content></landingPage5>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1110, N'e5ea1d92-e915-49bd-b360-a89e3047006f', CAST(0x0000A71D00EEE41B AS DateTime), N'<landingPage5 id="1110" key="2f832d14-f485-45e0-aa01-de260768a5b7" parentID="1059" level="2" creatorID="0" sortOrder="9" createDate="2017-02-17T14:26:57" updateDate="2017-02-17T14:29:46" nodeName="Contact (5)" urlName="contact-5" path="-1,1059,1110" isDoc="" nodeType="1108" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1111" nodeTypeAlias="landingPage5"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}]]></content><spotlights><![CDATA[[{"name":"Item 1","ncContentTypeAlias":"spotlightWithReuse","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]","pickedSpotlight":""}]]]></spotlights></landingPage5>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1110, N'3ccd93a5-0c2d-406d-87c8-b721ab07d5dc', CAST(0x0000A71D00EE1E5C AS DateTime), N'<landingPage4 id="1110" key="2f832d14-f485-45e0-aa01-de260768a5b7" parentID="1059" level="2" creatorID="0" sortOrder="9" createDate="2017-02-17T14:26:57" updateDate="2017-02-17T14:26:57" nodeName="Contact (4) (1)" urlName="contact-4-1" path="-1,1059,1110" isDoc="" nodeType="1101" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1102" nodeTypeAlias="landingPage4"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ],
              "active": false
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e",
          "active": true
        }
      ]
    }
  ]
}]]></content><spotlights><![CDATA[[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]]]></spotlights></landingPage4>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1110, N'4670a873-ac2d-42a6-b3ce-eae68eb9ba26', CAST(0x0000A71D00EE8737 AS DateTime), N'<landingPage5 id="1110" key="2f832d14-f485-45e0-aa01-de260768a5b7" parentID="1059" level="2" creatorID="0" sortOrder="9" createDate="2017-02-17T14:26:57" updateDate="2017-02-17T14:28:27" nodeName="Contact (5)" urlName="contact-5" path="-1,1059,1110" isDoc="" nodeType="1108" creatorName="Andy Butland" writerName="Andy Butland" writerID="0" template="1111" nodeTypeAlias="landingPage5"><umbracoNaviHide>0</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}]]></content><spotlights><![CDATA[[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]]]></spotlights></landingPage5>')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] ON 

INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1, 1059, N'd9255190-863f-4001-94d5-f78978058528', 38, NULL, NULL, NULL, NULL, N'This is an official Umbraco Starter kit. It shows of the newest features in Umbraco and is the perfect place to start for newcomers.. Everything is made to be taken apart. It''s your own little playground. Enjoy!')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (2, 1059, N'd9255190-863f-4001-94d5-f78978058528', 39, NULL, NULL, NULL, N'Fanoe - Umbraco Starter Kit', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (3, 1059, N'd9255190-863f-4001-94d5-f78978058528', 40, NULL, NULL, NULL, N'/media/1042/logo.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (4, 1059, N'd9255190-863f-4001-94d5-f78978058528', 41, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "config": {},
              "styles": {
                "margin-bottom": "60px"
              },
              "controls": [
                {
                  "value": "Welcome to Fanoe",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "This is the new default starter kit for Umbraco, we enjoy building things that not only look great, but also work great.",
                  "editor": {
                    "name": "Banner Tagline",
                    "alias": "banner_tagline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 25px; line-height: 35px; font-weight: normal; text-align:center",
                      "markup": "<h2 style=''font-weight: 100; font-size: 40px;text-align:center''>#value#</h2>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>The starter kit</h2>\n<p>Congratulations on getting up and running with the “Fanoe” starter kit. It''s a great way to get to know the Grid datatype.</p>\n<p><a href=\"/{localLink:1078}\" title=\"The starter kit\">Learn about the starter kit →</a><a href=\"/{localLink:1078}\" title=\"The Starterkit\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Learn the basics</h2>\n<p>To get started on the right foot make sure to check out our documentation - from tutorials to API reference.</p>\n<p><a href=\"/{localLink:1079}\" title=\"Basics\">Off to the docs →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Master classes</h2>\n<p>The best way to learn Umbraco is through the Master classes that’s running every month in most regions.</p>\n<p><a href=\"/{localLink:1080}\" title=\"Masterclasses\">Learn about the masterclasses →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1044/14441035391_7ee1d0d166_h_darken.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d28a05da-2404-c1e7-6265-01b07fc5f722"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Umbraco Forms</h1>\n<p>With our add-on product Umbraco Forms it’s a breeze to create any type of form you can imagine.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Package repository</h1>\n<p>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "5362ea7d-e729-078b-e717-a1e7aa69fd4b"
        },
        {
          "name": "Full width image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1127,
                    "image": "/media/1046/14386124825_d43f359900_h_cropped.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "953b3802-6b4f-20ed-66f9-9a855e9afdd4"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Sharing is caring</h2>\n<p>Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Born global, loving local</h2>\n<p>If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community. You can do just that through the many local user groups and meetups</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "29cac0ff-d8e9-605b-9e7b-6809dce55edd"
        },
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">CodeGarden</h1>\n<h5 style=\"text-align: center;\">Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0093bd05-735a-9623-8509-28085818745c"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (5, 1060, N'0d3cd253-9456-4fe2-bc38-6aef71456835', 42, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (6, 1060, N'0d3cd253-9456-4fe2-bc38-6aef71456835', 43, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (7, 1061, N'27a6e815-a338-48c2-b1ca-2e35d6241375', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Fanø",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Fanø is a Danish island in the North Sea off the coast of southwestern Denmark, and is the very northernmost of the Danish Wadden Sea Islands. Fanø municipality is the municipality that covers the island and its seat is the town of Nordby.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1012/fanoe-denmark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "789b4b02-6a1e-bbff-9435-939d83f6e895"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 dir=\"ltr\"><span><span>How is this starter kit made?</span></span></h1>\n<p dir=\"ltr\"><span>Congratulations on getting up and running with Umbraco and the “Fanoe” starter kit. The idea with this starter kit is to let you explore some of the simple things Umbraco can do for a typical content powered website using “The Grid” feature.</span></p>\n<p><span>To get the most out of this starter kit and get started on the right foot, make sure to watch the “Grid” tutorial on Umbraco.TV which will take you through how the entire starter kit was made. From implementing the HTML mockups in Umbraco and using the powerful features in the Grid to give maximum freedom and flexibility for editors - without compromising the design.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f0013b7-f55e-cdd9-6ed9-7ad2f8696157"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "While walking around on Fanø, you will notice that almost all traditional houses have a little window above the front door with a model boat.\nThis is a very traditional good luck charm for the men away at sea. The economy of the island was almost entirely based on fishing and every family home has the model boat to ensure the safe return of sailors",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "3bd5271f-c171-8435-ba19-00008abd3af5"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (8, 1062, N'562a5119-390d-4581-ba51-0b644e85641a', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Learn the basics",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">While we recommend everyone to get an Umbraco.TV subscription to learn the ins and outs of Umbraco, maybe you prefer a more traditional tutorial or detailed technical documentation.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1047/9027509991_ff12bd87e4_b_small_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "97df8f64-dc98-40a9-e5f3-ac065983d6bd"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Create a basic website in Umbraco</h1>\n<p style=\"text-align: center;\">At Our Umbraco you’ll find both and we definitely recommend reading the guide on <a href=\"http://our.umbraco.org/documentation/Using-Umbraco/Creating-Basic-Site/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">creating a basic website in Umbraco</a><a href=\"#\" target=\"_blank\" title=\"Create a basic website in Umbraco\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "070e60ae-26d9-a277-5b04-97a52f73e34d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Sharpen those Razor skills</span></h2>\n<p dir=\"ltr\"><span>Umbraco uses Razor - a templating engine from Microsoft - as the main way to generate pages. If you’ve never used it before and in particular if you’ve never used ASP.NET before, It might seem a little daunting, but fear not. The template editor in the back office provides snippets and a Query Builder to get you up to speed.</span></p>\n<p dir=\"ltr\"><span>Once you know the basics, it’s also nice to know that there’s <a href=\"http://our.umbraco.org/projects/developer-tools/umbraco-v6-mvc-razor-cheatsheets/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">cheat sheets</a> covering the most common methods - ready to print out for office decoration.</span></p>\n<h2 dir=\"ltr\"><span>Extend with the API</span></h2>\n<p dir=\"ltr\"><span>If you want to extend Umbraco even further, you can use our .NET API to programmatically create Content, Media, Members and anything else that’s possible through the back office. For a quick start, <a href=\"http://umbraco.com/follow-us/blog-archive/2013/1/22/introducing-contentservice-aka-the-v6-api/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">you can follow this tutorial</a></span><span> and for full reference, don’t miss <a href=\"http://our.umbraco.org/documentation/reference/Management-v6/Services/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">the thorough documentation on Our</a>.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "16f56cd2-374c-8c6c-c91c-7d65b8b264cd"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (9, 1063, N'68e8b829-782c-455f-9e90-8d1268cf63c8', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Masterclasses",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">The best and fastest way to learn Umbraco is through the official Master classes that are running every month in most regions.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1022/9686845888_e2d216ce81_b_dark_small.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2d34e33a-a1ef-04d5-9445-e1f1633bc362"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h3 style=\"text-align: center;\">The masterclasses are ran by either the Umbraco HQ or by the most experienced community heroes and use thoroughly tested materials to ensure you’ll return as a fully skilled Umbraco craftsperson.</h3>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "blue"
          },
          "id": "5312fa7b-3d5c-e9c0-4d0c-f6ae5d73e168"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Get it right from the beginning</span></h2>\n<p dir=\"ltr\"><span>While Umbraco is a simple tool, it’s important that you use it the right way. The Level 1 master class is designed to make sure that any Web Developer - also with no previous ASP.NET knowledge - can create advanced multi-lingual sites by the end of the course.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Become an expert</span></h2>\n<p dir=\"ltr\"><span>Once you know the basics, you can step up your game by attending the Level 2 master class. While the first masterclass is focused on implementing a site, this Masterclass will teach you how the .net APIs work and how to integrate and extend Umbraco. Whether that’s creating content programmatically or integrating a third party e-commerce engine or CRM.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Worth the investment</span></h2>\n<p dir=\"ltr\"><span>All attendees at the official Umbraco Masterclasses receive a certification which is the best way to make yourself noticed in the Umbraco ecosystem. So whether you’re looking to move up in the ranks of your company or are a free agent, you shouldn’t be doing Umbraco without becoming certified. The investment will come back many times, so make sure to <a href=\"http://umbraco.com/products/training/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\" target=\"_blank\" title=\"Masterclasses\">keep an eye out for a Masterclass near you</a>.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "a3ddf743-1622-7eec-6ea4-08caef854559"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (10, 1064, N'51782a83-742a-4a6d-a62e-ecc5cbdab9a3', 42, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (11, 1064, N'51782a83-742a-4a6d-a62e-ecc5cbdab9a3', 43, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (12, 1065, N'9bc8b176-c4be-4431-9ae3-7ea26784d9ec', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Sharing is caring",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1048/sharingiscaring_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0efee164-ea45-3657-66c2-04db5cbdcd37"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>Get help</h2>\n<p>If you’re stuck in your Umbraco project, the friendly forum is the place to visit. We take pride in keeping a friendly atmosphere in our forums despite the rapid growth of the project, so remember that the easier and friendlier you ask the more likely you are to get a quality reply.</p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Karma<br /></span></h2>\n<p dir=\"ltr\">On “Our” we have a virtual currency called “Karma” - think of it as likes worth counting. When you give people help, they can appreciate this by giving you a virtual high five. In addition to the joy of knowing that your help meant something, you also get karma points and while money doesn’t buy you happiness, a little bit of karma can. </p>\n<p dir=\"ltr\"><span>In other words, don’t forget to say thanks - it doesn’t cost you anything!</span></p>\n<p dir=\"ltr\"> </p>\n<h2 dir=\"ltr\"><span>Give back<br /></span></h2>\n<p dir=\"ltr\">Once you’ve become better at Umbraco, remember to set aside a little bit of time to be the help you got. It’ll keep the snowball effect rolling and by pulling together as a community, it doesn’t take much effort from everybody to make Umbraco community the best in the industry when it comes to get a fast and friendly quality response.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "0e64a81c-519d-ed35-7e28-35e2d441a044"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.54,
                      "top": 0.34082397003745318
                    },
                    "id": 1130,
                    "image": "/media/1049/9027510123_92a91b5cf4_b_dark.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "1efceb16-6a36-e18b-905a-b372c3d8b5e1"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (13, 1066, N'74d1096f-b6e8-45d4-9629-bba0a27a43b5', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "CodeGarden",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1014/9017002308_81dfd2c1d5_b_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d851bdc5-cb0c-e982-a1aa-f1cdda3e39c0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Well, it used to be a conference</span></h2>\n<p dir=\"ltr\"><span>but today we like to think of it more as a “festival”. Lasting three days from early mornings to late evenings, it’s packed with a combination of learning everything about Umbraco to the who’s who in the community in a laid back atmosphere where you’ll feel at home.</span></p>\n<h2 dir=\"ltr\"><span>Great sessions</span></h2>\n<p dir=\"ltr\"><span>At Umbraco you’ll find sessions that’ll take your skills to the next level. From large-scale implementation to highly specialized sites, you really shouldn’t miss out on the opportunity to learn from those who have come before you.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "afbe6cbd-a903-1c91-4d7e-fafa73515de6"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5056179775280899
                    },
                    "id": 1123,
                    "image": "/media/1015/14257753719_2c02b94030_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1015%2F14257753719_2c02b94030_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "4bbedf99-360e-905c-2bd3-71b458ab4647"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "In raw numbers, Codegarden is: 500+ attendees, 3 packed days, 20+ sessions, 26 passionate speakers, 3 workshops, 1 keynote, a hack room, 2 rounds of bingo and 3563 cups of fair trade coffee",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "6bfba7ba-f732-8193-3d38-2980e262142d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Influence the project</span></h2>\n<p dir=\"ltr\"><span>Aside from the regular sessions and workshops CodeGarden also provides a unique approach to conferencing. It is called Open Space Technology and is all about networking, problem solving. This means you are not just limited to the scheduled topics but can put your own passions on the agenda and influence the future of the project.</span></p>\n<h2 dir=\"ltr\"><span>Loads of fun</span></h2>\n<p dir=\"ltr\"><span>In the community we value having a great time, so CodeGarden evenings are packed with social events. From canal tours of Copenhagen (with free beer and champagne) to evening parties and the infamous Umbraco bingo and dinner which can’t be described in words.</span></p>\n<h2 dir=\"ltr\"><span>Get your ticket</span></h2>\n<p><span>CodeGarden always ends up selling out, so make sure to reserve your ticket. The earlier you order the cheaper it is and if you’re on a stretch budget there’s a big chance that a friendly local Umbracian will have a couch to spare.<br /></span></p>\n<p><span><a href=\"http://umbraco.com/cg15/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Buy ticket for Codegarden</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "edebcf94-a4b1-fec5-5bc6-f8f677b03b16"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.605,
                      "top": 0.33333333333333331
                    },
                    "id": 1124,
                    "image": "/media/1016/14435759945_a2c58e9ed6_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1016%2F14435759945_a2c58e9ed6_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "96ec2067-0a50-459a-4d95-714b5b8ac4b6"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (14, 1067, N'4aee1ab8-570b-4c5a-aa74-9969fd17c4f7', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Born global, loving local",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community and finally - if you can’t come to the community, why not have the community come to you by starting a local user group?</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1017/14359779226_df7329d607_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "3dd3ea61-c394-5ce1-91d8-93f4a41b0dc0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco Meetups</span></h2>\n<p dir=\"ltr\"><span>From London to New York, from Denmark in the north to Australia in the south - there’s local Umbraco User groups all over the world that <a href=\"http://our.umbraco.org/events/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">arrange regular meetups</a>. The format is usually a laid back atmosphere where people share their knowledge and new people are always welcome. So make sure to <a href=\"http://umbraco.meetup.com/\">check out Meetup.com for a local group</a> and if you’re not lucky, why not start one - it’s not that hard.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Local Festivals</span></h2>\n<p dir=\"ltr\"><span>Inspired by CodeGarden, there’s more and more annual local Umbraco events. Originated from the community in the United Kingdom, there’s “Umbraco Festivals” going on in many countries around the world. These are one day events packed with sessions that often combine advanced Umbraco topics with discussing how local awareness can be improved. And as they are driven by the community and often sponsored by local Umbraco partners, they’re usually very inexpensive events to attend.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f2b5540-7c52-4631-3877-6be5f61f6a12"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49583333333333335,
                      "top": 0.53
                    },
                    "id": 1126,
                    "image": "/media/1018/10818851674_e375a8751e_b.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1018%2F10818851674_e375a8751e_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "102d5bec-3fb5-4d1a-cd9f-2baeeb5cdc44"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (15, 1068, N'ca325e72-9edb-48e2-a3e1-092a4f9a404b', 42, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (16, 1068, N'ca325e72-9edb-48e2-a3e1-092a4f9a404b', 43, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (17, 1069, N'c29aa415-7c26-49bf-a63e-e4e46e1b8d3e', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Umbraco forms",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">With our add-on product Umbraco Forms it’s a breeze to create anything from simple contact forms to advanced questionnaires.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "0a170745-ecbd-f642-0e5c-8475e6fae812"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">You won''t need to write a single line of code.</h1>\n<p style=\"text-align: center;\">Instead, you can create, edit and administer your form via a user interface that is a fully integrated part of Umbraco.</p>\n<p style=\"text-align: center;\"> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "<iframe src=\"//player.vimeo.com/video/110229004\" width=\"360\" height=\"203\" frameborder=\"0\" title=\"Form installer intro\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": "/App_Plugins/Grid/Editors/Render/embed_videowrapper.cshtml",
                    "icon": "icon-movie-alt"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "17022257-5f35-360f-8cec-f574221fc457"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1>Why does Umbraco Forms cost money?</h1>\n<p>At the Umbraco HQ we employ 15 full-time employees to ensure that the core is of the highest quality and constantly evolves. As we believe in keeping great ideas sustainable, we’ve never taken outside investment, but solely rely on income from products that enhance - but don’t limit - the open source core. We believe this is the best, long term solution and we hope you agree.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "190b7767-6b42-cd23-1d01-ad7e2ff24a6d"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (18, 1070, N'a5cc4e48-41c9-43bd-b3e8-b207a2322212', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Package repository",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1024/14448232381_8f994d2adc_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0fc8f95c-1db8-6d29-788c-58a23c47634a"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Swim in the ocean of packages</span></h2>\n<p dir=\"ltr\"><span>From complete e-commerce platforms to integration with 3rd party services such as MailChimp and YouTube to developer tools that’ll boost your productivity.</span></p>\n<p dir=\"ltr\"><span>While you can download the packages on Our, you can also browse and install them directly from within the backoffice - called the “Package Repository” (yes, we should find a sexier name!). Those packages are filtered to ensure they’ll work with your Umbraco installation (based on version) and only packages that have been approved by at least 15 community people make the cut.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "9bc7883d-fd02-84d2-a790-9e0174b22e77"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "If you like the package, make sure to give it a high five.",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "a01e8642-d4a9-30d4-d8ef-ae31a0f7f83e"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1120,
                    "image": "/media/1038/screen-shot-2014-12-01-at-121327.png",
                    "paragraph": "Once you’ve installed a package, make sure to give feedback. Whether the install was successful or not, it’ll help the next person trying to give it a go. At Our Umbraco you can report compatibility with a few simple clicks.",
                    "headline": "Give feedback"
                  },
                  "editor": {
                    "name": "Image w/ text right",
                    "alias": "media_text_right",
                    "view": "/App_Plugins/Grid/Editors/Views/media_with_description.html",
                    "render": "/App_Plugins/Grid/Editors/Render/media_text_right.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "96916694-116a-637c-2319-a5b077e80bd9"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (19, 1071, N'865859a9-0109-4170-b1bc-5f4f58e1e08f', 37, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (20, 1072, N'c17b52dc-8df4-4a0d-bdbb-ec138ec5f4fe', 35, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\" dir=\"ltr\"><span>Tall trees have deep roots</span></h1>\n<h5 style=\"text-align: center;\" dir=\"ltr\"><span>You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2bd04b6a-0561-05c8-aa48-7ee47fde287f"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>The origins of the roots</span></h2>\n<p dir=\"ltr\"><span>date back to 2003 where the first version of Umbraco saw its light. Back then nobody could predict what it would become and especially not Niels Hartvig who simply designed and built Umbraco as a tool to quickly produce sites for his freelance clients and make sure they had a user-friendly way of updating it.</span></p>\n<p dir=\"ltr\"><span>But in 2004 he decided to open source the work and with help of friends Kasper Bumbech and Anders Pollas with whom he shared office space, the first version of Umbraco as open source saw the light of the day on February 16th 2005.</span></p>\n<p><span>In the early days, the community was purely virtual and since it was the days before Facebook and Twitter, the early adopters communicated through a Yahoo Mailinglist. From the seeds of talking Umbraco via email, the idea of an Umbraco conference surfaced and in March 2005, <a href=\"https://groups.yahoo.com/neo/groups/umbraco/conversations/messages/195\" target=\"_blank\" title=\"Codegarden was born\">CodeGarden was born…</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "7a2e4652-8523-3ade-053d-f7873c9c8020"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1108,
                    "image": "/media/1027/14434411872_8e663d6de0_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "5fc9f47f-3ac1-4627-df26-2922b584e288"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Since v1 of CodeGarden in 2005</span></h2>\n<p dir=\"ltr\"><span>thousands of people have attended what is considered a must experience event for any “Umbracian”; it’s where everything Umbraco comes to life. From seeing the latest progress, sharing knowledge with fellow community members, having memorable times in the wonderful city of Copenhagen and returning energized with new knowledge and inspiration.</span></p>\n<p dir=\"ltr\"><span>But more than anything, it’s the special vibe that has always been a keystone in everything that surrounds Umbraco. As coined by Hudson Maul back in 2006 - it’s “The Friendly CMS”.</span></p>\n<h2 dir=\"ltr\"><br /><br /></h2>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "84b00350-7168-7858-0b37-e452f05d7664"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (21, 1072, N'c17b52dc-8df4-4a0d-bdbb-ec138ec5f4fe', 36, NULL, NULL, NULL, NULL, N'You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (22, 1073, N'2dde0380-0303-43d1-85dd-1ccfbf4d8e7f', 35, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Different Flowers Make a Bouquet</h1>\n<h5 style=\"text-align: center;\">It may only take two to tango, but a party worth remembering is a completely different story.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1031/9026528992_d38fbc2e28_o_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "63d1f52a-a6be-2459-a337-22f97cdb15bb"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco is a huge family </span></h2>\n<p dir=\"ltr\"><span>including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.</span></p>\n<p dir=\"ltr\"><span>Without diversity, status quo becomes king. At Umbraco we don’t believe in the status quo. We believe it’s the sum of our differences - whether designer, developer or editor, whether nationality, religion or gender, heck, whether Apple or PC - that it’s the nutrition for moving forward.</span></p>\n<p dir=\"ltr\"><span>When you open your eyes for the qualities in other people, you open up an astounding opportunity to learn. Our world - and our differences - is a buffet of eye-opening knowledge just waiting for you. So make sure to treat everyone friendly and with the highest respect. Don''t be the judge.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "8e82e5c1-8583-3d32-2742-c02b96060643"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1113,
                    "image": "/media/1032/9039247947_e15a9d8850_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "d8ceaabf-535b-16db-e4ae-522fc0555846"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (23, 1073, N'2dde0380-0303-43d1-85dd-1ccfbf4d8e7f', 36, NULL, NULL, NULL, NULL, N'It may only take two to tango, but a party worth remembering is a completely different story. Including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (24, 1074, N'407d3292-e4fd-42d8-8257-2151894ec6e9', 35, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49514563106796117,
                      "top": 0.19
                    },
                    "id": 1115,
                    "image": "/media/1033/whole-earth-catalog.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "ec390b52-0259-8b7f-fc86-56374ea6ca63"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: left;\" dir=\"ltr\"><span>Only the curious have something to find</span></h1>\n<p>A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.</p>\n<p dir=\"ltr\"><span>Yet, we all dream about - and need - a little adventure every now and then. At the Umbraco community we praise those who dare to play and take risks. At the many Umbraco events around the world, brave people share their ideas through opinionated talks and at Our Umbraco courageous coders share their packages that extend the feature set of Umbraco.</span></p>\n<p dir=\"ltr\"><span>You should as well. After all, what do you </span><span>really</span><span> have to lose? Nothing compared to what you have to gain: becoming a better craftsperson, inspiring others and the satisfaction of seeing the download number of your work increase week after week. If we don’t strive for moving forward - whether professionals or amateurs - then what’s the point?</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "“Once you stop learning, you start dying”\n- Albert Einstein",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "bdc66e02-87e6-7aa6-34a8-c0e5f834af79"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (25, 1074, N'407d3292-e4fd-42d8-8257-2151894ec6e9', 36, NULL, NULL, NULL, NULL, N'A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (26, 1075, N'9760a023-eb19-4e5f-b81e-51e602075802', 42, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (27, 1075, N'9760a023-eb19-4e5f-b81e-51e602075802', 43, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (28, 1059, N'c30c2e0b-f429-4156-9346-045bdf58f700', 40, NULL, NULL, NULL, N'/media/1042/logo.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (29, 1059, N'c30c2e0b-f429-4156-9346-045bdf58f700', 39, NULL, NULL, NULL, N'Fanoe - Umbraco Starter Kit', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (30, 1059, N'c30c2e0b-f429-4156-9346-045bdf58f700', 38, NULL, NULL, NULL, NULL, N'This is an official Umbraco Starter kit. It shows of the newest features in Umbraco and is the perfect place to start for newcomers.. Everything is made to be taken apart. It''s your own little playground. Enjoy!')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (31, 1059, N'c30c2e0b-f429-4156-9346-045bdf58f700', 41, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "config": {},
              "styles": {
                "margin-bottom": "60px"
              },
              "controls": [
                {
                  "value": "Welcome to Fanoe",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "This is the new default starter kit for Umbraco, we enjoy building things that not only look great, but also work great.",
                  "editor": {
                    "name": "Banner Tagline",
                    "alias": "banner_tagline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 25px; line-height: 35px; font-weight: normal; text-align:center",
                      "markup": "<h2 style=''font-weight: 100; font-size: 40px;text-align:center''>#value#</h2>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>The starter kit</h2>\n<p>Congratulations on getting up and running with the “Fanoe” starter kit. It''s a great way to get to know the Grid datatype.</p>\n<p><a href=\"/{localLink:1078}\" title=\"The starter kit\">Learn about the starter kit →</a><a href=\"/{localLink:1078}\" title=\"The Starterkit\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Learn the basics</h2>\n<p>To get started on the right foot make sure to check out our documentation - from tutorials to API reference.</p>\n<p><a href=\"/{localLink:1079}\" title=\"Basics\">Off to the docs →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Master classes</h2>\n<p>The best way to learn Umbraco is through the Master classes that’s running every month in most regions.</p>\n<p><a href=\"/{localLink:1080}\" title=\"Masterclasses\">Learn about the masterclasses →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1044/14441035391_7ee1d0d166_h_darken.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d28a05da-2404-c1e7-6265-01b07fc5f722"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Umbraco Forms</h1>\n<p>With our add-on product Umbraco Forms it’s a breeze to create any type of form you can imagine.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Package repository</h1>\n<p>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "5362ea7d-e729-078b-e717-a1e7aa69fd4b"
        },
        {
          "name": "Full width image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1127,
                    "image": "/media/1046/14386124825_d43f359900_h_cropped.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "953b3802-6b4f-20ed-66f9-9a855e9afdd4"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Sharing is caring</h2>\n<p>Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Born global, loving local</h2>\n<p>If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community. You can do just that through the many local user groups and meetups</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "29cac0ff-d8e9-605b-9e7b-6809dce55edd"
        },
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">CodeGarden</h1>\n<h5 style=\"text-align: center;\">Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0093bd05-735a-9623-8509-28085818745c"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (32, 1060, N'd9ebcd2a-c1c6-4579-b3f7-5c6e349f4d18', 42, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (33, 1060, N'd9ebcd2a-c1c6-4579-b3f7-5c6e349f4d18', 43, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (34, 1064, N'1c86c387-bb0d-4c7b-8f10-a139f934ace6', 42, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (35, 1064, N'1c86c387-bb0d-4c7b-8f10-a139f934ace6', 43, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (36, 1068, N'51fdc01a-6fc8-45ac-be9b-9b16ba451cca', 42, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (37, 1068, N'51fdc01a-6fc8-45ac-be9b-9b16ba451cca', 43, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (38, 1071, N'702f0071-7da4-4f56-89e9-a5f4630d7d99', 37, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (39, 1075, N'28f7948f-7bed-42fe-aa91-57f94acd4d99', 42, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (40, 1075, N'28f7948f-7bed-42fe-aa91-57f94acd4d99', 43, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (41, 1072, N'de2da6e2-6981-4030-a76c-ac744a4a86ae', 35, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\" dir=\"ltr\"><span>Tall trees have deep roots</span></h1>\n<h5 style=\"text-align: center;\" dir=\"ltr\"><span>You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2bd04b6a-0561-05c8-aa48-7ee47fde287f"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>The origins of the roots</span></h2>\n<p dir=\"ltr\"><span>date back to 2003 where the first version of Umbraco saw its light. Back then nobody could predict what it would become and especially not Niels Hartvig who simply designed and built Umbraco as a tool to quickly produce sites for his freelance clients and make sure they had a user-friendly way of updating it.</span></p>\n<p dir=\"ltr\"><span>But in 2004 he decided to open source the work and with help of friends Kasper Bumbech and Anders Pollas with whom he shared office space, the first version of Umbraco as open source saw the light of the day on February 16th 2005.</span></p>\n<p><span>In the early days, the community was purely virtual and since it was the days before Facebook and Twitter, the early adopters communicated through a Yahoo Mailinglist. From the seeds of talking Umbraco via email, the idea of an Umbraco conference surfaced and in March 2005, <a href=\"https://groups.yahoo.com/neo/groups/umbraco/conversations/messages/195\" target=\"_blank\" title=\"Codegarden was born\">CodeGarden was born…</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "7a2e4652-8523-3ade-053d-f7873c9c8020"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1108,
                    "image": "/media/1027/14434411872_8e663d6de0_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "5fc9f47f-3ac1-4627-df26-2922b584e288"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Since v1 of CodeGarden in 2005</span></h2>\n<p dir=\"ltr\"><span>thousands of people have attended what is considered a must experience event for any “Umbracian”; it’s where everything Umbraco comes to life. From seeing the latest progress, sharing knowledge with fellow community members, having memorable times in the wonderful city of Copenhagen and returning energized with new knowledge and inspiration.</span></p>\n<p dir=\"ltr\"><span>But more than anything, it’s the special vibe that has always been a keystone in everything that surrounds Umbraco. As coined by Hudson Maul back in 2006 - it’s “The Friendly CMS”.</span></p>\n<h2 dir=\"ltr\"><br /><br /></h2>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "84b00350-7168-7858-0b37-e452f05d7664"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (42, 1072, N'de2da6e2-6981-4030-a76c-ac744a4a86ae', 36, NULL, NULL, NULL, NULL, N'You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (43, 1069, N'b29bd2cd-8163-4c4d-bddf-bf489ca0fb18', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Umbraco forms",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">With our add-on product Umbraco Forms it’s a breeze to create anything from simple contact forms to advanced questionnaires.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "0a170745-ecbd-f642-0e5c-8475e6fae812"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">You won''t need to write a single line of code.</h1>\n<p style=\"text-align: center;\">Instead, you can create, edit and administer your form via a user interface that is a fully integrated part of Umbraco.</p>\n<p style=\"text-align: center;\"> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "<iframe src=\"//player.vimeo.com/video/110229004\" width=\"360\" height=\"203\" frameborder=\"0\" title=\"Form installer intro\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": "/App_Plugins/Grid/Editors/Render/embed_videowrapper.cshtml",
                    "icon": "icon-movie-alt"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "17022257-5f35-360f-8cec-f574221fc457"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1>Why does Umbraco Forms cost money?</h1>\n<p>At the Umbraco HQ we employ 15 full-time employees to ensure that the core is of the highest quality and constantly evolves. As we believe in keeping great ideas sustainable, we’ve never taken outside investment, but solely rely on income from products that enhance - but don’t limit - the open source core. We believe this is the best, long term solution and we hope you agree.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "190b7767-6b42-cd23-1d01-ad7e2ff24a6d"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (44, 1065, N'd7f768d6-3057-4110-9916-4e999b5dbafd', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Sharing is caring",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1048/sharingiscaring_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0efee164-ea45-3657-66c2-04db5cbdcd37"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>Get help</h2>\n<p>If you’re stuck in your Umbraco project, the friendly forum is the place to visit. We take pride in keeping a friendly atmosphere in our forums despite the rapid growth of the project, so remember that the easier and friendlier you ask the more likely you are to get a quality reply.</p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Karma<br /></span></h2>\n<p dir=\"ltr\">On “Our” we have a virtual currency called “Karma” - think of it as likes worth counting. When you give people help, they can appreciate this by giving you a virtual high five. In addition to the joy of knowing that your help meant something, you also get karma points and while money doesn’t buy you happiness, a little bit of karma can. </p>\n<p dir=\"ltr\"><span>In other words, don’t forget to say thanks - it doesn’t cost you anything!</span></p>\n<p dir=\"ltr\"> </p>\n<h2 dir=\"ltr\"><span>Give back<br /></span></h2>\n<p dir=\"ltr\">Once you’ve become better at Umbraco, remember to set aside a little bit of time to be the help you got. It’ll keep the snowball effect rolling and by pulling together as a community, it doesn’t take much effort from everybody to make Umbraco community the best in the industry when it comes to get a fast and friendly quality response.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "0e64a81c-519d-ed35-7e28-35e2d441a044"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.54,
                      "top": 0.34082397003745318
                    },
                    "id": 1130,
                    "image": "/media/1049/9027510123_92a91b5cf4_b_dark.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "1efceb16-6a36-e18b-905a-b372c3d8b5e1"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (45, 1061, N'61997560-db26-4b27-966c-36d81b685cc7', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Fanø",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Fanø is a Danish island in the North Sea off the coast of southwestern Denmark, and is the very northernmost of the Danish Wadden Sea Islands. Fanø municipality is the municipality that covers the island and its seat is the town of Nordby.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1012/fanoe-denmark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "789b4b02-6a1e-bbff-9435-939d83f6e895"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 dir=\"ltr\"><span><span>How is this starter kit made?</span></span></h1>\n<p dir=\"ltr\"><span>Congratulations on getting up and running with Umbraco and the “Fanoe” starter kit. The idea with this starter kit is to let you explore some of the simple things Umbraco can do for a typical content powered website using “The Grid” feature.</span></p>\n<p><span>To get the most out of this starter kit and get started on the right foot, make sure to watch the “Grid” tutorial on Umbraco.TV which will take you through how the entire starter kit was made. From implementing the HTML mockups in Umbraco and using the powerful features in the Grid to give maximum freedom and flexibility for editors - without compromising the design.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f0013b7-f55e-cdd9-6ed9-7ad2f8696157"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "While walking around on Fanø, you will notice that almost all traditional houses have a little window above the front door with a model boat.\nThis is a very traditional good luck charm for the men away at sea. The economy of the island was almost entirely based on fishing and every family home has the model boat to ensure the safe return of sailors",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "3bd5271f-c171-8435-ba19-00008abd3af5"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (46, 1073, N'a4641bda-93e5-446f-a7f4-7b47fc800858', 35, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Different Flowers Make a Bouquet</h1>\n<h5 style=\"text-align: center;\">It may only take two to tango, but a party worth remembering is a completely different story.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1031/9026528992_d38fbc2e28_o_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "63d1f52a-a6be-2459-a337-22f97cdb15bb"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco is a huge family </span></h2>\n<p dir=\"ltr\"><span>including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.</span></p>\n<p dir=\"ltr\"><span>Without diversity, status quo becomes king. At Umbraco we don’t believe in the status quo. We believe it’s the sum of our differences - whether designer, developer or editor, whether nationality, religion or gender, heck, whether Apple or PC - that it’s the nutrition for moving forward.</span></p>\n<p dir=\"ltr\"><span>When you open your eyes for the qualities in other people, you open up an astounding opportunity to learn. Our world - and our differences - is a buffet of eye-opening knowledge just waiting for you. So make sure to treat everyone friendly and with the highest respect. Don''t be the judge.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "8e82e5c1-8583-3d32-2742-c02b96060643"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1113,
                    "image": "/media/1032/9039247947_e15a9d8850_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "d8ceaabf-535b-16db-e4ae-522fc0555846"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (47, 1073, N'a4641bda-93e5-446f-a7f4-7b47fc800858', 36, NULL, NULL, NULL, NULL, N'It may only take two to tango, but a party worth remembering is a completely different story. Including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (48, 1070, N'14c287e4-ca79-4d66-be5b-5286d9a9d493', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Package repository",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1024/14448232381_8f994d2adc_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0fc8f95c-1db8-6d29-788c-58a23c47634a"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Swim in the ocean of packages</span></h2>\n<p dir=\"ltr\"><span>From complete e-commerce platforms to integration with 3rd party services such as MailChimp and YouTube to developer tools that’ll boost your productivity.</span></p>\n<p dir=\"ltr\"><span>While you can download the packages on Our, you can also browse and install them directly from within the backoffice - called the “Package Repository” (yes, we should find a sexier name!). Those packages are filtered to ensure they’ll work with your Umbraco installation (based on version) and only packages that have been approved by at least 15 community people make the cut.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "9bc7883d-fd02-84d2-a790-9e0174b22e77"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "If you like the package, make sure to give it a high five.",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "a01e8642-d4a9-30d4-d8ef-ae31a0f7f83e"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1120,
                    "image": "/media/1038/screen-shot-2014-12-01-at-121327.png",
                    "paragraph": "Once you’ve installed a package, make sure to give feedback. Whether the install was successful or not, it’ll help the next person trying to give it a go. At Our Umbraco you can report compatibility with a few simple clicks.",
                    "headline": "Give feedback"
                  },
                  "editor": {
                    "name": "Image w/ text right",
                    "alias": "media_text_right",
                    "view": "/App_Plugins/Grid/Editors/Views/media_with_description.html",
                    "render": "/App_Plugins/Grid/Editors/Render/media_text_right.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "96916694-116a-637c-2319-a5b077e80bd9"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (49, 1066, N'3574fa7e-cc26-41e7-8466-887df2b8fd20', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "CodeGarden",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1014/9017002308_81dfd2c1d5_b_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d851bdc5-cb0c-e982-a1aa-f1cdda3e39c0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Well, it used to be a conference</span></h2>\n<p dir=\"ltr\"><span>but today we like to think of it more as a “festival”. Lasting three days from early mornings to late evenings, it’s packed with a combination of learning everything about Umbraco to the who’s who in the community in a laid back atmosphere where you’ll feel at home.</span></p>\n<h2 dir=\"ltr\"><span>Great sessions</span></h2>\n<p dir=\"ltr\"><span>At Umbraco you’ll find sessions that’ll take your skills to the next level. From large-scale implementation to highly specialized sites, you really shouldn’t miss out on the opportunity to learn from those who have come before you.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "afbe6cbd-a903-1c91-4d7e-fafa73515de6"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5056179775280899
                    },
                    "id": 1123,
                    "image": "/media/1015/14257753719_2c02b94030_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1015%2F14257753719_2c02b94030_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "4bbedf99-360e-905c-2bd3-71b458ab4647"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "In raw numbers, Codegarden is: 500+ attendees, 3 packed days, 20+ sessions, 26 passionate speakers, 3 workshops, 1 keynote, a hack room, 2 rounds of bingo and 3563 cups of fair trade coffee",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "6bfba7ba-f732-8193-3d38-2980e262142d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Influence the project</span></h2>\n<p dir=\"ltr\"><span>Aside from the regular sessions and workshops CodeGarden also provides a unique approach to conferencing. It is called Open Space Technology and is all about networking, problem solving. This means you are not just limited to the scheduled topics but can put your own passions on the agenda and influence the future of the project.</span></p>\n<h2 dir=\"ltr\"><span>Loads of fun</span></h2>\n<p dir=\"ltr\"><span>In the community we value having a great time, so CodeGarden evenings are packed with social events. From canal tours of Copenhagen (with free beer and champagne) to evening parties and the infamous Umbraco bingo and dinner which can’t be described in words.</span></p>\n<h2 dir=\"ltr\"><span>Get your ticket</span></h2>\n<p><span>CodeGarden always ends up selling out, so make sure to reserve your ticket. The earlier you order the cheaper it is and if you’re on a stretch budget there’s a big chance that a friendly local Umbracian will have a couch to spare.<br /></span></p>\n<p><span><a href=\"http://umbraco.com/cg15/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Buy ticket for Codegarden</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "edebcf94-a4b1-fec5-5bc6-f8f677b03b16"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.605,
                      "top": 0.33333333333333331
                    },
                    "id": 1124,
                    "image": "/media/1016/14435759945_a2c58e9ed6_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1016%2F14435759945_a2c58e9ed6_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "96ec2067-0a50-459a-4d95-714b5b8ac4b6"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (50, 1062, N'ef902dde-95ad-4e77-bd89-6ed75cd7f6fc', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Learn the basics",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">While we recommend everyone to get an Umbraco.TV subscription to learn the ins and outs of Umbraco, maybe you prefer a more traditional tutorial or detailed technical documentation.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1047/9027509991_ff12bd87e4_b_small_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "97df8f64-dc98-40a9-e5f3-ac065983d6bd"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Create a basic website in Umbraco</h1>\n<p style=\"text-align: center;\">At Our Umbraco you’ll find both and we definitely recommend reading the guide on <a href=\"http://our.umbraco.org/documentation/Using-Umbraco/Creating-Basic-Site/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">creating a basic website in Umbraco</a><a href=\"#\" target=\"_blank\" title=\"Create a basic website in Umbraco\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "070e60ae-26d9-a277-5b04-97a52f73e34d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Sharpen those Razor skills</span></h2>\n<p dir=\"ltr\"><span>Umbraco uses Razor - a templating engine from Microsoft - as the main way to generate pages. If you’ve never used it before and in particular if you’ve never used ASP.NET before, It might seem a little daunting, but fear not. The template editor in the back office provides snippets and a Query Builder to get you up to speed.</span></p>\n<p dir=\"ltr\"><span>Once you know the basics, it’s also nice to know that there’s <a href=\"http://our.umbraco.org/projects/developer-tools/umbraco-v6-mvc-razor-cheatsheets/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">cheat sheets</a> covering the most common methods - ready to print out for office decoration.</span></p>\n<h2 dir=\"ltr\"><span>Extend with the API</span></h2>\n<p dir=\"ltr\"><span>If you want to extend Umbraco even further, you can use our .NET API to programmatically create Content, Media, Members and anything else that’s possible through the back office. For a quick start, <a href=\"http://umbraco.com/follow-us/blog-archive/2013/1/22/introducing-contentservice-aka-the-v6-api/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">you can follow this tutorial</a></span><span> and for full reference, don’t miss <a href=\"http://our.umbraco.org/documentation/reference/Management-v6/Services/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">the thorough documentation on Our</a>.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "16f56cd2-374c-8c6c-c91c-7d65b8b264cd"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (51, 1074, N'd2aecbc2-f12b-4cd8-bcdc-2412ed714f12', 35, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49514563106796117,
                      "top": 0.19
                    },
                    "id": 1115,
                    "image": "/media/1033/whole-earth-catalog.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "ec390b52-0259-8b7f-fc86-56374ea6ca63"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: left;\" dir=\"ltr\"><span>Only the curious have something to find</span></h1>\n<p>A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.</p>\n<p dir=\"ltr\"><span>Yet, we all dream about - and need - a little adventure every now and then. At the Umbraco community we praise those who dare to play and take risks. At the many Umbraco events around the world, brave people share their ideas through opinionated talks and at Our Umbraco courageous coders share their packages that extend the feature set of Umbraco.</span></p>\n<p dir=\"ltr\"><span>You should as well. After all, what do you </span><span>really</span><span> have to lose? Nothing compared to what you have to gain: becoming a better craftsperson, inspiring others and the satisfaction of seeing the download number of your work increase week after week. If we don’t strive for moving forward - whether professionals or amateurs - then what’s the point?</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "“Once you stop learning, you start dying”\n- Albert Einstein",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "bdc66e02-87e6-7aa6-34a8-c0e5f834af79"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (52, 1074, N'd2aecbc2-f12b-4cd8-bcdc-2412ed714f12', 36, NULL, NULL, NULL, NULL, N'A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (53, 1067, N'b7b69255-d650-4f24-bf38-38ef5ccd6c3b', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Born global, loving local",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community and finally - if you can’t come to the community, why not have the community come to you by starting a local user group?</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1017/14359779226_df7329d607_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "3dd3ea61-c394-5ce1-91d8-93f4a41b0dc0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco Meetups</span></h2>\n<p dir=\"ltr\"><span>From London to New York, from Denmark in the north to Australia in the south - there’s local Umbraco User groups all over the world that <a href=\"http://our.umbraco.org/events/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">arrange regular meetups</a>. The format is usually a laid back atmosphere where people share their knowledge and new people are always welcome. So make sure to <a href=\"http://umbraco.meetup.com/\">check out Meetup.com for a local group</a> and if you’re not lucky, why not start one - it’s not that hard.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Local Festivals</span></h2>\n<p dir=\"ltr\"><span>Inspired by CodeGarden, there’s more and more annual local Umbraco events. Originated from the community in the United Kingdom, there’s “Umbraco Festivals” going on in many countries around the world. These are one day events packed with sessions that often combine advanced Umbraco topics with discussing how local awareness can be improved. And as they are driven by the community and often sponsored by local Umbraco partners, they’re usually very inexpensive events to attend.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f2b5540-7c52-4631-3877-6be5f61f6a12"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49583333333333335,
                      "top": 0.53
                    },
                    "id": 1126,
                    "image": "/media/1018/10818851674_e375a8751e_b.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1018%2F10818851674_e375a8751e_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "102d5bec-3fb5-4d1a-cd9f-2baeeb5cdc44"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (54, 1063, N'533820d6-3742-46db-a6cf-e82e97a92e8e', 44, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Masterclasses",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">The best and fastest way to learn Umbraco is through the official Master classes that are running every month in most regions.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1022/9686845888_e2d216ce81_b_dark_small.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2d34e33a-a1ef-04d5-9445-e1f1633bc362"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h3 style=\"text-align: center;\">The masterclasses are ran by either the Umbraco HQ or by the most experienced community heroes and use thoroughly tested materials to ensure you’ll return as a fully skilled Umbraco craftsperson.</h3>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "blue"
          },
          "id": "5312fa7b-3d5c-e9c0-4d0c-f6ae5d73e168"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Get it right from the beginning</span></h2>\n<p dir=\"ltr\"><span>While Umbraco is a simple tool, it’s important that you use it the right way. The Level 1 master class is designed to make sure that any Web Developer - also with no previous ASP.NET knowledge - can create advanced multi-lingual sites by the end of the course.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Become an expert</span></h2>\n<p dir=\"ltr\"><span>Once you know the basics, you can step up your game by attending the Level 2 master class. While the first masterclass is focused on implementing a site, this Masterclass will teach you how the .net APIs work and how to integrate and extend Umbraco. Whether that’s creating content programmatically or integrating a third party e-commerce engine or CRM.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Worth the investment</span></h2>\n<p dir=\"ltr\"><span>All attendees at the official Umbraco Masterclasses receive a certification which is the best way to make yourself noticed in the Umbraco ecosystem. So whether you’re looking to move up in the ranks of your company or are a free agent, you shouldn’t be doing Umbraco without becoming certified. The investment will come back many times, so make sure to <a href=\"http://umbraco.com/products/training/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\" target=\"_blank\" title=\"Masterclasses\">keep an eye out for a Masterclass near you</a>.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "a3ddf743-1622-7eec-6ea4-08caef854559"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (55, 1078, N'33ade3d5-95d8-44f9-acd3-37459ef6e3b3', 42, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (56, 1078, N'33ade3d5-95d8-44f9-acd3-37459ef6e3b3', 43, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (57, 1078, N'5aebe1df-135e-4b8a-974e-dc45ddf50495', 42, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (58, 1078, N'5aebe1df-135e-4b8a-974e-dc45ddf50495', 43, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (59, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', 46, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (60, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', 47, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (61, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', 51, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (62, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', 53, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (63, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', 52, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (64, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', 48, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (65, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', 50, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (66, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', 56, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (67, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (68, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (69, 1078, N'3f0beda6-befa-44fc-a0ea-9d911608f446', 49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (70, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', 46, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (71, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', 47, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (72, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', 51, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (73, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', 53, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (74, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', 52, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (75, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', 48, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (76, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', 50, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (77, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', 56, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (78, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (79, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (80, 1078, N'bca0c717-9af0-46c2-ac2f-7592835d5928', 49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (81, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', 46, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (82, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', 47, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (83, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', 51, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (84, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', 53, NULL, NULL, NULL, NULL, N'[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (85, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', 52, NULL, NULL, NULL, NULL, N'For getting help with implementing Umbraco, look at our list of Certified Umbraco partner')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (86, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', 48, NULL, NULL, NULL, N'The forum', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (87, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', 50, NULL, NULL, NULL, N'Getting help', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (88, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', 56, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (89, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', 55, NULL, NULL, NULL, NULL, N'For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (90, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', 54, NULL, NULL, NULL, N'Get in touch', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (91, 1078, N'220bf527-65d3-4221-90ef-141b42ff00f6', 49, NULL, NULL, NULL, NULL, N'For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (92, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', 46, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (93, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', 47, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (94, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', 51, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (95, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', 53, NULL, NULL, NULL, NULL, N'[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (96, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', 52, NULL, NULL, NULL, NULL, N'For getting help with implementing Umbraco, look at our list of Certified Umbraco partner')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (97, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', 48, NULL, NULL, NULL, N'The forum', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (98, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', 50, NULL, NULL, NULL, N'Getting help', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (99, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', 56, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]')
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (100, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', 55, NULL, NULL, NULL, NULL, N'For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (101, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', 54, NULL, NULL, NULL, N'Get in touch', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (102, 1085, N'3cbe4b23-45d5-47cc-a11b-e6fb0a8047c0', 49, NULL, NULL, NULL, NULL, N'For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (103, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', 46, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (104, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', 47, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (105, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', 51, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (106, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', 53, NULL, NULL, NULL, NULL, N'[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (107, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', 52, NULL, NULL, NULL, NULL, N'For getting help with implementing Umbraco, look at our list of Certified Umbraco partner')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (108, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', 48, NULL, NULL, NULL, N'The forum', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (109, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', 50, NULL, NULL, NULL, N'Getting help', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (110, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', 56, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (111, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', 55, NULL, NULL, NULL, NULL, N'For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (112, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', 54, NULL, NULL, NULL, N'Get in touch', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (113, 1085, N'a0ea3110-79f1-4a52-b81b-e449670f277c', 49, NULL, NULL, NULL, NULL, N'For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (114, 1085, N'5bf223a0-074a-45c2-a932-839dacdc1036', 60, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (115, 1085, N'5bf223a0-074a-45c2-a932-839dacdc1036', 61, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (116, 1085, N'4a406469-4921-446a-b23b-467d1e03e2d2', 60, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (117, 1085, N'4a406469-4921-446a-b23b-467d1e03e2d2', 61, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (118, 1087, N'c894e732-9cf0-4fd0-bf01-68794f4dde60', 58, NULL, NULL, NULL, NULL, N'For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (119, 1087, N'c894e732-9cf0-4fd0-bf01-68794f4dde60', 57, NULL, NULL, NULL, N'The forum', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (120, 1087, N'c894e732-9cf0-4fd0-bf01-68794f4dde60', 59, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (121, 1088, N'1813b682-bf12-4ff1-a2e4-f1d8dd3e0617', 58, NULL, NULL, NULL, NULL, N'For getting help with implementing Umbraco, look at our list of Certified Umbraco partner')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (122, 1088, N'1813b682-bf12-4ff1-a2e4-f1d8dd3e0617', 57, NULL, NULL, NULL, N'Getting help', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (123, 1088, N'1813b682-bf12-4ff1-a2e4-f1d8dd3e0617', 59, NULL, NULL, NULL, NULL, N'[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (124, 1089, N'566c793d-4113-4e5d-93b5-11eca289e810', 58, NULL, NULL, NULL, NULL, N'For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (125, 1089, N'566c793d-4113-4e5d-93b5-11eca289e810', 57, NULL, NULL, NULL, N'Get in touch', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (126, 1089, N'566c793d-4113-4e5d-93b5-11eca289e810', 59, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (127, 1093, N'218fe7d6-b9a8-4ba9-a66f-19cafc6659cd', 58, NULL, NULL, NULL, NULL, N'For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (128, 1093, N'218fe7d6-b9a8-4ba9-a66f-19cafc6659cd', 57, NULL, NULL, NULL, N'The forum', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (129, 1093, N'218fe7d6-b9a8-4ba9-a66f-19cafc6659cd', 59, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (130, 1094, N'38f8a85c-0c5a-4189-9a93-1da12de97b4d', 58, NULL, NULL, NULL, NULL, N'For getting help with implementing Umbraco, look at our list of Certified Umbraco partner')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (131, 1094, N'38f8a85c-0c5a-4189-9a93-1da12de97b4d', 57, NULL, NULL, NULL, N'Getting help', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (132, 1094, N'38f8a85c-0c5a-4189-9a93-1da12de97b4d', 59, NULL, NULL, NULL, NULL, N'[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (133, 1095, N'55d8493f-4361-4f55-b932-8cd055870f52', 58, NULL, NULL, NULL, NULL, N'For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (134, 1095, N'55d8493f-4361-4f55-b932-8cd055870f52', 57, NULL, NULL, NULL, N'Get in touch', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (135, 1095, N'55d8493f-4361-4f55-b932-8cd055870f52', 59, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (136, 1093, N'c6c04869-5d93-421a-9fb7-00f10b5e4128', 58, NULL, NULL, NULL, NULL, N'For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (137, 1093, N'c6c04869-5d93-421a-9fb7-00f10b5e4128', 57, NULL, NULL, NULL, N'The forum', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (138, 1093, N'c6c04869-5d93-421a-9fb7-00f10b5e4128', 59, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Go to the forum",
    "url": "http://our.umbraco.org/forum/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (139, 1094, N'4a24ed8f-ab2b-43a7-8348-10a5cf157902', 58, NULL, NULL, NULL, NULL, N'For getting help with implementing Umbraco, look at our list of Certified Umbraco partner')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (140, 1094, N'4a24ed8f-ab2b-43a7-8348-10a5cf157902', 57, NULL, NULL, NULL, N'Getting help', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (141, 1094, N'4a24ed8f-ab2b-43a7-8348-10a5cf157902', 59, NULL, NULL, NULL, NULL, N'[
  {
    "name": "List of Certified Umbraco Partners",
    "url": "http://umbraco.com/certified-partners/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (142, 1095, N'9d9032b1-4d74-4f45-945e-41c44c15bc2f', 58, NULL, NULL, NULL, NULL, N'For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (143, 1095, N'9d9032b1-4d74-4f45-945e-41c44c15bc2f', 57, NULL, NULL, NULL, N'Get in touch', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (144, 1095, N'9d9032b1-4d74-4f45-945e-41c44c15bc2f', 59, NULL, NULL, NULL, NULL, N'[
  {
    "name": "Umbraco HQ",
    "url": "http://umbraco.com/contact/",
    "icon": "icon-link"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (145, 1099, N'b46f4dd7-13d1-47ca-a1ab-7ccd73e37a5a', 60, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (146, 1099, N'b46f4dd7-13d1-47ca-a1ab-7ccd73e37a5a', 61, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (147, 1099, N'8fdfdf79-7dd5-43f7-8670-63f4746dcb29', 60, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (148, 1099, N'8fdfdf79-7dd5-43f7-8670-63f4746dcb29', 61, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (149, 1099, N'7ee88b3c-551a-467e-b679-3c6cd0aee4cc', 42, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (150, 1099, N'7ee88b3c-551a-467e-b679-3c6cd0aee4cc', 43, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (151, 1099, N'd96badbf-9d97-4279-a2f3-165cf6214600', 42, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (152, 1099, N'd96badbf-9d97-4279-a2f3-165cf6214600', 43, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (153, 1099, N'98ee47c7-570b-459c-9408-2ee694716008', 71, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (154, 1099, N'98ee47c7-570b-459c-9408-2ee694716008', 72, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (155, 1099, N'98ee47c7-570b-459c-9408-2ee694716008', 73, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (156, 1099, N'91740449-db8e-4d58-a46b-4d29f312935b', 71, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (157, 1099, N'91740449-db8e-4d58-a46b-4d29f312935b', 72, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (158, 1099, N'91740449-db8e-4d58-a46b-4d29f312935b', 73, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (159, 1099, N'8acfbfe6-42d4-4b46-851a-acc0919de92c', 71, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (160, 1099, N'8acfbfe6-42d4-4b46-851a-acc0919de92c', 73, NULL, NULL, NULL, N'1093,1094,1095', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (161, 1099, N'8acfbfe6-42d4-4b46-851a-acc0919de92c', 72, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (162, 1103, N'afb38f93-d58e-44bb-baaa-e78fd8ed6840', 71, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (163, 1103, N'afb38f93-d58e-44bb-baaa-e78fd8ed6840', 73, NULL, NULL, NULL, N'1093,1094,1095', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (164, 1103, N'afb38f93-d58e-44bb-baaa-e78fd8ed6840', 72, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (165, 1103, N'18fad8cd-b003-48c2-900e-fdd619dbe4b7', 71, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (166, 1103, N'18fad8cd-b003-48c2-900e-fdd619dbe4b7', 73, NULL, NULL, NULL, N'1093,1094,1095', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (167, 1103, N'18fad8cd-b003-48c2-900e-fdd619dbe4b7', 72, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (171, 1103, N'c6739934-6b4c-440e-8597-157f7ae2e38a', 71, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (172, 1103, N'c6739934-6b4c-440e-8597-157f7ae2e38a', 73, NULL, NULL, NULL, N'1093,1094,1095', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (173, 1103, N'c6739934-6b4c-440e-8597-157f7ae2e38a', 72, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (174, 1104, N'2c57f5b1-5bd4-42e9-ad96-8b66ae363efb', 74, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (175, 1104, N'2c57f5b1-5bd4-42e9-ad96-8b66ae363efb', 76, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": []
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (176, 1104, N'2c57f5b1-5bd4-42e9-ad96-8b66ae363efb', 77, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (177, 1104, N'a6357037-80e4-4f2c-a7b3-abe131038ac0', 74, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (178, 1104, N'a6357037-80e4-4f2c-a7b3-abe131038ac0', 76, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ],
              "active": false
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e",
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (179, 1104, N'a6357037-80e4-4f2c-a7b3-abe131038ac0', 77, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (180, 1104, N'40401c82-6609-4dcc-a4c9-52105593db38', 74, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (181, 1104, N'40401c82-6609-4dcc-a4c9-52105593db38', 76, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (182, 1104, N'40401c82-6609-4dcc-a4c9-52105593db38', 77, NULL, NULL, NULL, NULL, N'[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Item 3","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (183, 1105, N'bc94b644-70e2-449c-8884-d784622aeb6c', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1050/1912289_753997844648209_7099291360101379579_o.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (184, 1105, N'bc94b644-70e2-449c-8884-d784622aeb6c', 7, NULL, NULL, NULL, N'1229', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (185, 1105, N'bc94b644-70e2-449c-8884-d784622aeb6c', 8, NULL, NULL, NULL, N'469', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (186, 1105, N'bc94b644-70e2-449c-8884-d784622aeb6c', 9, NULL, NULL, NULL, N'122310', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (187, 1105, N'bc94b644-70e2-449c-8884-d784622aeb6c', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (188, 1104, N'31ca523c-8d13-4ccf-ae78-80ee8ff2806a', 74, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (189, 1104, N'31ca523c-8d13-4ccf-ae78-80ee8ff2806a', 76, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e",
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (190, 1104, N'31ca523c-8d13-4ccf-ae78-80ee8ff2806a', 77, NULL, NULL, NULL, NULL, N'[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (191, 1104, N'5dcac874-a96b-457a-a495-d2ef9703fd16', 74, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (192, 1104, N'5dcac874-a96b-457a-a495-d2ef9703fd16', 76, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ],
              "active": false
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e",
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (193, 1104, N'5dcac874-a96b-457a-a495-d2ef9703fd16', 77, NULL, NULL, NULL, NULL, N'[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (194, 1110, N'3ccd93a5-0c2d-406d-87c8-b721ab07d5dc', 74, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (195, 1110, N'3ccd93a5-0c2d-406d-87c8-b721ab07d5dc', 76, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ],
              "active": false
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e",
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (196, 1110, N'3ccd93a5-0c2d-406d-87c8-b721ab07d5dc', 77, NULL, NULL, NULL, NULL, N'[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (197, 1110, N'21b2af43-0c44-423b-83e6-1d891a1cb7ba', 74, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (198, 1110, N'21b2af43-0c44-423b-83e6-1d891a1cb7ba', 76, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (199, 1110, N'21b2af43-0c44-423b-83e6-1d891a1cb7ba', 77, NULL, NULL, NULL, NULL, N'[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (200, 1110, N'cb2fe7e6-380d-4fa4-910b-0ea54ff85618', 79, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (201, 1110, N'cb2fe7e6-380d-4fa4-910b-0ea54ff85618', 80, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (202, 1110, N'cb2fe7e6-380d-4fa4-910b-0ea54ff85618', 82, NULL, NULL, NULL, NULL, N'[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]')
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (203, 1110, N'4670a873-ac2d-42a6-b3ce-eae68eb9ba26', 79, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (204, 1110, N'4670a873-ac2d-42a6-b3ce-eae68eb9ba26', 80, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (205, 1110, N'4670a873-ac2d-42a6-b3ce-eae68eb9ba26', 82, NULL, NULL, NULL, NULL, N'[{"name":"The forum","ncContentTypeAlias":"spotlight","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Getting help","ncContentTypeAlias":"spotlight","heading":"Getting help","copy":"For getting help with implementing Umbraco, look at our list of Certified Umbraco partner","link":"[\r\n  {\r\n    \"name\": \"List of Certified Umbraco Partners\",\r\n    \"url\": \"http://umbraco.com/certified-partners/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"},{"name":"Get in touch","ncContentTypeAlias":"spotlight","heading":"Get in touch","copy":"For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ","link":"[\r\n  {\r\n    \"name\": \"Umbraco HQ\",\r\n    \"url\": \"http://umbraco.com/contact/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]"}]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (206, 1110, N'66f9ff83-3fe1-40a3-9925-36634eca6109', 79, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (207, 1110, N'66f9ff83-3fe1-40a3-9925-36634eca6109', 80, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (208, 1110, N'66f9ff83-3fe1-40a3-9925-36634eca6109', 82, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (209, 1110, N'e5ea1d92-e915-49bd-b360-a89e3047006f', 79, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (210, 1110, N'e5ea1d92-e915-49bd-b360-a89e3047006f', 80, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (211, 1110, N'e5ea1d92-e915-49bd-b360-a89e3047006f', 82, NULL, NULL, NULL, NULL, N'[{"name":"Item 1","ncContentTypeAlias":"spotlightWithReuse","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]","pickedSpotlight":null}]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (212, 1110, N'3784abc6-6700-42d2-94bd-22187c968d0f', 79, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (213, 1110, N'3784abc6-6700-42d2-94bd-22187c968d0f', 80, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "alias": "banner_headline"
                  },
                  "active": false
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1050/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "hasConfig": true,
          "id": "1b706611-e259-d0bf-8418-c6cb92026c0e"
        }
      ]
    }
  ]
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (214, 1110, N'3784abc6-6700-42d2-94bd-22187c968d0f', 82, NULL, NULL, NULL, NULL, N'[{"name":"The forum","ncContentTypeAlias":"spotlightWithReuse","heading":"The forum","copy":"For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.","link":"[\r\n  {\r\n    \"name\": \"Go to the forum\",\r\n    \"url\": \"http://our.umbraco.org/forum/\",\r\n    \"icon\": \"icon-link\"\r\n  }\r\n]","pickedSpotlight":null},{"name":"Getting help","ncContentTypeAlias":"spotlightWithReuse","heading":"Getting help","copy":"","link":"","pickedSpotlight":1094},{"name":"Item 3","ncContentTypeAlias":"spotlightWithReuse","heading":"Get in touch","copy":"","link":"","pickedSpotlight":1095}]')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Upload image', 0, 0, NULL, NULL, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (7, -92, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (8, -92, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (9, -92, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 0, NULL, NULL, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (26, -92, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (27, -96, 1031, 5, N'contents', N'Contents:', 0, 0, NULL, NULL, N'0000001b-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (29, -92, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (32, -92, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (33, -92, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (34, -92, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (35, 1046, 1054, 12, N'content', N'Content', 0, 0, N'', N'', N'45e5e229-60e1-45f9-931a-efabc6d512a7')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (36, -89, 1054, 13, N'introduction', N'Introduction', 0, 0, N'', N'', N'519221e9-1204-4857-8e6c-3769c5a6dd6d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (37, -49, 1055, NULL, N'umbracoNaviHide', N'Hide in bottom navigation?', 0, 0, N'', N'', N'6404ce74-47a8-4a5c-98ce-881d9119431e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (38, -89, 1056, 14, N'siteDescription', N'Site Description', 0, 0, N'', N'', N'b5c3ead1-4960-4f08-bbd9-fefc00c1a777')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (39, -88, 1056, 14, N'siteTitle', N'Site Title', 1, 0, N'', N'', N'ed5d4cc3-bdee-453b-94d1-71b1bab29822')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (40, -90, 1056, 14, N'siteLogo', N'Site Logo', 2, 0, N'', N'', N'113b5b25-29f8-4102-8746-41b29554c77b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (41, 1047, 1056, 15, N'content', N'Content', 0, 0, N'', N'', N'5d69549c-f813-4999-b9d6-ea8392d1fa1b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (42, -49, 1057, NULL, N'umbracoNaviHide', N'Hide in bottom navigation?', 0, 0, N'', N'', N'baa1b476-b4ca-4d5a-b4da-506172b43aed')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (43, 1048, 1057, 16, N'content', N'Content', 0, 0, N'', N'', N'898caa74-a0c5-4fda-a8bb-b9ccdab42dc5')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (44, 1048, 1058, 17, N'content', N'Content', 0, 0, N'', N'', N'90ba2945-e3fc-4f32-8699-b742b305cb1b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (46, -49, 1079, NULL, N'umbracoNaviHide', N'Hide in bottom navigation?', 0, 0, N'', N'', N'31afd4b4-5bd6-4462-a51c-ce726eb9380b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (47, 1048, 1079, 19, N'content', N'Content', 0, 0, N'', N'', N'63ca4ba2-fc8a-49da-a530-7c53a3743602')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (48, -88, 1079, 20, N'signpostHeading1', N'Signpost heading (1)', 0, 0, NULL, NULL, N'8c9f4fb2-0e6a-4ceb-8b72-47533c78458b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (49, -89, 1079, 20, N'signpostCopy1', N'Signpost copy (1)', 1, 0, NULL, NULL, N'5f025a8d-54ea-4117-b5f6-8f88064083a1')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (50, -88, 1079, 20, N'signpostHeading2', N'Signpost heading (2)', 3, 0, NULL, NULL, N'96b5b263-74de-43d7-bcca-6a94f3e915f8')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (51, 1080, 1079, 20, N'signpostLink1', N'Signpost link (1)', 2, 0, NULL, NULL, N'52bc4e2e-1880-40fb-9596-05ef4126af20')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (52, -89, 1079, 20, N'signpostCopy2', N'Signpost copy (2)', 4, 0, NULL, NULL, N'f9061e5c-bbba-4d99-a0a2-3f74765bd9ad')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (53, 1080, 1079, 20, N'signpostLink2', N'Signpost link (2)', 5, 0, NULL, NULL, N'3cf8576b-f9c0-409a-94c7-2060f731700d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (54, -88, 1079, 20, N'signpostHeading3', N'Signpost heading (3)', 6, 0, NULL, NULL, N'94645fee-14dd-4398-b87e-788d316964f1')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (55, -89, 1079, 20, N'signpostCopy3', N'Signpost copy (3)', 7, 0, NULL, NULL, N'9b0b9692-4586-4db5-96ac-780f704bb501')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (56, 1080, 1079, 20, N'signpostLink3', N'Signpost link (3)', 8, 0, NULL, NULL, N'064c7b72-3711-49b4-a72e-70fa294ad130')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (57, -88, 1083, 21, N'heading', N'Heading', 0, 0, NULL, NULL, N'6ca93882-a9a6-4f65-b58e-917f96d4c1c6')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (58, -89, 1083, 21, N'copy', N'Copy', 1, 0, NULL, NULL, N'e60d2adf-98b5-4449-96de-53a008936e1c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (59, 1080, 1083, 21, N'link', N'Link', 2, 0, NULL, NULL, N'c41c1565-ca8f-4bb1-ab87-d2b20ac3b75d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (60, -49, 1084, NULL, N'umbracoNaviHide', N'Hide in bottom navigation?', 0, 0, N'', N'', N'331a326d-d48c-4b42-bacc-dbe2b513503d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (61, 1048, 1084, 22, N'content', N'Content', 0, 0, N'', N'', N'4c85fd47-e752-447c-b3de-ff149aaa0f15')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (71, -49, 1096, NULL, N'umbracoNaviHide', N'Hide in bottom navigation?', 0, 0, N'', N'', N'52036f8d-4387-4f2e-8eb6-1088b0bfd0bb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (72, 1048, 1096, 24, N'content', N'Content', 0, 0, N'', N'', N'5b660665-a90a-42c1-a835-7c304e2c4421')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (73, 1098, 1096, 26, N'spotlights', N'Spotlights', 1, 0, NULL, NULL, N'54d57ede-235d-4ab7-a879-6f1528fbf863')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (74, -49, 1101, NULL, N'umbracoNaviHide', N'Hide in bottom navigation?', 0, 0, N'', N'', N'2898ee65-1ee0-4002-8989-826e61645432')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (76, 1048, 1101, 25, N'content', N'Content', 0, 0, N'', N'', N'9d5cfce2-d38d-430c-af31-34dc9a391730')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (77, 1100, 1101, 27, N'spotlights', N'Spotlights', 1, 0, NULL, NULL, N'182675c4-69ea-42ee-a380-6aed8112ad07')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (78, 1106, 1107, 28, N'pickedSpotlight', N'Picked Spotlight', 3, 0, NULL, NULL, N'74095a7e-04f2-488d-aaf1-2e6237f30168')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (79, -49, 1108, NULL, N'umbracoNaviHide', N'Hide in bottom navigation?', 0, 0, N'', N'', N'1b234693-2dd4-4428-9a38-22bf6d600324')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (80, 1048, 1108, 29, N'content', N'Content', 0, 0, N'', N'', N'0450ad31-0325-4bfc-84f2-3842dce7797a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (82, 1109, 1108, 30, N'spotlights', N'Spotlights', 0, 0, NULL, NULL, N'b1bc5ed3-f95e-453e-b3b7-03379942bed4')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (3, 1032, N'Image', 1, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (4, 1033, N'File', 1, N'50899f9c-023a-4466-b623-aba9049885fe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (5, 1031, N'Contents', 1, N'79995fa2-63ee-453c-a29b-2e66f324cdbe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (11, 1044, N'Membership', 1, N'0756729d-d665-46e3-b84a-37aceaa614f8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (12, 1054, N'Content', 2, N'5b4e2df3-7620-4620-a366-9c3e5848398a')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (13, 1054, N'Introduction', 1, N'a395435b-44f2-4354-92d5-ed4c04bd106d')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (14, 1056, N'Site', 2, N'be85cc8e-2046-4dcd-8565-af55b9753e4c')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (15, 1056, N'Content', 1, N'01230f34-bf36-433d-ac15-59dde606c6b9')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (16, 1057, N'Content', 0, N'1945d42d-6d57-4121-8249-5f55272b03f0')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (17, 1058, N'Content', 0, N'f6f1d57e-10f9-4d44-bf61-1ce128d40a91')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (19, 1079, N'Content', 0, N'9a880fc4-f567-43a6-b202-75f5549ff40f')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (20, 1079, N'Signposts', 1000, N'b6a71236-4a35-4e03-9a79-50055dd248bb')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (21, 1083, N'Content', 0, N'ef31b6a7-0930-4eed-b431-e5e705b88c1a')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (22, 1084, N'Content', 0, N'194ba74a-4b11-4347-836d-daa39de82166')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (24, 1096, N'Content', 0, N'b4158094-365d-4cd9-b69a-da1985927d18')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (25, 1101, N'Content', 0, N'4301ad1e-8f58-459e-82f4-e1a3a96f9bca')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (26, 1096, N'Spotlights', 1, N'a75f5723-d4bb-4133-9b60-8cf0bd3c72a7')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (27, 1101, N'Spotlights', 1, N'd2c9c7e8-11de-49bd-8a0d-bf5877f7a38e')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (28, 1107, N'Content', 0, N'57cc306e-51d9-4dc8-84f5-bdae81344780')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (29, 1108, N'Content', 0, N'2a005088-1b2e-4dfa-8eff-f3c72c90a9c3')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (30, 1108, N'Spotlights', 1, N'a4e20c76-5646-48c9-9b44-8de5fd3fbe23')
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
SET IDENTITY_INSERT [dbo].[cmsTaskType] ON 

INSERT [dbo].[cmsTaskType] ([id], [alias]) VALUES (1, N'toTranslate')
SET IDENTITY_INSERT [dbo].[cmsTaskType] OFF
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (1, 1049, N'Master', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = null;
	var home = @CurrentPage.Site();
}

<!DOCTYPE html>
<html lang="en">
  <head>

    <!-- Meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="@CurrentPage.siteDescription">

    <title>@CurrentPage.Name | @CurrentPage._siteTitle</title>
	
	<!-- Fonts -->
	<link href="//fonts.googleapis.com/css?family=Merriweather:400,700,300,900" rel="stylesheet" type="text/css">
	<link href="//fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet" type="text/css">
	
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/fanoe.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn''t work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <header>
      <div class="container">
        <div class="row">
          <div class="col-xs-8 col-sm-12 col-md-4">
			<a href="@home.Url">
            	<div class="brand" style="background-image:url(''@(home.SiteLogo)?height=65&width=205&bgcolor=000'')"></div>
			</a>
          </div>
          <div class="col-sm-12 col-md-8">
            <nav>
			  
              @{ Html.RenderPartial("MainNavigation"); }

            </nav>
          </div>
        </div>
      </div>

      <div id="toggle" class="toggle">
        <a href="#" class="cross"><span></span></a>
      </div>
    </header>
	
    @RenderBody()

    <footer class="field dark">
      <div class="container">
        <div class="row">
			
		  @{ Html.RenderPartial("BottomNavigation"); }

        </div>
      </div>
    </footer>
    
    <!-- Javascripts -->
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
	<script src="/scripts/fanoe.js"></script>
  </body>
</html>')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (2, 1050, N'BlogOverview', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}

<div role="content">

	<section class="light blogarchive equalizer">
		<div class="container">

			<div class="row">
				@foreach(var post in CurrentPage.Children) 
				{
					<div class="col-sm-6">
						<div class="content equal">
							<a href="@post.Url">
								<div class="date">@post.CreateDate.ToLongDateString()</div>
								<h2>@post.Name</h2>		
								<p>@Umbraco.Truncate(post.Introduction, 240, true)</p>
							</a>
						</div>
					</div>
				}
			</div>
		</div>
	</section>

</div>')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (3, 1051, N'BlogPost', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}

@CurrentPage.GetGridHtml("content", "fanoe")')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (4, 1052, N'Home', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}

@CurrentPage.GetGridHtml("content", "fanoe")')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (5, 1053, N'TextPage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}

@CurrentPage.GetGridHtml("content", "fanoe")')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (6, 1082, N'LandingPage1', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}

@CurrentPage.GetGridHtml("content", "fanoe")
	
    <div class=''dark''>
        <div class=''container''>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div>
                            
    
<h2>@Model.Content.GetPropertyValue("signpostHeading1")</h2>
<p>@Model.Content.GetPropertyValue("signpostCopy1")</p>
<p><a href="http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe">Go to the forum →</a></p>
<p> </p>
<h2>Getting help</h2>
<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>
<p><a href="http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe">List of Certified Umbraco Partners →</a></p>
<p> </p>
<h2><span>Get in touch</span></h2>
<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>
<p><a href="http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe">Umbraco HQ →</a></p>


                </div>
            </div>        
        </div>
		</div>
    </div>')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (7, 1086, N'LandingPage2', N'@using RJP.MultiUrlPicker.Models
@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}

@CurrentPage.GetGridHtml("content", "fanoe")

<div class=''dark''>
    <div class=''container''>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div>



                </div>
            </div>
        </div>
    </div>
</div>')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (8, 1097, N'LandingPage3', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (9, 1102, N'LandingPage4', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (10, 1111, N'LandingPage5', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1, CAST(0x0000A71C010C001A AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"TextPage1\",\"Id\":1077,\"PropertyTypeIds\":[45],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D12] D8111CDBC0A442CFB42FF52A3E905518')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (2, CAST(0x0000A71C010C1427 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1078]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D12] D8111CDBC0A442CFB42FF52A3E905518')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (3, CAST(0x0000A71C010C37E7 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1078]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D12] D8111CDBC0A442CFB42FF52A3E905518')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (4, CAST(0x0000A71C010CB82C AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"TextPage1\",\"Id\":1077,\"PropertyTypeIds\":[45],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D12] D8111CDBC0A442CFB42FF52A3E905518')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (5, CAST(0x0000A71C010CC4B2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"LandingPage1\",\"Id\":1079,\"PropertyTypeIds\":[46,47],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D12] D8111CDBC0A442CFB42FF52A3E905518')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (6, CAST(0x0000A71C010CDD7D AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"Home\",\"Id\":1056,\"PropertyTypeIds\":[41,38,39,40],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D12] D8111CDBC0A442CFB42FF52A3E905518')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (7, CAST(0x0000A71C010D229C AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"LandingPage1\",\"Id\":1079,\"PropertyTypeIds\":[46,47],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D12] D8111CDBC0A442CFB42FF52A3E905518')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (8, CAST(0x0000A71C010DCFF1 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"LandingPage1\",\"Id\":1079,\"PropertyTypeIds\":[46,47,48,49,50],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D12] D8111CDBC0A442CFB42FF52A3E905518')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (9, CAST(0x0000A71C010E7944 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"UniqueId\":\"a4fd129c-a6d1-4d4b-9d28-21c2b29570f6\",\"Id\":1080}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (10, CAST(0x0000A71C010ED3B9 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"LandingPage1\",\"Id\":1079,\"PropertyTypeIds\":[46,47,48,49,51,50],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (11, CAST(0x0000A71C010F1C78 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"UniqueId\":\"87748673-5c98-42a6-a549-bc94b3b86f9d\",\"Id\":1081}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (12, CAST(0x0000A71C010F3B4A AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"LandingPage1\",\"Id\":1079,\"PropertyTypeIds\":[46,47,48,49,51,50,52,53,54,55,56],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (13, CAST(0x0000A71C010F825B AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (14, CAST(0x0000A71C010F8D29 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (15, CAST(0x0000A71C010FA53F AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"LandingPage1\",\"Id\":1079,\"PropertyTypeIds\":[46,47,48,49,51,50,52,53,54,55,56],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (16, CAST(0x0000A71C010FAF77 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1078]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1078]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (17, CAST(0x0000A71C01107EA6 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1078]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1078]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (18, CAST(0x0000A71C01111E27 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (19, CAST(0x0000A71C01114346 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (20, CAST(0x0000A71C011152ED AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (21, CAST(0x0000A71C0111860E AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (22, CAST(0x0000A71C0111AB3E AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (23, CAST(0x0000A71C0111BCF3 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (24, CAST(0x0000A71C01123847 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (25, CAST(0x0000A71C01125482 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (26, CAST(0x0000A71C01128965 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (27, CAST(0x0000A71C0112E45C AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (28, CAST(0x0000A71C0112F79B AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (29, CAST(0x0000A71C01133930 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1082]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (30, CAST(0x0000A71C01135D4D AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1078]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1078]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P18248/D19] 60B72BC0FF4E49E0924019AFC5BF4798')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (31, CAST(0x0000A71D00ABFED6 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"spotlight\",\"Id\":1083,\"PropertyTypeIds\":[57,58,59],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (32, CAST(0x0000A71D00AC56A2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"LandingPage2\",\"Id\":1084,\"PropertyTypeIds\":[60,61],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (33, CAST(0x0000A71D00AC64AF AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"spotlight\",\"Id\":1083,\"PropertyTypeIds\":[57,58,59],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (34, CAST(0x0000A71D00AC8853 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1085]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (35, CAST(0x0000A71D00AC91BB AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1085]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (36, CAST(0x0000A71D00ACB59F AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"Home\",\"Id\":1056,\"PropertyTypeIds\":[41,38,39,40],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (37, CAST(0x0000A71D00ACE94C AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1086]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (38, CAST(0x0000A71D00ACF94D AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1086]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (39, CAST(0x0000A71D00AD23EA AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"LandingPage2\",\"Id\":1084,\"PropertyTypeIds\":[60,61],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (40, CAST(0x0000A71D00AD3F96 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1085]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1085]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (41, CAST(0x0000A71D00B038E7 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1087]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (42, CAST(0x0000A71D00B059A7 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1088]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (43, CAST(0x0000A71D00B077BA AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1089]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D2] 76D48B5C624F4FF4B099DEC11C28FCBD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (44, CAST(0x0000A71D00B1E27A AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"dataFolder\",\"Id\":1090,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (45, CAST(0x0000A71D00B1EAD6 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"dataFolder\",\"Id\":1090,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (46, CAST(0x0000A71D00B1F2CA AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"dataFolder\",\"Id\":1090,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (47, CAST(0x0000A71D00B200C5 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1091]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (48, CAST(0x0000A71D00B21988 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"dataFolder\",\"Id\":1090,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (49, CAST(0x0000A71D00B22510 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1092]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (50, CAST(0x0000A71D00B23380 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1093]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (51, CAST(0x0000A71D00B23FA2 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1094]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (52, CAST(0x0000A71D00B247D0 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1095]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (53, CAST(0x0000A71D00B251BF AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1092]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (54, CAST(0x0000A71D00B259D5 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1092,1093,1094,1095]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (55, CAST(0x0000A71D00B29FCE AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage3\",\"Id\":1096,\"PropertyTypeIds\":[71,72],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (56, CAST(0x0000A71D00B2AF02 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1097]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D3] 66D8ED42F78F486FB57E6AD97B6D8A58')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (57, CAST(0x0000A71D00B2D97C AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage3\",\"Id\":1096,\"PropertyTypeIds\":[71,72],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D4] F8BD4147533849808457591360633316')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (58, CAST(0x0000A71D00B38A28 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"UniqueId\":\"f0a34019-d28b-4aba-8037-7920f86710b2\",\"Id\":1098}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D4] F8BD4147533849808457591360633316')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (59, CAST(0x0000A71D00B3B430 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage3\",\"Id\":1096,\"PropertyTypeIds\":[71,72,73],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D4] F8BD4147533849808457591360633316')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (60, CAST(0x0000A71D00B3C441 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D4] F8BD4147533849808457591360633316')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (61, CAST(0x0000A71D00B3CC59 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D4] F8BD4147533849808457591360633316')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (62, CAST(0x0000A71D00B3D38C AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D4] F8BD4147533849808457591360633316')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (63, CAST(0x0000A71D00B3EA46 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"Home\",\"Id\":1056,\"PropertyTypeIds\":[41,38,39,40],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D4] F8BD4147533849808457591360633316')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (64, CAST(0x0000A71D00B3F468 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D4] F8BD4147533849808457591360633316')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (65, CAST(0x0000A71D00B3FF68 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D4] F8BD4147533849808457591360633316')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (66, CAST(0x0000A71D00B40C20 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D4] F8BD4147533849808457591360633316')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (67, CAST(0x0000A71D00B62597 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"UniqueId\":\"7787cc97-81d1-4049-9453-79644127e7ca\",\"Id\":1100}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D13] B407999EC48B45AABBA62D12C896892D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (68, CAST(0x0000A71D00B64C07 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage4\",\"Id\":1101,\"PropertyTypeIds\":[74,76,75],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D13] B407999EC48B45AABBA62D12C896892D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (69, CAST(0x0000A71D00B66F22 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage4\",\"Id\":1101,\"PropertyTypeIds\":[74,76,77],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D13] B407999EC48B45AABBA62D12C896892D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (70, CAST(0x0000A71D00B67C73 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"Home\",\"Id\":1056,\"PropertyTypeIds\":[41,38,39,40],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D13] B407999EC48B45AABBA62D12C896892D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (71, CAST(0x0000A71D00B6B60B AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D13] B407999EC48B45AABBA62D12C896892D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (72, CAST(0x0000A71D00B77D82 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (73, CAST(0x0000A71D00B78ECB AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (74, CAST(0x0000A71D00B79D9E AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (75, CAST(0x0000A71D00B7B009 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage4\",\"Id\":1101,\"PropertyTypeIds\":[74,76,77],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (76, CAST(0x0000A71D00B7C007 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (77, CAST(0x0000A71D00B7CF9B AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage4\",\"Id\":1101,\"PropertyTypeIds\":[74,76,77],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (78, CAST(0x0000A71D00B80E97 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (79, CAST(0x0000A71D00B82249 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (80, CAST(0x0000A71D00B8286C AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (81, CAST(0x0000A71D00B832A8 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage4\",\"Id\":1101,\"PropertyTypeIds\":[74,76,77],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (82, CAST(0x0000A71D00B8ED02 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (83, CAST(0x0000A71D00B9572B AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (84, CAST(0x0000A71D00BA0220 AS DateTime), N'[{"RefreshType":0,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (85, CAST(0x0000A71D00BA5925 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Path\":\"-1,1105\",\"Id\":1105,\"Operation\":0}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (86, CAST(0x0000A71D00BA8B01 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (87, CAST(0x0000A71D00BAC224 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (88, CAST(0x0000A71D00BAE778 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage3\",\"Id\":1096,\"PropertyTypeIds\":[71,73,72],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (89, CAST(0x0000A71D00BAEDDD AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage4\",\"Id\":1101,\"PropertyTypeIds\":[74,77,76],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (90, CAST(0x0000A71D00BB2217 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage3\",\"Id\":1096,\"PropertyTypeIds\":[71,72,73],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (91, CAST(0x0000A71D00BB5B02 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage4\",\"Id\":1101,\"PropertyTypeIds\":[74,77,76],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (92, CAST(0x0000A71D00BB648C AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage4\",\"Id\":1101,\"PropertyTypeIds\":[74,76,77],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P16348/D14] C4E5A91FD74241E5AB80193B6BC1A16D')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (93, CAST(0x0000A71D00DCB1C8 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"UniqueId\":\"909cd8d5-0a33-44f9-8d54-d878416d8bfc\",\"Id\":1106}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D2] F35B816B71DA4A34860FF7B65586B612')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (94, CAST(0x0000A71D00DCDC4B AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"spotlightWithReuse\",\"Id\":1107,\"PropertyTypeIds\":[78],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D2] F35B816B71DA4A34860FF7B65586B612')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (95, CAST(0x0000A71D00DD00A5 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage5\",\"Id\":1108,\"PropertyTypeIds\":[79,80,81],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D2] F35B816B71DA4A34860FF7B65586B612')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (96, CAST(0x0000A71D00DD2B57 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"UniqueId\":\"80c4957d-2989-4b03-a9ed-d3e0f0b6088f\",\"Id\":1109}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D2] F35B816B71DA4A34860FF7B65586B612')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (97, CAST(0x0000A71D00DD5AF7 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage5\",\"Id\":1108,\"PropertyTypeIds\":[79,80,82],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D2] F35B816B71DA4A34860FF7B65586B612')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (98, CAST(0x0000A71D00DD90F2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"Home\",\"Id\":1056,\"PropertyTypeIds\":[41,38,39,40],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D2] F35B816B71DA4A34860FF7B65586B612')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (99, CAST(0x0000A71D00DDA3AC AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1110]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D2] F35B816B71DA4A34860FF7B65586B612')
GO
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (100, CAST(0x0000A71D00DDB496 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1110]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D2] F35B816B71DA4A34860FF7B65586B612')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (101, CAST(0x0000A71D00DDCA62 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1111]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D2] F35B816B71DA4A34860FF7B65586B612')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (102, CAST(0x0000A71D00DDFDA7 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"landingPage5\",\"Id\":1108,\"PropertyTypeIds\":[79,80,82],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D3] B06CC625011248048857BFCA8890F1FE')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (103, CAST(0x0000A71D00DE0C8B AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1110]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1110]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D3] B06CC625011248048857BFCA8890F1FE')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (104, CAST(0x0000A71D00DE1F6E AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1110]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1110]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D3] B06CC625011248048857BFCA8890F1FE')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (105, CAST(0x0000A71D00DE6969 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1110]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1110]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D3] B06CC625011248048857BFCA8890F1FE')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (106, CAST(0x0000A71D00DEA056 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"UniqueId\":\"a4fd129c-a6d1-4d4b-9d28-21c2b29570f6\",\"Id\":1080}]"}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D3] B06CC625011248048857BFCA8890F1FE')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (107, CAST(0x0000A71D00DEC53D AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1110]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1110]","JsonPayload":null}]', N'LOPCABUTLAND//LM/W3SVC/2/ROOT [P11344/D3] B06CC625011248048857BFCA8890F1FE')
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName]) VALUES (1, N'en-US', N'en-US')
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1, 0, -1, CAST(0x0000A71C01195851 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (2, 0, -1, CAST(0x0000A71C01195864 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (3, 0, -1, CAST(0x0000A71C01195888 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (4, 0, -1, CAST(0x0000A71C011958C3 AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (5, 0, -1, CAST(0x0000A71C0119592D AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (6, 0, -1, CAST(0x0000A71C01195931 AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (7, 0, -1, CAST(0x0000A71C01195936 AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (8, 0, -1, CAST(0x0000A71C0119593A AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (9, 0, -1, CAST(0x0000A71C0119593D AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (10, 0, -1, CAST(0x0000A71C0119593F AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (11, 0, -1, CAST(0x0000A71C01195940 AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (12, 0, -1, CAST(0x0000A71C01195943 AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (13, 0, -1, CAST(0x0000A71C01195945 AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (14, 0, -1, CAST(0x0000A71C01195946 AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (15, 0, -1, CAST(0x0000A71C01195947 AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (16, 0, -1, CAST(0x0000A71C011959AC AS DateTime), N'Save', N'Bulk Save content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (17, 0, 1059, CAST(0x0000A71C01195A4F AS DateTime), N'Publish', N'Publish with Children performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (18, 0, 0, CAST(0x0000A71C011BA966 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (19, 0, 1077, CAST(0x0000A71C011C7AD5 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (20, 0, 1075, CAST(0x0000A71C011C8EE6 AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (21, 0, 1078, CAST(0x0000A71C011CB15E AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (22, 0, -1, CAST(0x0000A71C011D32BE AS DateTime), N'Delete', N'Delete Content of Type 1077 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (23, 0, 1077, CAST(0x0000A71C011D32EB AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (24, 0, 1079, CAST(0x0000A71C011D3F6F AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (25, 0, 1056, CAST(0x0000A71C011D583B AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (26, 0, 1079, CAST(0x0000A71C011D9D4C AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (27, 0, 1079, CAST(0x0000A71C011E4AAE AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (28, 0, -1, CAST(0x0000A71C011E9B26 AS DateTime), N'PackagerInstall', N'Package ''RJP.MultiUrlPicker'' installed. Package guid: a0577f79-d05e-4cf9-a7bb-f3368826a571')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (29, 0, -1, CAST(0x0000A71C011EA401 AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (30, 0, 1080, CAST(0x0000A71C011EF400 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (31, 0, 1079, CAST(0x0000A71C011F4E68 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (32, 0, 1081, CAST(0x0000A71C011F9737 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (33, 0, 1079, CAST(0x0000A71C011FB607 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (34, 0, 1082, CAST(0x0000A71C011FFD17 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (35, 0, 1082, CAST(0x0000A71C012007E7 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (36, 0, 1079, CAST(0x0000A71C01201FEE AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (37, 0, 1078, CAST(0x0000A71C012029F6 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (38, 0, 1078, CAST(0x0000A71C01202A32 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (39, 0, 1078, CAST(0x0000A71C0120F82C AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (40, 0, 1082, CAST(0x0000A71C012198E6 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (41, 0, 1082, CAST(0x0000A71C0121BE06 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (42, 0, 1082, CAST(0x0000A71C0121CDAC AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (43, 0, 1082, CAST(0x0000A71C012200CD AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (44, 0, 1082, CAST(0x0000A71C012225FD AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (45, 0, 1082, CAST(0x0000A71C012237B3 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (46, 0, 1082, CAST(0x0000A71C0122B307 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (47, 0, 1082, CAST(0x0000A71C0122CF42 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (48, 0, 1082, CAST(0x0000A71C01230424 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (49, 0, 1082, CAST(0x0000A71C01235F1B AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (50, 0, 1082, CAST(0x0000A71C0123725B AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (51, 0, 1082, CAST(0x0000A71C0123B3F0 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (52, 0, 1078, CAST(0x0000A71C0123D80A AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (53, 0, 1083, CAST(0x0000A71D00BC796B AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (54, 0, -1, CAST(0x0000A71D00BCD13D AS DateTime), N'Publish', N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (55, 0, 1084, CAST(0x0000A71D00BCD15E AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (56, 0, 1083, CAST(0x0000A71D00BCDF6B AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (57, 0, 1078, CAST(0x0000A71D00BD0312 AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (58, 0, 1085, CAST(0x0000A71D00BD0C74 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (59, 0, 1056, CAST(0x0000A71D00BD305D AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (60, 0, 1086, CAST(0x0000A71D00BD6409 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (61, 0, 1086, CAST(0x0000A71D00BD740A AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (62, 0, 1084, CAST(0x0000A71D00BD9E8F AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (63, 0, 1085, CAST(0x0000A71D00BDBA40 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (64, 0, 1085, CAST(0x0000A71D00BDBA51 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (65, 0, 0, CAST(0x0000A71D00BDC580 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (66, 0, 0, CAST(0x0000A71D00BDE1B5 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (67, 0, 1087, CAST(0x0000A71D00C0B3A3 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (68, 0, 0, CAST(0x0000A71D00C0B722 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (69, 0, 1088, CAST(0x0000A71D00C0D464 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (70, 0, 0, CAST(0x0000A71D00C0D71F AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (71, 0, 1089, CAST(0x0000A71D00C0F276 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (72, 0, 1090, CAST(0x0000A71D00C25D1D AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (73, 0, 1090, CAST(0x0000A71D00C26593 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (74, 0, 1090, CAST(0x0000A71D00C26D7D AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (75, 0, 0, CAST(0x0000A71D00C272FD AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (76, 0, 1091, CAST(0x0000A71D00C27888 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (77, 0, 1090, CAST(0x0000A71D00C29429 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (78, 0, 0, CAST(0x0000A71D00C298A0 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (79, 0, 1092, CAST(0x0000A71D00C29E6C AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (80, 0, 1087, CAST(0x0000A71D00C2AE3E AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (81, 0, 1088, CAST(0x0000A71D00C2BA5B AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (82, 0, 1089, CAST(0x0000A71D00C2C28E AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (83, 0, 1092, CAST(0x0000A71D00C2CC7C AS DateTime), N'Publish', N'Publish with Children performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (84, 0, 1092, CAST(0x0000A71D00C2D494 AS DateTime), N'Publish', N'Publish with Children performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (85, 0, -1, CAST(0x0000A71D00C31A3F AS DateTime), N'Publish', N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (86, 0, 1096, CAST(0x0000A71D00C31A8A AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (87, 0, 1097, CAST(0x0000A71D00C329BE AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (88, 0, 1096, CAST(0x0000A71D00C35426 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (89, 0, 1098, CAST(0x0000A71D00C404E6 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (90, 0, 1096, CAST(0x0000A71D00C42EEB AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (91, 0, 1085, CAST(0x0000A71D00C43EFE AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (92, 0, 1099, CAST(0x0000A71D00C44711 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (93, 0, 1099, CAST(0x0000A71D00C44E13 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (94, 0, 1099, CAST(0x0000A71D00C44E46 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (95, 0, 1056, CAST(0x0000A71D00C46505 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (96, 0, 1099, CAST(0x0000A71D00C46F12 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (97, 0, 1099, CAST(0x0000A71D00C46F24 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (98, 0, 1099, CAST(0x0000A71D00C47A25 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (99, 0, 1099, CAST(0x0000A71D00C486DC AS DateTime), N'Publish', N'Save and Publish performed by user')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (100, 0, -1, CAST(0x0000A71D00C5DE08 AS DateTime), N'PackagerInstall', N'Package ''Nested Content'' installed. Package guid: f7f45e5e-526f-4682-a3fc-7b35d657a7b8')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (101, 0, -1, CAST(0x0000A71D00C5E7D1 AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (102, 0, 1100, CAST(0x0000A71D00C6A052 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (103, 0, -1, CAST(0x0000A71D00C6C697 AS DateTime), N'Publish', N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (104, 0, 1101, CAST(0x0000A71D00C6C6C4 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (105, 0, 0, CAST(0x0000A71D00C6E3A3 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (106, 0, 1101, CAST(0x0000A71D00C6E9DE AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (107, 0, 1056, CAST(0x0000A71D00C6F732 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (108, 0, 0, CAST(0x0000A71D00C6F975 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (109, 0, 1102, CAST(0x0000A71D00C730C7 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (110, 0, 1099, CAST(0x0000A71D00C7F83E AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (111, 0, 1103, CAST(0x0000A71D00C806AD AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (112, 0, 1103, CAST(0x0000A71D00C8185B AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (113, 0, 0, CAST(0x0000A71D00C81EB6 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (114, 0, 1101, CAST(0x0000A71D00C82AAB AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (115, 0, 1103, CAST(0x0000A71D00C83AC3 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (116, 0, 0, CAST(0x0000A71D00C84093 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (117, 0, 1101, CAST(0x0000A71D00C84A4F AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (118, 0, 1103, CAST(0x0000A71D00C88956 AS DateTime), N'Delete', N'Trashed content with Id: ''1103'' related to original parent content with Id: ''1059''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (119, 0, 1103, CAST(0x0000A71D00C88956 AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (120, 0, 0, CAST(0x0000A71D00C89141 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (121, 0, 0, CAST(0x0000A71D00C89192 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (122, 0, 1104, CAST(0x0000A71D00C89D05 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (123, 0, 0, CAST(0x0000A71D00C89D61 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (124, 0, 1104, CAST(0x0000A71D00C8A329 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (125, 0, 0, CAST(0x0000A71D00C8A643 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (126, 0, 1101, CAST(0x0000A71D00C8AD4E AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (127, 0, 0, CAST(0x0000A71D00C8B233 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (128, 0, 0, CAST(0x0000A71D00C90013 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (129, 0, 0, CAST(0x0000A71D00C91241 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (130, 0, 1104, CAST(0x0000A71D00C967BE AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (131, 0, 1104, CAST(0x0000A71D00C9D1E7 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (132, 0, 0, CAST(0x0000A71D00CAD3AD AS DateTime), N'New', N'Media ''1912289_753997844648209_7099291360101379579_o.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (133, 0, 1105, CAST(0x0000A71D00CAD3E2 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (134, 0, 1104, CAST(0x0000A71D00CB05BB AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (135, 0, 0, CAST(0x0000A71D00CB0DD5 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (136, 0, 0, CAST(0x0000A71D00CB1299 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (137, 0, 0, CAST(0x0000A71D00CB1510 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (138, 0, 0, CAST(0x0000A71D00CB2AA7 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (139, 0, 1104, CAST(0x0000A71D00CB3CE0 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (140, 0, 1096, CAST(0x0000A71D00CB621F AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (141, 0, 0, CAST(0x0000A71D00CB63EA AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (142, 0, 1101, CAST(0x0000A71D00CB689A AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (143, 0, 1096, CAST(0x0000A71D00CB9CB7 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (144, 0, 0, CAST(0x0000A71D00CBA1A1 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (145, 0, 1101, CAST(0x0000A71D00CBD5B4 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (146, 0, 1101, CAST(0x0000A71D00CBDF3E AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (147, 0, 0, CAST(0x0000A71D00CBEA5F AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (148, 0, 0, CAST(0x0000A71D00ECA350 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (149, 0, 1106, CAST(0x0000A71D00ED2C84 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (150, 0, 1107, CAST(0x0000A71D00ED56F6 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (151, 0, 0, CAST(0x0000A71D00ED6317 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (152, 0, -1, CAST(0x0000A71D00ED7B4A AS DateTime), N'Publish', N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (153, 0, 1108, CAST(0x0000A71D00ED7B64 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (154, 0, 1109, CAST(0x0000A71D00EDA615 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (155, 0, 0, CAST(0x0000A71D00EDABAF AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (156, 0, 0, CAST(0x0000A71D00EDD26A AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (157, 0, 1108, CAST(0x0000A71D00EDD5B3 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (158, 0, 1056, CAST(0x0000A71D00EE0BB1 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (159, 0, 1104, CAST(0x0000A71D00EE1E6B AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (160, 0, 0, CAST(0x0000A71D00EE2200 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (161, 0, 1110, CAST(0x0000A71D00EE2E01 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (162, 0, 1111, CAST(0x0000A71D00EE451F AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (163, 0, 0, CAST(0x0000A71D00EE66A0 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (164, 0, 1108, CAST(0x0000A71D00EE7853 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (165, 0, 1110, CAST(0x0000A71D00EE8714 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (166, 0, 1110, CAST(0x0000A71D00EE8747 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (167, 0, 0, CAST(0x0000A71D00EE8D37 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (168, 0, 0, CAST(0x0000A71D00EE8E9D AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (169, 0, 0, CAST(0x0000A71D00EE93E6 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (170, 0, 0, CAST(0x0000A71D00EE96C3 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (171, 0, 1110, CAST(0x0000A71D00EE9A29 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (172, 0, 0, CAST(0x0000A71D00EE9B2B AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (173, 0, 0, CAST(0x0000A71D00EE9CDE AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (174, 0, 0, CAST(0x0000A71D00EEB002 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (175, 0, 0, CAST(0x0000A71D00EEB21E AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (176, 0, 1110, CAST(0x0000A71D00EEE426 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (177, 0, 1080, CAST(0x0000A71D00EF1B14 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (178, 0, 0, CAST(0x0000A71D00EF2020 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (179, 0, 1110, CAST(0x0000A71D00EF3FF9 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (180, 0, 0, CAST(0x0000A71D00F0D838 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (181, 0, 0, CAST(0x0000A71D00F0DFF7 AS DateTime), N'New', N'Content '''' was created')
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
SET IDENTITY_INSERT [dbo].[umbracoMigration] ON 

INSERT [dbo].[umbracoMigration] ([id], [name], [createDate], [version]) VALUES (1, N'Umbraco', CAST(0x0000A71C01194096 AS DateTime), N'7.5.9')
SET IDENTITY_INSERT [dbo].[umbracoMigration] OFF
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-331, 0, -1, 0, 1, N'-1,-331', -1, N'0af5e610-a310-4b6f-925f-e928d5416af7', N'LOCK: Servers', N'87a9f1ff-b1e4-4a25-babb-465a4a47ec41', CAST(0x0000A71C01193FD0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-97, 0, -1, 0, 1, N'-1,-97', 2, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-96, 0, -1, 0, 1, N'-1,-96', 2, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-95, 0, -1, 0, 1, N'-1,-95', 2, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-92, 0, -1, 0, 1, N'-1,-92', 35, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', N'Label', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-90, 0, -1, 0, 1, N'-1,-90', 34, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-89, 0, -1, 0, 1, N'-1,-89', 33, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-88, 0, -1, 0, 1, N'-1,-88', 32, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-87, 0, -1, 0, 1, N'-1,-87', 4, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-51, 0, -1, 0, 1, N'-1,-51', 2, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-49, 0, -1, 0, 1, N'-1,-49', 2, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-43, 0, -1, 0, 1, N'-1,-43', 2, N'fbaf13a8-4036-41f2-93a3-974f678c312a', N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-42, 0, -1, 0, 1, N'-1,-42', 2, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-41, 0, -1, 0, 1, N'-1,-41', 2, N'5046194e-4237-453c-a547-15db3a07c4e1', N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-40, 0, -1, 0, 1, N'-1,-40', 2, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-39, 0, -1, 0, 1, N'-1,-39', 2, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-37, 0, -1, 0, 1, N'-1,-37', 2, N'0225af17-b302-49cb-9176-b9f35cab9c17', N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-36, 0, -1, 0, 1, N'-1,-36', 2, N'e4d66c0f-b935-4200-81f0-025f7256b89a', N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-21, 0, -1, 0, 0, N'-1,-21', 0, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(0x0000A71C01193FCB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-20, 0, -1, 0, 0, N'-1,-20', 0, N'0f582a79-1e41-4cf0-bfa0-76340651891a', N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(0x0000A71C01193FCB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-1, 0, -1, 0, 0, N'-1', 0, N'916724a5-173d-4619-b97e-b9de133dd6f5', N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(0x0000A71C01193FC8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1031, 0, -1, 0, 1, N'-1,1031', 2, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A71C01193FCE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1032, 0, -1, 0, 1, N'-1,1032', 2, N'cc07b313-0843-4aa8-bbda-871c8da728c8', N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A71C01193FCE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1033, 0, -1, 0, 1, N'-1,1033', 2, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A71C01193FCE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1034, 0, -1, 0, 1, N'-1,1034', 2, N'a6857c73-d6e9-480c-b6e6-f15f6ad11125', N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1035, 0, -1, 0, 1, N'-1,1035', 2, N'93929b9a-93a2-4e2a-b239-d99334440a59', N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1036, 0, -1, 0, 1, N'-1,1036', 2, N'2b24165f-9782-4aa3-b459-1de4a4d21f60', N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1040, 0, -1, 0, 1, N'-1,1040', 2, N'21e798da-e06e-4eda-a511-ed257f78d4fa', N'Related Links', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1041, 0, -1, 0, 1, N'-1,1041', 2, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1043, 0, -1, 0, 1, N'-1,1043', 2, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FCF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1044, 0, -1, 0, 1, N'-1,1044', 0, N'd59be02f-1df9-4228-aa1e-01917d806cda', N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(0x0000A71C01193FCF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1045, 0, -1, 0, 1, N'-1,1045', 2, N'7e3962cc-ce20-4ffc-b661-5897a894ba7e', N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C01193FD0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1046, 0, -1, 0, 1, N'-1,1046', 24, N'a3785f08-73d5-406b-855f-8e52805c22e2', N'Grid Blogpost', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C0119583B AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1047, 0, -1, 0, 1, N'-1,1047', 25, N'bc957e81-2cdc-4fe3-bab2-ca4110cdff68', N'Grid FrontPage', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C0119584C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1048, 0, -1, 0, 1, N'-1,1048', 26, N'21944c98-8e32-4475-807d-61a60c1ab070', N'Grid TextPage', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C0119584E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1049, 0, -1, NULL, 1, N'-1,1049', 0, N'c2c63760-2fe4-42cf-9f7e-f86b280c8ead', N'Master', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A71C0119586F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1050, 0, 1049, NULL, 1, N'-1,1049,1050', 0, N'7f9a50f0-8473-45e8-8e35-f55d75d9c64b', N'Blog Overview', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A71C01195878 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1051, 0, 1049, NULL, 1, N'-1,1049,1051', 0, N'f6cdc78a-7421-4169-a20d-ffe322f80d05', N'Blog Post', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A71C01195880 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1052, 0, 1049, NULL, 1, N'-1,1049,1052', 0, N'61109e66-0578-4ea8-9f39-284278fa759d', N'Home', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A71C01195883 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1053, 0, 1049, NULL, 1, N'-1,1049,1053', 0, N'e58ce053-1583-4971-9b21-6cd874537cd5', N'Text page', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A71C01195885 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1054, 0, -1, 0, 1, N'-1,1054', 0, N'd3c7b31a-bd04-4a5b-ad67-42ed44ffa79a', N'Blog Post', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71C011958AD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1055, 0, -1, 0, 1, N'-1,1055', 1, N'9823685f-f172-4f3d-a2b4-1f6b04809e29', N'Blog Post Repository', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71C011958B7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1056, 0, -1, 0, 1, N'-1,1056', 9, N'c9d3b616-45e4-418a-aa2c-f3a25e55c67d', N'Home', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71C011958BA AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1057, 0, -1, 0, 1, N'-1,1057', 3, N'3a2b79d1-3a19-4208-9858-a234c7c1de3d', N'Landing Page', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71C011958BE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1058, 0, -1, 0, 1, N'-1,1058', 4, N'1c9bab7d-019b-4207-a9e3-1d59702e8150', N'Text Page', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71C011958C0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1059, 0, -1, 0, 1, N'-1,1059', 0, N'fe969938-1e65-45e8-b8f3-60a2a4e879fe', N'Home', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C01195954 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1060, 0, 1059, 0, 2, N'-1,1059,1060', 0, N'ffb4eed3-a064-4ea8-8478-d89a0a06e710', N'Learn', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C01195978 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1061, 0, 1060, 0, 3, N'-1,1059,1060,1061', 0, N'f2f2288d-d7b3-4e85-9a80-c00c3213de65', N'The starter kit', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C0119597D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1062, 0, 1060, 0, 3, N'-1,1059,1060,1062', 1, N'19810dc0-8fc8-4a01-9261-b2c8e2b83311', N'Basics', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C01195980 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1063, 0, 1060, 0, 3, N'-1,1059,1060,1063', 2, N'90b0cb02-1447-48ff-912b-fc3bc8cdd3cd', N'Masterclasses', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C01195983 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1064, 0, 1059, 0, 2, N'-1,1059,1064', 1, N'7df2df79-2df6-493e-85b4-62340dd6dfd6', N'Explore', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C01195986 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1065, 0, 1064, 0, 3, N'-1,1059,1064,1065', 0, N'61d90ec6-b3a8-4c44-959a-9efee4f73dbd', N'Our Umbraco', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C01195989 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1066, 0, 1064, 0, 3, N'-1,1059,1064,1066', 1, N'db304a88-9f5b-447b-b1f1-5788faf2ef04', N'Codegarden', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C0119598C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1067, 0, 1064, 0, 3, N'-1,1059,1064,1067', 2, N'a8dc7604-6d87-404a-adbf-2c4e5cd3e089', N'Meetup groups', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C0119598F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1068, 0, 1059, 0, 2, N'-1,1059,1068', 2, N'e61ade6c-823c-4287-9fbd-b280281745e5', N'Extend', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C01195992 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1069, 0, 1068, 0, 3, N'-1,1059,1068,1069', 0, N'7a559f1d-7682-403c-ae2b-5d19a678ee4c', N'Umbraco Forms', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C01195996 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1070, 0, 1068, 0, 3, N'-1,1059,1068,1070', 1, N'fbda6122-4271-4b47-beb7-4b2f71e673d5', N'Package repository', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C01195999 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1071, 0, 1059, 0, 2, N'-1,1059,1071', 3, N'2d70dc1c-3c95-4475-8e4c-ea5f25b6698c', N'Blog', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C0119599C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1072, 0, 1071, 0, 3, N'-1,1059,1071,1072', 0, N'0afcd916-446a-4ae1-b089-b26227e7fbda', N'Tall trees have deep roots', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C0119599F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1073, 0, 1071, 0, 3, N'-1,1059,1071,1073', 1, N'fb10eb0f-4d5d-4a37-bdd1-93e4730a8b8b', N'Different Flowers Make a Bouquet', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C011959A2 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1074, 0, 1071, 0, 3, N'-1,1059,1071,1074', 2, N'98b39820-427c-43b5-9ea5-7258d9383209', N'Only the curious have something to find', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C011959A5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1075, 0, 1059, 0, 2, N'-1,1059,1075', 4, N'f14745f4-ba09-403a-8ba5-1ebe2ec6b793', N'Contact', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C011959A9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1076, 0, -1, 0, 1, N'-1,1076', 0, N'9d41742b-fecf-458d-b04f-51e61fc08c1a', N'Demo', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(0x0000A71C011B0198 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1078, 0, 1059, 0, 2, N'-1,1059,1078', 5, N'22388436-2fa9-49d1-a6cf-395fec8cef96', N'Contact (1)', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71C011C8ED6 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1079, 0, 1076, 0, 2, N'-1,1076,1079', 6, N'ccf6edd1-95f4-4fff-b71f-cf70cb040662', N'Landing Page (1)', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71C011D3936 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1080, 0, -1, 0, 1, N'-1,1080', 27, N'a4fd129c-a6d1-4d4b-9d28-21c2b29570f6', N'Single Url Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C011EF3E0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1081, 0, -1, 0, 1, N'-1,1081', 28, N'87748673-5c98-42a6-a549-bc94b3b86f9d', N'Landing Page (1) - Signpost copy (3) - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71C011F9734 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1082, 0, 1049, NULL, 1, N'-1,1049,1082', 0, N'ea9c4e84-5748-454f-8035-884df00ba6e1', N'Landing page (1)', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A71C011FFD0E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1083, 0, 1076, 0, 2, N'-1,1076,1083', 8, N'688b3c53-5d44-432d-8a90-21bcc6d9b751', N'Spotlight', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71D00BC793F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1084, 0, 1076, 0, 2, N'-1,1076,1084', 9, N'56d8d7ba-5c4c-410c-81c8-86cb14ef5826', N'Landing Page (2)', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71D00BC8EB6 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1085, 0, 1059, 0, 2, N'-1,1059,1085', 6, N'b17f9c56-7f8d-4e5b-8240-bc179b1ac881', N'Contact (2)', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00BD02E9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1086, 0, 1049, NULL, 1, N'-1,1049,1086', 0, N'f89f8613-0347-4368-860f-5b7a0516d9e8', N'Landing page (2)', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A71D00BD63FF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1087, 0, 1085, 0, 3, N'-1,1059,1085,1087', 0, N'8a3edea7-93aa-4f78-b33f-9e02223fda14', N'The forum', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00C0B38A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1088, 0, 1085, 0, 3, N'-1,1059,1085,1088', 1, N'3fbe2a82-20f8-4da4-b019-14615eb014cb', N'Getting help', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00C0D44F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1089, 0, 1085, 0, 3, N'-1,1059,1085,1089', 2, N'9fcf83eb-e65a-445a-92af-2ab337cf47f8', N'Get in touch', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00C0F261 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1090, 0, 1076, 0, 2, N'-1,1076,1090', 12, N'729ed7c8-5c50-4b81-bce1-a3fea7a3f697', N'Folder', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71D00C25CFC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1091, 0, -1, 0, 1, N'-1,1091', 1, N'12b0085e-9959-474b-a9bc-6da1d6fecea3', N'Data', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00C2784D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1092, 0, 1091, 0, 2, N'-1,1091,1092', 0, N'00a48818-8aac-4703-930f-3861c77f268f', N'Spotlights', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00C29E57 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1093, 0, 1092, 0, 3, N'-1,1091,1092,1093', 0, N'75fcff75-75dc-434f-acaf-4ab0d38418bc', N'The forum', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00C2AE35 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1094, 0, 1092, 0, 3, N'-1,1091,1092,1094', 1, N'44633af8-dad4-47de-8298-09938516b8e5', N'Getting help', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00C2B9F7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1095, 0, 1092, 0, 3, N'-1,1091,1092,1095', 2, N'82c4d7ef-1542-4a76-b405-dec62ace9b54', N'Get in touch', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00C2C28A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1096, 0, 1076, 0, 2, N'-1,1076,1096', 23, N'ccbf8b10-58d8-4229-aecb-864ad966ffe7', N'Landing Page (3)', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71D00C2EE86 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1097, 0, 1049, NULL, 1, N'-1,1049,1097', 0, N'3902013f-b6e3-45c1-9139-65c8e3c03d71', N'Landing page (3)', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A71D00C329B5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1098, 0, -1, 0, 1, N'-1,1098', 29, N'f0a34019-d28b-4aba-8037-7920f86710b2', N'Spotlight picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71D00C404DA AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1099, 0, 1059, 0, 2, N'-1,1059,1099', 7, N'0f8cc586-bb24-47dd-ba82-140f45fa4913', N'Contact (3)', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00C43EE3 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1100, 0, -1, 0, 1, N'-1,1100', 30, N'7787cc97-81d1-4049-9453-79644127e7ca', N'Spotlight nested content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71D00C6A031 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1101, 0, 1076, 0, 2, N'-1,1076,1101', 25, N'e36e8edc-25b6-4172-9489-88a782e11ea6', N'Landing Page (4)', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71D00C6AE80 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1102, 0, 1049, NULL, 1, N'-1,1049,1102', 0, N'32cd232f-dbc4-40c4-b1b2-34704e6e9306', N'Landing page (4)', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A71D00C730BF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1103, 1, -20, 0, 1, N'-1,-20,1103', 1, N'a76fbb69-18b0-41bf-b66c-055910773f0d', N'Contact (4)', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00C7F81A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1104, 0, 1059, 0, 2, N'-1,1059,1104', 8, N'f33517f9-bf0b-4ed4-9351-1e4708e319e3', N'Contact (4)', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00C89CF4 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1105, 0, -1, 0, 1, N'-1,1105', 0, N'87ab44c9-5375-4b0b-90d6-68292d285047', N'1912289_753997844648209_7099291360101379579_o.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A71D00CAD3C9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1106, 0, -1, 0, 1, N'-1,1106', 31, N'909cd8d5-0a33-44f9-8d54-d878416d8bfc', N'Spotlight Single Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71D00ED2C67 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1107, 0, 1076, 0, 2, N'-1,1076,1107', 6, N'7e0048fb-9d63-47b4-a219-cba3f16dcaa2', N'Spotlight With Reuse', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71D00ED56DF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1108, 0, 1076, 0, 2, N'-1,1076,1108', 28, N'e6a49041-8eb8-46ad-96c8-1b82cc20e0c5', N'Landing Page (5)', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A71D00ED6032 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1109, 0, -1, 0, 1, N'-1,1109', 32, N'80c4957d-2989-4b03-a9ed-d3e0f0b6088f', N'Spotlight nested content with reuse', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A71D00EDA60B AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1110, 0, 1059, 0, 2, N'-1,1059,1110', 9, N'2f832d14-f485-45e0-aa01-de260768a5b7', N'Contact (5)', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A71D00EE1E50 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1111, 0, 1049, NULL, 1, N'-1,1049,1111', 0, N'f5519046-114e-44d9-bc22-4ea0343faeec', N'Landing page (5)', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A71D00EE4516 AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelation] ON 

INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (1, 1059, 1103, 2, CAST(0x0000A71D00C88955 AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[umbracoRelation] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost:7078/umbraco', N'LOPCABUTLAND//LM/W3SVC/2/ROOT', CAST(0x0000A71C0119837F AS DateTime), CAST(0x0000A71D00F0EFC5 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userType], [startStructureID], [startMediaID], [userName], [userLogin], [userPassword], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate]) VALUES (0, 0, 0, 1, -1, -1, N'Andy Butland', N'abutland73@gmail.com', N'th8az9oUhHSlmBymjPSQGrP4VKQ=', N'abutland73@gmail.com', N'en-GB', N'd3bdc89c-c687-48c8-ae8b-7052e9e6030e', 0, NULL, CAST(0x0000A71C01194142 AS DateTime), CAST(0x0000A71D00EC8917 AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'content')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'developer')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'forms')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'media')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'member')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'settings')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'users')
SET IDENTITY_INSERT [dbo].[umbracoUserType] ON 

INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (2, N'writer', N'Writer', N'CAH:F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (4, N'translator', N'Translator', N'AF')
SET IDENTITY_INSERT [dbo].[umbracoUserType] OFF
/****** Object:  Index [IX_cmsContent]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContent] ON [dbo].[cmsContent]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentType]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsContentType_icon]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType]
(
	[icon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentVersion_ContentId]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentVersion_ContentId] ON [dbo].[cmsContentVersion]
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentVersion_VersionId]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentVersion_VersionId] ON [dbo].[cmsContentVersion]
(
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDataType_nodeId]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDataType_nodeId] ON [dbo].[cmsDataType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDictionary_id]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDocument] ON [dbo].[cmsDocument]
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument_newest]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_cmsDocument_newest] ON [dbo].[cmsDocument]
(
	[newest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument_published]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_cmsDocument_published] ON [dbo].[cmsDocument]
(
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMacroPropertyAlias]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro]
(
	[macroAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMacroProperty_Alias]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty]
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_1]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyData_1] ON [dbo].[cmsPropertyData]
(
	[contentNodeId] ASC,
	[versionId] ASC,
	[propertytypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_2]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_2] ON [dbo].[cmsPropertyData]
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_3]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_3] ON [dbo].[cmsPropertyData]
(
	[propertytypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeUniqueID]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeUniqueID] ON [dbo].[cmsPropertyType]
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeGroupUniqueID]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [dbo].[cmsPropertyTypeGroup]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsTags]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags]
(
	[tag] ASC,
	[group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsTaskType_alias]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_cmsTaskType_alias] ON [dbo].[cmsTaskType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTemplate_nodeId]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoAccess_nodeId]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccess_nodeId] ON [dbo].[umbracoAccess]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoAccessRule]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccessRule] ON [dbo].[umbracoAccessRule]
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoDeployChecksum]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoDeployChecksum] ON [dbo].[umbracoDeployChecksum]
(
	[entityType] ASC,
	[entityGuid] ASC,
	[entityPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoLanguage_languageISOCode]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage]
(
	[languageISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLog]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog]
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoMigration]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoMigration] ON [dbo].[umbracoMigration]
(
	[name] ASC,
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeObjectType]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeObjectType] ON [dbo].[umbracoNode]
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeParentId]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeParentId] ON [dbo].[umbracoNode]
(
	[parentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeTrashed]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeTrashed] ON [dbo].[umbracoNode]
(
	[trashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeUniqueID]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoNodeUniqueID] ON [dbo].[umbracoNode]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoRedirectUrl]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRedirectUrl] ON [dbo].[umbracoRedirectUrl]
(
	[urlHash] ASC,
	[contentKey] ASC,
	[createDateUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_computerName]    Script Date: 17/02/2017 14:38:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer]
(
	[computerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoServer_isActive]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer]
(
	[isActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoUser_userLogin]    Script Date: 17/02/2017 14:38:48 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser]
(
	[userLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
ALTER TABLE [dbo].[cmsContentVersion] ADD  CONSTRAINT [DF_cmsContentVersion_VersionDate]  DEFAULT (getdate()) FOR [VersionDate]
GO
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_newest]  DEFAULT ('0') FOR [newest]
GO
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()) FOR [UniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_closed]  DEFAULT ('0') FOR [closed]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
ALTER TABLE [dbo].[umbracoMigration] ADD  CONSTRAINT [DF_umbracoMigration_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_cmsContentType_nodeId] FOREIGN KEY([contentType])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId] FOREIGN KEY([ContentId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentVersion] CHECK CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentXml] CHECK CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDataType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDataType] CHECK CONSTRAINT [FK_cmsDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDataTypePreValues]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId] FOREIGN KEY([datatypeNodeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDataTypePreValues] CHECK CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId] FOREIGN KEY([versionId])
REFERENCES [dbo].[cmsContentVersion] ([VersionId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY([propertytypeid])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY([contentNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY([ParentId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_cmsTags]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY([taskTypeId])
REFERENCES [dbo].[cmsTaskType] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_cmsTaskType_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY([parentUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser1]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoDeployDependency]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id1] FOREIGN KEY([sourceId])
REFERENCES [dbo].[umbracoDeployChecksum] ([id])
GO
ALTER TABLE [dbo].[umbracoDeployDependency] CHECK CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id1]
GO
ALTER TABLE [dbo].[umbracoDeployDependency]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id2] FOREIGN KEY([targetId])
REFERENCES [dbo].[umbracoDeployChecksum] ([id])
GO
ALTER TABLE [dbo].[umbracoDeployDependency] CHECK CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id2]
GO
ALTER TABLE [dbo].[umbracoDomains]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomains] CHECK CONSTRAINT [FK_umbracoDomains_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueID])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser_umbracoUserType_id] FOREIGN KEY([userType])
REFERENCES [dbo].[umbracoUserType] ([id])
GO
ALTER TABLE [dbo].[umbracoUser] CHECK CONSTRAINT [FK_umbracoUser_umbracoUserType_id]
GO
ALTER TABLE [dbo].[umbracoUser2app]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2app_umbracoUser_id] FOREIGN KEY([user])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2app] CHECK CONSTRAINT [FK_umbracoUser2app_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id]
GO
USE [master]
GO
ALTER DATABASE [UmbracoShowTellDemo] SET  READ_WRITE 
GO
