-- 동등 조인
-- employees 테이블과 departments 테이블은 department_id로 연결

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM locations;
select * from job_history;

-- employee_id & firstname, department_id & department_name 전체 검색
SELECT a.employee_id, a.first_name, b.department_id, b.department_name 
FROM employees a, departments b
WHERE a.department_id = b.department_id;

-- 직원 id가 101인 직원의 업무 경력 (job_history)
SELECT   a.first_name, a.last_name, b.* -- table_name.* = 전체 검색
FROM employees a, job_history b
where a.employee_id = b.employee_id -- 같은 키 묶는게 중요
and a.employee_id = 101;

-- 직원이 어느 부서에서 속하는지와 소재지가 어디인지 조회
SELECT a.employee_id, a.first_name, b.department_name, c.location_id, c.city
FROM employees a, departments b, locations c
WHERE a.department_id = b.department_id 
AND b.location_id = c.location_id;

-- 부서 테이블에 자료 추가 :lcations 테이블을 (location_id)를 참조
-- location_id가 부모테이블에 없어서 추가가 안됨. - 외래키 제약 조건 위배
insert into departments(department_id, department_name, location_id) 
--VALUES (273, 'Sample', 1000); --추가됨(location_id가 존재해서) ROLLBACK;
VALUES (273, 'Sample', 1110);
--integrity constraint (HR.DEPT_LOC_FK) violated - parent key not found
--제약 조건

-- location table에서 id 1000인 data 삭제
-- 자식테이블(departments)에서 사용(참조)하고 있어서 삭제 불가
DELETE FROM locations WHERE location_id = 1700;
ROLLBACK;



-- 외부 조인(outer join) : 양쪽 테이블에서 데이터 값이 
--                            일치하지 않는 경우에도 모든 데이터 연결 - 합집합
SELECT COUNT(*) 조인된건수 
FROM employees a, departments b
WHERE a.department_id = b.department_id;

-- department_id IS NULL인 직원 검색
SELECT employee_id, first_name, department_id 
FROM employees 
WHERE department_id IS NULL;

-- 내부 조인(inner join) : 양쪽 테이블에서 데이터 값이 
--                            일치하지 않아도 모든 데이터 연결 - 교집합
SELECT a.employee_id, a.first_name, b.department_id, b.department_name
FROM employees a, departments b
WHERE a.department_id = b.department_id(+);








