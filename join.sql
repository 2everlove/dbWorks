-- 동등 조인
-- employees 테이블과 departments 테이블은 department_id로 연결

SELECT * FROM departments;
SELECT * FROM locations;

-- employee_id & firstname, department_id & department_name 전체 검색
SELECT a.employee_id, a.first_name, b.department_id, b.department_name 
FROM employees a, departments b
WHERE a.department_id = b.department_id;

-- 직원이 어느 부서에서 속하는지와 소재지가 어디인지 조회
SELECT a.employee_id, a.first_name, b.department_name, c.location_id, c.city
FROM employees a, departments b, locations c
WHERE a.department_id = b.department_id 
AND b.location_id = c.location_id;