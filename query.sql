#1. 
select count(*) from movie;

#2. 
select count(*) from movie where genres like '%drama%';

#3. 
select distinct m.title, r.rating from movie m inner join rating r on m.movieId=r.movieId order by r.rating desc limit 10;

#4. 
select userId, count(*) cnt from rating group by userId order by cnt desc limit 5;

#5. 
select title,timestamp from movie m,rating r where m.movieId=r.movieId and r.timestamp in (select max(timestamp) from rating);
select title,timestamp from movie m,rating r where m.movieId=r.movieId and r.timestamp in (select min(timestamp) from rating);

#6. 
select count(*) from movie where title like '%1990%';
