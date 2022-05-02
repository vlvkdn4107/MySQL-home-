

use shopdb;

create table userTBL(
	userName char(4) not null,
    userAge int not null,
    addr char(15) not null,
    mobile int not null,
    primary key(userName)
);

alter table usertbl modify addr char(3);
alter table usertbl modify mobile char(13) not null;

create table buyTBL(
	userName char(4) not null,
    prodName char(10) not null,
    price int not null,
    amount int not null,
    foreign key(userName) references userTBL(userName)
);

select * from usertbl;

insert into usertbl values('임우성', '25', '김해', '010-1111-1111');
insert into usertbl(userName, userage, mobile) values('홍길동', '35', '010-2222-2222');
insert into usertbl values('전우치', '34', '대구', '010-3333-3333');
insert into usertbl(userName, mobile, userage) values('이순신', '010-4444-4444', '40');

delete from usertbl where userName = '홍길동';

update usertbl set addr = '서울' where userName = '이순신';
update usertbl set addr = '인천' where userage = '35'; -- userAge로도 찾을수 있지만 pirmary인 userName으로 찾는게 더 쉽고 빠르다.


desc buytbl;
select * from buytbl;

insert into buytbl values('임우성', '헤드셋', '3', '2');
insert into buytbl values('임우성', '의자', '10', '1');
insert into buytbl values('이순신', '칼', '20', '1');
insert into buytbl values('전우치', '부채', '3', '5');
insert into buytbl values('전우치', '피리', '10', '3');
insert into buytbl values('이순신', '거북선', '100', '8');


-- userName'임우성' 에 있는 prodName, price, amount의 정보만 출력!!
select prodName, price, amount
from buytbl
where userName = '임우성';

update buytbl set amount = '10' where prodName = '거북선';
update buytbl set amount = '2' where prodName = '칼';
update buytbl set price = '13' where prodName = '의자';
