USE [esamikshya]
GO
/****** Object:  ForeignKey [FK_BlockInfoTable_DistrictInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlockInfoTable_DistrictInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_block]'))
ALTER TABLE [dbo].[samikshya_block] DROP CONSTRAINT [FK_BlockInfoTable_DistrictInfoTable]
GO
/****** Object:  ForeignKey [FK_ClusterInfoTable_BlockInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClusterInfoTable_BlockInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_cluster]'))
ALTER TABLE [dbo].[samikshya_cluster] DROP CONSTRAINT [FK_ClusterInfoTable_BlockInfoTable]
GO
/****** Object:  ForeignKey [FK_DistrictInfoTable_StateInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DistrictInfoTable_StateInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_district]'))
ALTER TABLE [dbo].[samikshya_district] DROP CONSTRAINT [FK_DistrictInfoTable_StateInfoTable]
GO
/****** Object:  ForeignKey [FK_samikshya_feature_permission_mapping_samikshya_features]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_feature_permission_mapping_samikshya_features]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_feature_permission_mapping]'))
ALTER TABLE [dbo].[samikshya_feature_permission_mapping] DROP CONSTRAINT [FK_samikshya_feature_permission_mapping_samikshya_features]
GO
/****** Object:  ForeignKey [FK_samikshya_feature_permission_mapping_samikshya_pemissions]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_feature_permission_mapping_samikshya_pemissions]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_feature_permission_mapping]'))
ALTER TABLE [dbo].[samikshya_feature_permission_mapping] DROP CONSTRAINT [FK_samikshya_feature_permission_mapping_samikshya_pemissions]
GO
/****** Object:  ForeignKey [FK_DownloadExcelInfo_BlockInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_BlockInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] DROP CONSTRAINT [FK_DownloadExcelInfo_BlockInfoTable]
GO
/****** Object:  ForeignKey [FK_DownloadExcelInfo_ClusterInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_ClusterInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] DROP CONSTRAINT [FK_DownloadExcelInfo_ClusterInfoTable]
GO
/****** Object:  ForeignKey [FK_DownloadExcelInfo_DistrictInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_DistrictInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] DROP CONSTRAINT [FK_DownloadExcelInfo_DistrictInfoTable]
GO
/****** Object:  ForeignKey [FK_DownloadExcelInfo_StateInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_StateInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] DROP CONSTRAINT [FK_DownloadExcelInfo_StateInfoTable]
GO
/****** Object:  ForeignKey [FK_UploadExcelInfo_DownloadExcelInfo]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UploadExcelInfo_DownloadExcelInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form_tran]'))
ALTER TABLE [dbo].[samikshya_monitoring_form_tran] DROP CONSTRAINT [FK_UploadExcelInfo_DownloadExcelInfo]
GO
/****** Object:  ForeignKey [FK_samikshya_role_scheme_samikshya_feature_permission_mapping]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_role_scheme_samikshya_feature_permission_mapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_role_scheme]'))
ALTER TABLE [dbo].[samikshya_role_scheme] DROP CONSTRAINT [FK_samikshya_role_scheme_samikshya_feature_permission_mapping]
GO
/****** Object:  ForeignKey [FK_samikshya_role_scheme_samikshya_roles]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_role_scheme_samikshya_roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_role_scheme]'))
ALTER TABLE [dbo].[samikshya_role_scheme] DROP CONSTRAINT [FK_samikshya_role_scheme_samikshya_roles]
GO
/****** Object:  ForeignKey [FK_samikshya_user_role_scheme_mapping_samikshya_role_scheme]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_user_role_scheme_mapping_samikshya_role_scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_user_role_scheme_mapping]'))
ALTER TABLE [dbo].[samikshya_user_role_scheme_mapping] DROP CONSTRAINT [FK_samikshya_user_role_scheme_mapping_samikshya_role_scheme]
GO
/****** Object:  ForeignKey [FK1_samikshya_user_role_scheme_mapping_samikshya_role_scheme]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK1_samikshya_user_role_scheme_mapping_samikshya_role_scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_user_role_scheme_mapping]'))
ALTER TABLE [dbo].[samikshya_user_role_scheme_mapping] DROP CONSTRAINT [FK1_samikshya_user_role_scheme_mapping_samikshya_role_scheme]
GO
/****** Object:  Table [dbo].[samikshya_monitoring_form_tran]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UploadExcelInfo_DownloadExcelInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form_tran]'))
ALTER TABLE [dbo].[samikshya_monitoring_form_tran] DROP CONSTRAINT [FK_UploadExcelInfo_DownloadExcelInfo]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_monitoring_form_trans_LastUpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_monitoring_form_tran] DROP CONSTRAINT [DF_samikshya_monitoring_form_trans_LastUpdatedBy]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_monitoring_form_trans_LastUpdatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_monitoring_form_tran] DROP CONSTRAINT [DF_samikshya_monitoring_form_trans_LastUpdatedTime]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form_tran]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_monitoring_form_tran]
GO
/****** Object:  Table [dbo].[samikshya_monitoring_form]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_BlockInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] DROP CONSTRAINT [FK_DownloadExcelInfo_BlockInfoTable]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_ClusterInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] DROP CONSTRAINT [FK_DownloadExcelInfo_ClusterInfoTable]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_DistrictInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] DROP CONSTRAINT [FK_DownloadExcelInfo_DistrictInfoTable]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_StateInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] DROP CONSTRAINT [FK_DownloadExcelInfo_StateInfoTable]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_monitoring_forms_LastUpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_monitoring_form] DROP CONSTRAINT [DF_samikshya_monitoring_forms_LastUpdatedBy]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_monitoring_forms_LastUpdatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_monitoring_form] DROP CONSTRAINT [DF_samikshya_monitoring_forms_LastUpdatedTime]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_monitoring_form]
GO
/****** Object:  Table [dbo].[samikshya_user_role_scheme_mapping]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_user_role_scheme_mapping_samikshya_role_scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_user_role_scheme_mapping]'))
ALTER TABLE [dbo].[samikshya_user_role_scheme_mapping] DROP CONSTRAINT [FK_samikshya_user_role_scheme_mapping_samikshya_role_scheme]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK1_samikshya_user_role_scheme_mapping_samikshya_role_scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_user_role_scheme_mapping]'))
ALTER TABLE [dbo].[samikshya_user_role_scheme_mapping] DROP CONSTRAINT [FK1_samikshya_user_role_scheme_mapping_samikshya_role_scheme]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_user_role_scheme_mapping_LastUpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_user_role_scheme_mapping] DROP CONSTRAINT [DF_samikshya_user_role_scheme_mapping_LastUpdatedBy]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_user_role_scheme_mapping_LastUpdatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_user_role_scheme_mapping] DROP CONSTRAINT [DF_samikshya_user_role_scheme_mapping_LastUpdatedTime]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_user_role_scheme_mapping]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_user_role_scheme_mapping]
GO
/****** Object:  Table [dbo].[samikshya_cluster]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClusterInfoTable_BlockInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_cluster]'))
ALTER TABLE [dbo].[samikshya_cluster] DROP CONSTRAINT [FK_ClusterInfoTable_BlockInfoTable]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_clusters_LastUpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_cluster] DROP CONSTRAINT [DF_samikshya_clusters_LastUpdatedBy]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_clusters_LastUpdatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_cluster] DROP CONSTRAINT [DF_samikshya_clusters_LastUpdatedTime]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_cluster]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_cluster]
GO
/****** Object:  Table [dbo].[samikshya_block]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlockInfoTable_DistrictInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_block]'))
ALTER TABLE [dbo].[samikshya_block] DROP CONSTRAINT [FK_BlockInfoTable_DistrictInfoTable]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_blocks_LastUpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_block] DROP CONSTRAINT [DF_samikshya_blocks_LastUpdatedBy]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_blocks_LastUpdatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_block] DROP CONSTRAINT [DF_samikshya_blocks_LastUpdatedTime]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_block]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_block]
GO
/****** Object:  Table [dbo].[samikshya_role_scheme]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_role_scheme_samikshya_feature_permission_mapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_role_scheme]'))
ALTER TABLE [dbo].[samikshya_role_scheme] DROP CONSTRAINT [FK_samikshya_role_scheme_samikshya_feature_permission_mapping]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_role_scheme_samikshya_roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_role_scheme]'))
ALTER TABLE [dbo].[samikshya_role_scheme] DROP CONSTRAINT [FK_samikshya_role_scheme_samikshya_roles]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_role_scheme_LastUpdatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_role_scheme] DROP CONSTRAINT [DF_samikshya_role_scheme_LastUpdatedTime]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_role_scheme_LastUpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_role_scheme] DROP CONSTRAINT [DF_samikshya_role_scheme_LastUpdatedBy]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_role_scheme]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_role_scheme]
GO
/****** Object:  Table [dbo].[samikshya_feature_permission_mapping]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_feature_permission_mapping_samikshya_features]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_feature_permission_mapping]'))
ALTER TABLE [dbo].[samikshya_feature_permission_mapping] DROP CONSTRAINT [FK_samikshya_feature_permission_mapping_samikshya_features]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_feature_permission_mapping_samikshya_pemissions]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_feature_permission_mapping]'))
ALTER TABLE [dbo].[samikshya_feature_permission_mapping] DROP CONSTRAINT [FK_samikshya_feature_permission_mapping_samikshya_pemissions]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_feature_permission_mapping_LastUpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_feature_permission_mapping] DROP CONSTRAINT [DF_samikshya_feature_permission_mapping_LastUpdatedBy]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_feature_permission_mapping_LastUpdatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_feature_permission_mapping] DROP CONSTRAINT [DF_samikshya_feature_permission_mapping_LastUpdatedTime]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_feature_permission_mapping]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_feature_permission_mapping]
GO
/****** Object:  Table [dbo].[samikshya_district]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DistrictInfoTable_StateInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_district]'))
ALTER TABLE [dbo].[samikshya_district] DROP CONSTRAINT [FK_DistrictInfoTable_StateInfoTable]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_districts_LastUpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_district] DROP CONSTRAINT [DF_samikshya_districts_LastUpdatedBy]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_districts_LastUpdatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_district] DROP CONSTRAINT [DF_samikshya_districts_LastUpdatedTime]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_district]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_district]
GO
/****** Object:  Table [dbo].[samikshya_feature]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_features_LastUpdatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_feature] DROP CONSTRAINT [DF_samikshya_features_LastUpdatedTime]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_features_LastUpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_feature] DROP CONSTRAINT [DF_samikshya_features_LastUpdatedBy]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_feature]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_feature]
GO
/****** Object:  Table [dbo].[samikshya_state]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_state]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_state]
GO
/****** Object:  Table [dbo].[samikshya_user]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_user]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_user]
GO
/****** Object:  Table [dbo].[samikshya_pemission]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_pemissions_LastUpdatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_pemission] DROP CONSTRAINT [DF_samikshya_pemissions_LastUpdatedTime]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_pemissions_LastUpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_pemission] DROP CONSTRAINT [DF_samikshya_pemissions_LastUpdatedBy]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_pemission]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_pemission]
GO
/****** Object:  Table [dbo].[samikshya_role]    Script Date: 05/20/2014 18:44:21 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_roles_LastUpdatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_role] DROP CONSTRAINT [DF_samikshya_roles_LastUpdatedTime]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_samikshya_roles_LastUpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[samikshya_role] DROP CONSTRAINT [DF_samikshya_roles_LastUpdatedBy]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_role]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_role]
GO
/****** Object:  Table [dbo].[samikshya_area_mapper]    Script Date: 05/20/2014 18:44:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_area_mapper]') AND type in (N'U'))
DROP TABLE [dbo].[samikshya_area_mapper]
GO
/****** Object:  Table [dbo].[samikshya_area_mapper]    Script Date: 05/20/2014 18:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_area_mapper]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_area_mapper](
	[id] [int] NOT NULL,
	[parent_code] [nvarchar](100) NOT NULL,
	[child_code] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_samikshya_area_mapper] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[samikshya_role]    Script Date: 05/20/2014 18:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_code] [nvarchar](50) NOT NULL,
	[role_name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[last_updated_date] [datetime] NOT NULL CONSTRAINT [DF_samikshya_roles_LastUpdatedTime]  DEFAULT (getdate()),
	[last_updated_by] [nvarchar](100) NOT NULL CONSTRAINT [DF_samikshya_roles_LastUpdatedBy]  DEFAULT ('System'),
 CONSTRAINT [PK_samikshya_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[samikshya_pemission]    Script Date: 05/20/2014 18:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_pemission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_pemission](
	[permission_id] [int] IDENTITY(1,1) NOT NULL,
	[permission_code] [nvarchar](50) NOT NULL,
	[permission_name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[last_updated_date] [datetime] NOT NULL CONSTRAINT [DF_samikshya_pemissions_LastUpdatedTime]  DEFAULT (getdate()),
	[last_updated_by] [nvarchar](50) NOT NULL CONSTRAINT [DF_samikshya_pemissions_LastUpdatedBy]  DEFAULT ('System'),
 CONSTRAINT [PK_samikshya_pemissions] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[samikshya_user]    Script Date: 05/20/2014 18:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_user]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_user](
	[user_id] [int] NOT NULL,
	[user_name] [varchar](100) NULL,
	[user_email_id] [varchar](100) NOT NULL,
	[user_contact_no] [varchar](20) NULL,
	[last_updated_by] [varchar](100) NULL,
	[last_updated_date] [datetime] NULL,
 CONSTRAINT [PK_samikshya_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[samikshya_state]    Script Date: 05/20/2014 18:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_state]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_state](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_code] [varchar](100) NOT NULL,
	[state_name] [varchar](100) NULL,
 CONSTRAINT [PK_StateInfoTable_1] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_StateInfoTable] UNIQUE NONCLUSTERED 
(
	[state_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[samikshya_feature]    Script Date: 05/20/2014 18:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_feature]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_feature](
	[feature_id] [int] IDENTITY(1,1) NOT NULL,
	[feature_code] [nvarchar](50) NOT NULL,
	[feature_name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[last_updated_date] [datetime] NOT NULL CONSTRAINT [DF_samikshya_features_LastUpdatedTime]  DEFAULT (getdate()),
	[last_updated_by] [nvarchar](100) NOT NULL CONSTRAINT [DF_samikshya_features_LastUpdatedBy]  DEFAULT ('System'),
 CONSTRAINT [PK_samikshya_features] PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[samikshya_district]    Script Date: 05/20/2014 18:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_district]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_district](
	[district_id] [int] IDENTITY(1,1) NOT NULL,
	[district_code] [varchar](100) NOT NULL,
	[district_name] [varchar](100) NULL,
	[state_id] [int] NOT NULL,
	[last_updated_by] [nvarchar](100) NOT NULL CONSTRAINT [DF_samikshya_districts_LastUpdatedBy]  DEFAULT ('System'),
	[last_updated_date] [datetime] NOT NULL CONSTRAINT [DF_samikshya_districts_LastUpdatedTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_DistrictInfoTable] PRIMARY KEY CLUSTERED 
(
	[district_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_DistrictInfoTable] UNIQUE NONCLUSTERED 
(
	[district_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[samikshya_feature_permission_mapping]    Script Date: 05/20/2014 18:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_feature_permission_mapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_feature_permission_mapping](
	[feature_permission_id] [int] IDENTITY(1,1) NOT NULL,
	[feature_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
	[last_updated_by] [nvarchar](100) NOT NULL CONSTRAINT [DF_samikshya_feature_permission_mapping_LastUpdatedBy]  DEFAULT ('System'),
	[last_updated_date] [datetime] NOT NULL CONSTRAINT [DF_samikshya_feature_permission_mapping_LastUpdatedTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_samikshya_feature_permission_mapping] PRIMARY KEY CLUSTERED 
(
	[feature_permission_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[samikshya_role_scheme]    Script Date: 05/20/2014 18:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_role_scheme]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_role_scheme](
	[role_scheme_id] [int] IDENTITY(1,1) NOT NULL,
	[role_scheme_name] [nvarchar](100) NULL,
	[role_id] [int] NOT NULL,
	[feature_permission_id] [int] NOT NULL,
	[area_code] [nvarchar](100) NULL,
	[last_updated_date] [datetime] NOT NULL CONSTRAINT [DF_samikshya_role_scheme_LastUpdatedTime]  DEFAULT (getdate()),
	[last_updated_by] [nvarchar](50) NOT NULL CONSTRAINT [DF_samikshya_role_scheme_LastUpdatedBy]  DEFAULT ('System'),
 CONSTRAINT [PK_samikshya_role_scheme] PRIMARY KEY CLUSTERED 
(
	[role_scheme_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[samikshya_block]    Script Date: 05/20/2014 18:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_block]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_block](
	[block_id] [int] IDENTITY(1,1) NOT NULL,
	[block_code] [varchar](100) NOT NULL,
	[block_name] [varchar](100) NULL,
	[district_id] [int] NULL,
	[last_updated_by] [nvarchar](100) NOT NULL CONSTRAINT [DF_samikshya_blocks_LastUpdatedBy]  DEFAULT ('System'),
	[last_updated_date] [datetime] NOT NULL CONSTRAINT [DF_samikshya_blocks_LastUpdatedTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_BlockInfoTable] PRIMARY KEY CLUSTERED 
(
	[block_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_BlockInfoTable] UNIQUE NONCLUSTERED 
(
	[block_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[samikshya_cluster]    Script Date: 05/20/2014 18:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_cluster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_cluster](
	[cluster_id] [int] IDENTITY(1,1) NOT NULL,
	[cluster_code] [varchar](100) NOT NULL,
	[cluster_name] [varchar](100) NULL,
	[block_id] [int] NULL,
	[last_updated_by] [nvarchar](100) NOT NULL CONSTRAINT [DF_samikshya_clusters_LastUpdatedBy]  DEFAULT ('System'),
	[last_updated_date] [datetime] NOT NULL CONSTRAINT [DF_samikshya_clusters_LastUpdatedTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_ClusterInfoTable] PRIMARY KEY CLUSTERED 
(
	[cluster_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_ClusterInfoTable] UNIQUE NONCLUSTERED 
(
	[cluster_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[samikshya_user_role_scheme_mapping]    Script Date: 05/20/2014 18:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_user_role_scheme_mapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_user_role_scheme_mapping](
	[user_role_scheme_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[role_scheme_id] [int] NULL,
	[last_updated_by] [nvarchar](100) NOT NULL CONSTRAINT [DF_samikshya_user_role_scheme_mapping_LastUpdatedBy]  DEFAULT ('System'),
	[last_updated_date] [datetime] NOT NULL CONSTRAINT [DF_samikshya_user_role_scheme_mapping_LastUpdatedTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_samikshya_user_role_scheme_mapping] PRIMARY KEY CLUSTERED 
(
	[user_role_scheme_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[samikshya_monitoring_form]    Script Date: 05/20/2014 18:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_monitoring_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[state_id] [int] NULL,
	[district_id] [int] NULL,
	[block_id] [int] NULL,
	[cluster_id] [int] NULL,
	[form_code] [varchar](100) NULL,
	[form_type] [varchar](100) NULL,
	[form_path] [varchar](200) NULL,
	[last_updated_by] [nvarchar](100) NOT NULL CONSTRAINT [DF_samikshya_monitoring_forms_LastUpdatedBy]  DEFAULT ('System'),
	[last_updated_date] [datetime] NOT NULL CONSTRAINT [DF_samikshya_monitoring_forms_LastUpdatedTime]  DEFAULT (getdate()),
	[is_active] [varchar](50) NULL,
	[version] [varchar](50) NULL,
 CONSTRAINT [PK_DownloadExcelInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[samikshya_monitoring_form_tran]    Script Date: 05/20/2014 18:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form_tran]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[samikshya_monitoring_form_tran](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] NULL,
	[form_path] [varchar](100) NULL,
	[last_updated_by] [nvarchar](100) NOT NULL CONSTRAINT [DF_samikshya_monitoring_form_trans_LastUpdatedBy]  DEFAULT ('System'),
	[last_updated_date] [datetime] NOT NULL CONSTRAINT [DF_samikshya_monitoring_form_trans_LastUpdatedTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_UploadExcelInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_BlockInfoTable_DistrictInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlockInfoTable_DistrictInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_block]'))
ALTER TABLE [dbo].[samikshya_block]  WITH CHECK ADD  CONSTRAINT [FK_BlockInfoTable_DistrictInfoTable] FOREIGN KEY([district_id])
REFERENCES [dbo].[samikshya_district] ([district_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlockInfoTable_DistrictInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_block]'))
ALTER TABLE [dbo].[samikshya_block] CHECK CONSTRAINT [FK_BlockInfoTable_DistrictInfoTable]
GO
/****** Object:  ForeignKey [FK_ClusterInfoTable_BlockInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClusterInfoTable_BlockInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_cluster]'))
ALTER TABLE [dbo].[samikshya_cluster]  WITH CHECK ADD  CONSTRAINT [FK_ClusterInfoTable_BlockInfoTable] FOREIGN KEY([block_id])
REFERENCES [dbo].[samikshya_block] ([block_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClusterInfoTable_BlockInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_cluster]'))
ALTER TABLE [dbo].[samikshya_cluster] CHECK CONSTRAINT [FK_ClusterInfoTable_BlockInfoTable]
GO
/****** Object:  ForeignKey [FK_DistrictInfoTable_StateInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DistrictInfoTable_StateInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_district]'))
ALTER TABLE [dbo].[samikshya_district]  WITH CHECK ADD  CONSTRAINT [FK_DistrictInfoTable_StateInfoTable] FOREIGN KEY([state_id])
REFERENCES [dbo].[samikshya_state] ([state_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DistrictInfoTable_StateInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_district]'))
ALTER TABLE [dbo].[samikshya_district] CHECK CONSTRAINT [FK_DistrictInfoTable_StateInfoTable]
GO
/****** Object:  ForeignKey [FK_samikshya_feature_permission_mapping_samikshya_features]    Script Date: 05/20/2014 18:44:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_feature_permission_mapping_samikshya_features]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_feature_permission_mapping]'))
ALTER TABLE [dbo].[samikshya_feature_permission_mapping]  WITH CHECK ADD  CONSTRAINT [FK_samikshya_feature_permission_mapping_samikshya_features] FOREIGN KEY([feature_id])
REFERENCES [dbo].[samikshya_feature] ([feature_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_feature_permission_mapping_samikshya_features]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_feature_permission_mapping]'))
ALTER TABLE [dbo].[samikshya_feature_permission_mapping] CHECK CONSTRAINT [FK_samikshya_feature_permission_mapping_samikshya_features]
GO
/****** Object:  ForeignKey [FK_samikshya_feature_permission_mapping_samikshya_pemissions]    Script Date: 05/20/2014 18:44:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_feature_permission_mapping_samikshya_pemissions]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_feature_permission_mapping]'))
ALTER TABLE [dbo].[samikshya_feature_permission_mapping]  WITH CHECK ADD  CONSTRAINT [FK_samikshya_feature_permission_mapping_samikshya_pemissions] FOREIGN KEY([permission_id])
REFERENCES [dbo].[samikshya_pemission] ([permission_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_feature_permission_mapping_samikshya_pemissions]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_feature_permission_mapping]'))
ALTER TABLE [dbo].[samikshya_feature_permission_mapping] CHECK CONSTRAINT [FK_samikshya_feature_permission_mapping_samikshya_pemissions]
GO
/****** Object:  ForeignKey [FK_DownloadExcelInfo_BlockInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_BlockInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form]  WITH CHECK ADD  CONSTRAINT [FK_DownloadExcelInfo_BlockInfoTable] FOREIGN KEY([block_id])
REFERENCES [dbo].[samikshya_block] ([block_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_BlockInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] CHECK CONSTRAINT [FK_DownloadExcelInfo_BlockInfoTable]
GO
/****** Object:  ForeignKey [FK_DownloadExcelInfo_ClusterInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_ClusterInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form]  WITH CHECK ADD  CONSTRAINT [FK_DownloadExcelInfo_ClusterInfoTable] FOREIGN KEY([cluster_id])
REFERENCES [dbo].[samikshya_cluster] ([cluster_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_ClusterInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] CHECK CONSTRAINT [FK_DownloadExcelInfo_ClusterInfoTable]
GO
/****** Object:  ForeignKey [FK_DownloadExcelInfo_DistrictInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_DistrictInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form]  WITH CHECK ADD  CONSTRAINT [FK_DownloadExcelInfo_DistrictInfoTable] FOREIGN KEY([district_id])
REFERENCES [dbo].[samikshya_district] ([district_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_DistrictInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] CHECK CONSTRAINT [FK_DownloadExcelInfo_DistrictInfoTable]
GO
/****** Object:  ForeignKey [FK_DownloadExcelInfo_StateInfoTable]    Script Date: 05/20/2014 18:44:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_StateInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form]  WITH CHECK ADD  CONSTRAINT [FK_DownloadExcelInfo_StateInfoTable] FOREIGN KEY([state_id])
REFERENCES [dbo].[samikshya_state] ([state_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DownloadExcelInfo_StateInfoTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form]'))
ALTER TABLE [dbo].[samikshya_monitoring_form] CHECK CONSTRAINT [FK_DownloadExcelInfo_StateInfoTable]
GO
/****** Object:  ForeignKey [FK_UploadExcelInfo_DownloadExcelInfo]    Script Date: 05/20/2014 18:44:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UploadExcelInfo_DownloadExcelInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form_tran]'))
ALTER TABLE [dbo].[samikshya_monitoring_form_tran]  WITH CHECK ADD  CONSTRAINT [FK_UploadExcelInfo_DownloadExcelInfo] FOREIGN KEY([form_id])
REFERENCES [dbo].[samikshya_monitoring_form] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UploadExcelInfo_DownloadExcelInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_monitoring_form_tran]'))
ALTER TABLE [dbo].[samikshya_monitoring_form_tran] CHECK CONSTRAINT [FK_UploadExcelInfo_DownloadExcelInfo]
GO
/****** Object:  ForeignKey [FK_samikshya_role_scheme_samikshya_feature_permission_mapping]    Script Date: 05/20/2014 18:44:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_role_scheme_samikshya_feature_permission_mapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_role_scheme]'))
ALTER TABLE [dbo].[samikshya_role_scheme]  WITH CHECK ADD  CONSTRAINT [FK_samikshya_role_scheme_samikshya_feature_permission_mapping] FOREIGN KEY([feature_permission_id])
REFERENCES [dbo].[samikshya_feature_permission_mapping] ([feature_permission_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_role_scheme_samikshya_feature_permission_mapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_role_scheme]'))
ALTER TABLE [dbo].[samikshya_role_scheme] CHECK CONSTRAINT [FK_samikshya_role_scheme_samikshya_feature_permission_mapping]
GO
/****** Object:  ForeignKey [FK_samikshya_role_scheme_samikshya_roles]    Script Date: 05/20/2014 18:44:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_role_scheme_samikshya_roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_role_scheme]'))
ALTER TABLE [dbo].[samikshya_role_scheme]  WITH CHECK ADD  CONSTRAINT [FK_samikshya_role_scheme_samikshya_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[samikshya_role] ([role_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_role_scheme_samikshya_roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_role_scheme]'))
ALTER TABLE [dbo].[samikshya_role_scheme] CHECK CONSTRAINT [FK_samikshya_role_scheme_samikshya_roles]
GO
/****** Object:  ForeignKey [FK_samikshya_user_role_scheme_mapping_samikshya_role_scheme]    Script Date: 05/20/2014 18:44:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_user_role_scheme_mapping_samikshya_role_scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_user_role_scheme_mapping]'))
ALTER TABLE [dbo].[samikshya_user_role_scheme_mapping]  WITH CHECK ADD  CONSTRAINT [FK_samikshya_user_role_scheme_mapping_samikshya_role_scheme] FOREIGN KEY([role_scheme_id])
REFERENCES [dbo].[samikshya_role_scheme] ([role_scheme_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_samikshya_user_role_scheme_mapping_samikshya_role_scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_user_role_scheme_mapping]'))
ALTER TABLE [dbo].[samikshya_user_role_scheme_mapping] CHECK CONSTRAINT [FK_samikshya_user_role_scheme_mapping_samikshya_role_scheme]
GO
/****** Object:  ForeignKey [FK1_samikshya_user_role_scheme_mapping_samikshya_role_scheme]    Script Date: 05/20/2014 18:44:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK1_samikshya_user_role_scheme_mapping_samikshya_role_scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_user_role_scheme_mapping]'))
ALTER TABLE [dbo].[samikshya_user_role_scheme_mapping]  WITH CHECK ADD  CONSTRAINT [FK1_samikshya_user_role_scheme_mapping_samikshya_role_scheme] FOREIGN KEY([user_id])
REFERENCES [dbo].[samikshya_user] ([user_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK1_samikshya_user_role_scheme_mapping_samikshya_role_scheme]') AND parent_object_id = OBJECT_ID(N'[dbo].[samikshya_user_role_scheme_mapping]'))
ALTER TABLE [dbo].[samikshya_user_role_scheme_mapping] CHECK CONSTRAINT [FK1_samikshya_user_role_scheme_mapping_samikshya_role_scheme]
GO
