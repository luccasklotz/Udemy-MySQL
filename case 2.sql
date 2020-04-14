select dm.emp_no, e.first_name, e.last_name, (max(s.salary)-min(s.salary)) as salary_difference,
case 
when (max(s.salary)-min(s.salary)) > 30000 then 'yes'
else 'no'
end as higher_than_30000
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
join salaries s on s.emp_no = dm.emp_no
group by s.emp_no;
