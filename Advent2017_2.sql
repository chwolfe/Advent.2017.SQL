/* Import data into the following table: 

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Advent2017_2](
	[C0] [int] NOT NULL,
	[C1] [int] NOT NULL,
	[C2] [int] NOT NULL,
	[C3] [int] NOT NULL,
	[C4] [int] NOT NULL,
	[C5] [int] NOT NULL,
	[C6] [int] NOT NULL,
	[C7] [int] NOT NULL,
	[C8] [int] NOT NULL,
	[C9] [int] NOT NULL,
	[C10] [int] NOT NULL,
	[C11] [int] NOT NULL,
	[C12] [int] NOT NULL,
	[C13] [int] NOT NULL,
	[C14] [int] NOT NULL,
	[C15] [int] NOT NULL
) ON [PRIMARY]

GO

*/

select sum(Checksum) 
from
(
SELECT (
(SELECT Max(v) 
   FROM (VALUES 
   ([C0])
      ,([C1])
      ,([C2])
      ,([C3])
      ,([C4])
      ,([C5])
      ,([C6])
      ,([C7])
      ,([C8])
      ,([C9])
      ,([C10])
      ,([C11])
      ,([C12])
      ,([C13])
      ,([C14])
      ,([C15])   
   ) AS value(v))  
  
  - (SELECT Min(v) 
   FROM (VALUES 
   ([C0])
      ,([C1])
      ,([C2])
      ,([C3])
      ,([C4])
      ,([C5])
      ,([C6])
      ,([C7])
      ,([C8])
      ,([C9])
      ,([C10])
      ,([C11])
      ,([C12])
      ,([C13])
      ,([C14])
      ,([C15])   
   ) AS value(v))) as [Checksum]
  FROM [TempWolfe].[dbo].[Advent2017_2] ) checksums