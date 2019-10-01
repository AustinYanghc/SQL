--no1
select u.unitcode, count(has_prereq_of)
from uni.prereq pr
right outer join uni.unit u on u.unitcode = pr.has_prereq_of
group by u.unitcode
order by u.UNITCODE;

--no2
select u2.unitcode, u2.unitname
from uni.prereq pr
join uni.unit u1 on u1.unitcode = pr.has_prereq_of
right outer join uni.unit u2 on pr.unitcode = u2.unitcode
group by u2.unitcode, u2.unitname
having count(has_prereq_of) = 0
order by unitcode;


select unitcode, unitname
from uni.unit
minus
select u1.unitcode, u1.unitname
from uni.prereq pr
join uni.unit u1 on u1.unitcode = pr.unitcode
order by unitcode;


select u1.unitcode, unitname
from uni.prereq pr
join uni.unit u1 on u1.unitcode = pr.unitcode
where u1.unitcode = (select pr.has_prereq_of from uni.prereq);

--no3
select nvl(avg(mark),0) as avg_mark
from uni.enrolment;


select unitcode, to_char(ofyear, 'yyyy') as year, semester, to_char(nvl(avg(mark),0),'90.00') as avg_mark
from uni.enrolment
group by unitcode, to_char(ofyear, 'yyyy'), semester
order by avg_mark;

select FOOD_SERVE_COST 