select * from young_employee_count yec;
select * from total_employee_count tec;
select * from actually_young_employee_count ayec;

drop table if exists young_employee_percentage;

select ayec.count AS "Employees Younger Than 50", yec.count AS "Employees Younger Than 55", tec.count AS "Total Employees", 
round((cast(yec.count as decimal)/tec.count)*100,2) AS "% of Employees Younger Than 55"
into young_employee_percentage
from young_employee_count yec
cross join total_employee_count tec
cross join actually_young_employee_count ayec;

select * from young_employee_percentage;