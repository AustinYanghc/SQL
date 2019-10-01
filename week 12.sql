SELECT
    *
FROM
    payroll.employee
WHERE
    empmsal < 1000
ORDER BY empno;

--02
SELECT DISTINCT
    deptno
FROM
    payroll.employee
ORDER BY deptno;

--03
SELECT
    *
FROM
    payroll.employee
WHERE
        empjob = 'TRAINER'
    AND
        empmsal < 2500
    AND
        deptno = 20
ORDER BY empno;

--04
SELECT
    empname AS "Name",
    empjob AS "Job",
    empmsal AS "Monthly Salary",
    empcomm AS "Commission"
FROM
    payroll.employee
WHERE
    empmsal > empcomm
ORDER BY empname;

--05
SELECT
    empname,
    empjob
FROM
    payroll.employee
WHERE
    empjob LIKE '%R'
ORDER BY empname;

--06
SELECT
    empname,
    empjob
FROM
    payroll.employee
WHERE
        empname LIKE 'J%'
    OR
        empname LIKE 'K%'
    OR
        empname LIKE 'M%'
ORDER BY empname;

--07
SELECT
    empname,
    empjob,
    to_char(empbdate,'Dd-Mon-YYYY') as BIRTHDATE,
    empmsal
FROM
    payroll.employee
WHERE
        empbdate < TO_DATE('01-JAN-1970','dd-MON-YYYY')
    AND
        empmsal > 1500
ORDER BY empname;

--08
SELECT
    empname,
    empcomm
FROM
    payroll.employee
WHERE
    empcomm IS NULL
ORDER BY empname;

--09
SELECT
    e.empname,
    e.empjob,
    d.deptname,
    d.deptlocation,
    e.empmsal
FROM
    payroll.employee e,
    payroll.department d
WHERE
        e.deptno = d.deptno
    AND
        d.deptlocation = 'NEW YORK'
ORDER BY e.empname;

--10
SELECT
    e.empname,
    e.empjob,
    d.deptname,
    d.deptlocation
FROM
    payroll.employee e,
    payroll.department d
WHERE
        e.deptno = d.deptno
    AND
        d.deptlocation NOT IN (
            'NEW YORK','CHICAGO'
        )
ORDER BY e.empname;

--11
SELECT
    empname,
    empjob,
    to_char(empbdate,'Dd-Mon-YYYY') as BIRTHDATE,
    empmsal
FROM
    payroll.employee
WHERE
    empbdate BETWEEN TO_DATE('01-JAN-1960','DD-MON-YYYY') AND TO_DATE('31-DEC-1964','DD-MON-YYYY')
ORDER BY empbdate;

--12
SELECT
    empname,
    empjob,
    empmsal
FROM
    payroll.employee
WHERE
    empmsal NOT BETWEEN 1500 AND 3000
ORDER BY empname;

--13
SELECT
    empname,
    empjob,
    mgrno
FROM
    payroll.employee
WHERE
    mgrno IS NOT NULL
ORDER BY empname;

--14
SELECT
    e.empname,
    e.empjob,
    d.deptname,
    d.deptlocation,
    e.empmsal
FROM
    payroll.employee e
    JOIN payroll.department d ON (
        e.deptno = d.deptno
    )
WHERE
    (
            d.deptlocation = 'DALLAS'
        OR
            e.empjob = 'MANAGER'
    ) AND
        e.empmsal > 2500
ORDER BY e.empname;

--15
SELECT
    e.empname,
    e.empjob,
    e.empmsal,
    s.salgrade
FROM
    payroll.employee e,
    payroll.salgrade s
WHERE
    e.empmsal BETWEEN s.sallower AND s.salupper
ORDER BY
    s.salgrade,
    e.empmsal;
    
--16
SELECT
    d.deptname,
    d.deptlocation,
    e.empname
FROM
    payroll.employee e
    RIGHT OUTER JOIN payroll.department d ON (
        e.deptno = d.deptno
    )
ORDER BY
    d.deptname,
    e.empname;
    
--17
SELECT
    e.empname "Employee",
    e.empjob AS "Emp Job",
    m.empname AS "Manager"
FROM
    payroll.employee e
    LEFT OUTER JOIN payroll.employee m ON (
        e.mgrno = m.empno
    )
ORDER BY
    m.empname,
    e.empname;

SELECT empno, EMPNAME
from payroll.employee;
    
--18
SELECT
    e.empname,
    d.deptname,
    to_char(histbegindate,'DD-Mon-YYYY') as HISTBEGIN,
    to_char(histenddate,'Dd-Mon-YYYY') as HISTEND,
    h.histmsal
FROM
    payroll.employee e
    JOIN payroll.history h ON (
        e.empno = h.empno
    )
    JOIN payroll.department d ON (
        d.deptno = h.deptno
    )
ORDER BY
    e.empname,
    h.histbegindate DESC;
    
--19
SELECT
    empname,
    empjob,
    empmsal,
    empmsal * 12 AS "Annual Salary"
FROM
    payroll.employee
ORDER BY empname;

--20
SELECT
    empname,
    empjob,
    empmsal,
    empcomm,
    empmsal * 12 + nvl(empcomm,0) AS "Annual Income"
FROM
    payroll.employee
ORDER BY empname;

--1
SELECT
    empno,
    empname,
    empjob,
    empmsal,
    empmsal * 12 AS annual_salary,
    empmsal * 12 * 1.1 AS ann_sal_with_rise
FROM
    payroll.employee
ORDER BY empno;

--2
SELECT
    empname,
    TO_CHAR(empbdate,'DD-Mon-YYYY') AS birthdate,
    floor(months_between(SYSDATE, empbdate) / 12) AS "Age in Yrs"
FROM
    payroll.employee
ORDER BY empname;

select 
Days_between(SYSDATE, empbdate)
FROM
    payroll.employee;

--3
SELECT
    empno,
    empname,
    empjob,
    empmsal,
    empcomm,
    ( empmsal + nvl(empcomm,0) ) * 12 AS total_salary
FROM
    payroll.employee
ORDER BY empno;

--4
SELECT
    'EMPLOYEE '
     || empinit
     || '. '
     || initcap(empname)
     || ' IS A '
     || initcap(empjob)
     || ' AND WORKS IN THE '
     || initcap(deptname)
     || ' DEPARTMENT.'
FROM
    payroll.employee e
    JOIN payroll.department d ON (
        e.deptno = d.deptno
    )
ORDER BY empname;

select *
FROM
    payroll.employee;
    
--5
SELECT
    empname,
    TO_CHAR(empbdate,'dd-Mon-yyyy') AS birthdate,
    round(
        months_between(SYSDATE,empbdate),
        1
    ) AS age_in_months
FROM
    payroll.employee
ORDER BY empname;

--6
SELECT
    empname,
    TO_CHAR(empbdate,'dd-Mon-yyyy') AS birthdate
FROM
    payroll.employee
WHERE
    EXTRACT(month FROM empbdate) = 2
ORDER BY empname;

--7
SELECT
    empname,
    empmsal,
    empcomm
FROM
    payroll.employee
WHERE
    empcomm > empmsal
ORDER BY empname;

--8
SELECT
    'EMPLOYEE '
     || empinit
     || '. '
     || initcap(empname)
     || ' was born on '
     || rtrim(TO_CHAR(empbdate,'DAY') )
     || ' the '
     || EXTRACT(DAY FROM empbdate)
     || ' of '
     || rtrim(TO_CHAR(empbdate,'MONTH') )
     || ','
     || EXTRACT(YEAR FROM empbdate)
FROM
    payroll.employee
ORDER BY empname;

--9
SELECT
    e.empno,
    e.empname,
    COUNT(*) AS nbr_registrations
FROM
    payroll.employee e
    JOIN payroll.registration r ON (
        e.empno = r.empno
    )
GROUP BY
    e.empno,
    e.empname
ORDER BY empname;

--10
SELECT
    empno,
    empname,
    TO_CHAR(empbdate,'DD-Mon-YYYY')
FROM
    payroll.employee
WHERE
    empbdate = (
        SELECT
            MIN(empbdate)
        FROM
            payroll.employee
    )
ORDER BY empname;

--11
SELECT
    d.deptno,
    d.deptname,
    COUNT(e.empno) "NbrOfEmployees",
    MIN(empmsal) "MinSalary",
    MAX(empmsal) "MaxSalary",
    SUM(empmsal) "TotalSalary",
    round(AVG(empmsal),2) "AvgSalary"
FROM
    payroll.employee e
    RIGHT OUTER JOIN payroll.department d ON (
        e.deptno = d.deptno
    )
GROUP BY
    d.deptno,
    d.deptname
ORDER BY deptno;

select *
from
payroll.employee;

payroll.department;

--12
SELECT
    deptno,
    empjob,
    SUM(empmsal)
FROM
    payroll.employee
GROUP BY
    deptno,
    empjob
ORDER BY deptno,empjob;

--13
SELECT
    empno,
    empname,
    empmsal
FROM
    payroll.employee
WHERE
    empmsal > (
        SELECT
            AVG(empmsal)
        FROM
            payroll.employee
    )
ORDER BY empno;

--14
SELECT
    d.deptno,
    d.deptname,
    round(AVG(empmsal),2) "AvgSalary"
FROM
    payroll.employee e
    JOIN payroll.department d ON (
        e.deptno = d.deptno
    )
GROUP BY
    d.deptno,
    d.deptname
HAVING
    AVG(empmsal) = (
        SELECT
            MAX(AVG(empmsal) )
        FROM
            payroll.employee
        GROUP BY
            deptno
    )
ORDER BY deptno;

--15
SELECT
    c.crscode,
    c.crsdesc,
    COUNT(o.crscode) "NbrOfferings"
FROM
    payroll.course c
    JOIN payroll.offering o ON (
        c.crscode = o.crscode
    )
GROUP BY
    c.crscode,
    c.crsdesc
HAVING
    COUNT(o.crscode) = (
        SELECT
            MAX(COUNT(o.crscode) )
        FROM
            payroll.offering
        GROUP BY
            crscode
    )
ORDER BY crscode;

select *
from payroll.offering;

--16
SELECT
    e.empname,
    e.empjob,
    TO_CHAR(empbdate,'dd-Mon-yyyy')
FROM
    payroll.employee e
WHERE
        ( e.empjob,EXTRACT(YEAR FROM empbdate) ) = (
            SELECT
                e.empjob,
                EXTRACT(YEAR FROM empbdate)
            FROM
                payroll.employee e
            WHERE
                empname = 'SCOTT'
        )
    AND
        e.empname <> 'SCOTT'
ORDER BY empname;

--17
SELECT
    empno
FROM
    payroll.employee
MINUS
SELECT 
    empno
FROM
    payroll.registration
ORDER BY empno;

--18
SELECT DISTINCT
    empno AS "TrainerAndStudent"
FROM
    payroll.offering
INTERSECT SELECT DISTINCT
    empno
FROM
    payroll.registration
ORDER BY "TrainerAndStudent";