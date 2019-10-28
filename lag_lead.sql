drop table customer_hist_sales;
CREATE TABLE "customer_hist_sales" (
  "customer_id"  Integer,
  "year" Integer,
  "sales" Integer,
  PRIMARY KEY("customer_id","year")
);


insert into customer_hist_sales values(1,2009,10);
insert into customer_hist_sales values(1,2010,18);
insert into customer_hist_sales values(1,2011,19);
insert into customer_hist_sales values(1,2012,21);
insert into customer_hist_sales values(1,2013,29);
insert into customer_hist_sales values(2,2009,10);
insert into customer_hist_sales values(2,2010,12);
insert into customer_hist_sales values(2,2011,15);
insert into customer_hist_sales values(2,2012,13);


select customer_id, year, sales, 
lag( sales,1,'NA') over (partition by customer_id order by year)
from customer_hist_sales;