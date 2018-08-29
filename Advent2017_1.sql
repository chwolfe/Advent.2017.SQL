
--import input data in table with following schema: 
/*

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Advent2017_1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Digit] [tinyint] NOT NULL,
 CONSTRAINT [PK_Advent2017_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

*/

declare @firstvalue int = 0
declare @lastvalue int = 0

select top 1 @firstvalue = Digit
 from Advent2017_1(nolock) 
  order by id asc

select top 1 @lastvalue = Digit
 from Advent2017_1(nolock) 
  order by id desc

;with 
 dataset (ID, Digit, Match)
 as 
 (
select a.ID, a.Digit, 
  case 
   when 
    a.Digit = lead(a.Digit, 1) over(order by a.ID) then 1 
    else 0 end 'Match'  
  from Advent2017_1 a(nolock) 
  )

select sum(Digit) + (case when @firstvalue = @lastvalue then @firstvalue else 0 end)
 from dataset d
  where Match = 1 


