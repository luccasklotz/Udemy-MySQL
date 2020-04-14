drop function if exists f_emp_info;
delimiter $$
create function f_emp_info (p_first_name varchar(255), p_last_name varchar(255)) returns integer
deterministic no sql reads sql data
begin
declare v_avg_salary decimal(10,2);
select s.salary
into v_avg_salary
from salaries s
join employees e on e.emp_no=s.emp_no
where e.first_name = p_first_name and e.last_name = p_last_name
order by s.from_date asc
limit 1;
return v_avg_salary;
end$$
delimiter ;

select f_emp_info('aruna','journel');