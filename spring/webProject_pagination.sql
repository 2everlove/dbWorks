--index 추가 후 성능 개선(index 이름은 product_board의 제약조건 내부의 index_name에서 가져옴)
select pboard.* from (
    select /*+ INDEX_DESC(SYS_C009706) */ ROW_NUMBER() OVER(ORDER BY pb.pboard_unit_updateDate desc) AS rnum, pb.* 
    from product_board pb 
) pboard 
where rnum between 1 and 10;

--rownum 내부의 서브쿼리
select pboard.* from (
    select /*+ INDEX_DESC(SYS_C009706) */ rownum rnum, pb.* 
    from (select * from product_board ORDER BY pboard_unit_updateDate desc) pb where rownum<=20
) pboard 
where rnum >=11;

--oracle 12c 이상부터 가능 쿼리
select pboard.* from product_board pboard order by pboard_unit_updateDate desc 
OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;