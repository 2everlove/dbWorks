select department_id from departments
union --union 중복제거 / union all 중복제거x
select department_id from employees order by department_id; --order by는 union 함수를 사용한 다음 제일 마지막에 작성