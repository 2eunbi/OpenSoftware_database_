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




