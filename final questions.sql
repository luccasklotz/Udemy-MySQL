-- Q1

SELECT 
    d.dept_name, e.gender, AVG(s.salary)
FROM
    employees e
        JOIN
    salaries s ON s.emp_no = e.emp_no
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
        JOIN
    departments d ON d.dept_no = de.dept_no
GROUP BY de.dept_no, e.gender
order by de.dept_no;

-- Q2

SELECT 
    MIN(dept_no), MAX(dept_no)
FROM
    dept_emp;

-- Q3

select e.emp_no, min(de.dept_no), 
case
when e.emp_no <= 10020 then '11022'
when e.emp_no between 10021 and 10040 then '11039'
end as manager
from employees e 
join dept_emp de on de.emp_no=e.emp_no
group by e.emp_no
order by emp_no;

SELECT 
    e.emp_no,
    (SELECT 
            MIN(dept_no)
        FROM
            dept_emp de
        WHERE
            de.emp_no = e.emp_no) dept_no,
    CASE
        WHEN e.emp_no <= 10020 THEN '11022'
        WHEN e.emp_no BETWEEN 10021 AND 10040 THEN '11039'
    END AS manager
FROM
    employees e
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
GROUP BY e.emp_no
ORDER BY emp_no;

-- Q4

select e.first_name,e.last_name,e.hire_date
from employees e 
where e.hire_date like '%2000%';

select * from employees where year(hire_date)=2000;

-- Q5

select * from titles where title like '%engineer%';
select * from titles where title = 'senior engineer';

-- Q6

-- Q7

SELECT 
    count(*)
FROM
    salaries
WHERE
    DATEDIFF(to_date, from_date) >= 364
        AND salary >= 100000
        and to_date not like '%9999%';

-- Q8

drop function if exists largest_salary
delimiter $$
create function largest_salary(p_emp_no integer) returns decimal (10,2)
deterministic
begin
declare largest_salary decimal (10,2);
select max(salary)
into largest_salary
from salaries
where emp_no=p_emp_no;
return largest_salary;
end$$
delimiter ;

drop function if exists smallest_salary
delimiter $$
create function smallest_salary(p_emp_no integer) returns decimal (10,2)
deterministic
begin
declare smallest_salary decimal (10,2);
select min(salary)
into smallest_salary
from salaries
where emp_no=p_emp_no;
return smallest_salary;
end$$
delimiter ;

select largest_salary(11356), smallest_salary(11356);

-- Q10

drop function if exists salary_calc;
delimiter $$
create function salary_calc(p_emp_no integer, type_salary varchar(3)) returns decimal (10,2)
deterministic
begin
declare salary_calc decimal (10,2);
select case type_salary
when 'min' then min(salary)
when 'max' then max(salary)
else max(salary)-min(salary)
end as salary_calc
into salary_calc
from salaries
where emp_no=p_emp_no;
return salary_calc;
end$$
delimiter ;

select salary_calc(11356,'min'),salary_calc(11356,'max'),salary_calc(11356,'xaa');