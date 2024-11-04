use tech;

create table EMP (EMPNO int primary key,ENAME varchar(30) null,JOB 
varchar(20) not null,HIERDATE date,MGR int,SAL decimal not null,COMM decimal,DEPTNO int);

describe emp;

insert into emp values(7369,'SMITH','CLERK','1980-12-17',7902,800,NULL,20),
(7499,'ALLEN','SALESMAN','1981-02-20',7698,1600,300,30),
(7521,'WARD','SALESMAN','1981-02-22',7698,1250,500,30),
(7566,'JONES','MANAGER','1981-04-02',7839,2975,NULL,20),
(7654,'MARTIN','SALESMAN','1981-09-28',7698,1250,1400,30),
(7698,'BLAKE','MANAGER','1981-05-01',7839,2850,NULL,30),
(7782,'CLARK','MANAGER','1981-06-09',7839,2450,NULL,10),
(7788,'SCOTT','ANALYST','1987-04-19',7566,3000,NULL,20),
(7839,'KING','PRESIDENT','1981-11-17',NULL,5000,NULL,10),
(7844,'TURNER','SALESMAN','1981-09-08',7698,1500,NULL,30),
(7876,'ADAMS','CLERK','1987-05-23',7788,1100,NULL,20),
(7900,'JAMES','CLERK','1981-12-03',7698,950,NULL,30),
(7902,'FORD','ANALYST','1981-12-03',7566,3000,NULL,20),
(7934,'MILLER','CLERK','1982-01-23',7782,1300,NULL,10),
(7901,'PRIYANKA','ANALYST','1981-12-03',7566,3000,NULL,50),
(7944,'KAMALA','CLERK','1982-01-23',7782,1300,NULL,50);


select deptno from emp group by deptno;
select job from emp group by job;

#display emp name sal and annual sal
select ename , sal, sal*12 as annual_salary from emp;

select max(sal)
from emp
where job in ("manager");

/*Display total number of employees working in dept 20 and salary should be >1500*/

select count(ename) num_of_emp
from emp
where deptno=20 and sal>1500;

select count(comm) from emp;

select count(*),deptno from emp
where job !="analyst"
group by deptno;

/* display maximum salary given to each job*/

select max(sal), job from emp
group by job;

/* display total salary need to pay for each job
except dept20 */

select sum(sal), job from emp
where deptno != 20
group by job;


/* display the desigantion in  which there are atleast two employees present*/

select count(*), job from emp
group by job
having count(*)>=2;


/* HAVING CLAUSE: to filter the groups we use having clause


syntax:

select group_by_expression/group_by_function
from table_name
[where <filter condition>]
group by column_name/expression
Having <filter_condition>;


order of execution:

1 - from
2 - where [ROW-BY-ROW]
3 - group by [ROW-BY-ROW]
4 - having [GROUP-BY-GROUP]
5 - select [GROUP-BY-GROUP]

*/
# display the name whicj are repeted exactly twice

select ename from emp
group by ename
having count(*)=2;

select count(*),deptno from emp
where ename like "%a%"or ename like"%s%"
group by deptno
having count(*)>=2;

select * from emp;

select sal from emp
group by sal
having count(*)>=2;

select job,sum(sal) as total_sal from emp
group by job
having sum(sal)>3450;

select job ,sal
from emp
where sal>1500;
﻿

############ASSIGNMENT ON WHERE Clause####
#1.WAQTD THE ANNUAL SALARY OF THE EMPLOYEE WHOSE NAME IS SMITH

SELECT  SAL*12 AS ANNUAL_SALARY FROM EMP
WHERE ENAME ='SMITH';

#2.WAQTD NAME OF THE EMPLOYEES WORKING AS CLERK
SELECT ENAME FROM EMP
WHERE JOB='CLERK';

#3. WAQTD SALARY OF THE EMPLOYEES WHO ARE WORKING AS SALESMAN
SELECT SAL FROM EMP
WHERE JOB='SALESMAN';

#4.WAQTD DETAILS OF THE EMP WHO EARNS MORE THAN 2000
SELECT * FROM EMP
WHERE SAL>2000;

#5.WAQTD DETAILS OF THE EMP WHOSE NAME IS JONES
SELECT * FROM EMP
WHERE ENAME='JONES';

#6. WAQTD DETAILS OF THE EMP WHO WAS HIRED AFTER 01-JAN-81
SELECT * FROM EMP
WHERE HIERDATE>'1981-01-01';

#7.WAQTD NAME AND SAL ALONG WITH HIS ANNUAL SALARY IF THE ANNUAL SALARY IS MORE THAN 12000 
SELECT ENAME,SAL,SAL*12 AS ANNUAL_SAL FROM EMP
WHERE SAL*12>12000;

#8.WAQTD EMPNO OF THE EMPLOYEES WHO ARE WORKING IN DEPT 50
SELECT EMPNO FROM EMP
WHERE DEPTNO=50;
#9. WAQTD ENAME AND HIREDATE IF THEY ARE HIRED BEFORE 1981
SELECT ENAME,HIERDATE FROM EMP
WHERE HIERDATE<'1981-01-01';

#10. WAQTD DETAILS OF THE EMPLOYEES WORKING AS MANAGER
SELECT * FROM EMP
WHERE JOB='MANAGER';

#11. WAQTD NAME AND SALARY GIVEN TO AN EMPLOYEE IF EMPLOYEE EARNS A COMMISSION OF RUPEES 1400 
SELECT ENAME,SAL FROM EMP
WHERE COMM IS NOT NULL;

#12. WAQTD DETAILS OF EMPLOYEES HAVING COMMISSION MORE THAN SALARY
SELECT * FROM EMP
WHERE COMM>SAL;

#13. WAQTD EMPNO OF EMPLOYEES HIRED BEFORE THE YEAR 87
SELECT EMPNO FROM EMP
WHERE HIERDATE<'1987-01-01';

#14. WAQTD DETAILS OF EMPLOYEES WORKING AS AN  ANALYST
SELECT * FROM EMP
WHERE JOB='ANALYST';

#15. WAQTD DETAILS OF EMPS EARNING MORE THAN 2000 RUPEES PER MONTH
SELECT * FROM EMP
WHERE SAL>2000;

######### ASSIGNMENT ON GROUP BY CLAUSE <22/05/2024>

#1.WAQTD NUMBER OF EMPLOYEES WORKING IN EACH DEPARTEMENT EXCEPT PRESIDENT.
SELECT COUNT(*),DEPTNO FROM EMP
WHERE JOB !="PRESEIDENT"
GROUP BY DEPTNO;

#2.WAQTD TOTAL SALARY NEEDED TO PAY ALL THE EMPLOYEES IN EACH JOB.
SELECT SUM(SAL),JOB FROM EMP
GROUP BY JOB;

#3.WAQTD NUMBER OF EMPLOYEEES WORKING AS MANAGER IN EACH DEPARTMENT.
SELECT COUNT(*),DEPTNO FROM  EMP
WHERE JOB='MANAGER'
GROUP BY DEPTNO;

#4.WAQTD AVG SALARY NEEDED TO PAY ALL THE EMPLOYEES IN EACH DEPARTMENT EXCLUDING THE EMPLOYEES OF DEPTNO 20.
SELECT AVG(SAL),DEPTNO FROM EMP
WHERE DEPTNO !=20
GROUP BY DEPTNO;

#5.WAQTD NUMBER OF EMPLOYEES HAVING CHARACTER 'A' IN THEIR NAMES IN EACH JOB.
SELECT COUNT(*),JOB FROM EMP
WHERE ENAME LIKE '%A%'
GROUP BY JOB;

#6.WAQTD NUMBER OF EMPLOYEES AND AVG SALARY NEEDED TO PAY THE EMPLOYEES WHO SALARY IN GREATER THAN 2000 IN EACH DEPT.
SELECT COUNT(*),AVG(SAL),DEPTNO FROM EMP
WHERE SAL>2000
GROUP BY DEPTNO;

#7.WAQDTD TOTAL SALARY NEEDED TO PAY AND NUMBER OF SALESMANS IN EACH DEPT.
SELECT SUM(SAL),COUNT(*) AS NO_SALESMAN,JOB FROM EMP
WHERE JOB = 'SALESMAN'
GROUP BY JOB;

#8.WAQTD NUMBER OF EMPLOYEES WITH THEIR MAXIMUM SALARIES IN EACH JOB.
SELECT MAX(SAL),JOB FROM EMP
GROUP BY JOB;

#9. WAQTD MAXIMUM SALARIES GIVEN TO AN EMPLOYEE WORKING IN EACH DEPT.
SELECT MAX(SAL),DEPTNO FROM EMP
GROUP BY DEPTNO;

#10. WAQTD NUMBER OF TIMES THE SALARIES PRESENT IN EMPLOYEE TABLE.
SELECT COUNT(SAL) FROM EMP;

######### ASSIGNMENT ON HAVING CLAUSE <22/05/2024>

/*1.WAQTD DNO AND NUMBER OF EMP WORKING IN EACH DEPT IF THERE
ARE ATLEAST 2 CLERKS IN EACH DEPT*/
SELECT DEPTNO,COUNT(*) FROM EMP
WHERE JOB='CLERK'
GROUP BY DEPTNO
HAVING COUNT(JOB)>=2;

#2.WAQTD DNO AND TOTAL SAALARYNEEDED TO PAY ALL EMP IN EACH DEPT IF THERE ARE ATLEAST 4 EMP IN EACH DEPT
SELECT DEPTNO,SUM(SAL) AS TOTAL_SAL FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)>=4;


#3.WAQTD NUMBER OF EMP EARNING SAL MORE THAN 1200 IN EACH JOB AND THE TOTAL SAL NEEDED TO PAY EMP OF EACH JOB MUST EXCEES 3800
SELECT SUM(SAL),JOB FROM EMP
WHERE SAL>1200
GROUP BY JOB
HAVING SUM(SAL)>3800;

#4.WAQTD DEPTNO AND NUMBER OF EMP WORKING ONLY IF THERE ARE 2 EMP WORKING IN EACH DEPT AS MANAGER.
SELECT DEPTNO,COUNT(*) FROM EMP
WHERE JOB='MANAGER'
GROUP BY DEPTNO
HAVING COUNT(JOB)>=2;

#5.WAQTD JOB AND MAX SAL OF EMP IN EACH JOB IF THE MAX SAL EXCEEDS 2600
SELECT JOB,MAX(SAL) FROM EMP
GROUP BY JOB
HAVING MAX(SAL)>2600;

#6.WAQTD THE SALARIES WHICH ARE REPEATED IN EMP TABLE
SELECT SAL FROM EMP
GROUP BY SAL
HAVING COUNT(*)>=2;

#7.WAQTD THE HIREDATE WHICH ARE DUPLICATED IN EMP TABLE
SELECT HIERDATE FROM EMP
GROUP BY HIERDATE
HAVING COUNT(*)>=2;

#8.WAQTD AVG SALARY OF EACH DEPT IF AVG SAL IS LESS THAN 3000
SELECT AVG(SAL),DEPTNO FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL)<3000;

#9.WAQTD DEPTNO IF THERE ARE ATLEAST 3 EMP IN EACH DEPT WHOS NAME HAS CHAR 'A' OR 'S'.
SELECT DEPTNO FROM EMP
WHERE ENAME LIKE '%A%' OR '%S%'
GROUP BY DEPTNO
HAVING COUNT(ENAME)>=3;

#10. WAQTD MIN AND MAX SALARIES OF EACH JOB IF MIN SAL IS MORE THAN 1000 AND MAX SAL IS LESS THAN 5000.
SELECT MIN(SAL) AS MINIMUM, MAX(SAL) AS MAXIMUM , job FROM EMP
GROUP BY JOB
HAVING MIN(SAL)>1000 or MAX(SAL)<5000;


###### May 23 ######
#ORDER BY CLAUSE :- TO DISPLAY THE DATA IN SORTED FORM either in asc or desc
#order of execution
#.1-from
#2.where[row-by-row]
#3.group by[row-by-row]
#4.having[group-by-group]
#5.select[group-by-group]
#6.order by[row-by-row]
select ENAME  from emp order by ename;
 /* SELECT column_name/expression from table_name
 [where <conditon>]*/
 /*Display the name and job of all the employees descending order of their empno*/
 select ename,job from emp
 order by empno desc;
 
 /**/
 select name,price,color,vehicletype from carrecods
 
where (vehcicletype="sedan" and color="black" and price<=10000) or
 (vehcicletype="sedan" and color in ("red","white") and price<=8000) or
 (vehcicletype="sedan" and price<=7000) or
 (vehcicletype="suv" and color="black" and price<=15000)or(vehcicletype="suv"  and price<=14000)
 order by price;
 
 ######### May 24
 /*Display the employee who are earning more then miller*/
 select  ename from emp
 where sal>(select sal from emp
 where ename="miller");
 
  /*Display the employee who hire after miller*/
 select ename, deptno,hierdate from emp
 where hierdate>(select hierdate from emp
 where ename ="miller")
 order by ename;
 
 /*Display the details employees who where working in the same designation of adams*/
 
 select * from emp
 where job=(select job from emp where ename='adams');
 
 /*display name,sal,deptno of the employees if they earn more than 2000 and work in same dept as james*/
 select ename,sal,deptno from emp
 where sal>2000 and deptno=(select deptno from emp where ename='james');
 
 /**/
 select * from emp
 where sal>(select sal from emp where ename='smith') and sal<(select sal from emp where ename='king');
 
 /**/
 select ename,sal,deptno from emp 
 where comm is not null and deptno=30 and sal>(select sal from emp where ename='scott');
 
 /**/
 select ename,hierdate from emp
 where ename like"%s" and hierdate>(select hierdate from emp where ename="james");
 
 #############  May 27
 
 select ename from emp
 where deptno=(select deptno from emp where ename='james') 
 and sal>(select sal from emp where ename='adams') 
 and job=(select job from emp where ename = 'miller' ) 
 and hierdate>(select hierdate from emp where ename='martin');
 
 select * from emp
 where job ='salesman' 
 and deptno=10 
 and comm>(select comm from emp where ename='smith') 
 and hierdate>(select hierdate from emp where ename ='king');
 
 select count(*) from emp
 where sal>(select sal from emp where ename ='smith') and sal<(select sal from emp where ename='martin');
 
 select * from emp
 where deptno='manager';
 
 create table dept(deptno int ,dname varchar(15),loc varchar(20));
 
 insert into dept values(10,'ACCOUNTING','NEW YORK'),
 (20,'RESEARCH','DALLAS'),
 (30,'SALES','CHICAGO'),
 (40,'OPEREATIONS','BOSTON');
 
 SELECT DNAME,LOC FROM DEPT ;
 
 SELECT DNAME FROM DEPT
 WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='MILLER');
 
 
 ################## Assignment DT-27/05/24
 ﻿
#1.WAQTD NAME OF THE EMPLOYEES EARNING MORE THAN ADAMS

SELECT ENAME FROM EMP 
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='ADAMS');

#2.WAQTD NAME AND SALARY OF THE EMPLOYEES EARNING LESS THAN KING

SELECT ENAME,SAL FROM EMP WHERE SAL<(SELECT SAL FROM EMP WHERE ENAME='KING');

#3.WAQTD NAME AND DEPTNO OF THE EMPLOYEES IF THEY ARE WORKING IN THE SAME DEPT AS JONES 

SELECT ENAME,DEPTNO FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='JONES');

#4.WAQTD NAME AND JOB OF ALL THE EMPLOYEES WORKING IN THE SAME DESIGNATION AS JAMES

SELECT ENAME, JOB FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME='JAMES');

#5. WAQTD EMPNO AND ENAME ALONG WITH ANNUAL SALARY OF ALL THE EMPLOYEES IF THEIR ANNUAL SALARY IS GREATER THAN WARDS ANNUAL SALARY.

SELECT EMPNO,ENAME, 12*SAL AS ANNUAL_SAL FROM EMP WHERE SAL*12> (SELECT 12*SAL FROM EMP WHERE ENAME='WARD');

#6.WAQTD NAME AND HIREDATE OF THE EMPLOYEES IF THEY ARE HIRED BEFORE SCOTT

SELECT ENAME ,HIERDATE FROM EMP WHERE HIERDATE<(SELECT HIERDATE FROM EMP WHERE ENAME='SCOTT');

#7.WAQTD NAME AND HIREDATE OF THE EMPLOYEES IF THEY ARE HIRED AFTER THE PRESIDENT

SELECT ENAME,HIERDATE FROM EMP WHERE HIERDATE>(SELECT HIERDATE FROM EMP WHERE JOB='PRESIDENT');

#8. WAQTD NAME AND SAL OF THE EMPLOYEE IF THEY ARE EARNING SAL LESS THAN THE EMPLOYEE WHOS EMPNO IS 7839

SELECT ENAME,SAL FROM EMP WHERE SAL<(SELECT SAL FROM EMP WHERE EMPNO=7839);

#9. WAQTD ALL THE DETAILS OF THE EMPLOYEES IF THE EMPLOYEES ARE HIRED BEFORE MILLER

SELECT * FROM EMP WHERE HIERDATE<(SELECT HIERDATE FROM EMP WHERE ENAME='MILLER');

#10. WAQTD ENAME AND EMPNO OF THE EMPLOYEES IF EMPLOYEES ARE EARNING MORE THAN ALLEN

SELECT ENAME,EMPNO FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME ='ALLEN');

#11. WAQTD ENAME AND SALARY OF ALL THE EMPLOYEES WHO ARE EARNING MORE THAN MILLER BUT LESS THAN ALLEN

SELECT ENAME,SAL FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='MILLER') AND SAL<(SELECT SAL FROM EMP WHERE ENAME='ALLEN');

#12. WAQTD ALL THE DETAILS OF THE EMPLOYEES WORKING IN DEPT 20 AND WORKING IN THE SAME DESIGNATION AS SMITH

SELECT * FROM EMP WHERE DEPTNO=20 AND JOB=(SELECT JOB FROM EMP WHERE ENAME='SMITH');

#13. WAQTD ALL THE DETAILS OF THE EMPLOYEES WORKING AS MANAGER IN THE SAME DEPT AS TURNER 

SELECT * FROM EMP WHERE JOB='MANAGER' AND DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='TURNER');

#14. WAQTD NAME AND HIREDATE OF THE EMPLOYEES HIRED AFTER 1980 AND BEFORE KING

SELECT ENAME,HIERDATE FROM EMP WHERE HIERDATE>'1979-12-31' AND HIERDATE <(SELECT HIERDATE FROM EMP WHERE ENAME='KING');

#15. WAQTD NAME AND SAL ALONG WITH ANNUAL SAL FOR ALL EMPLOYEES WHOS SAL IS LESS THAN BLAKE AND MORE THAN 3500

SELECT ENAME,SAL,12*SAL AS ANNUAL_SAL FROM EMP WHERE SAL>3500 OR SAL<(SELECT SAL FROM EMP WHERE ENAME='BLAKE');

#16. WAQTD ALL THE DETAILS OF EMPLOYEES WHO EARN MORE THAN SCOTT BUT LESS THAN KING

SELECT * FROM EMP WHERE SAL<(SELECT SAL FROM EMP WHERE ENAME='KING') AND SAL>(SELECT SAL FROM EMP WHERE ENAME='SCOTT');

#17.WAQTD NAME OF THE EMPLOYEES WHOS NAME STARTS WITH 'A' AND WORKS IN THE SAME DEPT AS BLAKE 

SELECT ENAME FROM EMP WHERE ENAME LIKE 'A%' AND DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME ='BLAKE');


#18. WAQTD NAME AND COMM IF EMPLOYEES EARN COMISSION AND WORK IN THE SAME DESIGNATION AS SMITH 

SELECT ENAME , COMM FROM EMP WHERE COMM IS NOT NULL AND JOB=(SELECT JOB FROM EMP WHERE ENAME ='SMITH');

#19. WAQTD DETAILS OF ALL THE EMPLOYEES WORKING AS CLERK IN THE SAME DEPT AS TURNER

SELECT * FROM EMP WHERE JOB='CLERK' AND DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='TURNER');

#20. WAQTD ENAME, SAL AND DESIGNATION OF THE EMPLOYEES WHOS ANNUAL SALARY IS MORE THAN SMITH AND LESS THAN KING.

SELECT ENAME,SAL,JOB FROM EMP 
WHERE SAL*12>(SELECT SAL*12 FROM EMP WHERE ENAME='SMITH')
 AND SAL*12 <(SELECT SAL*12 FROM EMP WHERE ENAME='KING');


###################### May 28 
select dname from dept where deptno=(select deptno from emp where ename ='adams');

#WAQTD LOC OF ADAMS
select loc from dept where deptno=(select deptno from emp where ename ='adams');

SELECT  ENAME FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='NEW YORK');

select * from dept;


SELECT COUNT(*) FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='RESEARCH');

select ename,sal from emp where deptno=20 and sal<(select sal from emp where ename='scott');

select * from emp where job ='manager' and deptno=(select deptno from dept where dname='accounting');

select * from emp where job=(select job from emp where ename='miller') and deptno=(select deptno from dept where loc ="new york");

SELECT COUNT(*) FROM EMP WHERE JOB ='CLERK' AND DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SMITH') AND SAL>(SELECT SAL FROM EMP WHERE ENAME ='KING') AND HIERDATE>(SELECT HIERDATE FROM EMP WHERE ENAME='MARTIN')AND DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='BOSTON');

SELECT MAX(SAL) FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');


############ MAY 28 Assignment part 2

﻿
#21.WAQTD DNAME OF THE EMPLOYEES WHOS NAME IS SMITH

SELECT DNAME FROM DEPT WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SMITH');

#22.WAQTD DNAME AND LOC OF THE EMPLOYEE WHOS ENAME IS KING

SELECT DNAME,LOC FROM DEPT WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='KING');

#23. WAQTD LOC OF THE EMP WHOS EMPLOYEE NUMBER IS 7902

SELECT LOC FROM DEPT WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE EMPNO=7902);

#24.WAQTD DNAME AND LOC ALONG WITH DEPTNO OF THE EMPLOYEE WHOS NAME ENDS WITH 'R'.

SELECT DNAME ,LOC ,DEPTNO FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%R');

#25.WAQTD DNAME OF THE EMPLOYEE WHOS DESIGNATION IS PRESIDENT 

SELECT DNAME FROM DEPT WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE JOB='PRESIDENT');

#26. WAQTD NAMES OF THE EMPLOYEES WORKING IN ACCOUNTING DEPARTMENT

SELECT ENAME FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING');

#27.WAQTD ENAME AND SALARIES OF THE EMPLOYEES WHO ARE WORKING IN THE LOCATION CHICAGO

SELECT ENAME,SAL FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='CHICAGO');

#28.WAQTD DETAILS OF THE EMPLOYEES WORKING IN SALES

SELECT * FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME ='SALES');

#29.WAQTD DETAILS OF THE EMP ALONG WITH ANNUAL SALARY IF EMPLOYEE ARE WORKING IN NEW YORK

SELECT *,12*SAL AS ANNUAL_SAL FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='NEW YORK');

#30.WAQTD NAMES OF EMPLOYEES WORKING IN OPERATIONS DEPARTMENT

SELECT ENAME FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='OPEREATIONS');

####################### MAY 30

SELECT ENAME FROM EMP WHERE SAL=(SELECT MAX(SAL)FROM EMP);

SELECT ENAME,SAL FROM EMP WHERE SAL=(SELECT MIN(SAL) FROM EMP);

/* TYPE OF SUBQUERY
1. SINGLE ROW SUBQUERY
2. MULTI ROW SUBQUERY*/

SELECT DNAME FROM DEPT WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME IN ('ALLEN' ,'SMITH')); # = WILL RETURN ONLY ONE VALUE
SELECT DNAME FROM DEPT WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE ENAME IN ('ALLEN' ,'SMITH'));# IN IS USED FOR MULTI ROW

/*
#1. SINGLE ROW SUB QUERY:

---> If the sub query returns exactly 1 record/value we call it as single row sub query
---> If it returns only one value then we can use the normal operators or the special operators to compare the values

#2 MULTI ROW SUB QUERY:

---> If the sub query return more than one record/ values we call it as multi row sub query
---> If it returns more than one value then we cannot use the normal operators, we have to use only special operators to compare the value
*/


# SUB QUERY OPERATOR 
# ALL IS THE SUB QUERY OPERATOR:- IS A SEPECIAL OPERATOR USED ALONG WITH A RELATIONAL OP(>,<,>=,<=) TO COMPARE THE VALUES PRESENT AT THE RHS.
#> ALL OP RETURNS TRUE IF ALL THE VALUES AYT THE RHS HAVE SATISFIED THE CONDITION.
#> IF ANY ONE RECORDS ISS TRUE WE WILL USE 'ANY'

SELECT ENAME FROM EMP WHERE SAL>ALL(SELECT SAL
 FROM EMP WHERE DEPTNO=20);
 
 SELECT ENAME,SAL FROM EMP
 WHERE SAL<ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
 
 SELECT ENAME FROM EMP WHERE SAL<ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
 
 SELECT ENAME FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME ='ADAMS');
 
 
 ########### Assingment MAY 30 MIN MAX
 ﻿
########################ASSIGNMENT ON MAX & MIN:

# 41.WAQTD NAME OF THE EMPLOYEE EARNING MAXIMUM SALARY 

SELECT ENAME FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP );

#42.WAQTD NAME OF THE EMPLOYEE EARNING MINIMUM SALARY

SELECT ENAME FROM EMP WHERE SAL=(SELECT MIN(SAL)FROM EMP);

#43. WAQTD NAME AND HIREDATE OF THE EMPLOYEE HIRED BEFORE ALL THE EMPLOYEES (FIRST EMP)

SELECT ENAME,HIERDATE FROM EMP WHERE HIERDATE=(SELECT MIN(HIERDATE) FROM EMP);

#44. WAQTD NAME AND HIREDATE OF THE EMPLOYEES HIRED AT THE LAST 

SELECT ENAME,HIERDATE FROM EMP WHERE HIERDATE=(SELECT MAX(HIERDATE) FROM EMP);

#45.WAQTD NAME, COMM OF THE EMPLOYEE WHO EARNS MIN COMISSION 

SELECT ENAME,COMM FROM EMP WHERE COMM=(SELECT MIN(COMM) FROM EMP);

#46. WAQTD NAME, SAL AND COMM OF THE EMPLOYEE EARNING MAXIMUM COMISSION

SELECT ENAME,SAL,COMM FROM EMP WHERE COMM=(SELECT MAX(COMM) FROM EMP);

#47.WAQTD DETAILS OF THE EMPLOYEE WHO HAS GREATEST EMPNO 

SELECT * FROM EMP WHERE EMPNO=(SELECT MAX(EMPNO) FROM EMP);

#49.WAQTD DETAILS OF THE EMPLOYEES EARNING LEAST ANNUAL SALARY 

SELECT * FROM EMP WHERE SAL*12=(SELECT MIN(SAL*12) FROM EMP);

#50.WAQTD NAME, ANNUAL SALARY OF THE EMPLOYEES IF THEIR ANNUAL SALARY IS MORE THAN ALL THE SAL

SELECT ENAME,SAL*12 AS ANNUAL_SAL FROM EMP WHERE SAL*12 >ALL(SELECT MAX(SAL) FROM EMP);

########################
﻿
#############ASSIGNMENT ON CASE 1 & 2
#31.WAQTD NAMES OF THE EMPLOYEES EARNING MORE THAN SCOTT IN ACCOUNTING DEPT

SELECT ENAME FROM EMP  WHERE SAL>ALL(SELECT SAL FROM EMP WHERE ENAME='SCOTT');

#32.WAQTD DETAILS OF THE EMPLOYEES WORKING AS MANAGER IN THE LOCATION CHICAGO

SELECT * FROM EMP WHERE JOB='MANAGER' AND DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='CHICAGO');

#33.WAQTD NAME AND SAL OF THE EMPLOYEES EARNING MORE THAN KING IN THE DEPT ACCOUNTING

SELECT ENAME,SAL FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='KING') AND DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING');

#34.WAQTD DETAILS OF THE EMPLOYEES WORKING AS SALESMAN IN THE DEPARTEMENT SALES 

SELECT * FROM EMP WHERE  JOB='SALESMAN' AND DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');

#35.WAQTD NAME, SAL, JOB, HIREDATE OF THE EMPLOYEES WORKING IN OPERATIONS DEPARTMENT AND HIRED BEFORE KING

SELECT ENAEME,SAL,JOB,HIERDATE FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='OPERATIONS' ) AND HIERDATE<(SELECT HIERDATE FROM EMP WHERE ENAME='KING' );

#36.DISPLAY ALL THE EMPLOYEES WHOSE DEPARTMET NAMES ENDING 'S'. 

SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE DNAME LIKE '%S');

#37.WAQTD DNAME OF THE EMPLOYEES WHOS NAMES HAS CHARACTER 'A' IN IT.

SELECT DNAME FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE'%A%');
 
#38. WAQTD DNAME AND LOC OF THE EMPLOYEES WHOS SALARY IS RUPEES 800. 

SELECT DNAME,LOC FROM DEPT WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE SAL = 800);

#39.WAQTD DNAME OF THE EMPLOYEES WHO EARN COMISSION

SELECT DNAME FROM DEPT WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE COMM IS NOT NULL);

#40. WAQTD LOC OF THE EMPLOYEES IF THEY EARN COMISSION IN DEPT 40

SELECT LOC FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE DEPTNO=40 AND COMM IS NOT NULL);

############################################

#ASSIGNMENT ON TYPES OF SUB QUERY.

#51.WAQTD NAME OF THE EMPLOYEES EARNING SALARY MORE THAN THE SALESMAN

SELECT ENAME FROM EMP WHERE SAL>ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN');

#52.WAQTD DETAILS OF THE EMPLOYEES HIRED AFTER ALL THE CLERKS 

SELECT * FROM EMP WHERE HIERDATE>ALL(SELECT HIERDATE FROM EMP WHERE JOB ='CLERKS');

#53.WAQTD NAME AND SALARY FOR ALL THE EMPLOYEES IF THEY ARE EARNING LESS THAN ATLEST A MANAGER 

SELECT ENAME ,SAL FROM EMP WHERE SAL<ALL(SELECT SAL FROM EMP WHERE JOB='MANAGER');

#54. WAQTD NAME AND HIREDATE OF EMPLOYEES HIRED BEFORE ALL THE MANAGERS

SELECT ENAME,HIERDATE FROM EMP WHERE HIERDATE>ALL(SELECT HIERDATE FROM EMP WHERE JOB='MANAGER');

#55.WAQTD NAMES OF THE EMPLOYEES HIRED AFTER ALL THE MANAGERS AND EARNING SALARY MORE TIIAN ALL THE CLERKS

SELECT ENAME FROM EMP WHERE HIERDATE>ALL(SELECT HIERDATE FROM EMP WHERE JOB='MANAGERS') AND SAL>ALL(SELECT SAL FROM EMP WHERE JOB='CLERK');

#56. WAQTD DETAILS OF THE EMPLOYEES WORKING AS CLERK AND HIRED BEFORE ATLEST A SALESMAN

SELECT * FROM EMP WHERE JOB='CLERK' AND HIERDATE<ANY(SELECT HIERDATE FROM EMP WHERE HIERDATE<ANY(SELECT HIERDATE FROM EMP WHERE JOB='SALESMAN'));

#57.WAQTD DETAILS OF EMPLOYEES WORKING IN ACCOUNTING OR SALES DEPT 

SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE DNAME IN ('ACCOUNTING','SALES') );

#58. WAQTD DEPARTMENT NAMES OF THE EMPOYEES WITH NAME SMITH, KING AND MILLER

SELECT DNAME FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME  IN ("SMITH","KING","MILLER"));

#59.WAQTD DETAILS OF EMPLOYEES WORKING NEWYORK OR CHICAGO

SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC IN ("NEW YORK","CHICAGO"));

#60. WAQTD EMP NAMES IF EMPLOYEES ARE HIRED AFTER ALL THE EMPLOYEES OF DEPT 10

SELECT ENAME FROM EMP WHERE HIERDATE>ALL(SELECT HIERDATE FROM EMP WHERE DEPTNO=10);



############################################## MAY 31 SQL CLASS

# SUB QUERY
# NESTED QUERY

SELECT MIN(SAL) FROM EMP WHERE SAL>(SELECT MIN(SAL) FROM EMP WHERE SAL>(SELECT MIN(SAL) FROM EMP WHERE SAL>(SELECT MIN(SAL) FROM EMP)));

SELECT DNAME FROM DEPT WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE SAL=(SELECT MIN(SAL) FROM EMP WHERE SAL>(SELECT MIN(SAL)FROM EMP)));
 
 #EMPLOYE MANAGER RELATIONSHIP
 SELECT ENAME FROM EMP WHERE EMPNO=(SELECT MGR FROM EMP WHERE ENAME='FORD');
 
 SELECT DNAME FROM DEPT WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE EMPNO=(SELECT MGR FROM EMP WHERE ENAME ='BLAKE'));
 
 #WAQTD NAMES OF THE EMPLOYEES REPORTING TO KING
 SELECT ENAME FROM EMP WHERE MGR=(SELECT EMPNO FROM EMP WHERE ENAME ='KING');
 
 ################### ASSIGMENT ON EMPLOYEE MANAGER RELATIONSHIP
 
 #WAQTD LOCATION OF ADAMS,S MANAGER'S MANAGER
 
 SELECT LOC FROM DEPT WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE EMPNO=(SELECT MGR FROM EMP WHERE EMPNO=(SELECT MGR FROM EMP WHERE ENAME='ADAMS')));
 
#WAQTD Name and salary given to the employees reporting To James.

SELECT ENAME ,SAL FROM EMP WHERE MGR=(SELECT EMPNO FROM EMP WHERE ENAME='JAMES');

#WAQTD dname of the employee reporting to President.

SELECT DNAME FROM DEPT WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE MGR=(SELECT EMPNO FROM EMP WHERE JOB='PRESIDENT'));

#WAQTD Department details of the employees who are reporting to MILLER.

SELECT * FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE MGR=(SELECT EMPNO FROM EMP WHERE ENAME='SCOTT'));


########## JUNE 3

/*
TO FIND MANAGER -> SELECT MGR IN SUB Q
TO FIND EMPLOYEES -> SELECT EID IN SUB Q*/


/*
WE USE ON CLAUSE TO USE JOINNG CONDITION

SYNTAX FOR INNER JOIN

SELECT COL_NAMES FROM TABLE1 INNER JOIN TABLE2
ON <JOIN CONDITION>

JOIN CONDITION :(ONLY FOR INNER JOIN AND OUTER JOIN)
TABLE.COL_NAME=TABLE2.COL_NAME

*/

SELECT * FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;


SELECT ENAME,LOC FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE JOB='MANAGER' ;

######################ASSIGNMENT 03 JUNE
# WATD ENAME SAL AND DNAME OF THE EMPLOYEE WORKING AS CLERK IN DEPT 20 AND EARNING MORE THAN 1800

SELECT ENAME,SAL,DNAME FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO WHERE JOB='CLERK' AND EMP.DEPTNO=20 AND SAL>1800;

#WAQTD ENAME DEPTNO DNAME AND LOC OF THE EMP EARNING MORE THAN 2000 IN NEW YORK

SELECT ENAME,DNAME,LOC,DEPT.DEPTNO FROM EMP INNER JOIN DEPT ON  EMP.DEPTNO=DEPT.DEPTNO WHERE SAL>2000 AND LOC='NEW YORK';

﻿

#ASSIGNMENT ON INNER JOIN:
#1.NAME OF THE EMPLOYEE AND HIS LOCATION OF ALL THE EMPLOYEES.

SELECT ENAME,LOC FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;

#2. WAQTD DNAME AND SALARY FOR ALL THE EMPLOYEE WORKING IN ACCOUNTING.

SELECT DNAME,SAL FROM DEPT INNER JOIN EMP ON DEPT.DEPTNO=EMP.DEPTNO WHERE DNAME='ACCOUNTING';

#3. WAQTD DNAME AND ANNUAL SALARY FOR ALL EMPLOYEES WHOS SALARY IS MORE THAN 2340

SELECT DNAME , SAL*12 AS ANNUAL_SAL FROM DEPT INNER JOIN EMP ON DEPT.DEPTNO=EMP.DEPTNO WHERE SAL>2340;

#4. WAQTD ENAME AND DNAME FOR EMPLOYEES HAVING CAHARACTER 'A' IN THEIR DNAME 

SELECT ENAME,DNAME FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO WHERE ENAME LIKE '%A%';

#5.WAQTD ENAME AND DNAME FOR ALL THE EMPLOYEES WORKING AS SALESMAN

SELECT ENAME,DNAME FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO WHERE JOB='SALESMAN';

#6.WADTD DNAME AND JOB FOR ALL THE EMPLOYEES WHOS JOB AND DNAME STARTS WITH CHARACTER 'S'

SELECT DNAME,JOB FROM DEPT INNER JOIN EMP ON DEPT.DEPTNO=EMP.DEPTNO WHERE DNAME LIKE'S%';

#7.WAQTD DNAME AND MGR NO FOR EMPLOYEES REPORTING TO 7839

SELECT DNAME,MGR FROM DEPT INNER JOIN EMP ON DEPT.DEPTNO=EMP.DEPTNO WHERE MGR=7839;

#8. WAQTD DNAME AND HIREDATE FOR EMPLOYEES HIRED AFTER 83 INTO ACCOUNTING OR RESEARCH DEPT

SELECT DNAME,HIERDATE FROM DEPT INNER JOIN EMP ON DEPT.DEPTNO=EMP.DEPTNO WHERE HIERDATE>'1983-12-31' AND DNAME IN ('ACCOUNTING','RESEARCH');

#9. WAQTD ENAME AND DNAME OF THE EMPLOYEES WHO ARE GETTING COMM IN DEPT 10 OR 30

SELECT ENAME,DNAME FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO WHERE COMM IS NOT NULL AND EMP.DEPTNO IN(10,30);

#10. WAQTD DNAME AND EMPNO FOR ALL THE EMPLOYEES WHO'S EMPNO ARE (7839,7902) AND ARE WORKING IN LOC NEW YORK.

SELECT DNAME,EMPNO FROM DEPT INNER JOIN EMP ON DEPT.DEPTNO=EMP.DEPTNO WHERE EMPNO IN(7839,7902) AND LOC='NEW YORK';



########################## JUNE 04
/*
LEFT OUTER JOIN 
IT WILL GIVE YOU MATCHED RECORDS ALONG WITH UNMATCHED RECORDS FROM LEFT TABLE

SYNTAX:
SELECT COL_NAME
FROM TABLE1 LEFT OUTER JOIN TABLE2
0N<JOIN CONDITION>
WHERE.......

RIGTHT OUTER JOIN 

REVERSE OF LEFT OUTER JOIN

FULL OUTER JOIN

SYNTAX:

SELECT COL_NAME
FROM TABLE LEFT OUTER JOIN TABLE2
ON <JOIN CONDITION>
UNION
SELECT COL_NAME 
FROM TABLE1 RIGHT OUTER JOIN TABLE2
ON<JOIN CONDITION>;

*/

SELECT ENAME,DNAME FROM EMP LEFT OUTER JOIN DEPT ON DEPT.DEPTNO= EMP.DEPTNO
UNION
SELECT ENAME ,DNAME FROM EMP RIGHT OUTER JOIN DEPT ON DEPT.DEPTNO=EMP.DEPTNO;


-- JUNE 06
-- SELF JOIN: WHEN DATA TO BE 

-- SYNTAX
/*
SELECT COL_NAMES
FROM TABLE AS T1,TABLE AS T2
WHERE <JOIN CONDITION>

SELECT COL_NAMES FROM TABLE AS T1 INNER JOIN TABLE AS T2 ON <JOIN CONDITION>
*/

SELECT E1.ENAME,M1.ENAME AS Manager_NAME FROM EMP AS E1 JOIN EMP AS M1 ON E1.MGR=M1.EMPNO; -- SELF JOIN
SELECT E1.ENAME,M1.ENAME AS Manager_NAME FROM EMP AS E1 , EMP AS M1 WHERE E1.MGR=M1.EMPNO; -- INNER JOIN



SELECT E1.ENAME ,E1.SAL ,M1.ENAME AS MANAGER,M1.SAL FROM EMP AS E1 JOIN EMP AS M1 ON E1.MGR=M1.EMPNO WHERE E1.JOB ='ANALYST';
SELECT E1.ENAME ,E1.SAL ,M1.ENAME AS MANAGER,M1.SAL FROM EMP AS E1 , EMP AS M1 WHERE E1.MGR=M1.EMPNO AND E1.JOB ='ANALYST';

SELECT E1.ENAME,E1.JOB,M1.ENAME,M1.JOB FROM EMP AS E1, EMP AS M1 WHERE E1.MGR=M1.DEPTNO AND E1.JOB=M1.JOB;

-- MAY 11

-- CONCAT
-- LOWER
-- UPPER
--


SELECT * FROM EMP;

SELECT concat(ENAME,":-",JOB) AS ENAME_JOB  FROM EMP;

SELECT CONCAT("SHIV ","SANKAR") AS MY_NAME FROM DUAL;

SELECT SUM(10+20) FROM DUAL;
SELECT SUM(10-50) FROM DUAL;

SELECT CONCAT("HII GOOD MORNING ",ENAME) AS HELLO FROM EMP WHERE JOB="MANAGER";

SELECT UPPER("shiv") from dual; -- upercase
-- or
select ucase("shiv") from dual;

-- select mid name substring

select mid("shiv",1,3) from dual;

select substring("shiv",1,3) from dual;

-- 
select length("shiv") from dual;

-- Numeric function
-- ABS(ABSOLUTE SQUAR VALE)
SELECT ABS(-25);
-- CIEL (CELING)
SELECT CEIL(5.1);

-- ROUND
SELECT ROUND(5.5);

-- FLOOR
SELECT FLOOR(5.1);

-- POWER
SELECT POWER(SAL,2) FROM EMP;

-- MOD

SELECT SAL FROM EMP WHERE MOD(EMPNO,2)=0;

-- DATE AND TIEM FUNCTION

-- NOW
SELECT NOW();
 
-- CURDATE
SELECT CURDATE();

-- CURTIME();
SELECT CURTIME();

-- DATE_ADD
SELECT DATE_ADD(curdate(),INTERVAL 5 MONTH);
-- DATEDIFF
SELECT DATEDIFF(curdate(),HIERDATE)FROM EMP;


-- DAYNAME
SELECT DAYNAME(CURDATE()) FROM DUAL;






