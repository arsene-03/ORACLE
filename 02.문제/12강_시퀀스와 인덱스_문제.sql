--1.��� ���̺��ǻ����ȣ���ڵ����λ����ǵ��Ͻ������������Ͻÿ�.(���۰�: 1, ������:1 �ִ밪:100000)
CREATE TABLE emp_seq
AS SELECT * FROM employee
WHERE 1=0;

CREATE SEQUENCE seq_emp_seq
maxvalue 100000;

--2. �����ȣ���������κ��͹߱޹޾Ƽ������� ���̺� �����͸��Է��ϼ���.1)��� �̸�: Julia, �Ի���: sysdate)2)��� �̸�: Alice�Ի���: 2020/12/31
INSERT INTO emp_seq
VALUES (seq_emp_seq.nextval,'Julia','','',TO_DATE(sysdate),'','','');
INSERT INTO emp_seq
VALUES (seq_emp_seq.nextval,'Alice','','',TO_DATE(20201231),'','','');
--3. EMP01���̺����̸� Į���� �ε����μ����ϵ��ε��� �̸���IDX_EMP01_EName�� �����ϼ���
CREATE INDEX IDX_emp_seq_Ename 
ON emp_seq(ename);


SELECT * FROM emp_seq;

SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN('emp_seq');

