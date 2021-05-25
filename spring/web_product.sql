insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
    values (file_sequence.nextval, 'name','uuid', 'src', 'image', '3');

insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
    values (file_sequence.nextval, 'ipadname','uuid', 'src', 'image', '3');

insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
    values (file_sequence.nextval, 'user01_name','user01_uuid', 'src', 'image', '4');

insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
    values (file_sequence.nextval, 'product01','product01_uuid', 'src', 'image', '3');

insert into products_info(product_id, file_pictureId, product_manufacturer, product_name, product_category, product_color) values (products_sequence.nextval, '1', 'apple', 'ipad4','tablet', '#dfe6e9');

insert into user_info(user_id, file_pictureId, user_email, user_name, user_password, user_contact, user_enabled, user_type, user_regdate, user_gender, user_birth, user_address, user_interesting, user_enabledContent) 
    values(user_sequence.nextval, 2, 'user01@naver.com', 'user01', '1234', '01012345678', 1, 1, sysdate, 'male', '1990-12-14', '서울시 금천구', '코딩', 'null');

insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
    values(pboard_sequence.nextval, 390000, 0, '999', 6, 1, 3);
  
commit;
rollback;


select * from common_file;

select * from products_info;

select * from user_info;

select * from product_board;

select * from product_board where pboard_unit_no=21;

select count(*) from product_board;

select * from user_info where user_id=1;

select rownum num, board.* from (select pboard.* from product_board pboard order by TO_NUMBER(pboard_unit_price) asc) board where rownum between 1 and 5;

select rownum num, board.* from (
    select pboard.* from product_board pboard  
    where product_id in
        (select product_id00 from products_info where product_category='tablet') 
    order by TO_NUMBER(pboard_unit_price) asc) board;

select rownum num, pboard.* from (select board.*, rank() over(partition by product_id order by pboard_unit_price) each_rank from (
    select * from product_board where product_id in(
        select product_id from products_info where product_category='tablet') ) board) pboard
    where each_rank between 1 and 5;

select rownum num, board.* from (select pboard.* from product_board pboard order by TO_NUMBER(pboard_unit_price) asc) board;