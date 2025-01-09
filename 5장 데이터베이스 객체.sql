# 날짜 : 2025/ 01/09
# 이름 : 최명기
# 내용 : 5장 데이터베이스 개체 

# 실습 5-1 
SHOW INDEX FROM `User1`;
show index from `User2`;
show index from `User3`;

# 실습 5-2
create index `idx_user1_uid` on `User1`(`uid`);
analyze table `User1`;

#실습 5-3 
drop index idx_user1_uid on `User1`;

# 실습 5-4
create view `vw_user1` as (select `name`,`hp`,`age` from `User1`);
create view `vw_user4_age_under30` as (select * from `User4` where `age` < 30);
create view `vw_member_with_sales` as  (
	select
    a.`uid` as `직원아이디`,
     b.`name` as `직원이름`,
      b.`pos` as `직급`,
       c.`name` as `부서명`,
        a.`year` as `매출년도`,
         a.`month` as `월`,
          a.`sale` as `매출액`
from `Sales` as a
join `Member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo
);

select * from `vw_user1`;
SELECT * FROM `vw_user2_age_under30`;


delimiter $$
create procedure proc_test1()
begin 
	select * from `Member`;
    select * from `department`;
end $$
delimiter ;

call proc_test1();

delimiter $$
create procedure proc_test2(in _userName varchar(10))
begin 
	select * from `Member` where `name`=_userName;
end $$
delimiter ;

call proc_test2('김유신');

delimiter $$
create procedure proc_test3(in _pos varchar(10), in _dep tinyint)
begin
	select * from `Member` where `pos`=_pos and `dep`=_dep;
end $$
delimiter ;

call proc_test3('차장', 101);

delimiter $$
	create procedure proc_test4(in _pos varchar(10), out _count int)
    begin 
		select count(*) into _count from `Member` where `pos`=_pos;
	end $$
    delimiter ;
    
    call proc_test4('대리',@_count);
    select concat('_count : ', @_count)
    
    delimiter $$
		create procedure proc_test5(IN _name varchar(10))
        begin 
			declare userId varchar(10);
		select `uid` into userId from `Member` where `name` = _name;
        select * from `Sales` where `uid`=userId;
	end $$
    delimiter ;
    
    
    call proc_test5('김유신');
    
    delimiter $$
		create procedure proc_test6()
        begin 
			declare num1 int;
            declare num2 int;
            
            set num1 = 1;
            set num2 = 2;
            
            if (num1 > num2) then
				select 'num1이 num2보다 크다.' as `결과2`;
			else
				select 'num1이 num2보다 작다' as `결과2`;
			end if;
		end $$
        delimiter ;

call proc_test6();

delimiter $$
	create procedure proc_test7()
    begin 
		declare sum int;
        declare num int;
        
        set sum = 0;
        set num = 1;
        
        while (num <= 10) DO
			set sum = sum + num;
            set num = num + 1;
		end while;
        
        select sum as '1부터 10까지 합계';
	end $$
    delimiter ;
    
    call proc_test7();

