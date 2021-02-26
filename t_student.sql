-- creating t_student table
CREATE TABLE t_student(
    studentid NUMBER(3) PRIMARY KEY,
    NAME VARCHAR2(10)
);

DESC t_student;

SELECT * FROM t_student;

INSERT INTO t_student VALUES (101,'이강');

rollback;

COMMIT;