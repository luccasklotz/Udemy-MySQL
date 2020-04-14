delimiter $$
create function f_emp_avg_salary (p_emp_no integer) returns decimal (10,2)
deterministic no sql reads sql data
begin
declare v_avg_salary decimal(10,2);
select avg(s.salary)
into v_avg_salary
from employees e
join salaries s
on e.emp_no = s.emp_no
where e.emp_no = p_emp_no;
return v_avg_salary;
end$$
delimiter ;