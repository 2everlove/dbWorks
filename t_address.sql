-- creating table
CREATE TABLE t_address (
    num       NUMBER(4),
    username  VARCHAR2(20) NOT NULL,
    tel       VARCHAR2(20) NOT NULL,
    email     VARCHAR2(50) NOT NULL,
    gender    VARCHAR2(5),
    joindate  DATE DEFAULT sysdate,
    PRIMARY KEY ( num )
);

DESC t_address;

-- 시퀀스(일련번호) 생성
CREATE SEQUENCE abseq INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 1000 NOCYCLE NOCACHE;

SELECT
    *
FROM
    t_address;