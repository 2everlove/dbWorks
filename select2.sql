SELECT
    job_id,
    department_id
FROM
    employees;

-- 중복 제거: distinct
SELECT DISTINCT
    job_id,
    department_id
FROM
    employees;
    
SELECT
    job_id,
    department_id
FROM
    employees;

--문자 타입 함수
SELECT
    last_name,
    lower(last_name)     AS lower적용,
    upper(last_name)     AS upper적용,
    email,
    initcap(email)       initcap적용
FROM
    employees;
    
-- job_id의 첫째 자리에서 시작해서 2개의 문자 출력 : SUBSTR()
SELECT
    job_id,
    substr(job_id, 1, 2) 직무코드
FROM
    employees;
    
-- job_id 문자열 값이 'ACCOUNT'이면 'ACCNT'로 출력 : REPLACE()
SELECT
    job_id,
    replace(job_id, 'ACCOUNT', 'ACCNT') 결과
FROM
    employees;

--12자리의 문자열의 자리를 부족한 만큼 '*' 로 채워서 출력
SELECT
    first_name,
    lpad(first_name, 12, '*') 결과
FROM
    employees;

SELECT
    first_name,
    rpad(first_name, 24 / 2, '*') 결과
FROM
    employees;


-- 숫자 타입 함수
SELECT
    salary,
    salary / 30                  일급,
    round(salary / 30, 1)        결과1, --소수첫째자리까지 반올림 출력 
    round(salary / 30, 0)        결과2, --정수형
    round(salary / 30, - 1)       결과3 --일의 자리에서 반올림
FROM
    employees;

-- TRUNC() -> 버림(절삭)
SELECT
    salary,
    salary / 30                  일급,
    trunc(salary / 30, 1)        결과1, --소수첫째자리까지 내림 출력 
    trunc(salary / 30, 0)        결과2, --정수형
    trunc(salary / 30, - 1)       결과3 --일의 자리에서 내림
FROM
    employees;


-- 날짜 타입 함수
-- department_id가 100인 직원에 대해 입사후 총 개월수 출력
SELECT
    first_name,
    department_id,
    sysdate,
    hire_date,
    trunc(months_between(sysdate, hire_date)) 총_개월수
FROM
    employees;

--employee_id 가 100에서 106번 사이의 직원의 hire_date에 3개월을 더하고 뺀 결과
SELECT
    first_name,
    employee_id,
    hire_date,
    add_months(hire_date, 3)        더하기_결과,
    add_months(hire_date, - 3)       빼기기_결과
FROM
    employees
WHERE
    employee_id BETWEEN 100 AND 106;

SELECT
    *
FROM
    departments;