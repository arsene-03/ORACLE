--1. 20�� �μ��� �Ҽӵ� ����� �����ȣ�� �̸�, �μ���ȣ�� ����ϴ�SELECT���� �ϳ��� ��(v_em_dno) �������ϼ���.
CREATE VIEW v_em_dno
AS SELECT eno,ename,dno
FROM employee
WHERE dno = 20;


--2. �̹� ������ ��(v_em_dno)�� ���ؼ� �޿��� ������ ���� ����� �� �ֵ��� �����ϼ���.
CREATE OR REPLACE VIEW v_em_dno
AS SELECT eno,ename,dno,salary,job
FROM employee
WHERE dno = 20;

--3. ���������� �ִ�޿�, �ּұ޿�, �޿� �Ѿ��� �����ִ� ��(EMP_group_job)�� ������ ���� ��ȸ �غ���.
CREATE OR REPLACE VIEW EMP_group_job(������,�ִ�޿�,�ּұ޿�,�޿��Ѿ�)
AS SELECT job, MAX(salary),MIN(salary),SUM(salary)
FROM employee
GROUP BY job;

SELECT * FROM EMP_group_job;
--4. �̹� ������ ��(v_em_dno)�� ���ؼ� ���ٰ����ѵ����͸� �Է°����ϵ��� ������ �ɾ� ����.
CREATE OR REPLACE VIEW v_em_dno
AS SELECT eno,ename,dno,salary,job
FROM employee
WHERE dno = 20 WITH CHECK OPTION;

--5.���� �����͸���(v_em_dno) �� ���ؼ� �Է��� �ѵ� ��(EMP_group_job)�� ���ؼ� ��ȸ �غ���.
CREATE SEQUENCE seq;
INSERT INTO v_em_dno
VALUES (5100,'Belita',10,'1500','CLERK');
INSERT INTO v_em_dno
VALUES (5200,'Erica',20,'2300','ANALYST');
INSERT INTO v_em_dno
VALUES (5300,'Kali',30,'1750','SALESMAN');
INSERT INTO v_em_dno
VALUES (5400,'Mia',20,'950','ANALYST');
INSERT INTO v_em_dno
VALUES (5500,'Zinna',10,'1050','CLERK');

SELECT * FROM v_em_dno;

--6.�̹� ������ ��(   v_em_dno)�� ���ؼ� �б� ���� �Ӽ��� �ο��غ���
CREATE OR REPLACE VIEW v_em_dno
AS SELECT eno,ename,dno,salary,job
FROM employee
WHERE dno = 20 WITH READ ONLY;

--7. ���, ����̸�, �μ���ȣ�ͺμ� �̸��� �����ִº並(emp_dept)�����ϼ���
CREATE OR REPLACE VIEW emp_dept
AS SELECT e.eno,e.ename,dno,d.dname
FROM employee e NATURAL JOIN department d;

--8.������ ��� �並 ��ȸ�ϼ���.
SELECT view_name, text
FROM user_views;

--9.  ������ ��(   v_em_dno,emp_group_job,emp_dept)�������ϼ���.
DROP VIEW v_em_dno;
DROP VIEW emp_group_job;
DROP VIEW emp_dept;


SELECT view_name, text
FROM user_views;