drop table salary;

CREATE TABLE "salary_dept" (
  "employee_id"  INTEGER,
  "department" Integer,
  "salary" INTEGER,
  PRIMARY KEY("employee_id")
);

insert into salary_dept values(20,1,8559);
insert into salary_dept values(19,1,9529);
insert into salary_dept values(18,1,8602);
insert into salary_dept values(17,1,9751);
insert into salary_dept values(16,1,8968);
insert into salary_dept values(15,2,7940);
insert into salary_dept values(14,2,7884);
insert into salary_dept values(13,2,8912);
insert into salary_dept values(12,2,7476);
insert into salary_dept values(11,2,7592);
insert into salary_dept values(10,2,8975);
insert into salary_dept values(9,2,7840);
insert into salary_dept values(8,3,7079);
insert into salary_dept values(7,3,9520);
insert into salary_dept values(6,3,9851);
insert into salary_dept values(5,3,9034);
insert into salary_dept values(4,3,7790);
insert into salary_dept values(3,3,7346);
insert into salary_dept values(2,3,7406);
insert into salary_dept values(1,3,7071);



# partition by dept.

select department, employee_id, salary,  rank() over ( partition by department order by salary desc) as ranked 
from salary_dept 
order by 1, 3 desc;