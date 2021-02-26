-- creating ex5 table
CREATE TABLE ex5 (
--    userid  VARCHAR2(20) primary key, --primary key - not null, unique
    userId varchar2(20) ,
    age     NUMBER(3) ,
    PRIMARY KEY(userId) --여기도 쓸 수 있음
);

-- 표 정의
DESC ex5;

-- 조회
SELECT
    *
FROM
    ex5;

--자료추가 - primary key(not null) - error
INSERT INTO ex5 VALUES (
    '',
    25
);

--자료추가 
INSERT INTO ex5 VALUES (
    'user',
    34
);

--자료추가 - primary key(not duple) - erro
INSERT INTO ex5 VALUES (
    'user',
    22
);

-- 테이블 전체 삭제
drop table ex5;



--트랜잭션 수행
COMMIT;