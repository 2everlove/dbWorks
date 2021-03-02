-- sequence : 일련번호 만들기 (1씩 증가 , 1부터 시작, 최소 1 최대 1000까지 사이클 x, 캐쉬 x) --
CREATE SEQUENCE myseq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;

create table ex6 (
    num number(2) PRIMARY KEY,
    name varchar2(10)
);

desc ex6;

-- 동물 추가
insert into ex6(num, name) values (myseq.nextval,'dog');
insert into ex6 values(myseq.nextval, 'cow');
insert into ex6 values(myseq.nextval, 'cat');

select * from ex6;

commit;

drop SEQUENCE myseq;
drop table ex6;

ROLLBACK;