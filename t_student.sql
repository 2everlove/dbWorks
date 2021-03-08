-- creating t_student table primary key !null, unique
CREATE TABLE t_student (
    studentid  NUMBER(3) PRIMARY KEY,
    name       VARCHAR2(10)
);

DESC t_student;

--
SELECT
    *
FROM
    t_student;

--
INSERT INTO t_student VALUES (
    101,
    '이강'
);

--Transjection
ROLLBACK;

COMMIT;

--copy
CREATE TABLE t_student2
    AS
        SELECT
            *
        FROM
            t_student;

DESC t_student2;

-- Adding age column 
ALTER TABLE t_student2 ADD (
    age NUMBER(3)
);

-- 갱신
UPDATE t_student2
SET
    age = 35
WHERE
    studentid = 102;

--
SELECT *
FROM t_student2;
DESC t_student2;

-- 자료형의 크기 변경(studentName 10b -> 20b)
ALTER TABLE t_student2 MODIFY (name VARCHAR2(20));

INSERT INTO t_student2 VALUES (308, '좋은하루', 42);
INSERT INTO t_student2 VALUES (309, '기분 좋은하루', 42);

ROLLBACK;

SELECT lengthb(stuentname) AS len FROM t_student2 WHERE studentid = 308;

--칼럼 이름 변경
ALTER TABLE t_student2 RENAME COLUMN age TO studentage;

--특정 칼럼 삭제
ALTER TABLE t_student2 DROP COLUMN studentage;

--테이블 삭제
DROP TABLE t_student2;