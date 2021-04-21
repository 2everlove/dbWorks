--create table 방명록
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

--create table 댓글
CREATE TABLE tbl_reply (
    rno NUMBER(10) PRIMARY KEY,
    bno NUMBER(10) NOT NULL,
    reply VARCHAR2(1000 BYTE) NOT NULL,
    replyer VARCHAR2(50 BYTE) NOT NULL,
    replydate DATE DEFAULT sysdate,
    updatedate DATE DEFAULT sysdate,
    CONSTRAINT fk_bno FOREIGN KEY(bno) REFERENCES tbl_board(bno) on delete cascade
);
--댓글 추가
insert into tbl_reply values (seq_reply.nextval, 203, '댓글', '댓글자', sysdate, sysdate);

delete from tbl_board where bno = 204;

select * from tbl_reply;

--댓글 주석
comment on table spring.tbl_reply is '댓글';
comment on column tbl_reply.rno is '번호';
comment on column tbl_reply.reply is '댓글';
comment on column tbl_reply.replyer is '작성자';
comment on column tbl_reply.replydate is '작성일';
comment on column tbl_reply.updatedate is '수정일';

--댓글 시퀀스
create sequence seq_reply;

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

--serve query를 이용한INSERT
INSERT INTO tbl_board (SELECT seq_tbl_board.NEXTVAL, title, content, writer, regdate, updatedate FROM tbl_board); 

-- 일반적인 INSERT
INSERT INTO tbl_board(bno, title, content, writer) VALUES (seq_tbl_board.NEXTVAL, '제목', '내용', '작성자');

SELECT * FROM tbl_board ORDER BY bno;

--시퀀스 제거
DROP SEQUENCE seq_tbl_board;

DROP TABLE tbl_reply;
DROP TABLE tbl_board;

--테이블은 그대로 두고, 카디널리티만 삭제
TRUNCATE TABLE tbl_reply;
ROLLBACK;

--테이블 구조
DESC tbl_board;
DESC tbl_reply;

--bno에 해당되는 테이블
DELETE tbl_board WHERE bno=88;

SHOW tables;

--TCL 처리
COMMIT;

CREATE TABLE test (no NUMBER(1));
INSERT INTO test VALUES(6);

SELECT ROWNUM, no FROM test 
--where rownum<5
ORDER BY no DESC;

SELECT ROWNUM, no FROM (SELECT no FROM test ORDER BY no DESC) WHERE ROWNUM<5;

--서브쿼리 방식 1
SELECT ROWNUM, no FROM (SELECT no FROM test ORDER BY no DESC) WHERE ROWNUM BETWEEN 1 AND 10;

--서브쿼리 방식 2
SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY a.bno) row_num, a.* FROM tbl_board a)WHERE row_num BETWEEN 1 AND 10;

SELECT ROW_NUMBER() OVER (ORDER BY bno DESC) row_num, tbl.* FROM tbl_board tbl;

--rownum은 1부터 시작해야 됨 (result null)
SELECT * FROM (SELECT ROWNUM rn, bno FROM tbl_board ORDER BY bno DESC) WHERE rn BETWEEN 6 AND 10;

SELECT * FROM (SELECT ROWNUM rn, bno FROM tbl_board ORDER BY bno DESC) WHERE rn <5;

SELECT bno, title, content, writer, regdate, updatedate 
		FROM (SELECT /*+INDEX_DESC(tbl_board pk_board) */
			ROWNUM rn, bno, title, content, writer, regdate, updatedate
		FROM tbl_board WHERE ROWNUM <= 20)
		WHERE rn > 10;

--총 건수 //삭제여부, 게시판 종류 등을 조건에 넣어서 원하는 data취함
SELECT COUNT(*) FROM tbl_board;

--field 검색 where ~ like ~ '%';
SELECT * FROM tbl_board WHERE title LIKE '제%'; --'제' 로 시작하는
SELECT * FROM tbl_board WHERE title LIKE '%목'; --'목' 으로 끝나는
SELECT * FROM tbl_board WHERE title LIKE '%w%'; -- 'w'가 포함된

SELECT bno, title, content, writer, regdate, updatedate 
		FROM 
			(
			SELECT /*+INDEX_DESC(tbl_board pk_board) */
				ROWNUM rn, bno, title, content, writer, regdate, updatedate
			FROM tbl_board WHERE title LIKE '%따뜻%');


select * from tbl_reply where bno = 203;

commit;