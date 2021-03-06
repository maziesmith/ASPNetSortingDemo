SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[friends](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[created] [datetime] NOT NULL,
 CONSTRAINT [PK_friends] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [ix_friends] ON [dbo].[friends] 
(
	[firstname] ASC,
	[lastname] ASC,
	[created] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sortFriends]
 	@sort AS VARCHAR(20)
AS
BEGIN
	SELECT id, firstname, lastname, created
	FROM friends
	ORDER BY
	CASE @sort
		WHEN 'firstname' THEN firstname
		WHEN 'lastname' THEN lastname
		ELSE NULL
	END ASC,
	CASE @sort
		WHEN 'created' THEN created
		ELSE NULL
	END ASC,
	CASE @sort
		WHEN 'firstname DESC' THEN firstname
		WHEN 'lastname DESC' THEN lastname
		ELSE NULL
	END DESC,
	CASE @sort
		WHEN 'created DESC' THEN created
		ELSE NULL
	END DESC
END
GO
ALTER TABLE [dbo].[friends] ADD  CONSTRAINT [DF_friends_created]  DEFAULT (getdate()) FOR [created]
GO
INSERT INTO friends(firstname, lastname, created) VALUES ('Julie', 'Truter', getdate() - 10)
INSERT INTO friends(firstname, lastname, created) VALUES ('Eugene', 'Stander', getdate() - 50)
INSERT INTO friends(firstname, lastname, created) VALUES ('Pam', 'Nizar', getdate() - 120)
INSERT INTO friends(firstname, lastname, created) VALUES ('Alexander', 'Mehlhorn', getdate() - 4)
INSERT INTO friends(firstname, lastname, created) VALUES ('Roland', 'Cooper', getdate() - 10)
INSERT INTO friends(firstname, lastname, created) VALUES ('Loren', 'Stevens', getdate() -2)
INSERT INTO friends(firstname, lastname, created) VALUES ('Edward', 'Anderson', getdate() - 5)
INSERT INTO friends(firstname, lastname, created) VALUES ('Wayne', 'Kleynhans', getdate() - 13)
