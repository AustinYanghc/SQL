--no1
select max(mark)
from uni.enrolment en
where en.unitcode = 'FIT1004'
and en.semester = 1
and to_char(en.ofyear, 'yyyy') = '2013';

--no2
select round(avg(mark),1)
from uni.enrolment en
where en.unitcode = 'FIT1040'
and en.semester = 2
and to_char(en.ofyear, 'yyyy') = '2013';

--no3
select to_char(en.ofyear, 'yyyy') as year, en.semester, round(avg(mark),1)
from uni.enrolment en
where en.unitcode = 'FIT1040'
group by to_char(en.ofyear, 'yyyy'), en.semester
order by to_char(en.ofyear, 'yyyy');

--no4
select count(studid)
from uni.enrolment en
where en.unitcode = 'FIT1040'
and to_char(en.ofyear, 'yyyy') = '2013';

select count(distinct studid)
from uni.enrolment en
where en.unitcode = 'FIT1040'
and to_char(en.ofyear, 'yyyy') = '2013';

--no5
select unitcode, semester, to_char(ofyear, 'yyyy') as year, count(studid)
from uni.enrolment 
where to_char(ofyear, 'yyyy') = '2013'
group by unitcode, semester, to_char(ofyear, 'yyyy')
order by count(studid);

--no6
select count(has_prereq_of) as "Total number"
from uni.prereq
where unitcode = 'FIT2077';

--no7
select unitcode, count(has_prereq_of) as "Number of Prerequisite Units"
from uni.prereq
group by unitcode
order by unitcode;

--no8
select has_prereq_of as "Prerequisite Unitcode", u2.unitname, count(has_prereq_of) as "Total show time"
from uni.unit u1
join uni.prereq pr on u1.unitcode = pr.unitcode
join uni.unit u2 on u2.unitcode = pr.has_prereq_of
group by has_prereq_of, u2.unitname
order by has_prereq_of;

select has_prereq_of as "Prerequisite Unitcode", u.unitname, count(has_prereq_of) as "Total show time"
from uni.prereq pr
join uni.unit u on u.unitcode = pr.has_prereq_of
group by has_prereq_of, u.unitname
order by has_prereq_of;

--no9
select unitcode, count(studid) as "Total choices"
from uni.enrolment en
where to_char(en.ofyear, 'yyyy') = '2013'
group by unitcode
order by count(studid) desc;

--no10
select studfname, studlname, studdob
from uni.student s
join uni.enrolment en on s.studid = en.studid
where studdob = (select min(studdob) from uni.student)
and en.unitcode = 'FIT1004';

select studfname, studlname, studdob
from uni.student s
where studdob = (select min(studdob) 
                 from uni.student s
                 join uni.enrolment en on s.studid = en.studid
                 where en.studid in (select en.studid from uni.enrolment where en.unitcode = 'FIT1004'));

select min(studdob) 
from uni.student s
join uni.enrolment en on s.studid = en.studid
where en.studid in (select en.studid from uni.enrolment where en.unitcode = 'FIT1004');

select en.studid from uni.enrolment en where en.unitcode = 'FIT1004';

select studfname, studlname, studdob
from uni.student s;

--no11
select studfname, studlname, mark
from uni.student s
join uni.enrolment en on s.studid = en.studid
where mark > (select avg(mark) from uni.enrolment where en.unitcode = 'FIT1040')
and en.unitcode = 'FIT1040'
and en.semester = 2
and to_char(en.ofyear, 'yyyy') = '2013';

select avg(mark) from uni.enrolment where unitcode = 'FIT1040';

select studfname, studlname, mark
from uni.student s
join uni.enrolment en on s.studid = en.studid
where en.unitcode = 'FIT1040'
and en.semester = 2
and to_char(en.ofyear, 'yyyy') = '2013';



