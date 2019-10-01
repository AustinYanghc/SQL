--PART A
--no1
SELECT * 
FROM UNI.STUDENT;

--no2
SELECT * 
FROM UNI.UNIT;

--no3
SELECT * 
FROM UNI.STUDENT 
WHERE UNI.STUDENT.studlname = 'Smith';

--no4
SELECT studfname as "firstname", studlname as "lastname" 
FROM UNI.STUDENT 
WHERE UNI.STUDENT.studlname = 'S%';

--no5 
SELECT studfname, studlname, studaddress 
FROM UNI.STUDENT 
WHERE UNI.STUDENT.studlname LIKE 'S%'
AND UNI.STUDENT.studfname LIKE '%i%';

--no6
SELECT unitcode, semester
FROM UNI.OFFERING o
WHERE to_char(o.ofyear, 'yyyy') = '2014';

--no7
SELECT unitcode
FROM UNI.OFFERING o
WHERE to_char(o.ofyear, 'yyyy') = '2014'
AND o.semester = '1';

--no8
SELECT *
FROM UNI.UNIT u
WHERE u.unitname LIKE 'FIT1%';

--no9
SELECT unitcode, SEMESTER
FROM UNI.OFFERING o
WHERE to_char(o.ofyear, 'yyyy') = '2013'
AND o.semester in (1,3);

--no10
SELECT studid, mark, unitcode, semester
FROM UNI.ENROLMENT e
WHERE to_char(e.ofyear, 'yyyy') = '2013'
AND e.semester = '1'
AND e.mark >= 50;


--PART B
--no1
SELECT studfname, studlname
FROM UNI.student s
JOIN UNI.enrolment en on s.studid = en.studid
WHERE en.mark >= 60 and en.mark <= 70;

--no2
SELECT unitcode, semester, stafffname, stafflname
FROM UNI.OFFERING o
JOIN UNI.STAFF s on o.chiefexam = s.STAFFID;

--no3
SELECT en.unitcode, en.semester, u.UNITNAME, studfname, studlname  
FROM UNI.student s
JOIN UNI.enrolment en on s.studid = en.studid
JOIN UNI.OFFERING o on o.unitcode = en.unitcode AND o.semester = en.semester AND o.ofyear = en.ofyear
JOIN UNI.UNIT u on u.unitcode = o.unitcode;

--no4
SELECT o.unitcode, semester, to_char(o.ofyear, 'yyyy') as offerYear, UNITNAME  
FROM UNI.OFFERING o 
JOIN UNI.UNIT u on u.unitcode = o.unitcode;

--no5
select unitcode, semester, cltype, clday, cltime
from UNI.SCHEDCLASS s
where staffid = (select staffid 
                 from uni.staff 
                 where stafffname = 'Albus' and stafflname = 'Dumbledore')
order by s.UNITCODE;

--no5
select unitcode, semester, cltype, clday, cltime
from UNI.SCHEDCLASS s
join uni.staff st on s.staffid = st.STAFFID 
where stafffname = 'Albus' and stafflname = 'Dumbledore' and to_char(s.ofyear, 'yyyy') = '2013'
order by s.UNITCODE;

--06
select semester, to_char(ofyear, 'yyyy'), mark, grade, en.unitcode, unitname 
FROM UNI.enrolment en
JOIN UNI.student s on s.studid = en.studid
JOIN UNI.UNIT u on u.unitcode = en.unitcode
where studfname = 'Mary' and studlname = 'Smith'
order by en.unitcode;

--07
select has_prereq_of as pre_unitcode, u2.unitname as pre_unitname, u1.unitcode, u1.unitname
from uni.unit u1
join uni.prereq pr on u1.unitcode = pr.unitcode
join uni.unit u2 on u2.unitcode = pr.has_prereq_of
order by unitcode;

--08
select has_prereq_of as pre_unitcode, u2.unitname as pre_unitname
from uni.unit u1
join uni.prereq pr on u1.unitcode = pr.unitcode
join uni.unit u2 on u2.unitcode = pr.has_prereq_of
where u1.unitname = 'Advanced Data Management';

--09
select s.studid, studfname, studlname
from uni.student s
join UNI.ENROLMENT en on en.STUDID = s.STUDID
where mark < 50 and to_char(ofyear, 'yyyy') = '2013';

--10
select studfname, studlname, unitcode, semester, to_char(ofyear, 'yyyy')
from uni.student s
join UNI.ENROLMENT en on en.STUDID = s.STUDID
where mark is null;