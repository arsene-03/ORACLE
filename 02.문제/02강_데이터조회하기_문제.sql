--1. ���� ������ �̿��Ͽ� ��� ����� ���Ͽ� $300�� �޿� �λ��� ������� ����� �̸�, �޿� �λ�� �޿����
SELECT Ename, salary+300 AS "�λ�� �޿�" FROM employee;

--2. ����� �̸�, �޿�, ���� �Ѽ����� �Ѽ����� ������ ���� ���������� ����ϼ���
SELECT ename,salary,(salary*12+100)as "���� �Ѽ���" FROM employee ORDER BY "���� �Ѽ���" DESC;

--3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� �����ͺ��� ���������� ����ϼ���
SELECT ename,salary FROM employee WHERE salary>2000 ORDER BY Salary DESC;

--4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���
SELECT eno, ename, dno FROM employee WHERE eno IN (7788);

--5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����ϼ���
 SELECT ename, salary FROM employee WHERE salary Not BETWEEN 2000 And 3000;
 
 --6. 1981�� 2�� 20�� ���� 1981�� 5��1�� ���̿� �Ի��� ����� �̸�, ������, �Ի����� ����ϼ���
 SELECT ename, job, hiredate FROM employee WHERE hiredate BETWEEN '19810220' AND '19810501';
 
 --7. �μ� ��ȣ�� 20�� 30�� ���ϴ� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ������������ ������ ������ ����ϼ���
 SELECT ename,dno FROM employee WHERE dno IN (20,30) ORDER BY ename DESC;
 
 --8. ��� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20�Ǵ� 30�� ����� �̸��� �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���
 SELECT ename, salary, dno FROM employee WHERE (salary BETWEEN 2000 AND 3000) AND dno IN(20,30) ORDER BY ename ASC ;
 
 --9. 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ����ϼ���(Like ���ϵ�ī��)
 SELECT ename, hiredate FROM employee WHERE hiredate LIKE '1981%';
 
 --10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���
 SELECT ename, job FROM employee WHERE manager IS null;
 
 --11. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�̼��� �������� ������������ �����Ͽ� ����ϼ���
 SELECT ename, salary, commission FROM employee WHERE job = 'SALESMAN' ORDER BY salary DESC,commission DESC;
 
 --12. �̸��� ����° ���ڰ� R�� ����� ����ϼ���
 SELECT ename FROM employee WHERE ename LIKE '__R%'; 
 
 --13. �̸��� A�� E�� ��� �����ϴ� ����� �̸��� ����ϼ���
 SELECT ename FROM employee WHERE ename LIKE '%A%E%' OR ename LIKE '%E%A%';
 
 --14. �������� �繫��(CLERK)�Ǵ� �������(SALESMAN)�̸鼭 �޿���$1600, $950 �Ǵ� $1300�� �ƴ� ����� �̸� ������, �޿��� ����ϼ���
 SELECT ename, job, salary FROM employee WHERE job in('CLERK','SALESMAN') AND salary NOT IN(1600,950,1300); 
 
 --15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����ϼ���
 SELECT ename,salary,commission FROM employee WHERE commission>=500;