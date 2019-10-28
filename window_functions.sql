drop table salary;

CREATE TABLE "salary" (
  "employee_id"  INTEGER,
  "salary" INTEGER,
  PRIMARY KEY("employee_id")
);


insert into salary values(20,8559);
insert into salary values(19,9529);
insert into salary values(18,8602);
insert into salary values(17,9751);
insert into salary values(16,8968);
insert into salary values(15,7940);
insert into salary values(14,7884);
insert into salary values(13,8912);
insert into salary values(12,7476);
insert into salary values(11,7592);
insert into salary values(10,8975);
insert into salary values(9,7840);
insert into salary values(8,7079);
insert into salary values(7,9520);
insert into salary values(6,9851);
insert into salary values(5,9034);
insert into salary values(4,7790);
insert into salary values(3,7346);
insert into salary values(2,7406);
insert into salary values(1,7071);


select employee_id, salary, dense_rank() over (order by salary desc) as ranked
from salary ;


# cumulative summation 
select employee_id, salary, sum(salary) over (order by salary asc) * 100 / (select sum(salary) from salary) as perc 
from salary ;



