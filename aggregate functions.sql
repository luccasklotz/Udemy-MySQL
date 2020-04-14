select count(distinct dept_no) from dept_emp;
select count(*) from dept_emp;

select sum(salary) from salaries where from_date > '1997-01-01';

select max(salary) from salaries;
select min(salary) from salaries;

select avg(salary) from salaries where from_date > '1997-01-01';

select round(avg(salary),2) from salaries;

select round(avg(salary),2) from salaries where from_date > '1997-01-01';

select * from departments order by dept_no;

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments
ORDER BY dept_no ASC;