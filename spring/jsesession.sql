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

-- 사용자 등록
insert into users (id, pwd, enabled, name, email) values ('user01', '1234', '1', '일번', '1@naver.com');
insert into users (id, pwd, enabled, name, email) values ('user02', '1234', '1', '이번', '2@naver.com');
insert into users (id, pwd, enabled, name, email) values ('user03', '1234', '1', '삼번', '3@naver.com');

-- 사용자별 권한 등록
insert into users_role (id, role_id) values ('user01', 'ROLE_USER');
insert into users_role (id, role_id) values ('user01', 'ROLE_ADMIN');
insert into users_role (id, role_id) values ('user02', 'ROLE_USER');
insert into users_role (id, role_id) values ('user03', 'ROLE_USER');

select * from users;
