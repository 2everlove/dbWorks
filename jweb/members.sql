--create t_member
CREATE TABLE t_member(
    memberid VARCHAR2(20),
    passwd VARCHAR2(20) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    gender VARCHAR2(10),
    joindate DATE DEFAULT sysdate,
    PRIMARY KEY(memberid)
);

-- t_board 게시판 테이블 생성
CREATE TABLE t_board(
    bnum NUMBER(4) primary key,
    title VARCHAR2(100) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regDate DATE DEFAULT sysdate,
    memberId VARCHAR2(20),
    CONSTRAINT FK_MemberBoard FOREIGN KEY(memberId) REFERENCES t_member(memberId)
);

-- 시퀀스 생성 : 게시판 번호(bnum)
CREATE SEQUENCE bSeq
INCREMENT BY 1 
START WITH 1
MINVALUE 1
MAXVALUE 1000 
NOCYCLE
NOCACHE;

desc t_board;

drop table t_board;

select * from t_board;
select* FROM t_member;