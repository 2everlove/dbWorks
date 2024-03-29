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

-- 합계, 평균 구하기 //SQL*PL 내부함수 AVG(),SUM(),COUNT()

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
    MAX(first_name)
    || ' '
    || MIN(first_name) 이름
FROM
    t_employee2;
    
    
--직무별 총급여와 평균 출력
SELECT
    job_id,
    SUM(salary)     AS 직무별_총급여,
    AVG(salary)     AS 직무별_평균급여
FROM
    t_employee2
WHERE
    employee_id >= 200
GROUP BY
    job_id
ORDER BY
    직무별_평균급여 DESC;

-- 그룹된 상태에서 조건을 처리: HAVING 절 사용
SELECT
    job_id,
    SUM(salary)     AS 직무별_총급여,
    AVG(salary)     AS 직무별_평균급여
FROM
    t_employee2
WHERE
    employee_id >= 200
GROUP BY
    job_id
HAVING
    SUM(salary) >= 10000
ORDER BY
    직무별_평균급여 DESC;   

-- NVL함수 : NULL값을 처리
SELECT
    last_name,
    employee_id,
    manager_id
FROM
    t_employee2
WHERE
    manager_id IS NULL;

--
SELECT
    last_name,
    employee_id,
    nvl(manager_id, 101)
FROM
    t_employee2
WHERE
    manager_id IS NULL;
    
-- 실제 데이터 변경
UPDATE t_employee2
SET
    manager_id = 101
WHERE
    employee_id = 100;

SELECT
    first_name,
    salary * commission_pct
FROM
    t_employee2;

-- commission_pct의 NULL에 1을 대입
SELECT
    first_name,
    salary * nvl(commission_pct, 1)
FROM
    t_employee2
ORDER BY
    commission_pct DESC;

-- DECODE(열이름, 조건, 변경값, 기본값)함수 : IF THEN ELSE 구문과 비슷
-- 부서아이디가 60이면 급여가 10%인상, 아니면 그대로 미인상
SELECT
    first_name,
    department_id,
    salary                                                   원래급여,
    decode(department_id, 60, salary * 1.1, salary)            조정급여,
    decode(department_id, 60, '10%인상', '미인상')                인상여부
FROM
    t_employee2;

--CASE WHEN 조건 THEN 변경값 ELSE 기본값 END
SELECT
    first_name,
    department_id,
    salary  원래급여,
    CASE
        WHEN department_id = 60 THEN
            salary * 1.1
        ELSE
            salary
    END     조정급여,
    CASE
        WHEN department_id = 60 THEN
            '10%인상'
        ELSE
            '미인상'
    END     인상여부
FROM
    t_employee2;

-- RANK() 함수 : 순위 매기기
SELECT * FROM employees;

SELECT first_name, salary, 
    RANK() OVER(ORDER BY salary DESC) 급여순위,
    DENSE_RANK() OVER(ORDER BY salary DESC) 급여순위_dense_rank
FROM employees;

-- 부서별로 직원의 순위 매기기
SELECT department_id, first_name, salary,
    RANK() OVER(PARTITION BY department_id ORDER BY salary) 급여_rank,
    DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) 급여순위_dense_rank
FROM employees;







