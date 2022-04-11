 create database clock;
use clock;

create table actor(Act_id int, Act_Name varchar(50), Act_Gender varchar(10),PRIMARY KEY(Act_id));

create table director (Dir_id int, Dir_Name varchar(50), Dir_Phone int,PRIMARY KEY(Dir_id));

create table movies (Mov_id int, Mov_Title varchar(50), Mov_Year int, Mov_Lang varchar(20), Dir_id int,PRIMARY KEY(Mov_id),FOREIGN KEY(Dir_id) REFERENCES director(Dir_id) ON DELETE CASCADE) ;

create table movies_cast (Act_id int, Mov_id int,Role varchar(20),FOREIGN KEY(Act_id) REFERENCES actor(Act_id) ON DELETE CASCADE,FOREIGN KEY(Mov_id) REFERENCES movies(Mov_id) ON DELETE CASCADE);

create table rating (Mov_id int, Rev_Stars varchar(20),FOREIGN KEY(Mov_id) REFERENCES movies(Mov_id) ON DELETE CASCADE) ;

INSERT INTO actor(Act_id,Act_Name,Act_Gender) VALUES (101,'kate','female');

INSERT INTO actor(Act_id,Act_Name,Act_Gender) VALUES (102,'leo','male');

INSERT INTO actor(Act_id,Act_Name,Act_Gender) VALUES (103,'joan','female');

INSERT INTO actor(Act_id,Act_Name,Act_Gender) VALUES (104,'frances','female');

INSERT INTO actor(Act_id,Act_Name,Act_Gender) VALUES (105,'tyre','male');

select * from actor;

INSERT INTO director(Dir_id,Dir_Name,Dir_phone) VALUES (301,'james cameron','1982654329');

INSERT INTO director(Dir_id,Dir_Name,Dir_phone) VALUES (302,'Hitchcock','8907654312');

INSERT INTO director(Dir_id,Dir_Name,Dir_phone) VALUES (303,'Steven Spielberg','8907654534');

INSERT INTO director(Dir_id,Dir_Name,Dir_phone) VALUES (304,'alejan','8456654534');

select * from director;

INSERT INTO movies(Mov_id,Mov_Title,Mov_Year,Mov_Lang,Dir_id) VALUES (201,'titanic',1997,'english',301);

INSERT INTO movies(Mov_id,Mov_Title,Mov_Year,Mov_Lang,Dir_id) VALUES (202,'rebecca',1940,'english',302);

INSERT INTO movies(Mov_id,Mov_Title,Mov_Year,Mov_Lang,Dir_id) VALUES (203,'AI',2001,'english',303);

INSERT INTO movies(Mov_id,Mov_Title,Mov_Year,Mov_Lang,Dir_id) VALUES (204,'Ready player one',2018,'english',303);

INSERT INTO movies(Mov_id,Mov_Title,Mov_Year,Mov_Lang,Dir_id) VALUES (205,'Revanant',2016,'english',304);

select * from movies;

INSERT INTO movies_cast(Act_id,Mov_id,Role) VALUES (101,201,'Rose');

INSERT INTO movies_cast(Act_id,Mov_id,Role) VALUES (102,201,'jack');

INSERT INTO movies_cast(Act_id,Mov_id,Role) VALUES (102,205,'hugh glass');

INSERT INTO movies_cast(Act_id,Mov_id,Role) VALUES (103,202,'mrs.de winter');

INSERT INTO movies_cast(Act_id,Mov_id,Role) VALUES (104,203,'monica');

INSERT INTO movies_cast(Act_id,Mov_id,Role) VALUES (105,204,'wade watts');

select * from movies_cast;

INSERT INTO rating(Mov_id,Rev_Stars) VALUES (201,4.8);

INSERT INTO rating(Mov_id,Rev_Stars) VALUES (202,3);

INSERT INTO rating(Mov_id,Rev_Stars) VALUES (203,4.4);

INSERT INTO rating(Mov_id,Rev_Stars) VALUES (204,4.5);

INSERT INTO rating(Mov_id,Rev_Stars) VALUES (205,4.6);

select * from rating;

select movies.Mov_Title,director.Dir_name from movies inner join director on movies.dir_id=director.dir_id where director.dir_id=302 ;   

SELECT mov_title FROM movies WHERE mov_id IN (

SELECT mov_id FROM  movies_cast WHERE act_id IN (

SELECT act_id FROM actor WHERE act_id IN (

SELECT act_id FROM  movies_cast GROUP BY act_id HAVING COUNT(act_id)>1)));

SELECT actor.Act_Name FROM actor inner join movies_cast on actor.act_id=movies_cast.act_id WHERE mov_id in(SELECT Mov_id FROM movies where Mov_year<2000 or Mov_year>2015);

SELECT mov_title,MAX(rev_stars)
FROM movies
INNER JOIN rating USING (mov_id)
GROUP BY mov_title
HAVING MAX(rev_stars)>0
ORDER BY mov_title;

SET SQL_SAFE_UPDATES=0;
UPDATE rating
SET rev_stars=5
WHERE mov_id IN (SELECT mov_id FROM movies
WHERE dir_id IN (SELECT dir_id
FROM director
WHERE dir_name='steven spielberg'));

