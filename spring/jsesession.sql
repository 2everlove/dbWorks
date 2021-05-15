-- 사용자 테이블 생성
create table users(
  	id varchar2(50) not null primary key,
  	pwd varchar2(100) not null,
  	enabled char(1) default '1',
	name varchar2(20) not null,
	email varchar2(100) not null
);

-- 권한 테이블 생성 
-- *다중 PK를 설정 할 경우 제약조건으로 하단에 추가 합니다
create table users_role (
    id       VARCHAR2(50) NOT NULL,
    role_id  VARCHAR2(50) NOT NULL,
    constraint fk_users_role FOREIGN KEY ( id ) REFERENCES users ( id ),
    constraint pk_users_role PRIMARY KEY (id, role_id)
);

alter table users_role change pk_users_role

-- 사용자 등록
insert into users (id, pwd, enabled, name, email) values ('user01', '1234', '1', '일번', '1@naver.com');
insert into users (id, pwd, enabled, name, email) values ('user02', '1234', '1', '이번', '2@naver.com');
insert into users (id, pwd, enabled, name, email) values ('user03', '1234', '1', '삼번', '3@naver.com');
insert into users (id, pwd, enabled, name, email) values ('user04', '1234', '1', '사번', '4@naver.com');

-- 사용자별 권한 등록
insert into users_role (id, role_id) values ('user01', 'ROLE_USER');
insert into users_role (id, role_id) values ('user01', 'ROLE_ADMIN');
insert into users_role (id, role_id) values ('user02', 'ROLE_USER');
insert into users_role (id, role_id) values ('user04', 'ROLE_USER');

select * from users_role;

select * from users;

select * from users where id = 'user01' and pwd = '1234';

--자동로그인을 위한 sessionkey, sessionlimit추가
alter table users add sessionkey varchar(50);
alter table users add sessionlimit date;

alter table users drop column sessionid;

commit;

--sessionkey,sessionlimit 업데이트
update users set sessionkey='key', sessionlimit=sysdate+7 where id ='user01';
