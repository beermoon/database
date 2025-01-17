create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on BookStore.* TO 'bookstore'@'%';
flush privileges;


create table `Customer` (
	`custId` int not null auto_increment primary key,
    `name` varchar(10) not null ,
    `address` varchar(20) default null,
    `phone` varchar(13) default null
    );
    

create table `Book` (
	`bookId` int not null primary key,
    `bookName` varchar(20) ,
    `publisher` varchar(20),
    `price` int default null
    );
    
create table `Order` (
	`orderId` int auto_increment primary key ,
    `custId` int , 
    `bookId` int ,
    `salePrice` int ,
    `orderDate` date
    );
drop table `Order`;
    
 
insert into `Customer` (`name`,`address`,`phone`) values ('박지성','영국 맨체스터','000-5000-0001');
insert into `Customer` (`name`,`address`,`phone`) values ('김연아','대한민국 서울','000-6000-0001');
insert into `Customer` (`name`,`address`,`phone`) values ('장미란','대한민국 강원도','000-7000-0001');
insert into `Customer` (`name`,`address`,`phone`) values ('추신수','미국 클리블랜드','000-8000-0001');
insert into `Customer` (`name`,`address`,`phone`) values ('박세리','대한민국 대전',null);


insert into `Book` values ('1','축구의 역사','굿스포츠','7000');
insert into `Book` values ('2','축구아는 여자','나무수','13000');
insert into `Book` values ('3','축구의 이해','대한미디어','22000');
insert into `Book` values ('4','골프 바이블','대한미디어','35000');
insert into `Book` values ('5','피겨 교본','굿스포츠','8000');
insert into `Book` values ('6','역도 단계별기술','굿스포츠','6000');
insert into `Book` values ('7','야구의 추억','이상미디어','20000');
insert into `Book` values ('8','야구를 부탁해','이상미디어','13000');
insert into `Book` values ('9','올림픽 이야기','삼성당','7500');
insert into `Book` values ('10','Olympic Champions','Person','13000');


insert into `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) values ('1','1','6000','2014-07-01');
insert into `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) values ('1','3','21000','2014-07-03');
insert into `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) values ('2','5','8000','2014-07-03');
insert into `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) values ('3','6','6000','2014-07-04');
insert into `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) values ('4','7','20000','2014-07-05');
insert into `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) values ('1','2','12000','2014-07-07');
insert into `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) values ('4','8','13000','2014-07-07');
insert into `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) values ('3','10','12000','2014-07-08');
insert into `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) values ('2','10','7000','2014-07-09');
insert into `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) values ('3','8','13000','2014-07-10');


# 실습 5-4
select custid,name,address from customer;

# 실습 5-5

select `bookName`, `price` from  `book`;

# 실습 5-6
select `price` , `bookName` from `book`;

# 실습 5-7
select `bookid` , `bookname`, `publisher`, `price` from `book`;

# 실습 5-8 
select `publisher` from `book`;

# 실습 5-9
select distinct `publisher` from `book`;

# 실습 5-10
select `bookid` , `bookname`, `publisher`, `price` from `book` where `price` >= 20000;

# 실습 5-11
select `bookid` , `bookname`, `publisher`, `price` from `book` where `price` < 20000;

# 실습 5-12
select `bookid` , `bookname`, `publisher`, `price` from `book` where price between 10000 and 20000;

# 실습 5-13 
select `bookid`,`bookname`,`price` from `book` where price between 15000 and 30000;

# 실습 5-14
select `bookid` , `bookname`, `publisher`, `price` from `book` where bookid = '2' or bookid = '3' or bookid = '5' ;

# 실습 5-15
select `bookid`,`bookname`,`price` from `book` where bookid % 2 = 0;

# 실습 5-16
select `name`,`address`,`phone`  from `Customer` where  name like '박%';

# 실습 5-17
select `custid`,`name`,`address`,`phone` from `Customer` where address like '대한민국%';

# 실습 5-18
select `custid`,`name`,`address`,`phone` from `Customer` where phone is not null;

# 실습 5-19
select `bookid` , `bookname`, `publisher`, `price` from `book` where publisher in ('굿스포츠' , '대한미디어');

# 실습 5-20
select `publisher` from `book` where bookname = '축구의 역사';

# 실습 5-21
select `publisher` from `book` where bookname like '축구%';

# 실습 5-22
select `bookid` , `bookname`, `publisher`, `price` from `book` where bookname like "%구%";

# 실습 5-23
select  `bookid` , `bookname`, `publisher`, `price` from `book` where price >= 20000 and bookname like "축구%";

# 실습 5-24
select   `bookid` , `bookname`, `publisher`, `price` from `book` order by bookname asc;

# 실습 5-25
select  `bookid` , `bookname`, `publisher`, `price` from `book`  order by price , bookname ;

# 실습 5-26

select * from `book` order by `price` desc, `publisher` asc;

# 실습 5-27
select   `bookid` , `bookname`, `publisher`, `price` from `book` order by price desc limit 3;

# 실습 5-28
select   `bookid` , `bookname`, `publisher`, `price` from `book` order by price asc limit 3;

# 실습 5-29
select sum(saleprice) as '총판매액' from `Order` ;

# 실습 5-30
select 
	sum(saleprice) as '총판매액',
    avg(saleprice) as '평균값',
    min(saleprice) as '최저가',
    max(saleprice) as '최고가'
from
	`Order`;
    
# 실습 5-31
select count(bookid) from `Order`;

# 실습 5-32
update `book` set `bookname` = '농구%' where `bookname` = '야구%';
select `bookid` , `bookname`, `publisher`, `price` from `book`;

# 실습 5-33
select `custId`, count(*) as `수량` from `Order` where `salePrice` >= 8000 group by `custid` having `수량` >= 2;

# 실습 5-34
select * from `Customer` as a  join `Order` as b on a.custId = b.custId ;

# 실습 5-35
select * from `Customer` as a join `Order` as b on a.custId = b.custId order by a.custId asc;

# 실습 5-36
select `name`, `saleprice` from `Customer` as a join `Order`as b on a.custId = b.custId order by a.custId; 

# 실습 5-37
select name, sum(saleprice) from `Customer` as a join `Order` as b on a.custId = b.custId group by a.custId order by `name`;

# 실습 5-38
select `name`,`bookname` from `Customer` as a join `Order` as b on a.custId = b.custId join `Book` as c on b.bookId = c.bookId;

# 실습 5-39
select `name`,`bookname` from `Customer` as a join `Order` as b on a.custId = b.custId join `Book` as c on b.bookId = c.bookId 
where price = 20000;

# 실습 5-40
SELECT 
	`name`,
    `salePrice`
FROM `Customer` AS a 
LEFT JOIN `Order` AS b  ON a.custId = b.custId;

# 실습 5-41
select sum(`salePrice`) as '총 매출' from `Customer` as a join `Order` as b on a.custId = b.custId where name = '김연아';