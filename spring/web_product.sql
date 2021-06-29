insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
    values (file_sequence.nextval, 'name','uuid1', 'src', 'image', '3');

insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
    values (file_sequence.nextval, 'ipadname','uuid2', 'src', 'image', '3');

insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
values ('23', 'file_name.jpg', 'file_uuid', 'file_uploadPath', 'file_type', '3'); 

insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
    values (file_sequence.nextval, 'user01_name','user01_uuid', 'src', 'image', '4');

insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
    values (file_sequence.nextval, 'product01','product01_uuid', 'src', 'image', '3');
    
insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
values (file_sequence.nextval, 'pboard01','pboard01_uuid', 'src', 'image', '3');

insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
values (5, 'pboard02','pboard02_uuid', 'src', 'image', '3');

insert into products_info(product_id, file_pictureId, product_manufacturer, product_name, product_category, product_color) values (products_sequence.nextval, '4', 'apple', 'ipad4','tablet', '#dfe6e9');
insert into products_info(product_id, file_pictureId, product_manufacturer, product_name, product_category, product_color) values (products_sequence.nextval, '4', 'apple', 'ipad5','tablet', '#dfe6e9');
insert into products_info(product_id, file_pictureId, product_manufacturer, product_name, product_category, product_color) values (products_sequence.nextval, '4', 'samsung', 'galaxyCom1','computer', '#dfe6e9');
insert into products_info(product_id, file_pictureId, product_manufacturer, product_name, product_category, product_color) values (products_sequence.nextval, '4', 'samsung', 'galaxyCom2','computer', '#dfe6e9');
insert into products_info(product_id, file_pictureId, product_manufacturer, product_name, product_category, product_color) values (products_sequence.nextval, '4', 'samsung', 'galaxyCom3','computer', '#dfe6e9');

insert into user_info(user_id, file_pictureId, user_email, user_name, user_password, user_contact, user_enabled, user_type, user_regdate, user_gender, user_birth, user_address, user_interesting, user_enabledContent) 
    values(user_sequence.nextval, 4, 'user01@naver.com', 'user01', '1234', '01012345678', 1, 1, sysdate, 'male', '1990-12-14', '서울시 금천구', '코딩', 'null');

insert into user_info(user_id, file_pictureId, user_email, user_name, user_password, user_contact, user_enabled, user_type, user_regdate, user_gender, user_birth, user_address, user_interesting, user_enabledContent) 
    values(user_sequence.nextval, 4, 'user02@naver.com', '삼성공식셀러', '1234', '01012345678', 1, 1, sysdate, 'male', '1990-12-14', '서울시 금천구', '코딩', 'null');

insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
    values(pboard_sequence.nextval, 390000, 0, '999', 2, 1, 5);
insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
    values(pboard_sequence.nextval, 400000, 0, '999', 2, 1, 5);
insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
    values(pboard_sequence.nextval, 410000, 0, '999', 2, 1, 5);
insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
    values(pboard_sequence.nextval, 420000, 0, '999', 2, 1, 5);
insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
    values(pboard_sequence.nextval, 430000, 0, '999', 2, 1, 5);
insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
    values(pboard_sequence.nextval, 440000, 0, '999', 2, 1, 5);
insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
values(pboard_sequence.nextval, 30000, 0, '999', 1, 1, 5);
insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
values(pboard_sequence.nextval, 31000, 0, '999', 1, 1, 5);
insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
values(pboard_sequence.nextval, 32000, 0, '999', 1, 1, 5);
insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
values(pboard_sequence.nextval, 33000, 0, '999', 1, 1, 5);
insert into product_board(pboard_unit_no, pboard_unit_price, pboard_unit_condition, pboard_unit_stocks, product_id, user_id, file_pictureId)
values(pboard_sequence.nextval, 34000, 0, '999', 1, 1, 5);
commit;
rollback;

desc user_info;
select * from common_file;

select * from products_info where product_id = 24;

select * from user_info;

select * from product_board;

select * from code_info;

select * from product_board where pboard_unit_no=81;

select count(*) from product_board;

select * from user_info where user_id=1;

select rownum num, board.* from (select pboard.* from product_board pboard order by TO_NUMBER(pboard_unit_price) asc) board where rownum between 1 and 5;

select rownum num, board.* from (
    select pboard.* from product_board pboard  
    where product_id in
        (select product_id00 from products_info where product_category='tablet') 
    order by TO_NUMBER(pboard_unit_price) asc) board;

select rownum num, pboard.* from (select board.*, rank() over(partition by product_id order by pboard_unit_price, pboard_unit_regdate desc) each_rank from (
    select * from product_board where product_id in(
        select product_id from products_info where product_category='tablet') ) board) pboard
    where each_rank between 1 and 5;

select rownum num, board.* from (select pboard.* from product_board pboard order by TO_NUMBER(pboard_unit_price) asc) board;

--카테고리로 file_id 가져오기
select * from common_file where file_pictureid in (select file_pictureid from products_info where product_category in (select product_category from product_board where product_category='tablet'));
select file_pictureId,file_uuid,file_uploadPath,file_name,file_type,file_regdate
        	, file_uploadPath||file_uuid|| '_' ||file_name as file_savepath
        	, file_uploadPath||'s_'||file_uuid|| '_' ||file_name as file_s_savepath
		from common_file
		where file_pictureid in (select file_pictureid from products_info where product_category in (select product_category from product_board where product_category='tablet'));

--pDetail
select file_pictureId,file_uuid,file_uploadPath,file_name,file_type,file_regdate
    , file_uploadPath||file_uuid|| '_' ||file_name as file_savepath
    , file_uploadPath||'s_'||file_uuid|| '_' ||file_name as file_s_savepath
from common_file
where file_pictureid in (select file_pictureid from product_board where pboard_unit_no='21');
        
select file_pictureId,file_uuid,file_uploadPath,file_name,file_type,file_regdate
    , file_uploadPath||file_uuid|| '_' ||file_name as file_savepath
    , file_uploadPath||'s_'||file_uuid|| '_' ||file_name as file_s_savepath
from common_file
where file_pictureid in (select file_pictureid from products_info where product_id in (select product_id from product_board where pboard_unit_no='13'));
--!search
select DISTINCT product_category from products_info where product_category like '%t%';
select product_category from products_info where product_category like '%t%';

--search product_pboard
select rownum num, pboard.* from (
			select board.*, rank() over(partition by product_id order by pboard_unit_price, pboard_unit_regdate desc) each_rank from (
    			select * from product_board where pboard_unit_enabled = '0' and product_id in(
        			select product_id from products_info 
		where product_id in (
			select product_id from products_info 
			where 
			
				Lower(product_name) like '%com%'
			
		)
        		)) board
        	) pboard where each_rank between 1 and 5;
            
--search product_info            
select p_i.* from (select * from products_info 
		where product_id in (
			select product_id from products_info 
			where 
			
				Lower(product_name) like '%com%'
			
)) p_i left join product_board p_b  on p_i.product_id = p_b.product_id where p_b.product_id is null;

--onClick type on search
select distinct p_i.* from (select * from products_info where product_category='tablet') p_i left join product_board p_b on p_i.product_id = p_b.product_id where p_b.product_id is not null;

select * from products_info where product_category='tablet';

select pb.*, f.file_uploadpath from (select p.file_pictureId masterImg, b.* from (select * 
		from product_board 
		where pboard_unit_no = 14 and pboard_unit_no = 61 and pboard_unit_no =20
			
		) b full outer join products_info p on b.product_id = p.product_id where b.pboard_unit_no is not null) pb full outer join common_file f on f.file_pictureId = pb.masterImg where f.file_pictureid is not null;
        
select p.file_pictureId masterImg, b.* from (select * 
		from product_board 
		where
				pboard_unit_no = 14 or pboard_unit_no = 61 or pboard_unit_no =20 or pboard_unit_no =81
			
		) b full outer join products_info p on b.product_id = p.product_id where b.pboard_unit_no is not null;
--검색어로 product_id 찾기(검색은 대소문자를 가리니 product_search를 lower()나 upper()로 감싼 뒤, java단에서 lower,upper를 맞추고 trim()으로 앞뒤 빈공간 제거)
select * from products_info where product_id in( select product_id from (
    select pboard.*, product_manufacturer||' '||product_category||' '||product_name product_search1, product_manufacturer||' '||product_name product_search2, product_name||' '||product_category||' '||product_manufacturer product_search3, product_name||' '||product_manufacturer||' '||product_category product_search4 from products_info pboard
) where product_search1 like lower('%samsung C%') or product_search2 like lower('%samsung C%') or product_search3 like lower('%samsung C%') or product_search4 like lower('%samsung C%'));

select * from products_info where product_id in( select product_id from (
    select pboard.*, product_category product_search4 from products_info pboard
) where product_search4 like lower('%computer%'));

--!search product_info
 select distinct p_i.*  from (select * from products_info 
      where product_id in (
         select product_id from products_info 
         where 
         
            Lower(product_name) like '%ip%'
         
      )) p_i left join product_board p_b on p_i.product_id = p_b.product_id where p_b.product_id is not null and p_b.pboard_unit_enabled = '0';

--join ex
select a.* from products_info a left outer join products_info b on a.product_category like lower('%computer%');
-----
select product.product_manufacturer|| product.product_category , product.product_name from (select rownum num, p.* from products_info p) product;

select product_manufacturer from products_info where product_manufacturer like '%app%';

select * from products_info where EXISTS (select product_manufacturer from products_info where product_manufacturer like '%app%');

select rownum num, pboard.* from (
			select board.*, rank() over(partition by product_id order by pboard_unit_price, pboard_unit_regdate desc) each_rank from (
    			select * from product_board where product_id in(
        			select product_id from products_info where product_id in( select product_id from (
    select pboard.*, product_manufacturer||' '||product_category||' '||product_name product_search1, product_manufacturer||' '||product_name product_search2, product_name||' '||product_category||' '||product_manufacturer product_search3, product_name||' '||product_manufacturer||' '||product_category product_search4 from products_info pboard
) where product_search1 like '%samsung g%' or product_search2 like '%samsung g%' or product_search3 like '%samsung g%' or product_search4 like '%samsung g%')) 
        		) board
        	) pboard where each_rank between 1 and 5;


select * from products_info where product_id in (select product_id from products_info where product_manufacturer like '%app%');

--admin
select board.* from (select rownum num, pboard.* from (select * from product_board where user_id = '1') pboard)board;

--!search & insert
insert into code_info(code_no, code_type, code_value) values(code_sequence.nextval, 'category', 'tablet');
select distinct product_category, product_manufacturer from products_info where product_name like '%a%';
insert into code_info(code_no, code_type, code_value) values(code_sequence.nextval, 'manufacturer', 'samsung');
select distinct product_category, product_manufacturer, product_name, product_id, file_pictureId, product_color, product_regdate, product_description 
		from products_info 
		where product_id = 2;
commit;
select * from code_info;
select distinct code_value from code_info where code_type = 'manufacturer' and code_value like '%a%';

select * from cart_board;

update order_board(order_totalcount) values (  (select pboard_unit_stocks from cart_board)cart (select pboard_unit_stocks from product_board where pboard_unit_no = 13)stock);

--search paging
select board.* from (select rownum rn, pInfo.* from products_info pInfo where product_name like '%a%' and rownum <= (1*10) order by product_regdate desc) board where rn > (1-1)*10;

--!main
select * from product_board order by product_id desc;
--main에서 랜덤으로 중복된 product_id 를 제거해서 1개의 게시글을 불러옴
select round(avg(nvl(a.review_rate,0)),0) avg, a.pboard_unit_no from product_review a group by a.pboard_unit_no;

select * from product_review;

select a.*, rownum num from (select nvl(r.review_rate,0) avg , b.* 
from (select pboard.* 
        from (select distinct board.*, row_number() over(partition by pboard_unit_condition, product_id order by dbms_random.random) each_rank 
            from product_board board where pboard_unit_enabled = '0'
        ) pboard where each_rank='1' 
    ) b 
left join (select round(avg(nvl(a.review_rate,0)),0) review_rate, a.pboard_unit_no 
        from product_review a group by a.pboard_unit_no 
    ) r
on r.pboard_unit_no = b.pboard_unit_no where b.pboard_unit_no is not null order by dbms_random.random) a order by num;

select distinct pboard.* 
        from (select board.*, row_number() over(partition by product_id order by dbms_random.random) each_rank 
            from product_board board where pboard_unit_enabled = '0'
        ) pboard where each_rank='1';

select pboard.* from (select board.*, row_number() over(partition by product_id order by dbms_random.random) each_rank from product_board board) pboard where each_rank='1';
select pboard.* from (select board.*, dense_rank() over(partition by pboard_unit_condition,product_id order by dbms_random.random) each_rank from product_board board) pboard where each_rank='1';

select product.* from (select rownum num, p.* from products_info p) product where num between 1 * 5-4 and 1 * 5; 

--order
select * from order_board;

select o.* 
from order_board o 
left join product_board p 
on o.pboard_unit_no = p.pboard_unit_no 
where o.pboard_unit_no is not null 
and p.user_id='1';

select * from product_board;
select * from user_info;
select rownum num, order_board.* from order_board where pboard_user_id = '1';
select order_board.* from (select rownum num, order_board.* from order_board where pboard_user_id = 'user01') order_board;

select orde.* from (select rownum num, o.* 
		from order_board o 
		left join product_board p 
		on o.pboard_unit_no = p.pboard_unit_no 
		where o.pboard_unit_no is not null 
		and p.user_id= 'user01') orde where num between 1 * 10-9 and 1 * 10;

--history
select p.file_pictureId masterImg, b.* from (select * 
		from product_board where pboard_unit_no = '61' or pboard_unit_no = '81' or pboard_unit_no = '22' or pboard_unit_no = '17'
        ) b 
full outer join products_info p on b.product_id = p.product_id 
where b.pboard_unit_no is not null 
order by DECODE(pboard_unit_no, '61', 1, '81', 2,'22', 3,'17',4);

--불러온 데이터를 기준(어차피 product_id는 1개는 무조건 들어가므로 random필요 없음)으로 products_info 불러옴
select nvl(r.review_rate,0) avg, b.* from (select * from products_info 
        where product_id in (
            select pboard.product_id 
            from (
                select board.*, row_number() over(partition by pboard_unit_condition, product_id order by pboard_unit_updatedate desc, pboard_unit_regdate asc) each_rank 
                from product_board board where pboard_unit_enabled = '0'
            ) 
                pboard where each_rank='1'
        )
) b full outer join product_review r on r.pboard_unit_no = b.pboard_unit_no;

select * from products_info where product_id in (select pboard.product_id from (select board.*, row_number() over(partition by product_id order by pboard_unit_updatedate desc, pboard_unit_regdate asc) each_rank from product_board board) pboard where each_rank='1');
select * from common_file where file_pictureid in (select file_pictureid from products_info where product_id in (select pboard.product_id from (select board.*, row_number() over(partition by product_id order by pboard_unit_updatedate desc, pboard_unit_regdate asc) each_rank from product_board board) pboard where each_rank='1'));
select * from user_info where user_id in (select user_id from products_info where product_id in (select pboard.product_id from (select board.*, row_number() over(partition by product_id order by pboard_unit_updatedate desc, pboard_unit_regdate asc) each_rank from product_board board) pboard where each_rank='1'));
--join ex
select c.* from common_file c left outer join (select p.* from products_info p left outer join product_board pb on p.product_id = pb.product_id) co on c.file_pictureid=co.file_pictureid;
------

select distinct product_manufacturer, product_category, product_name
		from products_info
		where lower(product_manufacturer) = 'sony';
        
        
select pbIn.* from (select rownum num, pb.* from (
    select board.* from (select pboard.* from (select * from product_board where user_id = '1' order by TO_NUMBER(pboard_unit_enabled)) pboard
        )board 
    ) pb 
left join products_info pi on pb.product_id=pi.product_id where pi.product_name like '%pad5%') pbIn where num between 1 * 10-9 and 1 * 10;

--nboard
select n.*, n.nboard_regDate+7 from notice_board n;

select * from order_board;
--order

select order_board.*, pi.product_name from (
    select rownum num, orderb.* from (
        select o.* 
        from order_board o 
        left join product_board p 
        on o.pboard_unit_no = p.pboard_unit_no 
        where o.pboard_unit_no is not null 
        and p.user_id= ${pboard_user_id}
    ) orderb 
)order_board left join products_info pi on order_board.product_id = pi.product_id 
where num between #{pageNo} * #{amount}-9 and #{pageNo} * #{amount} 
order by order_board.order_id desc;

select ob.* from (select rownum num, order_board.*, pi.product_name from (select orderb.* from (select o.* 
from order_board o 
left join product_board p 
on o.pboard_unit_no = p.pboard_unit_no 
where o.pboard_unit_no is not null 
and p.user_id= '1') orderb )order_board left join products_info pi on order_board.product_id = pi.product_id) ob;

order by order_board.order_id desc;
        
select order_board.* from (
    select rownum num, o.*, p.product_name from (select * from order_board) o
    left join products_info p 
    on o.product_id = p.product_id 
    where o.product_id is not null) 
order_board where num between 1 * 10-9 and 1 * 10 order by order_board.order_regdate desc;

select rownum num, pboard.* from (
			select board.*, rank() over(partition by product_id order by pboard_unit_price, pboard_unit_regdate desc) each_rank from (
    			select * from product_board where pboard_unit_enabled = '0' and product_id in(
        			select product_id from products_info where product_category='video') 
        		) board
        	) pboard where each_rank between 1 and 5 order by pboard.pboard_unit_price;
select distinct p_i.* from (select * from products_info where product_category='tablet') p_i left join product_board p_b on p_i.product_id = p_b.product_id where p_b.product_id is not null and p_b.pboard_unit_enabled = '0';

select order_board.* from (
    (select rownum num, o.* from order_board where user_id = '1' order by order_regdate desc) o
left join products_info p on o.product_id = p.product_id where o.product_id is not null
) 
order_board where num between 1 * 10-9 and 1 * 10;

select order_board.* from ( select rownum num, o.*, p.product_name from (select * from order_board where user_id = '1' order by order_regdate desc) o
left join products_info p on o.product_id = p.product_id where o.product_id is not null) order_board where num between 1 * 10-9 and 1 * 10;

--------------
select order_board.* from (
    select rownum num, o.*, p.product_name from (select * from order_board where user_id = 'admin' ) o
    left join products_info p 
    on o.product_id = p.product_id 
    where o.product_id is not null order by o.order_regdate desc) 
order_board where num between 1 and 20 ;

------payment(company)
select ob.* from (
    select rownum num, order_board.*, pi.product_name from (
        select orderb.* from (
            select o.* 
            from order_board o 
            left join product_board p 
            on o.pboard_unit_no = p.pboard_unit_no 
            where o.pboard_unit_no is not null 
            and p.user_id= '1'
        ) orderb order by orderb.order_id desc
    )order_board left join products_info pi on order_board.product_id = pi.product_id 
) ob
where num between 1 and 20; 

----payment(company)
select ob.* from (
    select rownum num, order_board.*, pi.product_name from (
        select orderb.* from (
            select o.* 
            from order_board o 
            left join product_board p 
            on o.pboard_unit_no = p.pboard_unit_no 
            where o.pboard_unit_no is not null 
            and p.user_id= '22'
        ) orderb
    )order_board left join products_info pi on order_board.product_id = pi.product_id order by to_number(order_board.order_id) desc
) ob where num between 1 and 10;

----payment(admin)
select order_board.* from (
    select rownum num, o.*, p.product_name from (select * from order_board order by order_regdate desc) o
    left join products_info p 
    on o.product_id = p.product_id 
    where o.product_id is not null) 
order_board where num between 1 and 20; 

--user(admin)
select * from user_info order by user_regdate desc;

---product register
select distinct LOWER(product_category) as product_category, LOWER(product_manufacturer) as product_manufacturer, LOWER(product_name) as product_name, product_id, file_pictureId, product_color, product_regdate, product_description 
		from products_info 
		where LOWER(product_name) like '%asu%';