create database tech; # This is One time execution
use tech; # Multi Time execution
# if we get error no database selected then execute above query

/* Syntax of create table
create table   table_name(col1 Datatype constraints,
col2 Datatype constrain .....
...coln Datatype constrain);*/

create table student(sid int primary key,
sname varchar(30) not null,
phone_num char(10) unique not null,
gender varchar(15),
place varchar(30) not null);

# Above query is one time execution

select * from student; /*To display entire table This is Multitime execute*/

describe student; # thise will show the detail with describtion of the table student   

###### May 9 class ######

/*Syntax of ALTER command 
ALTER table table_name condition*/

select * from student; 

alter table student add column email varchar(100) unique not null;

/*Syntax
INSERT into table_name values(val1,val2....valn)*/

insert into student values(1,"Shiv","9692913336","Male","Bbsr","shiv4040@gmail.com");
insert into student values(2,"Ram","9692912336","Male","Bbsr","ram4040@gmail.com"),
(3,"Syam","9792912336","Male","Bbsr","syam4040@gmail.com");#To insert multiple tuples

/*Syntax of update 
UPDATE table_name set col_name= new_value where reference_col_name=values*/
UPDATE student set place="Tamilnadu" where sid=3;

####### May 10th ######
set sql_safe_updates=0;# when we get error 1175 safe update mode we need to use this query
/*Delete Syntax
DELETE from table_name WHERE condition*/
delete from student where sid=2;
select*from student;
/*Systax of TRUNCATE 
TRUNCATE TABLE TABLE_NAME*/
truncate table student;
rollback; 

##### May 11 #########
/*TCL Commands
COMMIT AND ROLLBACK*/
SELECT*FROM student;

insert into student values(4,"Hari","9692913436","Male","Tamil Nadu","shiv440@gmail.com");

commit;

insert into student values(5,"Priya","9690913436","Female","Tamil Nadu","priya440@gmail.com");
rollback;

/*Move to sales Data for DQL LECTURE*/
