-- create database museumdata;
create database museumdata;

-- use database 
use museumdata;

-- Let's See all tables
show tables;

select * from canvas_size;
select * from product_size;
select * from artist;
select * from work;
select * from subject;
select * from museum;
select * from museum_hours;


-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.

select artist.Full_Name ,work.name as Works,m.name as Museum from work
inner join artist 
on artist.artist_id = work.artist_id
inner join museum as m
on work.museum_id=m.museum_id;

-- 2. Group By and Count:
-- How many works does each artist have in the database? Display the artist's full name along with the count of their works, ordered by the count in descending order.
create view ArtistNcount as
select a.Full_Name,w.name as workname,m.name as MuseumName from work as w
inner join artist as a
on a.artist_id =w.artist_id
inner join museum as m
on w.museum_id=m.museum_id;


select full_name,count(*) as Count_Of_Work from  ArtistNcount
group by full_name
order by Count_Of_Work desc;

-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.
create view Work_count as
select w.work_id,w.name as workname,artist_id,city,m.name as MuseumName from work as w
inner join 
museum as m
on w.museum_id=m.museum_id;

select MuseumName,count(*) as Counts  from Work_count
group by MuseumName
order by Counts desc
limit 5;

-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.

select w.Name,w.Style,m.name as MuseumName from work as w
inner join
museum as m
on w.museum_id=m.museum_id
order by MuseumName
limit 10;

-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.
create view SalePrice as 
select a.Full_Name,p.sale_price from artist as a
inner join work as w
on a.artist_id=w.artist_id
inner join product_size as p
on w.work_id=p.work_id;

select Full_Name,sum(sale_price) as Totalsales from SalePrice
group by full_name
order by Totalsales desc;	

-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.
create view A3wplus as
select  a.artist_id,a.full_name,w.work_id from artist as a
inner join 
work as w
on a.artist_id=w.artist_id;

select Full_Name,count(*) as Workcount from A3wplus
group by Full_Name
having WorkCount>3
order by WorkCount;

-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 
create view smallSaleP as
select a.Full_Name,w.name as WorkName,p.Sale_Price,p.Regular_Price  from work as w
inner join
artist as a
on w.artist_id=a.artist_id
inner join
product_size as p
on w.work_id=p.work_id;

select * from Product_Size;
select * from smallSaleP
where Sale_price < Regular_price
order by sale_price desc;

-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.

create view avgHB as
select w.Name as artwork,c.Width,c.Height from Product_Size as p
inner join
canvas_size as c
on p.size_id=c.size_id
inner join
work as w
on p.work_id=w.work_id;

select artwork,avg(width),avg(height) from avgHB
group by Artwork
order by avg(width);

-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.

create view salemax as
select m.Name,p.Sale_Price from work as w
inner join
product_size as p
on w.work_id=p.work_id
inner join museum as m
on w.museum_id=m.museum_id;
  
select name as MuseumName,max(sale_price) as MaximumSalePrice from salemax  
group by MuseumName
order by MaximumSalePrice desc ;

-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.

create view FNN as
select concat(first_name,' ',last_name,',',' ',nationality) as NameNation,Full_Name from artist;

create view NameNation as
select f.NameNation,a.full_name,w.work_id,a.artist_id from FNN as f
inner join 
artist as a
on f.full_name=a.full_name
inner join
work as w
on a.artist_id=w.artist_id;
drop view NameNation;

select NameNation,count(*) as countofwork from NameNation
group by NameNation
order by countofwork desc;


