select e.emp_no,e.first_name,e.last_name,
case
when max(de.to_date) like '%9999%' then 'Is still employed'
else 'Not an employee anymore'
end as still_employee
from employees e
join dept_emp de on de.emp_no=e.emp_no
group by emp_no;

select * from dept_emp limit 10;