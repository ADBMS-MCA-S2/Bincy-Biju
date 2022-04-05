create database employe;
use employe;
create table  employee(E_ID VARCHAR(10),E_NAME varchar(50),AGE VARCHAR(50),SALARY INT(50));
INSERT INTO employee VALUES("101","ANU",22,9000);
INSERT INTO employee VALUES("102","Shane",29,8000);
INSERT INTO employee VALUES("103","Rohan",34,6000);
INSERT INTO employee VALUES("104","Scott",44,10000);
INSERT INTO employee VALUES("105","Tiger",35,8000);
INSERT INTO employee VALUES("106","Alex",27,7000);
INSERT INTO employee VALUES("107","Abhi",29,8000);
SELECT COUNT(E_NAME)FROM employee;

SELECT MAX(AGE) FROM employee;

SELECT MIN(AGE) FROM employee;

SELECT SUM(AGE) FROM employee;

SELECT AVG(AGE) FROM employee;

CREATE VIEW emp as
select age from employee;

select * from emp;

select salary from employee group by salary;

SELECT SALARY FROM employee ORDER BY SALARY ASC;

SELECT SALARY FROM employee ORDER BY SALARY DESC;



