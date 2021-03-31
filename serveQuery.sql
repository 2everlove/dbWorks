--서브 쿼리 (메인 쿼리 안에서 사용되는 검색 쿼리)
select * from employees;

select ROUND(avg(salary),2) 평균급여 from employees;

--평균 급여 이상인 사원의 수를 구하세요
select count(*) 평균급여이상_사원수 from employees 
    where salary >= (select ROUND(avg(salary),2) from employees);