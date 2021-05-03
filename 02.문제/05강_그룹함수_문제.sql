--1. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��ձ޿��� ����ϼ���. 
--   Į���� ��Ī�� �ְ��(Maximun) ������(Minimun), �Ѿ�(Sum), ��� �޿�(Average)�� �����ϰ���տ����ؼ��������� �ݿø� �ϼ���
SELECT MAX(salary)AS "�ְ��(Maximun)",
       MIN(salary)AS "������(Minimun)",
       SUM(salary)AS "�Ѿ�(Sum)",
       ROUND(AVG(salary),0)AS "��� �޿�(Average)"
FROM employee;

--2. �� �������������� �޿� �ְ��, ������, �Ѿ� �� ��վ�������ϼ���. 
--   Į���� ��Ī�� �ְ��(Maximun) ������(Minimun), �Ѿ�(Sum), ��� �޿�(Average)�� �����ϰ���տ� ���ؼ��� ������ �ݿø� �ϼ���
SELECT job AS "��������",
       MAX(salary)AS "�ְ��(Maximun)",
       MIN(salary)AS "������(Minimun)",
       SUM(salary)AS "�Ѿ�(Sum)",
       ROUND(AVG(salary),0)AS "��� �޿�(Average)"
FROM employee
GROUP BY job;

--3. Count(*)�Լ����̿��ؼ��������������� ����� ���� ����ϼ���
SELECT job,count(dno)AS "�����"
FROM employee
GROUP BY job;

--4. �������Ǽ��� �����ϼ���. Į���� ��Ī��COUNT(MANAGER)������ϼ���.
SELECT COUNT(DISTINCT MANAGER)AS "COUNT(MANAGER)"
FROM employee;

--5. �޿� �ְ��, �޿� �������������� ����ϼ���. Į���� ��ĪDIFFERENCE�� �����ϼ���
SELECT MAX(salary)AS"�޿� �ְ��",MIN(salary)AS"�޿� ������",MAX(salary)-MIN(salary)AS"DIFFERENCE"
FROM employee;

--6. ���޺� ����� ���� �޿��� ����ϼ���. �����ڸ� �� �� ���� ��� �� ���� �޿���2000�̸��� �׷��� ���ܽ�Ű��޿��� ���� �����������������Ͽ� ����ϼ���.
SELECT job,MIN(salary)
FROM employee
WHERE MANAGER IS NOT NULL
GROUP BY job
HAVING MIN(salary)>=2000
ORDER BY MIN(salary) DESC;

--7. �� �μ��� ���� �μ���ȣ, �����, �μ����Ǹ�� ����� ��ձ޿�������Ͻÿ�
--   Į���� ��Ī���μ���ȣ(DNO), �����(Numberof PeoPle), ��ձ޿�(Salary)�� �����ϰ�
--   ��ձ޿��¼Ҽ���2°�ڸ������ݿø� �ϼ���
SELECT dno AS"�μ���ȣ(DNO)",
       COUNT(*) AS"�����(Numberof PeoPle)",
       ROUND(avg(salary),2) AS "��ձ޿�(Salary)"
FROM employee
GROUP BY dno;

--8. �� �μ��� ���� �μ���ȣ�̸�, ������, �����, �μ����Ǹ�� ����� ��� �޿��� ����Ͻÿ�. 
--   Į���� ��Ī�� �μ���ȣ�̸�(DName), ������(Location), �����(Numberof PeoPle), ��ձ޿�(Salary)�� �����ϰ� ��ձ޿��������� �ݿø��ϼ���.
SELECT 
d.dname AS"�μ���ȣ�̸�(DName)",
d.loc AS"������(Location)",
COUNT(e.eno) AS"�����(Numberof PeoPle)",
ROUND(AVG(e.salary),0) AS"��ձ޿�(Salary)"
FROM employee e,department d
WHERE e.dno = d.dno
GROUP BY d.dname,d.loc;



--9. ������ ǥ���� ���� �ش� ������ ���� �μ���ȣ�� �޿� �� �μ�10,20,30�� �޿� �Ѿ��� ���� ����Ͻÿ�. 
--   �� Į���� ��Ī�� ����job, �μ�10,�μ�20, �μ�30, �Ѿ����� �����ϼ���.
SELECT 
CASE WHEN dno = 10 THEN '�μ�10'
     WHEN dno = 20 THEN '�μ�20'
     WHEN dno = 30 THEN '�μ�30'
     END AS job,
sum(salary)AS "�μ��� �޿�"
FROM employee 
GROUP BY dno
ORDER BY dno asc;


SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM SALGRADE;