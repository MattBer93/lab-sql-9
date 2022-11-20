use sakila;
select * from rental; 
-- In this lab we will find the customers who were active in consecutive months of May and June. 
-- Follow the steps to complete the analysis.

-- 1) Create a table rentals_may to store the data from rental table with information for the month of May.
drop table if exists rentals_may;
create table `rentals_may` (
	may_id smallint(5) unsigned not null auto_increment,
    rental_id int not null,
    rental_date datetime not null,
    inventory_id mediumint unsigned not null,
    customer_id smallint(5) unsigned not null,
    return_date datetime default null,
    staff_id tinyint(3) unsigned not null,
    last_update datetime not null,
    primary key(may_id),
    constraint foreign key (rental_id) references rental(rental_id) on delete restrict on update cascade
) engine=InnoDB auto_increment=1003 default charset=utf8;


-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
insert into rentals_may(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
select rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update from rental
where substring(rental_date, 7, 1) = 5;


-- Create a table rentals_june to store the data from rental table with information for the month of June.
drop table if exists rentals_june;
create table `rentals_june` (
	june_id smallint(5) unsigned not null auto_increment,
    rental_id int not null,
    rental_date datetime not null,
    inventory_id mediumint unsigned not null,
    customer_id smallint(5) unsigned not null,
    return_date datetime default null,
    staff_id tinyint(3) unsigned not null,
    last_update datetime not null,
    primary key(june_id),
    constraint foreign key (rental_id) references rental(rental_id) on delete restrict on update cascade
) engine=InnoDB auto_increment=1003 default charset=utf8;


-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
insert into rentals_june(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
select rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update from rental
where substring(rental_date, 7, 1) = 6;


-- Check the number of rentals for each customer for May.
select * from rentals_may;

select customer_id, count(may_id) as may_total from rentals_may
group by customer_id
order by may_total desc;


-- Check the number of rentals for each customer for June.
select customer_id, count(june_id) as june_total from rentals_june
group by customer_id
order by june_total desc;














