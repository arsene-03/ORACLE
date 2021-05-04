--1. Employee���̺��Ǳ����� �����Ͽ�EMP_SAMPLE�� �̸��� ���̺������弼�� 
--  ������̺��ǻ�� ��ȣĮ���� ���̺� ������ primarykey���������������ϵ� ���������̸��� my_emp_pk�� �����ϼ���.
CREATE TABLE EMP_SAMPLE
AS SELECT *FROM employee
WHERE 1=0;

ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_emp_pk PRIMARY KEY (eno);

--2. department���̺��Ǳ����� �����Ͽ�dept_sample�̶� ���̺������弼��.
--   dept_sample�� �μ���ȣĮ���� ���̺� ������primarykey���������������ϵ� ���������̸���my_dept_pk�������ϼ���.
CREATE TABLE dept_sample
AS SELECT * FROM department
WHERE 1=0;

ALTER TABLE dept_sample
ADD CONSTRAINT my_dept_pk PRIMARY KEY (dno);

--3. ������̺��Ǻμ���ȣĮ���� ���������ʴ� �μ��� ����� ���������ʵ��� �ܷ�Ű ���������������ϵ� ���������̸���my_emp_dept_fk�������ϼ���.
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_emp_dept_fk FOREIGN KEY (dno) REFERENCES dept_sample(dno);

--4. ������̺���Ŀ�̼� �÷���0���� ū ������ �Է��� �� �ֵ��� ���������������ϼ���
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_emp_ck CHECK (0<commission);




SELECT * FROM EMP_SAMPLE;
SELECT * FROM dept_SAMPLE;

SELECT table_name,constraint_name
FROM SYS.user_constraints
WHERE table_name IN (UPPER('EMP_SAMPLE')); -- ���������� ���� x