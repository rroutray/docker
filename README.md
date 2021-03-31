Steps:

Download & install docker desktop installer
Download & install Ubuntu from Microsoft store
In docker settings->Resources->WSL INTEGRATION, select Ubuntu.

Open Ubuntu command line and execute following commands:
Pull image for MySQL:
docker pull mysql/mysql-server:latest

Deploy a new MySQL container (container1):
docker run --name=mysql_container -d mysql/mysql-server:latest

Installed MySQL client:
apt-get install mysql-client

Download sample dataset from website:
curl -k https://files.grouplens.org/datasets/movielens/ml-latest-small.zip -o MyFilename.zip

Unzipping the required files from dataset:
unzip MyFilename.zip

Pull image for python:
docker pull python:latest

Deploy a new python container (container_python):
docker run --name=python_container -d python:latest

Login to MySQL from Ubuntu:
docker exec -it mysql_container mysql -uroot -p

In MySql command prompt:
Create database, movies

Create 2 tables (these are required for the questions in problem statement):
movie
rating

Import data into 2 tables:
LOAD DATA INFILE '/home/vagrant/movies.csv' INTO TABLE movie FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE '/home/vagrant/ratings.csv' INTO TABLE rating FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

Query the tables in MySql and found answers:
1. How many movies are in data set ?
Ans: 9742

2. What is the most common genre of movie?
Ans: Drama (4361 count)

3. What are top 10 movies with highest rate ?
Ans: Movie title                        Rating
Devil in a Blue Dress (1995)	        5
Father of the Bride Part II (1995)	5
Toy Story (1995)	                5
Jumanji (1995)	                        5
Die Hard: With a Vengeance (1995)	5
Father of the Bride Part II (1995)	5
Toy Story (1995)	                5
Jumanji (1995)	                        5
Die Hard: With a Vengeance (1995)	5
Father of the Bride Part II (1995)	5

4. What are 5 most often rating users ?
Ans: User    No. of ratings
     414	2698
     599	2478
     474	2108
     448	1864
     274	1346

5. When was done first and last rate included in data set and what was the rated movie tittle?
Ans: last rate: 2018-09-24 14:27:30 (Title: Crumb (1994))
     first rate: 1996-03-29 18:36:55 (There are 20 movies with same timestamp)

6. Find all movies released in 1990
Ans: 148 movies

Create Docker compose file (uploaded in Github):
docker-compose.yml (single file for both MySql & Python)
This compose file has references to db_connector.py (sample file to test connection with MySql) and query.sql (it contains MySql queries to create DB, tables and query for questions given above)

Create Python file (uploaded in Github):
db_connector.py

Create MySql file (uploaded in Github):
query.sql
