# 날짜 : 2025/01/14
# 이름 : 최명기
# 내용 : sql 연습문제 3


create database `College`;
create user 'college'@'%' identified by '1234';
grant all privileges on `College`.* to 'college'@'%';
flush privileges;

create table `Student` (
	`stdNo` varchar(8)  primary key,
    `stdName` varchar(20) ,
    `stdHp` varchar(13) unique key, 
    `stdYear` int ,
    `stdAddress` varchar(100) default null 
    );
    
create table `Lecture` (
	`lecNo` int primary key,
    `lecName` varchar(20) ,
    `lecCredit` int,
    `lecTime` int ,
    `lecClass` varchar(10) default null
    );
    
create table `Register` (
	`regStdNo` varchar(8),
    `regLecNo` int ,
    `regMidScore` int default null ,
    `regFinalScore` int default null ,
    `regTotalScore` int default null ,
    `regGrade` varchar(1)
    );
    

drop table `register`;
    
INSERT INTO `Student` VALUES ('20201016', '김유신', '010-1234-1001', 3, NULL);
INSERT INTO `Student` VALUES ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
INSERT INTO `Student` VALUES ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
INSERT INTO `Student` VALUES ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
INSERT INTO `Student` VALUES ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
INSERT INTO `Student` VALUES ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

INSERT INTO `Lecture` VALUES (159, '인지행동심리학', 3, 40, '본304');
INSERT INTO `Lecture` VALUES (167, '운영체제론',    3, 25, '본B05');
INSERT INTO `Lecture` VALUES (234, '중급 영문법',   3, 20, '본201');
INSERT INTO `Lecture` VALUES (239, '세법개론',     3, 40, '본204');
INSERT INTO `Lecture` VALUES (248, '빅데이터 개론', 3, 20, '본B01');
INSERT INTO `Lecture` VALUES (253, '컴퓨팅사고와 코딩', 2, 10, '본B02');
INSERT INTO `Lecture` VALUES (349, '사회복지 마케팅', 2, 50, '본301');




INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201126', 234);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 248);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 253);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201126', 239);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20210216', 349);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20210326', 349);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 167);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20220416', 349);


# 실습 3-4
select * from `Lecture`;

# 실습 3-5
select * from `Student`;

#실습 3-6
select * from `Register`;

# 실습 3- 7
select * from `Student` where `std` = 3;


# 실습 3-8
select * from `Lecture` where `lecCredit` like 2;

# 실습 3-9

UPDATE `Register` SET `regMidScore` = 36, `regFinalScore`= 42 WHERE `regStdNo`='20201126' AND `regLecNo`=234;
UPDATE `Register` SET `regMidScore` = 24, `regFinalScore`= 62 WHERE `regStdNo`='20201016' AND `regLecNo`=248;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore`= 40 WHERE `regStdNo`='20201016' AND `regLecNo`=253;
UPDATE `Register` SET `regMidScore` = 37, `regFinalScore`= 57 WHERE `regStdNo`='20201126' AND `regLecNo`=239;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore`= 68 WHERE `regStdNo`='20210216' AND `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 16, `regFinalScore`= 65 WHERE `regStdNo`='20210326' AND `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 18, `regFinalScore`= 38 WHERE `regStdNo`='20201016' AND `regLecNo`=167;
UPDATE `Register` SET `regMidScore` = 25, `regFinalScore`= 58 WHERE `regStdNo`='20220416' AND `regLecNo`=349;
select * from `register`;

    
# 실습 3-10
update `register` set
	`regTotalScore`= `regMidScore` + `regFinalScore`,
					`regGrade` = if(`regTotalScore` >= 90, 'A', 
									 if(`regTotalScore` >= 80, 'B',
									 if(`regTotalScore` >= 70, 'C',
									 if(`regTotalScore` >= 60, 'D', 'F'))));
select * from `register`;


# 실습 3-11
select * from `register` order by `regTotalScore` desc;

# 실습 3-12
select * from `register` where `regLecNo` = 349 order by `regTotalScore` desc;

# 실습 3-13
select * from `lecture` where `lecTime` >= 30;

# 실습 3-14
select `lecName` , `lecClass` from `lecture`;

# 실습 3-15
select `stdNo`, `stdName` from `Student`;

# 실습 3-16
select * from `student` where `stdAddress` is null;

# 실습 3-17
select * from `Student` where `stdAddress` like '부산%';

# 실습 3-18
SELECT * FROM `Student` AS a 
LEFT JOIN `Register` AS b
ON a.stdNo = b.regStdNo;

# 실습 3-19
select 
	a.`stdNo` , 
    a.`stdName` ,
    b.`regLecNo` , 
    b.`regMidScore`, 
    b.`regFinalScore` , 
    b.`regTotalScore`,
    b.`regGrade` 
    from `Student` as a, `Register` as b where a.stdNo = b.regStdNo;

# 실습 3-20
select `stdName` , `stdNo` , `regLecNo` 
from `Student` as a
join `register` as b
on a.stdNo = b.regStdNo
where `regLecNo` = '349';

select * from `student`;
select * from `register`;

# 실습 3-21
select 
	`stdNo`,
    `stdName`,
    count(`stdNo`) as `수강신청 건수`,
    sum(`regTotalScore`) as `종합점수`,
    sum(`regTotalScore`) / count (`stdNo`) as `평균`
from `Student` as a
join `register` as b
on a.stdNo = b.regStdNo
group by `stdNo`
order by `stdNo`;

# 실습 3-22 
select * from `register` as a inner join `Lecture` as b on a.regLecNo = b.lecNo;

# 실습 3-23
select 
	`regStdNo`,
    `regLecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
    from `register` as a join `Lecture` as b
    on a.regLecNo = b.lecNo;
    
# 실습 3- 24
select 
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regTotalScore`) as `사회복지 마케팅 평균`
    from `register` as a join `Lecture` as b on a.regTotalScore = b.lecName;
    
# 실습 3-25
select 
	`regStdNo`,
    `lecName`
from `register` as a join `lecture` as b on a.regStdNo = b.lecName
where `regGrade` = 'A';


# 실습 3-26
select * from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo;

# 실습 3-27

# 실습 3-28
select 
	* from `student` as a
     
     
     
# 실습 3-29

# 실습 3-30 



    