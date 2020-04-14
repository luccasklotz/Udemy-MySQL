use employees;
drop procedure if exists emp_info;
delimiter $$
create procedure emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
begin
select emp_no
into p_emp_no
from employees
where first_name = p_first_name
and last_name = p_last_name
group by emp_no;
end$$
delimiter ;