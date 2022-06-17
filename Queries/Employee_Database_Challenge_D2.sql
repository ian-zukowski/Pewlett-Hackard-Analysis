-- drop table at start of code so it will run every new time
Drop Table if exists mentorship_eligibility;

-- select columns for new table from employees, dept_emp, and titles
-- distinct on emp_no so no duplicates
Select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date
, de.from_date, de.to_date, t.title
into mentorship_eligibility
from employees e
join dept_emp de on e.emp_no=de.emp_no
join titles t on e.emp_no=t.emp_no
-- limit to current employees
where (de.to_date = '9999-01-01')
-- limit to those born in 1965
AND (birth_date between '1965-01-01' AND '1965-12-31')
-- order by emp_no
order by e.emp_no;

-- verify results
select * from mentorship_eligibility;