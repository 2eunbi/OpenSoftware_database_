select name, sum(saleprice) as ÃÑ±¸¸Å¾×
from customer, orders
where customer.custid=orders.custid
group by name
order by name;

alter table orders
add foreign key(bookid) references book(bookid);

select name, bookname
from customer cu, orders od, book bk
where cu.custid=od.custid
and od.bookid=bk.bookid;

select stff.eno, stff.ename, stff.job, stff.manager
from employee stff, employee mgr
where stff.manager=mgr.eno and mgr.ename like 'BLAKE';

select *
from customer, orders
where customer.custid = orders.custid
order by orders.custid;

select name, saleprice
from customer left outer join
orders on customer.custid=orders.custid;

select bk.bookid, bk.bookname, od.orderid, od.orderdate
from book bk left outer join orders od
on bk.bookid=od.bookid
order by bk.bookid;

select bk.bookname, count(od.bookid)
from book bk left outer join orders od
on bk.bookid=od.bookid
group by bk.bookname;

select bk.publisher, count(od.bookid) as salecount
from book bk left outer join orders od
on bk.bookid=od.bookid
group by bk.publisher;

select dp.dno, dp.dname 
from department dp, employee ep
where dp.dnm=ep.dno and ep.ename='SCOTT';

select stff.ename, stff.job, stff.hiredate, ep.ename as "managername"
from employee stff, employee ep
where stff.manager=ep.eno and stff.hiredate<ep.hiredate;

select cu.name, bk.bookname, od.orderdate
from customer cu, book bk, orders od
where cu.custid=od.custid and od.bookid=bk.bookid
order by od.orderdate;

create user dituse1
IDENTIFIED BY ditdb20;

create user eunbi
IDENTIFIED BY ditdb20;



