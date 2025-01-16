# 날짜 : 2025/01/16
# 이름 : 최명기
# 내용 : sql 연습문제 4


create database `Theater`;
create user 'theater'@'%' identified by '1234';
grant all privileges on bank.* TO 'theater'@'%';
flush privileges;

#실습 4-2
create table `Movies` (
	`movie_id` int auto_increment primary key ,
    `title` varchar(30) ,
    `genre` varchar(10) ,
    `release_date` date
    );
    
create table `Customers` (
	`customer_id` int auto_increment primary key ,
    `name` varchar(20) ,
    `email` varchar(50) ,
    `phone` char(13)
    );
    
    
create table `Bookings` (
	`booking_id` int primary key ,
    `customer_id` int ,
    `movie_id` int ,
    `num_tickets` int ,
    `booking_date` datetime
    );
drop table `Movies`;

# 실습 4-3

insert into `Movies` (`title`,`genre`,`release_date`) values('쇼생크의 탈출','드라마','1994-10-14');
insert into `Movies` (`title`,`genre`,`release_date`) values('타이타닉','로맨스','1997-03-24');
insert into `Movies` (`title`,`genre`,`release_date`) values('탑건','액션','1987-07-16');
insert into `Movies` (`title`,`genre`,`release_date`) values('쥬라기공원','액션','1994-02-11');
insert into `Movies` (`title`,`genre`,`release_date`) values('글래디에이터','액션','2000-05-03');
insert into `Movies` (`title`,`genre`,`release_date`) values('시네마천국','드라마','1995-04-12');
insert into `Movies` (`title`,`genre`,`release_date`) values('미션임파서블','액션','1995-11-11');
insert into `Movies` (`title`,`genre`,`release_date`) values('노트북','로맨스','2003-08-23');
insert into `Movies` (`title`,`genre`,`release_date`) values('인터스텔라','SF','2011-05-26');
insert into `Movies` (`title`,`genre`,`release_date`) values('아바타','SF','2010-02-10');


insert into `Customers` (`name`,`email`, `phone`) values ('김유신','kys@example.com','010-1234-1001');
insert into `Customers` (`name`,`email`, `phone`) values ('김춘추','kcc@example.com','010-1234-1002');
insert into `Customers` (`name`,`email`, `phone`) values ('장보고','jbg@example.com','010-1234-1003');
insert into `Customers` (`name`,`email`, `phone`) values ('강감찬','kgc@example.com','010-1234-1004');
insert into `Customers` (`name`,`email`, `phone`) values ('이순신','lss@example.com','010-1234-1005');

    

insert into `Bookings` values ('101','1','1','2','2023-01-10 00:00:00');
insert into `Bookings` values ('102','2','2','3','2023-01-11 00:00:00');
insert into `Bookings` values ('103','3','2','2','2023-01-13 00:00:00');
insert into `Bookings` values ('104','4','3','1','2023-01-17 00:00:00');
insert into `Bookings` values ('105','5','5','2','2023-01-21 00:00:00');
insert into `Bookings` values ('106','3','8','2','2023-01-21 00:00:00');
insert into `Bookings` values ('107','1','10','4','2023-01-21 00:00:00');
insert into `Bookings` values ('108','2','9','1','2023-01-22 00:00:00');
insert into `Bookings` values ('109','5','7','2','2023-01-23 00:00:00');
insert into `Bookings` values ('110','3','4','2','2023-01-23 00:00:00');
insert into `Bookings` values ('111','1','6','1','2023-01-24 00:00:00');
insert into `Bookings` values ('112','3','5','3','2023-01-25 00:00:00');

drop table `Bookings`;
# 실습 4-4
select title from `movies`;

#실습 4-5
select * from Movies where `genre` like '로맨스';

#실습 4-6
select title, release_date from Movies where release_date >= '2010-01-01';

#실습 4-7
select booking_id, booking_date from Bookings where num_tickets >= 3;

#실습 4-8
select * from Bookings where booking_date < '2023-01-20';

#실습 4-9
select * from Movies where release_date between '1990-01-01' and '1999-12-13';

#실습 4-10
select * from Bookings order by booking_date desc limit 3;

#실습 4-11
select title, release_date from movies order by release_date asc limit 1;

#실습 4-12
select
	concat(title, ' - ', release_date) as movie_info
    from movies
    where `title` like '%공원%'
    order by release_date asc
    limit 1;

#실습 4-13
select booking_date title from Bookings join Movies join Customers  where customer_id = 2; 

#실습 4-14
select `name`,`phone`,`booking_date`,`title`
 from bookings B 
 Join Customers C on B.customer_id = C.customer_id 
 Join Movies M on B.movie_id = M.movie_id;

# 실습 4-15
select 
	M.genre,
    avg(B.num_tickets) AS avg_tickets
FROM bookings B
JOIN Movies M ON B.movie_id = M.movie_id
group by genre;

# 실습 4-16
select 
	C.name,
    avg(B.num_tickets) as avg_tickets
    from Bookings B
    JOIN Customers C on B.customer_id = C.customer_id
    group by name;
    

# 실습 4-17
select 
	C.name,
    SUM(B.num_tickets) AS `전체 예매 티켓 수`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
group by name
order by `전체 예매 티켓 수` desc;

# 실습 4-18
select 
B.booking_id , B.movie_id ,C.name,  B.booking_date
from Bookings B
join Customers C on B.customer_id = C.customer_id
order by B.booking_date asc
limit 1; 
    
    

#실습 4-19
select 
	genre, title,release_date
from Movies
where (genre, release_date) IN (
select genre, MAX(release_date)
from movies
group by genre
);


#실습 4-20

select * from Movies
where movie_id in (
	select movie_id from Bookings
    where customer_id = (select customer_id from customers where name ='김유신' ));
    

#실습 4-21
select name, email from Customers
where customer_id = (
	select customer_id
    from Bookings
    group by customer_id
    order by sum(num_tickets) desc
    limit 1
    );

#실습 4-22
select * from bookings where num_tickets > (select avg(num_tickets) from Bookings);

#실습 4-23

select 
	M.title, SUM(B.num_tickets) as total_tickets
from Bookings B
join movies M ON B.movie_id = M.movie_id
group by title;

#실습 4-24
select 
	c.name,
    sum(b.num_tickets) as total_tickets,
    avg(b.num_tickets) as avg_tickets
from Bookings b
join Customers c ON b.customer_id = c.customer_id
group by name;
    
#실습 4-25
select 
	c.customer_id,
    c.name,
    c.email,
    sum(b.num_tickets) as `예매 티켓수`
from bookings b
join Customers c on b.customer_id = c.customer_id
group by customer_id
order by `예매 티켓수` desc;

#실습 4-26
select 
	name,
	title,
	num_tickets,
	booking_date
from bookings b
join customers c on b.customer_id = c.customer_id
join movies m on b.movie_id = m.movie_id
order by num_tickets desc;

# 실습 4-27
select 
	M.title,
    M.genre,
    SUM(B.num_tickets) AS `예매 티켓 수`,
    AVG(B.num_tickets) AS `평균 티켓 수`
FROM bookings B
JOIN Movies M ON B.movie_id = M.movie_id
WHERE M.genre = '액션'
group by M.`movie_id`
order by `평균 티켓 수` desc;
