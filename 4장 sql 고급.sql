# 날짜 :  2025/01/28
# 이름 :  김철학
# 내용 : 4장 sql 고급

#실습 4-1
#실습 4-1
create table `Member` (
	`uid`	varchar(10) primary key,
    `name`	varchar(10) not null,
    `hp`	char(13) unique not null,
    `pos`	varchar(10) default '사원',
    `dep`	int,
    `rdate`	datetime not null
);

create table `Department` (
	`depNo` int primary key,
    `name`	varchar(10) not null,
    `tel`	char(12) not null
);

create table `Sales` (
	`seq`	int auto_increment primary key,
    `uid`	varchar(10) not null,
    `year`	year not null,
    `month`	tinyint not null,
    `sale`	int
);

#실습 4-2
INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, NOW());
INSERT INTO `Member` VALUES ('a102', '김유신',   '010-1234-1002', '차장', 101, NOW());
INSERT INTO `Member` VALUES ('a103', '김춘추',   '010-1234-1003', '사원', 101, NOW());
INSERT INTO `Member` VALUES ('a104', '장보고',   '010-1234-1004', '대리', 102, NOW());
INSERT INTO `Member` VALUES ('a105', '강감찬',   '010-1234-1005', '과장', 102, NOW());
INSERT INTO `Member` VALUES ('a106', '이성계',   '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a107', '정철',     '010-1234-1007', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a108', '이순신',   '010-1234-1008', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a109', '허균',     '010-1234-1009', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a110', '정약용',   '010-1234-1010', '사원', 105, NOW());
INSERT INTO `Member` VALUES ('a111', '박지원',   '010-1234-1011', '사원', 105, NOW());

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);

#실습 4-3
select * from `Member` where `name` = '김유신';
select * from `Member` where `name` <> '김춘추';
select * from `Member` where `pos` ='사원' or `pos` = '대리';
select * from `Member` where `pos` IN ('사원','대리');
select * from `Member` where `name` like '%신';
select * from `Member` where `name` like '정%';
select * from `Member` where `pos` = '차장' AND dep=101;
select * from `Member` where `pos` = '차장' OR dep=101;
select * from `Member` where  `name` != '김춘추';
select * from `Member` where `pos` = '사원' or `pos` = '대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT * FROM `Member` WHERE `dep` IN (101,102,103);
SELECT * FROM `Member` WHERE ``;


# 실습 4-4

select * from `Sales` order by `sale`;
select * from `Sales` order by `sale` ASC;
select * from `Sales` order by `sale` DESC;
select * from `Member` order by `name`; 
select * from `Member` order by `name` DESC;
select * from `Member` order by `name` ASC;
select * from  `Sales` WHERE `sale` > 5000 ORDER BY `sale` DESC;
select * from `Sales` WHERE `sale` > 50000 order by `year`, `month`, `sale` DESC;

# 실습 4-5
select * from `Sales` LIMIT 3;
select * from `Sales` LIMIT 0,3;
select * from `Sales` LIMIT 1,2;
select * from `Sales` LIMIT 5,3;
select * from Sales order by `sale` DESC LIMIT 3,5;
select * from Sales where `sale` < 50000 order by `sale` desc limit 3;
select * from Sales where `sale` > 50000 order by `year` desc, `month` , `sale` desc limit 5;


# 실습 4-6
select SUM(`sale`) AS `합계` from `Sales`;
select AVG(sale) as `평균` from `Sales`;
select max(sale) as `최대값` from `Sales`;
select min(sale) as `최소값` from `Sales`;
select CEILING(1.2);
select ceiling(1.8);
select floor(1.2);
select floor(1.8);
select round(1.2);
select round(1.8);
select rand(); # 0 ~ 1 사이 실수
select ceiling(RAND() * 10); # 1~10 사이 정수 
select count(*) AS `갯수` from `Sales`;
select left('HelloWorld',5);
select RIGHT('HelloWorld',5);
select substring('HelloWorld',6,5);
select concat('Hello','World');
select concat(`uid`,`name`,`hp`) from `member` where `uid`='a108';

select curdate();
select curtime();
select now();
insert into `Member` values ('a112','유관순','010-1234-1012','대리', 107, NOW());

# 실습 4-7
select SUM(sale) AS `2018년 1월 매출 총합` FROM `Sales` WHERE `year` = '2018' and `month` = 1;
select SUM(sale) AS `총합` , AVG(sale)  as `평균`
	FROM `Sales`
	WHERE `year` = 2019 and `month` = 2 and `sale` > 50000;

# 실습 4-9
SELECT 
    MAX(sale) AS 최대값, MIN(sale) AS 최솟값
FROM
    sales
WHERE
    year = '2020';

# 문제 1 영업1부(101)에 속한 직원들의 이름과 직급을 조회하세요.
select `name` , `pos` from `Member` where `dep` = '101'; 

# 문제 2  "2019년 1월의 총 매출 합계를 구하세요.
select SUM(sale) AS `합계` from `Sales` where  `year` = '2019' and `month` = '1';
	
# 문제 3 김유신 직원(a102)의 모든 매출 내역을 조회하세요
select `year`,`month`,`sale` from `Sales` where `uid` = 'a102';

#문제   2020년 1월 매출 상위 3명의 직원 조회
select `uid` , `sale` from `sales` WHERE `year` = '2020' AND `month` = '1' ORDER BY `sale` DESC LIMIT 3 ;

# 문제  특정 부서에서 '차장' 이상의 직급을 가진 직원 조회
select * from `Member` WHERE `dep` = 101 AND `pos` IN('차장','부장');

