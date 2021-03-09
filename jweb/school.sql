-- 학과(부모) 테이블 생성
CREATE TABLE department(
    dname VARCHAR2(30),
    dtel VARCHAR2(20),
    location VARCHAR2(20),
    PRIMARY KEY(dname)
);
DESC department;

-- 학생(자식) 테이블 생성
CREATE TABLE student(
    snumber NUMBER(10),
    sname VARCHAR2(20),
    age NUMBER(3),
    gender VARCHAR2(4),
    address VARCHAR2(50),
    dname VARCHAR2(30),
    PRIMARY KEY(snumber),
    CONSTRAINT fk_dept_std FOREIGN KEY(dname) REFERENCES department(dname)
);

SELECT * FROM department;
SELECT * FROM student;

--학과 추가(삽입)
INSERT INTO department VALUES ('소프트웨어학과','02-1234-1234','B동 3층');
INSERT INTO department VALUES ('전기전자공학과','02-1234-4567','B동 4층');
INSERT INTO department VALUES ('화학공학과','02-1234-5678','B동 5층');

--학생 추가(삽입)
INSERT INTO student VALUES (20211234, '이강', 22, '여', '서울시 구로구', '소프트웨어학과');
INSERT INTO student VALUES (20211235, '박대양', 25, '남', '서울시 성동구','전기전자공학과');
INSERT INTO student VALUES (20211236, '한비양', 21, '여', '경기도 수원시', '전기전자공학과');
--INSERT INTO student VALUES (20211267, '정산들', 25, '남', '경기도 평택시', '기계공학과'); 부모에게 '기계공학과' 는 없으므로 위배됨



