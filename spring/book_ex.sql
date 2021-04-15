--sequence
create SEQUENCE seq_board;

--create table
create table tbl_board(
    bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);
--pk
alter table tbl_board add CONSTRAINT pk_board PRIMARY key(bno);

--insert
insert into tbl_board(bno, title, content, writer) values (seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');

commit;

select * from tbl_board order by bno desc;

