-- employees 테이블 조회
DESC employees;

-- 전체 조회
SELECT * FROM employees;

-- 특정 칼럼 조회
select employee_id, first_name, last_name from employees;

-- 별칭(닉네임) 만들기 - AS를 사용
SELECT employee_id as 사원번호, first_name as 이름, last_name as 성 from employees;

-- 오른차순(ASC), 내림차순(DESC) 정렬 : ORDER BY
SELECT * from employees order by employee_id desc ;

-- 급여로 정렬하기
select first_name, last_name, salary from employees order by salary desc;

-- 문제1. 급여가 10,000이상인 사람 검색
select first_name, last_name, salary from employees where salary < 10000;
select first_name, last_name, salary from employees where salary >= 10000;

-- where는 조건절(비교 연산, 논리 연산)
-- 문제2. ID가 100인 사원을 검색
select employee_id, first_name, last_name from employees where employee_id=100;

-- 문제3. salary가 15000이상 20000미만
select first_name 이름, last_name 성, salary 급여 from employees where salary >= 15000 and salary < 20000;

-- 산술 연산
select employee_id, salary as 급여, salary+500 as 추가급여 from employees;

-- 이름과 성 연결 : 연결 연산자 '||'
select employee_id, first_name || ' ' || last_name as name from employees;

select employee_id, email || '@gmail.com' as mail from employees;

-- null 찾기
select employee_id, manager_id from employees where manager_id is null;
