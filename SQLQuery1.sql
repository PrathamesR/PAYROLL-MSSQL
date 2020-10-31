--UC1
create database Payroll;
select name,database_id from sys.databases;
use Payroll;

--UC2
create table employee_payroll(
	id int NOT NULL identity(1,1) PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	salary DECIMAL(10,2) NOT NULL,
	start_Date DATETIME NOT NULL 
) ;

--UC3
insert into employee_payroll values('Prathamesh',  1000,'2020-1-1');
insert into employee_payroll values('Name',  1000,'2020-1-1');
insert into employee_payroll values('ZA',  1000,'2020-1-1');
insert into employee_payroll values('XYZ',  1000,'2020-2-1');
insert into employee_payroll values('Bill',  1000,'2020-2-1','1234567890','NA','Pune',NULL);
insert into employee_payroll values('MNO',  1000,'2020-2-1','789456123','Comps','Mumbai',null);

--UC4
select * from employee_payroll;

--UC5
select * from employee_payroll where name='Prathamesh';
select * from employee_payroll where start_Date between '2019-5-6' and GETDATE();

--UC6
alter table employee_payroll add gender VARCHAR(1);
update employee_payroll set gender = 'M' where name ='Bill' or name ='Charlie';
update employee_payroll set gender = 'F' where gender is NULL;

--UC7
select gender,SUM(basic_Pay) as Total, AVG(basic_Pay) as Average, Count(name) as Count from employee_payroll group by gender; 

exec sp_help employee_payroll;

--UC8
alter table employee_payroll add phoneNo VARCHAR(10) NOT NULL;
alter table employee_payroll add department VARCHAR(50) NOT NULL DEFAULT('NA');
alter table employee_payroll add addr VARCHAR(50) DEFAULT(NULL);

alter table employee_payroll drop column addr;

update employee_payroll set addr='Mumbai';

delete from employee_payroll where name = 'Name';

EXEC sp_RENAME 'employee_payroll.basicPay', 'basic_Pay', 'COLUMN';
EXEC sp_RENAME 'employee_payroll.address', 'addr', 'COLUMN';


