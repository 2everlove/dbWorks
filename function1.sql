-- DUAL 테이블 사용하기
SELECT
    *
FROM
    dual;

DESC dual;

SELECT
    sysdate
FROM
    dual;

-- 자동 형변화
SELECT
    1 + '2' 더하기결과 --문자가 있어도 됨
FROM
    dual;
    
-- 타입 변환 함수
SELECT
    to_number('123') str_num
FROM
    dual;

-- 날짜 형식 변환
SELECT
    to_char(sysdate, 'yy')        년도,
    to_char(sysdate, 'yyyy')      년도_4,
    to_char(sysdate, 'mm')        월,
    to_char(sysdate, 'dd')        일,
    to_char(sysdate, 'yy/mm/dd')
FROM
    dual;
    
-- 시간 형식 변환
SELECT
    to_char(sysdate, 'hh:mi:ss pm')                 AS 시간,
    to_char(sysdate, 'yyyy/mm/dd hh:mi:ss pm')      AS 날짜와_시간
FROM
    dual;
    
-- 날짜 형식(TO_DATE):특정한 날짜 변환
SELECT
    TO_DATE('20190505', 'yymmdd') str_date
FROM
    dual;
    
    
    
    
-- 그룹 함수 : 여러 행의 데이터 처리
-- employess table -> t_employee2
CREATE TABLE t_employee2
    AS
        SELECT
            *
        FROM
            employees;

DESC t_employee2;

DROP TABLE t_employee2;

ROLLBACK;

-- 개수 세기
SELECT
    COUNT(salary) 급여행수
FROM
    t_employee2;

SELECT
    COUNT(*) 전체행수 --'*'은 전체 칼럼에 대한 행의 수
FROM
    t_employee2;

-- 합계 구하기

SELECT
    SUM(salary)                   합계,
    round(AVG(salary), 2)         평균
FROM
    t_employee2;
    
--max, min
SELECT
    MAX(salary)     최대값,
    MIN(salary)     최소값
FROM
    t_employee2;
    
-- 문자의 최대값, 최소값
SELECT
    MAX(first_name)     최대문자값,
    MIN(first_name)     최소문자값
FROM
    t_employee2;
    
SELECT
    MAX(first_name)+
    MIN(first_name) 이름
FROM
    t_employee2;