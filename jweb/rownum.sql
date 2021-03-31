SHOW tables;

SELECT * FROM t_member;
SELECT ROWNUM, t_board.* FROM t_board ORDER BY regdate DESC;

--ROWNUM (의사 칼럼)
SELECT ROWNUM AS 순번, board.* 
    FROM (SELECT * FROM t_board ORDER BY regdate DESC) board 
        WHERE ROWNUM BETWEEN 1 AND 10; --rownum은 1부터 시작하므로 1무조건 포함

select * from(
    SELECT ROWNUM num, board.* 
    FROM (SELECT * FROM t_board ORDER BY regdate DESC) board
) 
    WHERE num BETWEEN 6 AND 10;