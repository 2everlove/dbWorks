-- employees 테이블 조회
DESC employees;

-- 전체 조회
SELECT * FROM employees;

-- 특정 칼럼 조회
SELECT employee_id, first_name, last_name FROM employees;

-- 별칭(닉네임) 만들기 - AS를 사용
SELECT employee_id AS 사원번호, first_name AS 이름, last_name AS 성 FROM employees;

-- 오른차순(ASC), 내림차순(DESC) 정렬 : ORDER BY
SELECT * FROM employees ORDER BY employee_id DESC ;

-- 급여로 정렬하기
SELECT first_name, last_name, salary FROM employees ORDER BY salary DESC;

-- 문제1. 급여가 10,000이상인 사람 검색
SELECT first_name, last_name, salary FROM employees WHERE salary < 10000;
SELECT first_name, last_name, salary FROM employees WHERE salary >= 10000;

-- where는 조건절(비교 연산, 논리 연산)
-- 문제2. ID가 100인 사원을 검색
SELECT employee_id, first_name, last_name FROM employees WHERE employee_id=100;

-- 문제3. salary가 15000이상 20000미만
SELECT first_name 이름, last_name 성, salary 급여 FROM employees WHERE salary >= 15000 AND salary < 20000;

-- 산술 연산
SELECT employee_id, salary AS 급여, salary+500 AS 추가급여 FROM employees;

-- 이름과 성 연결 : 연결 연산자 '||'
SELECT employee_id, first_name || ' ' || last_name AS NAME FROM employees;

SELECT employee_id, email || '@gmail.com' AS mail FROM employees;

-- null 찾기
SELECT employee_id, manager_id FROM employees WHERE manager_id IS NULL;
