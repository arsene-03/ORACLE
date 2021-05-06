--1. Equi������ ����Ͽ�SCOTT ����� �μ���ȣ�� �μ��̸��� ����ϼ���
SELECT e.ename, d.dno, d.dname
FROM employee e, department d
WHERE e.dno = d.dno
AND e.ename = 'SCOTT';

--2. Inner ���ΰ�on�����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸���������������ϼ���.
SELECT e.ename, d.dname, d.loc
FROM employee e INNER JOIN department d
ON e.dno = d.dno;

--3. INNER ����Using �����ڸ�����Ͽ�10�� �μ��� ���ϴ� ��� �������ǰ��� ����� �μ����������������Ͽ�����ϼ���.
SELECT e.job,d.loc
FROM employee e INNER JOIN department d
USING (dno)
WHERE dno = '10';

--4. Natural������ ����Ͽ�Ŀ�̼����޴� ��� ����� �̸�, �μ��̸�, ������������ϼ���
SELECT ename,dname,loc
FROM employee NATURAL JOIN department
WHERE job = 'SALESMAN';

--5. Equal ���ΰ�Wildī�带 ����ؼ��̸���A�����Ե� ��� ����� �̸��� �μ���������ϼ���.
SELECT e.ename,d.dname
FROM employee e,department d
WHERE e.dno = d.dno
AND e.ename LIKE '%A%';

--6. Natural ������ ����Ͽ�NEW York�� �ٹ��ϴ¸�� ����� �̸�, ���� �μ���ȣ�� �μ���������ϼ���.
SELECT e.ename, e.job, dno, d.dname, d.loc
FROM employee e NATURAL JOIN department d
WHERE d.loc = 'NEW YORK';

--7. Self Join�� ����Ͽ������ �̸��� ��� ��ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����ϼ���. 
--�� ���� ��Ī�� ����̸�(Employee) �����ȣ(emp#) �������̸�(Manager) �����ڹ�ȣ(Mgr#)
SELECT emp.ename AS "����̸�(Employee)",emp.eno AS "�����ȣ(emp#)",
       man.ename AS "�������̸�(Manager)",man.eno AS "�����ڹ�ȣ(Mgr#)"
FROM employee emp, employee man
WHERE emp.manager = man.eno;

--8. Outter����self ������ ����Ͽ������ڰ����� ����� �����Ͽ������ȣ���������γ������� �����Ͽ�Ŭ���ϼ���
--�� ���� ��Ī�� ����̸�(Employee)�����ȣ(emp#)�������̸�(Manager)�����ڹ�ȣ(Mgr#)
SELECT emp.ename AS "����̸�(Employee)",emp.eno AS "�����ȣ(emp#)",
       man.ename AS "�������̸�(Manager)",man.eno AS "�����ڹ�ȣ(Mgr#)"
FROM employee emp, employee man
WHERE emp.manager = man.eno(+)
ORDER BY emp.eno DESC;

--9. Self������ ����Ͽ� ������ ���(SCOTT)�� �̸�, �μ���ȣ, ������ ����� ������ �μ������ٹ��ϴ� ����� ����ϼ���
--�� ���� ��Ī�� �̸�, �μ���ȣ, ����� �����ϼ���
SELECT emp.ename AS "�̸�", emp.dno AS"�μ���ȣ",coo.ename AS"����"
FROM employee emp, employee coo
WHERE emp.ename = 'SCOTT'
AND emp.dno = coo.dno
AND coo.ename <> 'SCOTT';


--10. Self ������ ����Ͽ�WARD ������ٴʰ� �Ի��� ����� �̸��� �Ի���������ϼ���.
SELECT ward.hiredate AS"WARD�� �Ի���",aft.ename AS"�Ĺ� �̸�",aft.hiredate AS"�Ĺ� �Ի���"
FROM employee ward, employee aft
WHERE ward.ename = 'WARD' 
AND ward.hiredate < aft.hiredate;

--11. Self������ ����Ͽ������ں��ٸ��� �Ի��Ѹ�� ����� �̸� �� �Ի��������������̸� ���Ի��԰��Բ� ����ϼ���. 
--�� ���� ��Ī�� ����̸�(Ename) ����Ի���(HIERDATE) ������ �̸�(Ename) ������ �Ի���(HIERDATE)�� ����ϼ���.
SELECT s.ename AS"����̸�(Ename)",
       s.hiredate AS"����Ի���(HIERDATE)",
       m.ename AS"������ �̸�(Ename)",
       m.hiredate AS"������ �Ի���(HIERDATE)"
FROM employee s, employee m
WHERE m.eno = s.manager
AND s.hiredate < m.hiredate;