-- copying employees table
CREATE TABLE t_employee
    AS
        SELECT
            employee_id,
            first_name,
            job_id,
            salary
        FROM
            employees;
-- 전체 조회
SELECT
    *
FROM
    t_employee;

SELECT
    *
FROM
    t_employee
WHERE
    salary >= 5000;

SELECT
    *
FROM
    t_employee
WHERE
    job_id = 'IT_PROG';

--조건 검색 - job_id가 FI로 시작하고, salary 7000이상
SELECT
    first_name,
    salary,
    job_id
FROM
    t_employee
WHERE
    job_id LIKE 'FI%'
    OR salary >= 7000;
--    AND salary >= 7000;
    
--조건 검색 - job_id가 IT로 시작
SELECT
    first_name,
    salary,
    job_id
FROM
    t_employee
WHERE
    job_id LIKE 'IT%';
    
--조건 검색 - salary 7000초과, job_id가 'IT' 나 'FI'로 시작
SELECT
    *
FROM
    t_employee
WHERE
        salary > 7000
    AND (job_id LIKE 'IT%'
    OR job_id LIKE 'FI%');

-- 테이블 전체 삭제
DROP TABLE t_employess;