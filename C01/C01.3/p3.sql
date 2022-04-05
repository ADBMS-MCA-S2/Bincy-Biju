create database employee3;

use employee3;

create table  employee(EMPNO VARCHAR(10),EMP_NAME varchar(50),DEPT VARCHAR(50),SALARY INT(50),DOJ DATE,BRANCH VARCHAR(50));

INSERT INTO employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH)VALUES("E101","Amit","production",45000,"12-03-00","Bangalore");

INSERT INTO employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH)VALUES("E102","Amit","HR",70000,"03-07-02","Bangalore");

INSERT INTO employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH)VALUES("E103","Sunita","anagamer",120000,"11-01-01","mysore");

INSERT INTO employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH)VALUES("E104","Sunita","IT",67000,"01-08-01","mysore");

INSERT INTO employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH)VALUES("E105","mahesh","civil",145000,"20-09-03","Mumbai");


select * from employee;


select EMPNO ,SALARY from employee;


SELECT AVG(SALARY)FROM employee;


SELECT COUNT(EMPNO)FROM employee;


SELECT count(DISTINCT EMP_NAME) FROM employee;

SELECT EMP_NAME,COUNT(EMP_NAME),SUM(SALARY) from employee group by EMP_NAME;

SELECT SUM(SALARY) FROM employee WHERE SALARY>120000;


SELECT EMP_NAME FROM employee ORDER BY EMP_NAME DESC;


SELECT * from employee where EMP_NAME="AMIT" AND SALARY>50000;











