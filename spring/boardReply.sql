CREATE TABLE tbl_reply (
    rno NUMBER(10) PRIMARY KEY,
    bno NUMBER(10),
    reply VARCHAR2(1000 BYTE),
    replyer VARCHAR2(50 BYTE),
    replydate DATE DEFAULT sysdate,
    updatedate DATE DEFAULT sysdate,
    CONSTRAINT fk_bno FOREIGN KEY(bno) REFERENCES tbl_board(bno)
);

CREATE TABLE tbl_board (
    bno NUMBER(10) PRIMARY KEY,
    title VARCHAR2(200 BYTE),
    content VARCHAR2(2000 BYTE),
    writer VARCHAR2(50 BYTE),
    regdate DATE DEFAULT sysdate,
    updatedate DATE DEFAULT sysdate
);
--한글은 3byte
--NVL(value, 0) / value가 null이면 0으로 치환

ALTER TABLE tbl_reply 
    ADD CONSTRAINT fk_bno 
    FOREIGN KEY(bno) 
    REFERENCES tbl_board(bno) ON DELETE CASCADE;

CREATE SEQUENCE bno INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 1000 NOCYCLE NOCACHE;

drop sequence bno;
    
DROP TABLE tbl_reply;

--테이블은 그대로 두고, 카디널리티만 삭제
TRUNCATE table tbl_reply;
    
DROP TABLE tbl_board;

DESC tbl_board;
DESC tbl_reply;

show tables;

commit;

