--create t_member
create table t_member(
    memberId varchar2(20),
    passwd varchar2(20) not null,
    name varchar2(30) not null,
    gender varchar2(10),
    joinDate date default sysdate,
    primary key(memberId)
);

create table t_board(
    bnum number(4),
    title varchar2(200),
    content varchar2(2000),
    regDate date DEFAULT sysdate,
    primary key(bnum)
);

select * from t_member;