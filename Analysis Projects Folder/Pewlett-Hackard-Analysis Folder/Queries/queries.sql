SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT count(*)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';


SELECT date_part('year',birth_date),count(*) 
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
group by date_part('year',birth_date);


-- Retirement eligibility
SELECT first_name,last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT count(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

drop table retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
from retirement_info 
inner join dept_emp
on retirement_info.emp_no=dept_emp.emp_no

SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
from retirement_info as ri
inner join dept_emp as de
on ri.emp_no=de.emp_no

-- just using aliases
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;	 


SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
INTO current_emp
from retirement_info as ri
inner join dept_emp as de
on ri.emp_no=de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp ce
left join dept_emp as de
on ce.emp_no=de.emp_no
GROUP BY de.dept_no
order by de.dept_no;

SELECT COUNT(ce.emp_no), de.dept_no
into retirement_summary_by_dept
FROM current_emp ce
left join dept_emp as de
on ce.emp_no=de.emp_no
GROUP BY de.dept_no
order by de.dept_no;

SELECT emp_no,
    first_name,
last_name,
    gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');	

select * from emp_info limit 5;
drop table emp_info;

SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

select * from emp_info;

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        dm.from_date,
        dm.to_date
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)

select e.* from dept_manager dm
inner join dept_emp e on e.emp_no=dm.emp_no;

select * from current_emp;

select * from manager_info;

select * from current_emp;

SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
where de.to_date = ('9999-01-01');

select * from current_emp where emp_no=10018;
select * from dept_emp where emp_no=10018;


select e.emp_no,e.first_name,e.last_name,d.dept_name from employees e
inner join dept_emp as de
on e.emp_no=de.emp_no
inner join departments d
on de.dept_no=d.dept_no
WHERE de.to_date = ('9999-01-01')
and (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
and (d.dept_name in ('Sales','Development'))
;
