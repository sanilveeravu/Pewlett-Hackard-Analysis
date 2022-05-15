-- Deliverable 1
-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
select emp_no, first_name, last_name
from employees;
	
select count(*)
from employees;
--300024

-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.

select emp_no, title, from_date,to_date from titles;
select count(*) from titles;

select e.emp_no, e.first_name, e.last_name,
       t.title, t.from_date, t.to_date
into retirement_titles	   
from employees e 
inner join titles t on (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no

select count(distinct e.emp_no)
from employees e 
inner join titles t on (e.emp_no=t.emp_no)
--WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and t.to_date='9999-01-01'

select count(*) from retirement_titles;
--133776

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date='9999-01-01'
ORDER BY emp_no, to_date DESC;

select count(*) from unique_titles;
--72458

-- Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
select count(*) as count, title
into retiring_titles
from unique_titles
group by title
order by count(*) desc;

select * from retiring_titles;

-- Deliverable 2
-- query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.

select e.emp_no, e.first_name, e.last_name, e.birth_date
from employees e ;

select de.emp_no,de.from_date, de.to_date
from dept_emp de;

select distinct on (t.emp_no) emp_no, title
from titles t
order by t.emp_no, to_date desc;

select distinct on (t.emp_no) t.emp_no, e.first_name, e.last_name, e.birth_date,
	   de.from_date, de.to_date, t.title
into mentorship_eligibilty
from employees e 
inner join dept_emp de on (e.emp_no = de.emp_no)
inner join titles t on (e.emp_no = t.emp_no)
WHERE de.to_date='9999-01-01' 
and t.to_date='9999-01-01' 
and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by t.emp_no;

select count(*) from mentorship_eligibilty;

-------------------------------------
-- Additional Summary Analysis
-------------------------------------

select count(distinct e.emp_no)
from employees e 
inner join dept_emp t on (e.emp_no=t.emp_no)
--300024

select count(distinct e.emp_no)
from employees e 
inner join dept_emp t on (e.emp_no=t.emp_no)
and t.to_date='9999-01-01'
--240124

select * 
into all_year_titles 
from 
(select distinct extract(YEAR from birth_date) birth_year 
from employees) e
cross join
(select distinct title 
from titles) t;

select t.title,extract(YEAR from e.birth_date) birth_year,count(*) tot_cnt
into emp_year_titles 
from 
(SELECT DISTINCT ON (emp_no) emp_no, title
FROM titles
WHERE to_date='9999-01-01'
ORDER BY emp_no, to_date DESC) t
inner join employees e on (e.emp_no=t.emp_no)
group by t.title,extract(YEAR from e.birth_date)
order by t.title,extract(YEAR from e.birth_date)
;

select ayt.birth_year,ayt.title,
COALESCE(tot_cnt, 0) tot_cnt from 
all_year_titles ayt 
left join emp_year_titles eyt
on (ayt.birth_year=eyt.birth_year
and ayt.title=eyt.title );

CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM crosstab ( 
	$$select ayt.birth_year,ayt.title,
COALESCE(tot_cnt, 0) tot_cnt from 
all_year_titles ayt 
left join emp_year_titles eyt
on (ayt.birth_year=eyt.birth_year
and ayt.title=eyt.title )$$
)
AS final_result ("birth_year" float8,"Assistant Engineer" bigint, "Engineer" bigint, "Manager" bigint, "Senior Engineer" bigint,"Senior Staff" bigint,"Staff" bigint, "Technique Leader" bigint)
order by 1;
