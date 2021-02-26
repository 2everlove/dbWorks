-- creating ex4 table
CREATE TABLE ex4 (
    name     VARCHAR2(10) NOT NULL,
    address  VARCHAR2(50)
);

DESC ex4;

-- 자료추가
INSERT INTO ex4 VALUES (
    '김산',
    ''
);

-- 자료추가 - error(not null)
INSERT INTO ex4 VALUES (
    '',
    '서울'
);

-- 자료추가 - 공백 문자
INSERT INTO ex4 VALUES (
    ' ',
    '서울'
);

-- 조회
SELECT
    *
FROM
    ex4;

-- 트랜잭션 취소
ROLLBACK;


-- 트랜잭션 수행
commit;