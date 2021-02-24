--ex1 ���̺� ����
create table ex1(
    column1 char(10),    --���� ���� �ڷ���
    column2 varchar2(10), -- ���� ���� �ڷ���
    column3 number        --���� �ڷ���
);

--���̺� �˻�(��ȸ)
select * from ex1;

-- �ڷ� �߰�(����)
insert into ex1 values('abc', 'abc', 100);
insert into ex1(column1, column2) values('kim', 'park');
insert into ex1(column1, column2, column3) values('choi', '', 20);

--char�� varchar�� ũ�� ��
select column1, LENGTH(column1) as len1, column2, length(column2) as len2, column3 from ex1;

select * from ex1 where column3 is null;

--column1�� 'choi'�ΰ� ���� (where ������)
--���� ��ɾ� delete from ���̺� �̸�(��� ����)
delete from ex1 where column1 = 'choi';