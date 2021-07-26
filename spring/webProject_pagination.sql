--index 추가 후 성능 개선(index 이름은 product_board의 제약조건 내부의 index_name에서 가져옴)
EXPLAIN plan FOR
select pboard.* from (
    select /*+ INDEX_DESC(SYS_C009706) */ ROW_NUMBER() OVER(ORDER BY pb.pboard_unit_updateDate desc) AS rnum, pb.* 
    from product_board pb 
) pboard 
where rnum between 1 and 10;
SELECT * FROM TABLE(dbms_xplan.display);

--rownum 내부의 서브쿼리
select pboard.* from (
    select /*+ INDEX_DESC(SYS_C009706) */ rownum rnum, pb.* 
    from (select * from product_board ORDER BY pboard_unit_updateDate desc) pb where rownum<=20
) pboard 
where rnum >=11;

--oracle 12c 이상부터 가능 쿼리
select pboard.* from product_board pboard order by pboard_unit_updateDate desc 
OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;

EXPLAIN plan FOR
select * from product_board;
SELECT * FROM TABLE(dbms_xplan.display);

select * from product_board;


--check buffer cache(Database Buffers)
show sga;

--multiblock I/O의 단위
show parameter db_file_multiblock_read_count;
alter session set db_file_multiblock_read_count = 128;--8KB*128 = 1MB

--table full scan은 큰 table에서 대량의 data를 읽을 때 유리
--index range scan은 큰 table에서 소량의 data를 읽을 때 유리(#index가 무조건 좋은건 절대 아님!!)

--range scan(index)
select * 
from product_board where pboard_unit_no = :pboard_no1
union all
select * 
from product_board where pboard_unit_no = :pboard_no2;