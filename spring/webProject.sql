CREATE TABLE common_file ( --파일(사진, 썸네일 등등)
    file_pictureId varchar2(100) not null,--사진 아이디
    file_uuid varchar2(100) PRIMARY KEY, -- uuid
    file_name varchar2(100) not Null, --파일 이름
    file_uploadPath VARCHAR2(200) NOT NULL, --업로드 경로
    file_type VARCHAR2(20) NOT NULL, --파일 유형(jpeg, txt 등등)
    file_usingType varchar2(20) not null, --이용하는 유형(0-user, 1-공지, 2-문의, 3-상품)
    file_regdate DATE DEFAULT sysdate --생성일
);
create SEQUENCE file_sequence; --사진아이디 시퀀스


CREATE TABLE products_info ( --상품 정보
    product_id varchar2(20) PRIMARY KEY, --상품 아이디
    file_pictureId varchar2(100) not null, --fk
    product_manufacturer varchar2(200) NOT NULL, --상품 제조사
    product_name VARCHAR2(20) NOT NULL, --상품 이름
    product_description VARCHAR2(500), --상품 설명
    product_category VARCHAR2(10) NOT NULL, --상품 분류
    product_color VARCHAR2(10) NOT NULL, --상품 색
    product_regdate DATE DEFAULT sysdate --상품 등록일
    --CONSTRAINT fk_file_products FOREIGN KEY(file_pictureId) REFERENCES common_file(file_pictureId)
);
create SEQUENCE products_sequence; --상품 정보 시퀀스

CREATE TABLE code_info(--카테고리,제조사를 type으로 가지는 table
    code_no varchar2(200) primary key,
    code_type varchar2(100) not null, --카테고리,제조사
    code_value varchar2(100) not null, -- 값(tablet, samsung), 메뉴값
    code_regdate date default sysdate, --생성일
    code_updateDate date default sysdate, --업데이트
    code__UP_MENU_ID VARCHAR2(50 BYTE), --상위메뉴
    code_menu_URL VARCHAR2(50 BYTE), --메뉴 주소
	code_menu_SORT NUMBER(2,0), --메뉴 정렬
	code_menu_VISIBLE CHAR(1 BYTE) --메뉴 보이기
);
create SEQUENCE code_sequence; --코드 정보 시퀀스

CREATE TABLE user_info ( --회원 정보
    user_id varchar2(100) PRIMARY KEY, --아이디
    file_pictureId varchar2(100) not null, --fk
    user_email varchar2(100) not null UNIQUE, --이메일
    user_name VARCHAR2(30) NOT NULL, --이름
    user_password VARCHAR2(200) NOT NULL, --비번
    user_contact VARCHAR2(30) NOT NULL, --연락처
    user_enabled VARCHAR2(10) NOT NULL, --활성화(0-블럭, 1- 사용, 2-탈퇴)
    user_type VARCHAR2(10) NOT NULL, --회원 유형 (0-관리자, 1-기업, 2-회원)
    user_regdate DATE DEFAULT SYSDATE, -- 가입일
    user_nickname varchar2(50),
    user_gender VARCHAR2(10), --성별
    user_birth DATE, --생일
    user_address VARCHAR2(200),--주소
    user_interesting VARCHAR2(200), --관심사
    user_enabledContent VARCHAR2(300) --활성화 내용(블럭,탈퇴 시 입력)
    --CONSTRAINT fk_file_user FOREIGN KEY(file_pictureId) REFERENCES common_file(file_pictureId)
);
--alter table user_info add(user_nickname varchar2(50));
alter table user_info add sessionkey varchar2(50); --자동로그인 세션키
alter table user_info add sessionlimit Date; --자동로그인 세션제한시간
create sequence user_sequence; --유저 시퀀스

CREATE TABLE product_board ( --상품 상세 게시판
    pboard_unit_no varchar2(20) PRIMARY KEY, --게시판 번호
    pboard_unit_price varchar2(200) NOT NULL, --상품 가격
    pboard_unit_condition VARCHAR2(20) NOT NULL, --상품 상태(0-신상, 1-할인, 2-이벤트)
    pboard_unit_stocks VARCHAR2(10) NOT NULL, --상품 재고
    pboard_unit_regdate DATE DEFAULT sysdate, --상품 게시판 등록일
    pboard_unit_updateDate DATE DEFAULT sysdate, --상품 게시판 수정일
    product_id varchar2(20) not null, --fk
    user_id varchar2(100) not null, --fk
    file_pictureId varchar2(100) not null, --fk
    CONSTRAINT fk_products_pboard FOREIGN KEY(product_id) REFERENCES products_info(product_id),
    CONSTRAINT fk_user_pboard FOREIGN KEY(user_id) REFERENCES user_info(user_id)
    --CONSTRAINT fk_file_pboard FOREIGN KEY(file_pictureId) REFERENCES common_file(file_pictureId)
);
alter table product_board add(pboard_unit_enabled varchar2(20)); --상품 보여주기(0-기본, 1-숨기(삭제를 누르면 1로 update해서 숨김// delete 처리 안함))
create SEQUENCE pboard_sequence; --상품 게시판 번호 시퀀스


CREATE TABLE notice_board ( --공지 게시판
    nboard_no NUMBER(10) PRIMARY KEY, --공지 번호
    nboard_title varchar2(200) NOT NULL, --공지 제목
    nboard_content varchar2(2000) NOT NULL, --공지 내용
    nboard_regdate DATE DEFAULT sysdate, -- 공지 생성일
    nboard_updateDate DATE DEFAULT sysdate, --공지 수정일
    nboard_category VARCHAR2(30) NOT NULL, --분류 (0-공지, 1-이벤트)
    nboard_public CHAR(1) NOT NULL, --공개여부
    user_id varchar2(100) not null,
    file_pictureId varchar2(100) not null,
    CONSTRAINT fk_user_nboard FOREIGN KEY(user_id) REFERENCES user_info(user_id) --공지 작성자
   -- CONSTRAINT fk_file_nboard FOREIGN KEY(file_pictureId) REFERENCES common_file(file_pictureId)
);
create sequence nboard_sequence; --공지 번호 시퀀스


CREATE TABLE notice_reply ( --공지 댓글
    nreply_no varchar2(20) PRIMARY KEY, --댓글 번호
    nreply_content varchar2(200) NOT NULL, --댓글 내용
    nreply_regdate DATE DEFAULT sysdate, --댓글 작성일
    nreply_updateDate DATE DEFAULT sysdate, --댓글 수정일
    nreply_re_reply DATE DEFAULT sysdate, --댓글의 댓글
    user_id varchar2(100) not null, --fk
    file_pictureId varchar2(100) not null, --fk
    nboard_no NUMBER(10) not null, --fk
    CONSTRAINT fk_user_notice FOREIGN KEY(user_id) REFERENCES user_info(user_id), --댓글 작성자
   --CONSTRAINT fk_file_notice FOREIGN KEY(file_pictureId) REFERENCES common_file(file_pictureId),
    CONSTRAINT fk_nboard_nreply FOREIGN KEY(nboard_no) REFERENCES notice_board(nboard_no)
);
create sequence nreply_sequence; --공지 댓글 번호 시퀀스


CREATE TABLE inquiry_board ( --문의 게시판
    iboard_no NUMBER(10) PRIMARY KEY, --문의 번호
    iboard_title varchar2(200) NOT NULL, --문의 제목
    iboard_content varchar2(2000) NOT NULL, --문의 내용
    iboard_regdate DATE DEFAULT sysdate, -- 문의 작성일
    iboard_category VARCHAR2(30) NOT NULL, --분류 (0-?, 1-?)
    iboard_public CHAR(1) NOT NULL, --공개여부
    user_id varchar2(100) not null, --fk
    CONSTRAINT fk_user_iboard FOREIGN KEY(user_id) REFERENCES user_info(user_id) --문의 작성자
);
create sequence iboard_sequence; -- 문의 번호 시퀀스
alter table inquiry_board add iboard_regdate_New Date; --문의 비밀글, 공개글 구분


CREATE TABLE inquiry_reply ( --문의 댓글
    ireply_no NUMBER(10) PRIMARY KEY, --댓글 번호
    ireply_content varchar2(200) NOT NULL, --댓글 내용
    ireply_regdate DATE DEFAULT sysdate, --댓글 작성일
    user_id varchar2(100) not null, --fk
    iboard_no NUMBER(10) not null, --fk
    CONSTRAINT fk_user_id FOREIGN KEY(user_id) REFERENCES user_info(user_id), --댓글 작성자
    CONSTRAINT fk_iboard_ireply FOREIGN KEY(iboard_no) REFERENCES inquiry_board(iboard_no) --문의 글 번호
);
create sequence ireply_sequence; -- 문의 댓글 번호 시퀀스


CREATE TABLE order_board ( --주문 게시판
    order_id varchar2(20) PRIMARY KEY, --주문 아이디
    order_address varchar2(200) NOT NULL, --배송주소
    order_name varchar2(20) NOT NULL, --받는 사람
    order_regdate DATE DEFAULT sysdate,--주문일
    ordder_cancelDate Date, --주문 취소일
    order_status varchar2(20) not null, --상태(1-주문완료, 2-택배사전달, 3-배송준비, 4-배송중, 5-배송완료, 0-주문취소)
    order_totalprice varchar2(1000) not null, -- 가격
    order_totalcount varchar2(100) not null, --갯수
    user_id varchar2(100) not null, --fk
    product_id varchar2(20) not null, --fk
    pboard_unit_no varchar2(20) not null, --fk
    CONSTRAINT fk_user_order FOREIGN KEY(user_id) REFERENCES user_info(user_id), --회원 아이디
    CONSTRAINT fk_products_order FOREIGN KEY(product_id) REFERENCES products_info(product_id), --상품 아이디(아이디, 색)
    CONSTRAINT fk_pboard_order FOREIGN KEY(pboard_unit_no) REFERENCES product_board(pboard_unit_no) --상품 게시글 번호(재고)
);
--alter table order_board add(order_totalprice varchar2(1000) not null); -- 가격
--alter table order_board add(order_totalcount varchar2(100) not null); --갯수
create sequence order_sequence; --주문 아이디 용 시퀀스

CREATE TABLE cart_board ( --장바구니 게시판
    cart_id varchar2(20) PRIMARY KEY, --장바구니 아이디
    user_id varchar2(100), --유저 아이디
    user_name varchar2(100), --유저 이름
    product_id varchar(20), --상품 아이디
    product_name varchar2(20), --상품 이름
    pboard_unit_no varchar2(20), --게시판 번호
    cart_totalprice varchar2(1000), --가격
    cart_totalcount varchar2(100), --갯수
    user_address varchar2(200) --가격
);
create sequence cart_sequence; -- 장바구니 시퀀스

commit;

 
--삭제 순서
--테이블 삭제
drop table cart_board;
drop table inquiry_reply;
drop table notice_reply;
drop table inquiry_board;
drop table notice_board;
drop table order_board;
drop table product_board;
drop table products_info;
drop table user_info;
drop table common_file;
--시퀀스 삭제
drop sequence cart_sequence;
drop sequence order_sequence;
drop sequence ireply_sequence;
drop sequence iboard_sequence;
drop sequence nreply_sequence;
drop sequence nboard_sequence;
drop sequence pboard_sequence;
drop sequence products_sequence;
drop sequence user_sequence;
drop sequence file_sequence;






--desc products_info;
