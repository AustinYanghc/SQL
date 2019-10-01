select unit_name
from unit u 
where unit_code = 'FIT9999';

select *
from ENROLMENT
--where stu_nbr = 11111113;

--no1
update unit
set unit_name = 'place holder unit'
where unit_code = 'FIT9999';

--no2
update ENROLMENT
set enrol_mark = 75, enrol_grade = 'D'
where stu_nbr = 11111113 
and unit_code = 'FIT5132'
and enrol_semester = '2'
and enrol_year = '2014';

--no3
update ENROLMENT
set enrol_grade = 'P1'
where enrol_mark >= 45 and enrol_mark <= 54;
update ENROLMENT
set enrol_grade = 'P2'
where enrol_mark >= 55 and enrol_mark <= 64;
update ENROLMENT
set enrol_grade = 'C'
where enrol_mark >= 65 and enrol_mark <= 74;
update ENROLMENT
set enrol_grade = 'D'
where enrol_mark >= 75 and enrol_mark <= 84;
update ENROLMENT
set enrol_grade = 'HD'
where enrol_mark >= 85 and enrol_mark <= 100;

--no4
delete from ENROLMENT
where stu_nbr = 11111114
and enrol_semester = '2'
and ENROL_YEAR = 2014;

--no5
delete from student
where stu_nbr = 11111113;
rollback;

--no6
alter table enrolment drop constraint fk_enrolment_student;
alter table enrolment add constraint fk_enrolment_student foreign key (stu_nbr)
      references student (stu_nbr) ON DELETE CASCADE;

delete from enrolment
where stu_nbr = 11111113;
rollback;

select stu_nbr
from student
where stu_nbr = 11111113;


--Part B

--no1
drop table account1;
create table account1 (
  acc_id number(8) not null,
  balance number(10) not null,
  cus_id number(8) not null,
  constraint pk_acc primary key (acc_id));
  
insert into account1 values (1, 100, 007);
insert into account1 values (2, 200, 008);

--no2
grant select, update on customer1 to fkon0001;

select *
from account1;

--no4
set autocommit off

--no5
update account1
set balance = 110
where acc_id = 1;

commit;

--no6
update account1
set balance = 150
where acc_id = 2;

commit;

--no8
drop table customer1;
create table customer1 (
  cus_id number(8) not null,
  cus_name varchar(50) not null,
  cus_des varchar(50),
  constraint pk_cus primary key (cus_id));
  
insert into customer1 values (007, 'Austin', 'CT boy');
insert into customer1 values (008, 'Finlay', 'Handsome boy');
insert into customer1 values (009, 'Juno', '家里出事了');

alter table account1 drop constraint fk_acc_cus;
alter table account1 add constraint fk_acc_cus foreign key (cus_id)
      references customer1 (cus_id);    
      
update account1
set balance = 150
where acc_id = 2;

update customer1
set cus_des = '出事了还这么肥！'
where cus_name = 'Juno';

rollback;