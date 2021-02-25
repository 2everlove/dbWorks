-- �μ� ���̺� �˻�
SELECT * FROM departments;

SELECT department_id, department_name FROM departments ORDER BY department_id DESC;

-- ������ ����ؼ� �˻� : where ������ (��, �� ����) (<> �ƴϴ� - ����) (= ����)
SELECT department_name, location_id FROM departments WHERE location_id <> 1700;

-- 정렬 : order by
SELECT * FROM departments ORDER BY department_id DESC;

--Ư�� ���ڰ� ���Ե� ������ �˻� : like ���� (%�� ���̰� �������� ������)
SELECT * FROM departments WHERE department_name LIKE 'IT%';

-- NULL �˻�
--SELECT * FROM departments WHERE manager_id IS NULL;
SELECT * FROM departments WHERE manager_id IS NOT NULL;

--BETWEEN A AND B (a �� b ����)
SELECT * FROM departments WHERE manager_id BETWEEN 100 AND 120;

-- IN ������ (OR)
SELECT * FROM departments WHERE manager_id IN(100, 103);