--1.��� ���̺��ǻ����ȣ���ڵ����λ����ǵ��Ͻ������������Ͻÿ�.(���۰�: 1, ������:1 �ִ밪:100000)
CREATE TABLE emp01(
    empno NUMBER(4),
    ename VARCHAR2(10),
    hiredate date);

CREATE SEQUENCE seq_emp_seq
    START WITH 1
    INCREMENT BY 1
    maxvalue 100000;

--2. �����ȣ���������κ��͹߱޹޾Ƽ������� ���̺� �����͸��Է��ϼ���.1)��� �̸�: Julia, �Ի���: sysdate)2)��� �̸�: Alice�Ի���: 2020/12/31
INSERT INTO emp01
VALUES (seq_emp_seq.nextval,'Julia',SYSDATE);
INSERT INTO emp01
VALUES (seq_emp_seq.nextval,'Alice',TO_DATE(20201231));

--3. EMP01���̺����̸� Į���� �ε����μ����ϵ��ε��� �̸���IDX_EMP01_EName�� �����ϼ���
CREATE INDEX IDX_emp01_Ename 
ON emp01(ename);


SELECT * FROM emp01;

SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN('emp01');

