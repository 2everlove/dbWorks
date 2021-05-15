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

desc tbl_board;

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
    CONSTRAINT fk_bno FOREIGN KEY(bno) REFERENCES tbl_board(bno) ON DELETE CASCADE
);
--댓글 추가
INSERT INTO tbl_reply VALUES (seq_reply.NEXTVAL, 202, '댓글 comment', 'replyer', sysdate, sysdate);


COMMIT;

DELETE FROM tbl_board WHERE bno = 204;

SELECT * FROM tbl_reply;

--댓글 주석
COMMENT ON TABLE spring.tbl_reply IS '댓글';
COMMENT ON COLUMN tbl_reply.rno IS '번호';
COMMENT ON COLUMN tbl_reply.reply IS '댓글';
COMMENT ON COLUMN tbl_reply.replyer IS '작성자';
COMMENT ON COLUMN tbl_reply.replydate IS '작성일';
COMMENT ON COLUMN tbl_reply.updatedate IS '수정일';

--댓글 시퀀스
CREATE SEQUENCE seq_reply;

-- CONSTRAINT fk_bno FOREIGN KEY(bno) REFERENCES tbl_board(bno) 에서 CONSTRAINT는 CONSTRAINT_NAME을 직접 설정 하는 것
COMMENT ON TABLE spring.tbl_reply IS '답글';

--creating table file
create table tbl_attach(
    attachno number(10) not null,
    uuid varchar2(100) not null,
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    filetype char(1),
    regdate date
);

COMMIT;

rollback;

select seq_attach.nextval from dual;

select * from tbl_attach order by attachno desc;

-- 시퀀스 생성
create sequence seq_attach; 

-- PK 생성
alter table tbl_attach add constraint pk_attach primary key (uuid); 

-- 1건 삽입
insert into tbl_attach values (SEQ_ATTACH.nextval, 'uuid', 'uploadPath', 'filename', 'N', sysdate);

--1건 삭제
delete from tbl_attach where uuid='f7331f17-c100-4e0e-8cba-9ad0f64d10' and attachNo=94;

-- board 테이블에 첨부파일 컬럼 생성
alter table tbl_board add (attachNo number(10));

select attachNo,uuid,uploadPath,fileName,filetype,regdate
        , uploadPath||uuid|| '_' ||fileName as savepath
        , uploadPath||'s_'||uuid|| '_' ||fileName as s_savepath
from tbl_attach order by attachno desc;

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

SELECT rno ,
bno ,
reply ,
replyer ,
replydate ,
    CASE
        WHEN to_char(sysdate,'yyyymmdd') = to_char(updatedate,'yyyymmdd')
        THEN to_char(updatedate, 'hh:mi:ss')
        ELSE to_char(updatedate, 'yyyy-mm-dd hh:mi:ss')
    END AS updatedate
FROM tbl_reply;

--date formatting
SELECT to_char(updatedate,'yyyymmdd'), to_char(updatedate,'yyyy-mm-dd'), to_char(sysdate,'yyyy/mm/dd'), to_char(updatedate,'yyyy-mm-dd am hh:mi:ss') FROM tbl_reply;

SELECT 
    CASE
        WHEN to_char(sysdate,'yyyymmdd') = to_char(updatedate,'yyyymmdd')
        THEN to_char(updatedate, 'hh:mi:ss')
        ELSE to_char(updatedate, 'yyyy-mm-dd hh:mi:ss')
    END AS updatedate
FROM tbl_reply;

SELECT ROW_NUMBER() OVER (PARTITION BY bno ORDER BY rno DESC);

--댓글

SELECT rn, rno, bno, reply, replyer, replydate ,
    CASE
        WHEN TO_CHAR(SYSDATE,'yyyymmdd') = TO_CHAR(UPDATEDATE,'yyyymmdd')
        THEN TO_CHAR(UPDATEDATE, 'hh:mi:ss')
        ELSE TO_CHAR(UPDATEDATE, 'yyyy-mm-dd hh:mi:ss')
    END AS UPDATEDATE
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY RNO DESC) RN, reply.*
    FROM TBL_REPLY reply
    WHERE BNO = 203
    ORDER BY RNO DESC
) WHERE RN BETWEEN 1 AND 10;

SELECT RN, RNO, BNO, REPLY, REPLYER, REPLYDATE, 
    CASE
        WHEN TO_CHAR(SYSDATE,'yyyymmdd') = TO_CHAR(UPDATEDATE,'yyyymmdd')
        THEN TO_CHAR(UPDATEDATE, 'hh:mi:ss')
        ELSE TO_CHAR(UPDATEDATE, 'yyyy-mm-dd hh:mi:ss')
    END UPDATEDATE
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY RNO DESC) RN, reply.*
    FROM tbl_reply reply
    WHERE bno=203
    ORDER BY rno DESC
    ) 
WHERE rn BETWEEN 1 AND 10;

COMMIT;
rollback;

select * from tbl_board where bno=264;

select * from tbl_reply where bno = 201;

--board에 reply count colmun 추가
alter table tbl_reply drop column replyent;
alter table tbl_board add replycnt number(10);

--query가 실행 될 시점 : 수정이 있을 때
update tbl_board
set replycnt = (select count(*) from tbl_reply where bno = 201)
where bno = 201;

select * from tbl_board order by bno desc ;

desc tbl_reply;

---------------------------백업용

CREATE SEQUENCE seq_board_bk;

CREATE TABLE tbl_board_bk (
    bkno      NUMBER(10, 0) PRIMARY KEY,
    bno       NUMBER(10, 0) NOT NULL,
    title     VARCHAR2(200) NOT NULL,
    content   VARCHAR2(2000) NOT NULL,
    writer    VARCHAR2(50) NOT NULL,
    regdate DATE DEFAULT sysdate,
    updatedate DATE DEFAULT sysdate,
    editdate  DATE DEFAULT sysdate
);

select * from tbl_board_bk;

INSERT INTO tbl_board_bk
    ( SELECT
        seq_board_bk.NEXTVAL,
        bno,
        title,
        content,
        writer,
        regdate,
        updatedate,
        sysdate
    FROM
        tbl_board
    WHERE
        bno = 201
    );

--
select bno,title, content, writer, regdate,updatedate,replycnt,attachno from (
select rownum, bno, title, content, writer, regdate, updatedate, replycnt,attachno from tbl_board order by bno desc);

select * from tbl_board where bno = 246;

insert into tbl_board (bno, title, content, writer, updatedate) values(seq_tbl_board.nextval, '제목ㅇㅇ', 'ㅇㅂㅇ', '작성자', sysdate);
commit;

