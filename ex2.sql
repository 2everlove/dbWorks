--ex2 테이블 생성하기
CREATE TABLE ex2 (
    NAME      VARCHAR2(20) NOT NULL,
    age       NUMBER(3),
    joindate  DATE
);

-- 자료 보기
DESC ex2;

-- 사람 추가 (sysdate - 현재 날짜)
INSERT INTO ex2 (
    NAME,
    age,
    joindate
) VALUES (
    '박하늘',
    28,
    sysdate
);
-- 해당 칼럼을 생략한 경우
INSERT INTO ex2 VALUES (
    '이양파',
    25,
    sysdate
);
-- 칼럼을 일부만 사용한 경우
INSERT INTO ex2 (
    NAME,
    age
) VALUES (
    '와타시',
    32
);

-- 트랜잭션 수행완료
COMMIT;

-- 검색
SELECT
    *
FROM
    ex2;
    
-- null값에 데이터 업데이트
UPDATE ex2 SET joindate=sysdate WHERE joindate IS NULL;