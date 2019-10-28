
drop table employee;

CREATE TABLE "employee" (
  "manager_id"  INTEGER,
  "employee_id" INTEGER,
  PRIMARY KEY("employee_id")
);


insert into employee values(1,1);
insert into employee values(1,2);
insert into employee values(1,3);
insert into employee values(1,4);
insert into employee values(1,5);
insert into employee values(2,6);
insert into employee values(2,7);
insert into employee values(2,8);
insert into employee values(2,9);
insert into employee values(3,10);
insert into employee values(3,11);
insert into employee values(3,12);
insert into employee values(3,13);
insert into employee values(4,14);
insert into employee values(4,15);
insert into employee values(4,16);
insert into employee values(4,17);
insert into employee values(5,18);
insert into employee values(5,19);
insert into employee values(5,20);



with cte_emp1 ( manager_id, count_of_employees)
as (select manager_id, count(*) as emp
from employee 
where manager_id > 3
group by manager_id), 
cte_emp2 ( manager_id, count_of_employees)
as (select manager_id, count(*) as emp
from employee 
where manager_id < 4
group by manager_id)
select * from cte_emp1 
union 
select * from cte_emp2;

WITH RECURSIVE
  cnt(x) AS (VALUES(1) UNION ALL SELECT x+1 FROM cnt WHERE x<10)
SELECT x FROM cnt;


with recursive 
emp_cte ( employee_id, manager_id, x)
as 
(select employee_id, manager_id, 1 
from employee
where employee_id=manager_id
union
select employee.employee_id, employee.manager_id, x+1 
from employee 
inner join 
emp_cte 
on emp_cte.employee_id = employee.manager_id 
where employee.manager_id != employee.employee_id
)
select * from emp_cte;
