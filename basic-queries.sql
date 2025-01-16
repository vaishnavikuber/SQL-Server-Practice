------------section 1 querying data

----select

select * from PersonDetails;

select first_name,last_name from PersonDetails;

select first_name,last_name,contact from PersonDetails;

select * from PersonDetails where gender='Male';

select * from PersonDetails order by first_name;

--------------section 2

----order by

select * from PersonDetails order by first_name desc;

select * from PersonDetails order by first_name,last_name;

select * from PersonDetails order by first_name asc ,last_name desc;

select first_name from PersonDetails order by email;

select first_name from PersonDetails order by len(first_name) desc;

select first_name,last_name from PersonDetails order by 2;

----------------section 3 limiting rows

-----offset fetch

select first_name,last_name from PersonDetails 
order by first_name
offset 88 rows;

select first_name,last_name from PersonDetails 
order by last_name
offset 50 rows
fetch first 20 rows only;

----select top

select top 30 email
from PersonDetails
order by first_name;

select top 3 percent email
from PersonDetails
order by id;

select top 1 first_name,contact 
from PersonDetails 
order by id desc;

select top 2  with ties zipcode
from PersonDetails
order by first_name;

---------------section 4 filtering data

----distinct

select distinct first_name 
from PersonDetails;

select distinct first_name,last_name 
from PersonDetails;

select distinct contact 
from PersonDetails
group by contact;

-----where
select * from PersonDetails
where first_name='Rocky'
order by last_name desc;

select * from PersonDetails
where first_name='Alfy';

-----and
select * from PersonDetails
where first_name='Alfy' and last_name='Poad';

select email from PersonDetails
where zipcode=3412 and first_name='Alfy';

----or

select first_name,last_name,email
from PersonDetails
where first_name='Alfy' or first_name='heinrik' or first_name='Rocky';

select first_name,last_name,email
from PersonDetails
where (first_name='Alfy' or first_name='heinrik') and last_name='Poad';

-----in

select first_name,last_name from PersonDetails
where first_name in('Alfy','heinrik');

------between
select id,first_name from PersonDetails
where id between 27 and 60;

-----like
select first_name,last_name from PersonDetails
where last_name like 'p%';

select first_name,email from PersonDetails
where last_name like 's%er'
order by first_name;

select first_name,last_name,email from PersonDetails
where last_name like '_e%'
order by first_name;

select first_name,last_name,email from PersonDetails
where first_name like '[abc]%'
order by first_name;

select first_name,last_name,email from PersonDetails
where first_name like '[^d-g]%'
order by first_name;

select first_name,last_name,email from PersonDetails
where last_name not like '_e%'
order by first_name;

select first_name,last_name,email from PersonDetails
where last_name like '%e!%' escape '!'
order by first_name;

-----alises

select first_name+' '+last_name as 'name' from PersonDetails;

select contact 'phone_number' from PersonDetails 
order by phone_number;

select p.first_name,p.email
from PersonDetails p;

--------------section 6 grouping data

---group by
select first_name from PersonDetails group by first_name;

select first_name,COUNT(*) from PersonDetails
group by first_name;

---having
select  p.first_name
from PersonDetails p
group by first_name
having count(*)>1;

------section 8 

---- union
select id from PersonDetails
union
select PersonId from Person;

----intersect
select id from PersonDetails
intersect
select PersonId from Person;

----except
select id from PersonDetails
except
select PersonId from Person;


