select * from dept_manager_dup order by dept_no;

select * from departments_dup order by dept_no;

select m.dept_no,m.emp_no,d.dept_name
from dept_manager_dup m
inner join
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, d.dept_no
FROM
    employees e
        INNER JOIN
    dept_manager d ON e.emp_no = d.emp_no
ORDER BY e.emp_no;

select m.dept_no,m.emp_no,d.dept_name
from dept_manager_dup m join departments_dup d on m.dept_no = d.dept_no
group by m.emp_no
order by dept_no;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        left JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.last_name = 'MARKOVITCH'
ORDER BY dm.dept_no desc , e.emp_no;

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'margareta'
        AND e.last_name = 'markovitch'
ORDER BY e.emp_no;

select e.first_name, e.last_name, e.hire_date, t.title, t.from_date, d.dept_name
from employees e 
join titles t on e.emp_no = t.emp_no
join dept_emp on dept_emp.emp_no = e.emp_no
join departments d on d.dept_no = dept_emp.dept_no;

select e.gender, t.title, count(e.gender) as count_per_gender
from employees e 
join titles t on e.emp_no = t.emp_no
where t.title = 'manager'
group by e.gender;

SELECT

    *

FROM

    (SELECT

        e.emp_no,

            e.first_name,

            e.last_name,

            NULL AS dept_no,

            NULL AS from_date

    FROM

        employees e

    WHERE

        last_name = 'Denis' UNION SELECT

        NULL AS emp_no,

            NULL AS first_name,

            NULL AS last_name,

            dm.dept_no,

            dm.from_date

    FROM

        dept_manager dm) as a

ORDER BY -a.emp_no DESC;



