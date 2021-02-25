-- employees ���̺� ��ȸ
DESC employees;

-- ��ü ��ȸ
SELECT * FROM employees;

-- Ư�� Į�� ��ȸ
SELECT employee_id, first_name, last_name FROM employees;

-- ��Ī(�г���) ����� - AS�� ���
SELECT employee_id AS �����ȣ, first_name AS �̸�, last_name AS �� FROM employees;

-- ��������(ASC), ��������(DESC) ���� : ORDER BY
SELECT * FROM employees ORDER BY employee_id DESC ;

-- �޿��� �����ϱ�
SELECT first_name, last_name, salary FROM employees ORDER BY salary DESC;

-- ����1. �޿��� 10,000�̻��� ��� �˻�
SELECT first_name, last_name, salary FROM employees WHERE salary < 10000;
SELECT first_name, last_name, salary FROM employees WHERE salary >= 10000;

-- where�� ������(�� ����, �� ����)
-- ����2. ID�� 100�� ����� �˻�
SELECT employee_id, first_name, last_name FROM employees WHERE employee_id=100;

-- ����3. salary�� 15000�̻� 20000�̸�
SELECT first_name �̸�, last_name ��, salary �޿� FROM employees WHERE salary >= 15000 AND salary < 20000;

-- ��� ����
SELECT employee_id, salary AS �޿�, salary+500 AS �߰��޿� FROM employees;

-- �̸��� �� ���� : ���� ������ '||'
SELECT employee_id, first_name || ' ' || last_name AS NAME FROM employees;

SELECT employee_id, email || '@gmail.com' AS mail FROM employees;

-- null ã��
SELECT employee_id, manager_id FROM employees WHERE manager_id IS NULL;
