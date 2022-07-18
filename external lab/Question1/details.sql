create database details;
use details;
create table student(rollno int primary key,name varchar(20),addresss varchar(30),totalmarks int);
create table Admission(rollno int, cid int,sem int,primary key(cid,rollno),
foreign key (rollno) references student(rollno) ,
foreign key (cid) references course(cid));
create table course(cid int,coursename varchar(30),fees int,primary key(cid));
insert into student values(101,"Bincy","kollam",90);
insert into student values(102,"Binu","kulakkada",80);
insert into student values(103,"Lincy","Aby bhavan",90);
insert into student values(104,"Manu","johny nivas",90);
insert into student values(105,"Manya","manya nivas",50);
insert into course values(200,"mca",4500);
insert into course values(201,"mca",6000);
insert into course values(202,"bca",4500);
insert into course values(203,"bca",4500);
insert into course values(204,"cs",4000);

insert into Admission values(101,200,2);
insert into Admission values(102,200,3);
insert into Admission values(103,203,2);
insert into Admission values(105,204,4);
insert into Admission values(105,203,6);

create view studen as
(select * from course where coursename="mca");
select * from studen;
select sum(fees) from course where cid in (select cid from Admission where rollno=105);

select coursename,count(rollno) from course,admission where course.cid=admission.cid group by admission.cid;

