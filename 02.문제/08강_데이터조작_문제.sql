--1. Employee���̺��Ǳ����� �����Ͽ�EMP_INSERT�� �� ���̺������弼��.
CREATE TABLE EMP_INSERT
AS
SELECT * FROM employee
WHERE 1=0;

--2. ������EMP_INSERT���̺��߰��ϵ�SYSDATE�� �̿��ؼ��Ի��������÷� �Է��ϼ���
INSERT INTO EMP_INSERT 
VALUES(8001,'CHOIHAKJUN','STUDENT','',sysdate,300,'','');

--3. EMP_INSERT ���̺���������߰��ϵ�TO_DATE�Լ��� ����ؼ��Ի����������� �Է��ϼ���
INSERT INTO EMP_INSERT 
VALUES(8002,'YOUNSUN','STUDENT','',TO_DATE(SYSDATE)-1,300,'','');

--4. Employee���̺��Ǳ����� ������ �����Ͽ�EMP_COPY�� �̸��� ���̺������弼��.
CREATE TABLE EMP_COPY
AS
SELECT * FROM employee;

--5. �����ȣ��7788�� ����� �μ���ȣ��10���μ����ϼ���.
UPDATE EMP_COPY
SET dno = 10
WHERE eno = 7788;
            
--6. �����ȣ��7788�� �������� �޿��� �����ȣ7499�� ��� ������ �޿��� ��ġ�ϵ��ϰ����ϼ���.
UPDATE EMP_COPY
SET job = (SELECT job
            FROM EMP_COPY
            WHERE eno=7499),
salary = (SELECT salary
            FROM EMP_COPY
            WHERE eno=7499)
WHERE eno = 7788;

--7. �����ȣ7369�� ������ ������ ��� ����� �μ���ȣ�����7369�� ���� �μ���ȣ�ΰ����ϼ���.
UPDATE EMP_COPY
SET dno = (SELECT dno
            FROM EMP_COPY
            WHERE eno = 7369)
WHERE job = (SELECT job
            FROM EMP_COPY
            WHERE eno = 7369);
            
--8. Department���̺��Ǳ����� ������ �����Ͽ�DEPT_COPY�� �̸��� ���̺������弼��
CREATE TABLE DEPT_COPY
AS
SELECT * FROM Department;

--9. DEPT_COPY���̺����μ�����RESEARCH�κμ��� �����ϼ���.
DELETE FROM DEPT_COPY 
WHERE dname = 'RESEARCH';
 
--10. DEPT_COPY���̺����μ���ȣ��10�̰ų�40�� �μ��� �����ϼ���
DELETE FROM DEPT_COPY 
WHERE dno= 10
OR dno = 40;


SELECT *FROM EMP_INSERT;
DROP TABLE EMP_COPY;
SELECT * FROM EMP_COPY;
SELECT * FROM DEPT_COPY;