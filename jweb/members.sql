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
    bnum NUMBER(4) PRIMARY KEY,
    title VARCHAR2(100) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate DATE DEFAULT sysdate,
    memberid VARCHAR2(20),
    CONSTRAINT fk_memberboard FOREIGN KEY(memberid) REFERENCES t_member(memberid)
);

-- 외래키 제약 조건 삭제
ALTER TABLE t_board DROP CONSTRAINT fk_memberboard;

-- 외래키 제약 조건 : 연쇄적으로 삭제
ALTER TABLE t_board ADD CONSTRAINT fk_memberboard FOREIGN KEY(memberid) REFERENCES t_member(memberid) ON DELETE CASCADE;

--조회수 칼럼 추가
ALTER TABLE t_board ADD (hit NUMBER(5));

-- 시퀀스 생성 : 게시판 번호(bnum)
CREATE SEQUENCE bseq
INCREMENT BY 1 
START WITH 1
MINVALUE 1
MAXVALUE 1000 
NOCYCLE
NOCACHE;

DROP SEQUENCE bseq;

DESC t_board;

DROP TABLE t_board;

DELETE FROM t_board WHERE bnum = 18;

COMMIT;

SELECT * FROM t_board;
SELECT * FROM t_board WHERE memberid='ddaddut' ORDER BY bnum DESC ;
SELECT* FROM t_member;

--전체 인원수
SELECT COUNT(*) 전체인원수 
FROM t_member;

--아이디가 mount인 개수 세기
SELECT COUNT(*) 아이디개수 
FROM t_member WHERE memberid='ddaddut';

--memberId가 'ddaddut'이면 'true', 아니면 'false' 출력
SELECT 
    memberid, passwd, decode(memberid, 'ddaddut', 'true', 'false') AS result 
FROM t_member WHERE memberid='ddaddut';

-- memberId가 'mount'의 개수가 1이면 'true', 아니면 'false'
SELECT decode(COUNT(*), 1, 'true', 'false') AS result FROM t_member WHERE memberid = 'ddaddut';

