-- COUNTRIES ���̺� ����ϱ�
-- �˻� SQL ��ɾ� : SELECT ���̸�(* = ALL) FROM ���̺��̸�
DESC countries;

SELECT * FROM countries;

--Ư�� ��(Į��) �˻�
SELECT country_name country, REGION_ID FROM countries;

--���� id�� 3�� ������ �˻�
SELECT COUNTRY_NAME FROM countries WHERE region_id=3;

-- �Ϻ� ������ �˻�
SELECT * FROM countries WHERE country_id='JP';

-- �ѱ� ������ �߰�
-- �߰�(����) ��ɾ� INSERT INTO ���̺� �̸� VALUES (Į�������Ͱ�, Į��������)
INSERT INTO countries VALUES ('KO', 'Korea', 3);