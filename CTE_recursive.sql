CREATE TABLE "employee_hist" (
  "employee"  Text,
  "manager" Text,
  PRIMARY KEY("employee")
);


insert into employee_hist values('Vimal','Haimanti');
insert into employee_hist values('Haimanti','Amit');
insert into employee_hist values('Amit','Adarsh Nand Bahadur');
insert into employee_hist values('Adarsh Nand Bahadur','Tanmoy Sengupta');
insert into employee_hist values('Tanmoy Sengupta','Bharath Upadhyay');
insert into employee_hist values('Bharath Upadhyay','Dhiraj Rajaram');
insert into employee_hist values('Dhiraj Rajaram','Ambiga');
insert into employee_hist values('Haritha','Pronoy');
insert into employee_hist values('Pronoy','Adarsh Nand Bahadur');


with emp_chain 
as (
select employee, manager 
from employee_hist 
where employee = 'Vimal'
union 
select employee_hist.employee, employee_hist.manager 
from employee_hist 
inner join 
emp_chain 
on employee_hist.employee=emp_chain.manager
)
select * from emp_chain;


employee    manager
----------  ----------
Vimal       Haimanti
Haimanti    Amit
Amit        Adarsh Nan
Adarsh Nan  Tanmoy Sen
Tanmoy Sen  Bharath Up
Bharath Up  Dhiraj Raj
Dhiraj Raj  Ambiga