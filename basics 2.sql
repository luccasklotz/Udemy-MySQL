select count(salary) from salaries where salary>100000;

select * from dept_manager;

select * from employees order by hire_date desc;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

SELECT 
    EMP_NO, AVG(SALARY)
FROM
    SALARIES
GROUP BY EMP_NO
HAVING
	AVG(salary) > 120000;
    
SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) > 200
ORDER BY first_name DESC;

select emp_no,count(from_date) from dept_emp where from_date > '2000-01-01' group by emp_no having count(from_date)>1 order by emp_no;

select * from salaries order by salary desc limit 10;

select * from dept_emp order by emp_no limit 100;