-- employees ���̺� ��ȸ
DESC employees;

-- ��ü ��ȸ
SELECT * FROM employees;

-- Ư�� Į�� ��ȸ
select employee_id, first_name, last_name from employees;

-- ��Ī(�г���) ����� - AS�� ���
SELECT employee_id as �����ȣ, first_name as �̸�, last_name as �� from employees;

-- ��������(ASC), ��������(DESC) ���� : ORDER BY
SELECT * from employees order by employee_id desc ;

-- �޿��� �����ϱ�
select first_name, last_name, salary from employees order by salary desc;

-- ����1. �޿��� 10,000�̻��� ��� �˻�
select first_name, last_name, salary from employees where salary < 10000;
select first_name, last_name, salary from employees where salary >= 10000;

-- where�� ������(�� ����, �� ����)
-- ����2. ID�� 100�� ����� �˻�
select employee_id, first_name, last_name from employees where employee_id=100;

-- ����3. salary�� 15000�̻� 20000�̸�
select first_name �̸�, last_name ��, salary �޿� from employees where salary >= 15000 and salary < 20000;

-- ��� ����
select employee_id, salary as �޿�, salary+500 as �߰��޿� from employees;

-- �̸��� �� ���� : ���� ������ '||'
select employee_id, first_name || ' ' || last_name as name from employees;

select employee_id, email || '@gmail.com' as mail from employees;

-- null ã��
select employee_id, manager_id from employees where manager_id is null;
