select e.emp_no, e.first_name, e.last_name,
case 
when dm.emp_no is not null then 'Manager'
else 'Employee'
end as is_manager
from employees e 
left join dept_manager dm on e.emp_no=dm.emp_no
where e.emp_no>109990;

select *
from employees e 
left join dept_manager dm on e.emp_no=dm.emp_no
where e.emp_no>109990;