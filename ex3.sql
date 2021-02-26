-- ex3 테이블 생성
CREATE TABLE ex3(
    col1 DATE,
    col2 TIMESTAMP
);

DESC ex3;

INSERT INTO ex3 VALUES (sysdate, systimestamp);
INSERT INTO ex3(col1) VALUES (sysdate);

SELECT col1 AS 날짜, col2 AS 상세보기 FROM ex3;

DROP TABLE ex3;

commit;