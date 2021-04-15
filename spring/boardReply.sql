--create table
CREATE TABLE tbl_board (
    bno NUMBER(10) PRIMARY KEY,
    title VARCHAR2(200 BYTE) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    regdate DATE DEFAULT sysdate,
    updatedate DATE
);

--create sequence
CREATE SEQUENCE seq_tbl_board;
--CREATE SEQUENCE seq_tbl_board INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 1000 NOCYCLE NOCACHE;

--주석 달아주기~
COMMENT ON TABLE spring.tbl_board IS '게시판';
COMMENT ON COLUMN tbl_board.bno IS '번호';
COMMENT ON COLUMN tbl_board.title IS '제목';
COMMENT ON COLUMN tbl_board.content IS '내용';
COMMENT ON COLUMN tbl_board.writer IS '작성자';
COMMENT ON COLUMN tbl_board.regdate IS '작성일';
COMMENT ON COLUMN tbl_board.updatedate IS '수정일';

CREATE TABLE tbl_reply (
    rno NUMBER(10) PRIMARY KEY,
    bno NUMBER(10) NOT NULL,
    reply VARCHAR2(1000 BYTE) NOT NULL,
    replyer VARCHAR2(50 BYTE) NOT NULL,
    replydate DATE DEFAULT sysdate,
    updatedate DATE DEFAULT sysdate,
    CONSTRAINT fk_bno FOREIGN KEY(bno) REFERENCES tbl_board(bno)
);
-- CONSTRAINT fk_bno FOREIGN KEY(bno) REFERENCES tbl_board(bno) 에서 CONSTRAINT는 CONSTRAINT_NAME을 직접 설정 하는 것
COMMENT ON TABLE spring.tbl_reply IS '답글';

--한글은 3byte
--NVL(value, 0) / value가 null이면 0으로 치환


--TBL_* Test
ALTER TABLE tbl_reply 
    ADD CONSTRAINT fk_bno 
    FOREIGN KEY(bno) 
    REFERENCES tbl_board(bno) ON DELETE CASCADE;

SELECT seq_tbl_board.NEXTVAL FROM dual;
SELECT seq_tbl_board.CURRVAL FROM dual;

INSERT INTO tbl_board (SELECT seq_tbl_board.NEXTVAL, title, content, writer, regdate, updatedate FROM tbl_board); 

INSERT INTO tbl_board(bno, title, content, writer) VALUES (seq_tbl_board.NEXTVAL, '제목', '내용', '작성자');
SELECT * FROM tbl_board;

DROP SEQUENCE seq_tbl_board;
    
DROP TABLE tbl_reply;
DROP TABLE tbl_board;

--테이블은 그대로 두고, 카디널리티만 삭제
TRUNCATE TABLE tbl_reply;
rollback;

DESC tbl_board;
DESC tbl_reply;

delete tbl_board where bno=88;

SHOW tables;

COMMIT;

