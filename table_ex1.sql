--ex1 테이블 생성
create table ex1(
    column1 char(10),    --고정 길이 자료형
    column2 varchar2(10), -- 가변 길이 자료형
    column3 number        --숫자 자료형
);

--테이블 검색(조회)
select * from ex1;

-- 자료 추가(삽입)
insert into ex1 values('abc', 'abc', 100);
insert into ex1(column1, column2) values('kim', 'park');
insert into ex1(column1, column2, column3) values('choi', '', 20);

--char와 varchar의 크기 비교
select column1, LENGTH(column1) as len1, column2, length(column2) as len2, column3 from ex1;

select * from ex1 where column3 is null;

--column1이 'choi'인걸 삭제 (where 조건절)
--삭제 명령어 delete from 테이블 이름(모두 삭제)
delete from ex1 where column1 = 'choi';