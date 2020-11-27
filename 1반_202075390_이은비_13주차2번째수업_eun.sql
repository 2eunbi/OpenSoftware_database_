 create table member(
    id varchar2(20),
    pwd varchar2(20) not null,
    name varchar2(20) not null,
    zipcode varchar2(20) not null,
    address1 varchar2(200) not null,
    address2 varchar2(60) not null,
    tel varchar2(15) not null,
    indate date default sysdate,
    constraint member_pk primary key(id)
);
 
 
 create table admin_mem(
  adminid varchar2(20),
  pwd varchar2(20) not null,
  name varchar2(30),
  tel varchar2(15),
  constraint admin_mem_pk primary key(adminid)
  );

create table products(
 product_code varchar2(20),
 product_name varchar2(100),
 product_kind char(1),
 product_price1 number,
 product_price2 number,
 product_content varchar2(1000),
 product_image varchar2(50),
 product varchar2(20),
 sizeSt number,
 sizeEd number,
 product_quantity varchar2(5),
 useyn char(1),
 indate date default sysdate,
 adminid varchar2(20),
 CONSTRAINT product_code_pk primary key(product_code),
 constraint product_adminid_fk foreign key(adminid)
 references admin_mem(adminid)
 );
 
 
 create table orders(
  order_seq number(10) constraint order_seq_pk primary key,
  product_code varchar2(20) not null,
  id varchar2(20) not null,
  product_size number not null,
  quantity number not null,
  result char(1),
  indate date default sysdate,
  constraint order_code_fk foreign key(product_code)
  references products(product_code),
  constraint order_id_fk foreign key(id)
  references member(id)
  );
  
  
insert into admin_mem(adminid, pwd, name)
 values('aduser1', 'dit20', '홍길동');
   
insert into member(id, pwd, name, zipcode, address1, adress2, tel)
 values('one', '1111', '김일동', '15761', '서울시 구로구 구로 1동 주공아파트', '104-1004호', '010-111-1111');
 
insert into products(produt_code, product_name, product_kind, product_price1, product_price2, product_content, sizeSt, sizeed, product_quantity, adminid)
 values('hi0001', '회색힐', '1', 10000, 12000, '여성전용 힐', 230, 255, '100', 'aduser1');
  
create sequence order_SEQ
	         start with 1
	         increment by 1
	         maxvalue 100000;

insert into orders(order_seq, product_code, id, product_size, quantity)
 values(order_seq.nextval, 'hi0001', 'one', 230, '5');


select od.order_seq, od.product_code, pr/product_name, od.id, mem.name, od.quantity, od.indate
 from orders od, member mem, products pr
 where od.product_code=pr.product_code and od.id = mem.id;
