drop table dept_second;
drop table dept_third;

create table dept_second(
    dno number(2) constraint pk_dept_second primary key,
    dname varchar2(14),
    loc varchar2(13)
    );
/*
구분할 수 있어야되기 때문에 primary 키는 null값을 허용하지 않는다
*/
create table Customer1(
    id VARCHAR(20) unique,
    pwd VARCHAR(20) not null,
    name VARCHAR(20) not null,
    phone VARCHAR(30),
    address VARCHAR(100)
);

insert into Customer1
values('null', '1234', '녹차아가씨', '010-111-1111', 'seoul');
select * from Customer1;

insert into Customer1
values('greentea', '11234', '그린티', '010-111-1111', 'seoul');
select * from Customer1;

create table Customer1(
    id VARCHAR(20) CONSTRAINT Costomer1_id_uk unique,
    pwd VARCHAR(20) CONSTRAINT Costomer1_pwd_nn not null,
    name VARCHAR(20) CONSTRAINT Costomer1_name_nn not null,
    phone VARCHAR(30),
    address VARCHAR(100)
);


drop table emp_second;

create table emp_second(
    eno number(4) constraint pk_emp_second primary key,
    ename VARCHAR(10),
    job VARCHAR(9),
    dno number(2) constraint fk_emp_second references department
);

drop table emp_third;

create table emp_third(
    eno number constraint emp_third_eno_pk primary key,
    enmae varchar2(10),
    salary number(7,2) DEFAULT 1000
    CONSTRAINT emp_third_salary_min check(salary>0)
);

select table_name, constraint_name
from user_constraints
where table_name=emp_third;

create table emp_copy
as
select * from employee;

create table dept_copy
as
select * from department;

select table_name, constraint_name
from user_constraints
where table_name in('EMPLOYEE', 'DEPARTMENT');

alter table emp_copy
add constraint emp_copy_eno_pk primary key(eno);

alter table dept_copy
add constraint dept_copy_dno_pk primary key(dno);

alter table emp_copy
add constraint emp_copy_dno_fk
foreign key(dno) references dept_copy(dno);

select table_name, constrant_name
from user_constraints
where table_name in('EMP_COPY', 'DEPT_COPY');

alter table dept_copy
drop primary key;

alter table dept_copy
drop primary key cascade;

select table_name, constraint_name
from uer_constraints
where table_name in('EMP_COPY', 'DEPT_COPY');

insert into emp_copy(eno, ename, dno)
values(8000, '윤정화', 50);

alter table emp_copy
disable constraint emp_copy_dno_fk;

alter table emp_copy
enable constraint emp_copy_dno_fk;

create table emp_simple
as
select * from employee
where 1=0;

alter table emp_simple
add constraint emp_simple_eno_pk PRIMARY kEY(eno);

alter table emp_simple
add FOREIGN kEY(dno) REFERENCES department(dno);

select * from emp_simple;

insert into emp_simple(eno, ename, dno)
values(1,'홍길동',10); 
insert into emp_simple(eno, ename, dno)
values(2,'김길동',40); 

select table_name, constraint_name
from user_constraints
where table_name='EMP_SIMPLE';

alter table emp_simple
disable constraint cys_c007110;

insert into emp_sample(eno, ename, dno)
values(3, '박길동', 50);

create sequence sample_seq
start with 10
increment by 10;

create table dept_copy1
as 
select * from department where 0=1;

insert into dept_copy1
values (sample_seq.nextval, 'ACCOUNTING', 'NEW YORK');

insert into dept_copy1
values (sample_seq.nextval, 'SALES', 'CHICAGO');


create table emp_copy1
as
select eno, ename, job, hiredate, dno from employee where 0=1;

insert into emp_copy1
values(7000, 'CANDY', 'MANAGER', '2012/05/01', 10);

insert into emp_copy1
values(7020, 'JERRY', 'SALESMAN', SYSDATE, 30);

select * from emp_copy1;

update dept_copy2
set dname='PROGRAMING'
where dno = 10;

update dept_copy2
set dname='HR';

update dept_copy2
set dname='PROGRAMING', loc='SEOUL'
where dno=10;

delete dept_copy2
where dno=10;

create table dept_cp
as
select * from department;

select * from dept_cp;

delete dept_cp;

ROLLBACK;

select * from dept_cp;

delete dept_cp
where dno=10;

select * from dept_cp;

COMMIT;
ROLLBACK;

select * from dept_cp;







