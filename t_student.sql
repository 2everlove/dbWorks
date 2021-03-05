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
    age = 20
WHERE
    studentid = 101;

--
SELECT *
FROM t_student2;

