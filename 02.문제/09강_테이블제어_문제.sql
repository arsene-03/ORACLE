--1. ���� ǥ�� ��õ� ���DEPT ���̺��������ϼ���
CREATE TABLE DEPT(dno NUMBER(2),
                  dname VARCHAR2(14),
                  loc VARCHAR2(13)
);
DESC DEPT;
--2. ���� ǥ�� ��õ� ���EMP ���̺��������ϼ���.
CREATE TABLE EMP(eno NUMBER(4),
                  ename VARCHAR2(10),
                  dno VARCHAR2(2)
);
DESC EMP;
--3. �� �̸��� ������ �� �ֵ���EMP���̺��������ϼ���.(ENAMEĮ��)
ALTER TABLE EMP 
MODIFY (ename VARCHAR2(25)
);

--4. EMPLOYEE���̺��������ؼ�EMPLOYEE2�� �̸��� ���̺��������ϵ�
-- �����ȣ, �̸�, �޿�, �μ���ȣĮ���� �����ϰ���� ������ Į������ ����
--EMP_ID, NAME, SAL, DEPT_ID�������ϼ���.
CREATE TABLE employee2
AS SELECT eno AS "EMP_ID",
          ename AS "NAME",
          salary AS "SAL",
          dno AS "DEPT_ID"
FROM employee;

--CREATE TABLE employee2
--    "EMP_ID",
--    "NAME",
--    "SAL",
--    "DEPT_ID"
--          AS SELECT eno,ename,salary,dno
--FROM employee;
DESC employee2;
--5. EMP ���̺��������ϼ���
DROP TABLE EMP CASCADE CONSTRAINTS;

--6. EMPLOYEE2���̺����̸���EMP�� �����ϼ���
RENAME employee2 to EMP;

--7. DEPT ���̺���DNAME Į���� �����ϼ���
ALTER TABLE DEPT DROP COLUMN dname;

--8. DEPT ���̺���LOCĮ����UNUSED�� ǥ���ϼ���.
ALTER TABLE DEPT 
SET UNUSED (LOC);

--9. UNUSED Į���� ��� �����ϼ���
ALTER TABLE DEPT
DROP UNUSED COLUMNS;

SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM employee2;