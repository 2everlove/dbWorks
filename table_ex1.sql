--ex1 ���̺� ����
Create Table Ex1(
    Column1 Char(10),    --���� ���� �ڷ���
    Column2 Varchar2(10), -- ���� ���� �ڷ���
    Column3 Number        --���� �ڷ���
);

--���̺� �˻�(��ȸ)
Select * From Ex1;

-- �ڷ� �߰�(����)
Insert Into Ex1 Values('abc', 'abc', 100);
Insert Into Ex1(Column1, Column2) Values('kim', 'park');
Insert Into Ex1(Column1, Column2, Column3) Values('choi', '', 20);

--char�� varchar�� ũ�� ��
Select Column1, Length(Column1) As Len1, Column2, Length(Column2) As Len2, Column3 From Ex1;

Select * From Ex1 Where Column3 Is Null;

--column1�� 'choi'�ΰ� ���� (where ������)
--���� ��ɾ� delete from ���̺� �̸�(��� ����)
Delete From Ex1 Where Column1 = 'choi';