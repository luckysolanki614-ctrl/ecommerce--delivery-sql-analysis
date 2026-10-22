use Lucy;

create table customers(
	customer_id  int primary key,
    customer_name  varchar(50)
    );
    
create table orders(
order_id  int primary key,
customer_id int,
order_dates date ,
order_amount  int
);

insert into customers 
values(1,'Aman'),(2,'Rohit'),(3,'Pooja'),(4,'Sneha'),(5,'vikram');

insert into orders
values(101,1,'2025-01-10',1200),(102,1,'2025-02-15',2500),(103,1,'2025-03-05',800),(104,2,'2025-01-20',3000),(105,3,'2025-02-18',1500),(106,3,'2025-04-12',4500);

select customers.customer_name , orders.order_id from customers
 left join orders on customers.customer_id = orders.customer_id where orders.order_id is null;
 
select customers.customer_name , count(orders.order_id) as total_orders ,
sum(orders.order_amount) as total_amount,
round(avg(orders.order_amount),2) as aov
 from customers
 inner join orders on customers.customer_id = orders.customer_id group by customers.customer_name;
 
 create table restaurants(
	rest_id int primary key,
    rest_name varchar(25),
    city varchar(20)
    );
    
create table deliveries(
del_id int primary key,
rest_id int ,
order_date date,
bill_amount int
);

insert into restaurants values
(11,'burger king','delhi'),
(12,'haldiram','jaipur'),
(13,'pizza hut','delhi'),
(14,'dominos','jaipur'),
(15,'subway','bikaner'),
(16,'barbeque','bikaner');
insert into deliveries values
(1001,11,'2025-01-05',450),
(1002,11,'2025-01-15',750),
(1003,11,'2025-02-10',900),
(1004,12,'2025-01-20',1200),
(1005,12,'2025-02-25',1800),
(1006,13,'2025-01-18',600),
(1007,14,'2025-02-14',1500),
(1008,14,'2025-02-14',2100),
(1009,14,'2025-03-01',800);

select restaurants.rest_id ,deliveries.rest_id from restaurants 
left join deliveries on restaurants.rest_id = deliveries.rest_id where deliveries.rest_id is null;

select restaurants.rest_name, count(deliveries.del_id) as total_div ,
sum(deliveries.bill_amount) as total_spent ,
round(avg(deliveries.bill_amount),2) as avg_amount from restaurants
inner join deliveries on restaurants.rest_id = deliveries.rest_id group by restaurants.rest_name having(total_div >=2 or total_spent >2000);

select restaurants.city , count(deliveries.del_id) as total_div,
sum(deliveries.bill_amount) as total_revenue,
round(avg(deliveries.bill_amount) ) as aov from restaurants
inner join deliveries on restaurants.rest_id = deliveries.rest_id group by restaurants.city order by total_revenue desc; 

select restaurants.rest_name , count(distinct deliveries.order_date) as unique_days,
count(deliveries.del_id) as total_count from restaurants inner join deliveries on restaurants.rest_id= deliveries.rest_id 
group by restaurants.rest_name having count(distinct deliveries.order_date)>=2;

select monthname(order_date) as order_month,
count(deliveries.del_id) as total_count, sum(deliveries.bill_amount) as total_revenue,
round(avg(deliveries.bill_amount),2) as aov from deliveries group by monthname(order_date);

with monthly_summary as(
select
	month(order_date) as month_num,
    monthname(order_date) as order_month,
    sum(bill_amount) as total_revenue
from deliveries group by month(order_date), monthname(order_date)
)
select
	order_month,
    total_revenue,
    lag(total_revenue) over (order by month_num) as pre_month_revenue,
    total_revenue - lag(total_revenue) over(order by month_num) as revenue_diff
from monthly_summary;

select order_date, year(order_date),month(order_date),monthname(order_date),day(order_date)
from deliveries;

select del_id, order_date , bill_amount from deliveries
where month(order_date)=2;

select restaurants.rest_name, deliveries.order_date , deliveries.bill_amount from restaurants 
inner join deliveries on deliveries.rest_id=restaurants.rest_id where month(deliveries.order_date)=1;

select * from Empl;
select * from Emplinfo;

select * from Empl 
inner join Emplinfo on Empl.id = Emplinfo.id where address='bikaner';

with ranked_salary as(
select
id,name, department,
dense_rank ()over(partition by department order by salary desc) as salary_rank
 from Empl
 )
 select
 id, name ,department,
 salary_rank from ranked_salary 
 where salary_rank=1;
 
 select del_id, order_date,bill_amount,
 lag(bill_amount) over (order by order_date) as pra_month
 from deliveries;
 
 select del_id, order_date,bill_amount,
 lead(bill_amount)over(order by order_date) as next_month
 from deliveries;
 
 with growth_rate as(
 select
 monthname(order_date)as month_name , month (order_date) as month_num, sum(bill_amount) as total_revenue from deliveries
 group by month(order_date), monthname(order_date)
 )
 select
 month_name,
 total_revenue,
 lag(total_revenue) over(order by month_num) as prev_month,
 total_revenue - lag(total_revenue) over (order by month_num) as mom_diff
 from growth_rate;
 
 
 select restaurants.rest_name, deliveries.order_date, deliveries.bill_amount 
 from restaurants inner join deliveries on restaurants.rest_id = deliveries.rest_id where month(deliveries.order_date)=1;
 
 select restaurants.rest_name, count(deliveries.order_date) as total_orders, sum(deliveries.bill_amount) as total_revenue,
 round(avg(deliveries.bill_amount),2) as aov from restaurants inner join deliveries on restaurants.rest_id = deliveries.rest_id 
 group by restaurants.rest_name;
 
  with growth_rate as(
 select
 monthname(order_date)as month_name , month (order_date) as month_num, sum(bill_amount) as total_revenue from deliveries
 group by month(order_date), monthname(order_date)
 )
 select
 month_name,
 total_revenue,
 lag(total_revenue) over(order by month_num) as prev_month,
 total_revenue - lag(total_revenue) over (order by month_num) as mom_diff
 from growth_rate;