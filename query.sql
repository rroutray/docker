create database IF NOT EXISTS movies;

use movies;

create table IF NOT EXISTS movie(movieId int,title varchar(255),genres varchar(255));

create table IF NOT EXISTS rating(userId int,movieId int,rating float,timestamp int);

#LOAD DATA INFILE '/tmp/mysql_boot/movies.csv' INTO TABLE movie FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

#LOAD DATA INFILE '/tmp/mysql_boot/ratings.csv' INTO TABLE rating FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

select count(*) from movie;

select count(*) from movie where genres like '%drama%';

select distinct m.title, r.rating from movie m inner join rating r on m.movieId=r.movieId order by r.rating desc limit 10;

select userId, count(*) cnt from rating group by userId order by cnt desc limit 5;

select title,timestamp from movie m,rating r where m.movieId=r.movieId and r.timestamp in (select max(timestamp) from rating);
select title,timestamp from movie m,rating r where m.movieId=r.movieId and r.timestamp in (select min(timestamp) from rating);

select count(*) from movie where title like '%1990%';