--ex1 테이블 생성
Create Table Ex1(
    Column1 Char(10),    --고정 길이 자료형
    Column2 Varchar2(10), -- 가변 길이 자료형
    Column3 Number        --숫자 자료형
);

--테이블 검색(조회)
Select * From Ex1;

-- 자료 추가(삽입)
Insert Into Ex1 Values('abc', 'abc', 100);
Insert Into Ex1(Column1, Column2) Values('kim', 'park');
Insert Into Ex1(Column1, Column2, Column3) Values('choi', '', 20);

--char와 varchar의 크기 비교
Select Column1, Length(Column1) As Len1, Column2, Length(Column2) As Len2, Column3 From Ex1;

Select * From Ex1 Where Column3 Is Null;

--column1이 'choi'인걸 삭제 (where 조건절)
--삭제 명령어 delete from 테이블 이름(모두 삭제)
Delete From Ex1 Where Column1 = 'choi';