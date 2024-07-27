create database Video_Games_Sales;

use	Video_Games_Sales;

Show	tables;

describe	video_games_sales;

select * from video_games_sales;

select distinct Critic_Score from video_games_sales;

-- First thing is to create primary key
alter table video_games_sales add column SN int primary key auto_increment first;

-- Changing of data type of each column.
alter table video_games_sales modify column platform varchar(10);
alter table video_games_sales modify column NA_Sales decimal(5,2);
alter table video_games_sales modify column EU_Sales decimal(5,2);
alter table video_games_sales modify column JP_Sales decimal(5,2);
alter table video_games_sales modify column Other_Sales decimal(5,2);
alter table video_games_sales modify column Global_Sales decimal(5,2);
alter table video_games_sales modify column Critic_Score varchar(10);
alter table video_games_sales modify column Critic_Count varchar(10);
alter table video_games_sales modify column User_Score decimal(2,1);
alter table video_games_sales modify column User_Count varchar(10);

select * from video_games_sales;

select * from video_games_sales where Critic_Score = '';

-- To create additional columns
alter table video_games_sales add column `Critic_Scr New` varchar(15) after Critic_Score,
add column `Critic_Cnt New` varchar(15) after Critic_Count, 
add column `User_Scr New` varchar(15) after User_Score, 
add column `User_Cnt New` varchar(15) after User_Count;

set sql_safe_updates = 0;
start transaction;

-- Updating newly created conditional column to the table to get more insight.
update video_games_sales set `Critic_Scr New` = case
when Critic_Score >= 86 then 'Excellent'
when Critic_Score between 71 and 85 then 'Very Good'
when Critic_Score between 61 and 70 then 'Good'
when Critic_Score between 50 and 60 then 'Fair'
when Critic_Score between 1 and 49 then 'Poor'
when Critic_Score = 0 then 'Unspecified'
else Critic_Score
end;

select * from video_games_sales;

update video_games_sales set `Critic_Cnt New` = case
when Critic_Count >= 76 then 'Critical Acclaim'
when Critic_Count between 51 and 75 then 'Many critics'
when Critic_Count between 26 and 50 then 'Some critics'
when Critic_Count between 1 and 25 then 'Few critics'
else Critic_Count
end;

alter table video_games_sales modify column `User_Cnt New` varchar(25);

update video_games_sales set `Critic_Cnt New` = 'Unspecified' where `Critic_Cnt New` = '';
update video_games_sales set Developer = 'Unspecified' where Developer = '';
update video_games_sales set Rating = 'No_Rating' where Rating = 'Unspecified';

start transaction;

update video_games_sales set `User_Scr New` = case
when User_Score >= 9 then 'Excellent'
when User_Score = 0 then 'Unspecified'
when User_Score between 7 and 8.9 then 'Good'
when User_Score between 5 and 6.9 then 'Average'
when User_Score between 3 and 4.9 then 'Poor'
when User_Score between 0.1 and 2.9 then 'Very_Poor'
else User_Score
end;

select * from video_games_sales;

update video_games_sales set `User_Cnt New` = case
when User_Count >= 6001 then 'Very-Large UB'
when User_Count = 0 then 'Unspecified'
when User_Count between 4001 and 6000 then 'Large UB'
when User_Count between 2001 and 4000 then 'Medium UB'
when User_Count between 501 and 2000 then 'Small UB'
when User_Count between 1 and 500 then 'Tiny UB'
else User_Count
end;

select * from video_games_sales;

start transaction; 

alter table video_games_sales add column Total_Sales decimal(3,2) after Global_Sales;

update video_games_sales set Total_Sales = NA_Sales + EU_Sales + JP_Sales + Other_Sales;

alter table video_games_sales modify column Total_Sales decimal(5,2);

alter table video_games_sales drop column Global_Sales;

select * from video_games_sales;

select distinct(Year_of_Release) from video_games_sales;

select replace(Publisher, 'Sony Computer Entertainment', 'Sony Comp Ent') as Ayo from video_games_sales;
update video_games_sales set Publisher = replace(Publisher, 'Sony Computer Entertainment', 'Sony Comp Ent');

start transaction; 


alter table video_games_sales add column Sales decimal(3,2) after Other_Sales;
alter table video_games_sales add column Region text after Global_Sales;

select sum(Total_Sales) from video_games_sales;

select * from video_games_sales;

set sql_safe_updates = 0;
start transaction;

select * from video_games_sales;

-- Merging of 3 columns (EU, NA, JP & Others) as Region to get more insight.
CREATE TABLE temp_Video_game_sales AS
SELECT SN, Game_Name, Platform, Year_of_Release, Genre, Publisher, 'NA' AS Region, NA_Sales AS Sales, 
Total_Sales, Critic_Score, `Critic_Scr New`, Critic_Count, `Critic_Cnt New`, User_Score, `User_Scr New`, 
User_Count, `User_Cnt New`, Developer, Rating
FROM video_games_sales
WHERE NA_Sales IS NOT NULL
UNION ALL
SELECT SN, Game_Name, Platform, Year_of_Release, Genre, Publisher, 'EU' AS Region, EU_Sales AS Sales, 
Total_Sales, Critic_Score, `Critic_Scr New`, Critic_Count, `Critic_Cnt New`, User_Score, `User_Scr New`, 
User_Count, `User_Cnt New`, Developer, Rating
FROM video_games_sales
WHERE EU_Sales IS NOT NULL
UNION ALL
SELECT SN, Game_Name, Platform, Year_of_Release, Genre, Publisher, 'JP' AS Region, JP_Sales AS Sales, 
Total_Sales, Critic_Score, `Critic_Scr New`, Critic_Count, `Critic_Cnt New`, User_Score, `User_Scr New`, 
User_Count, `User_Cnt New`, Developer, Rating
FROM video_games_sales
WHERE JP_Sales IS NOT NULL
UNION ALL
SELECT SN, Game_Name, Platform, Year_of_Release, Genre, Publisher, 'Other' AS Region, Other_Sales AS Sales, 
Total_Sales, Critic_Score, `Critic_Scr New`, Critic_Count, `Critic_Cnt New`, User_Score, `User_Scr New`, 
User_Count, `User_Cnt New`, Developer, Rating
FROM video_games_sales
WHERE Other_Sales IS NOT NULL;

DROP TABLE video_games_sales;

RENAME TABLE temp_Video_game_sales TO Video_Games_Sales;

select * from Video_Games_Sales;

select count(SN) from video_games_sales;
select distinct(Game_Name) from video_games_sales;
select distinct(Region) from video_games_sales;

alter table video_games_sales DROP column Total_Sales;

























































































rollback;
set sql_safe_updates = 1;

