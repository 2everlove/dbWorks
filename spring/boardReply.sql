CREATE TABLE tbl_board (
    bno NUMBER(10) PRIMARY KEY,
    title VARCHAR2(200 BYTE) not null,
    content VARCHAR2(2000) not null,
    writer VARCHAR2(50) not null,
    regdate DATE DEFAULT sysdate,
    updatedate DATE
);

--주석 달아주기~
comment on table spring.tbl_board is '게시판';
comment on column tbl_board.bno is '번호';
comment on column tbl_board.title is '제목';
comment on column tbl_board.content is '내용';
comment on column tbl_board.writer is '작성자';
comment on column tbl_board.regdate is '작성일';
comment on column tbl_board.updatedate is '수정일';

CREATE TABLE tbl_reply (
    rno NUMBER(10) PRIMARY KEY,
    bno NUMBER(10) not null,
    reply VARCHAR2(1000 BYTE) not null,
    replyer VARCHAR2(50 BYTE) not null,
    replydate DATE DEFAULT sysdate,
    updatedate DATE DEFAULT sysdate,
    CONSTRAINT fk_bno FOREIGN KEY(bno) REFERENCES tbl_board(bno)
);
-- CONSTRAINT fk_bno FOREIGN KEY(bno) REFERENCES tbl_board(bno) 에서 CONSTRAINT는 CONSTRAINT_NAME을 직접 설정 하는 것
comment on table spring.tbl_reply is '답글';


--한글은 3byte
--NVL(value, 0) / value가 null이면 0으로 치환

ALTER TABLE tbl_reply 
    ADD CONSTRAINT fk_bno 
    FOREIGN KEY(bno) 
    REFERENCES tbl_board(bno) ON DELETE CASCADE;

create sequence seq_tbl_board;
CREATE SEQUENCE seq_tbl_board INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 1000 NOCYCLE NOCACHE;

select seq_tbl_board.nextval from dual;
select seq_tbl_board.currval from dual;

insert into tbl_board (select seq_tbl_board.nextval, title, content, writer, regdate, updatedate from tbl_board); 

INSERT INTO tbl_board(bno, title, content, writer) VALUES (seq_tbl_board.nextval, '제목', '내용', '작성자');
select * from tbl_board;

drop sequence seq_tbl_board;
    
DROP TABLE tbl_reply;
DROP TABLE tbl_board;

--테이블은 그대로 두고, 카디널리티만 삭제
TRUNCATE table tbl_reply;

DESC tbl_board;
DESC tbl_reply;

show tables;

commit;

