--06��. ��������
-- �ּұ޿��� �޴� ����� �̸�, ������, �޿��� ����ϼ���
SELECT ename, job, salary--��������
FROM employee
WHERE salary = (SELECT min(salary)
                FROM employee);--��������

-- �μ��� �ּұ޿��� 30�� �μ��� �ּұ޿����� ū �μ��� �μ���ȣ�� �׶��� �ּ� �޿��� ����� ���ô�(������ ��������)
SELECT dno,MIN(salary)
FROM employee
GROUP BY dno
HAVING MIN(salary) > (SELECT MIN(salary)
                      FROM employee
                      WHERE dno=30);

-- �μ��� �ּұ޿��� �޴»�� ��ȣ�� �̸��� ����ϴ� ������(IN ������)
SELECT dno,eno,ename,salary
FROM employee
WHERE salary IN (SELECT MIN(salary)
                FROM employee
                GROUP BY dno);
-------------���Ʒ� ����---------------
SELECT dno,eno,ename,salary
FROM employee
WHERE salary = ANY (SELECT MIN(salary)
                FROM employee
                GROUP BY dno);
                
-- ������ SALESMAN�� �ƴϸ鼭�޿��� SALESMAN ���� ���� ��������� ����ϼ���(ANY ������) (salesman�� �޿��� ���� ����������� �����޿��� �޴»����)
SELECT * FROM employee
WHERE salary < ANY (SELECT salary
                    FROM employee
                    WHERE job = 'SALESMAN')
AND job != 'SALESMAN';
-------------���Ʒ� ����---------------
SELECT * FROM employee
WHERE salary < (SELECT MAX(salary)
                    FROM employee
                    WHERE job = 'SALESMAN')
AND job != 'SALESMAN';


-- ������ SALESMAN�� �ƴϸ鼭�޿��� SALESMAN ���� ���� ��������� ����ϼ���(ALL ������) (salesman�� �޿��� ���� ���� ������� �����޿��� �޴»����)
SELECT * FROM employee
WHERE salary < ALL(SELECT salary
                    FROM employee
                    WHERE job = 'SALESMAN')
AND job != 'SALESMAN';
-------------���Ʒ� ����---------------
SELECT * FROM employee
WHERE salary < (SELECT MIN(salary)
                    FROM employee
                    WHERE job = 'SALESMAN')
AND job != 'SALESMAN';

------------------------------------------------------------------------------------
--07��. JOIN
SELECT * FROM employee; -- Ʃ��14��
SELECT * FROM department; -- Ʃ��4��
--ī�׽þ� ��
SELECT * FROM employee, department; -- ī�׽þȰ� 14x4

--EQUI ���� = INNER ����
SELECT * FROM employee, department
WHERE employee.dno = department.dno -- Ʃ�� 14��
AND employee.eno = 7788;
----���Ʒ� ����----
SELECT *
FROM employee INNER JOIN department -- INNER ����
ON employee.dno = department.dno
WHERE employee.eno = 7788;

SELECT eno,ename,salary,dname,employee.dno --����� �÷����ݵ�� ��� �����Դ��� ����x
FROM employee,department
WHERE employee.dno = department.dno
AND empolyee.eno = 7788;

SELECT e.eno,e.ename,e.salary,d.dname,e.dno --��Ī�� ������ ��Ī.Į�� �ص��ȴ�
FROM employee e,department d
WHERE e.dno = d.dno
AND e.eno = 7788;

--NATURAL ����: �����̺��� �÷��� �ڵ������� ���� �� �÷��� �������� ����
SELECT e.eno,e.ename,e.salary,d.dname,dno -- ����� Į���� ��𼭰����Դ��� ǥ�� x
FROM employee e NATURAL JOIN department d-- INNER ����
WHERE e.eno = 7788;

--join using: 
SELECT *
FROM employee  JOIN department -- INNER ����
USING (dno)
WHERE employee.eno = 7788;

--NON EQUI����
SELECT e.ename, e.salary, s.grade  -- ��Ȯ�� ��ġx a�� b �� ���̿��� �ִٸ�
FROM employee e, salgrade s
WHERE e.salary BETWEEN losal AND hisal;
----���� �Ʒ� ����-------
SELECT e.ename, e.salary, s.grade  -- ��Ȯ�� ��ġx a�� b �� ���̿��� �ִٸ�
FROM employee e, salgrade s
WHERE s.losal <= e.salary AND e.salary <= s.hisal;

--3�� ����
--����̸��� �ҼӺμ��̸�, �޿��� �޿���� ����ϼ���
SELECT e.ename, d.dname, e.salary, s.grade
FROM employee e, department d, salgrade s
WHERE e.dno = d.dno
AND e.salary BETWEEN s.losal AND s.hisal;

--SELF ����
-- ����̸��� ��� �Ŵ����� �̸��� ����ϼ���
SELECT emp.ename AS "�����", manager.ename AS "�����"
FROM employee emp, employee manager
WHERE emp.manager = manager.eno;

--outer ����
-- ����̸��� ��� �Ŵ����� �̸��� ����ϼ���(�� �����ȣ�� ���� ��쵵 ���)
--����Ŭ������
SELECT emp.ename AS "�����", manager.ename AS "�����"
FROM employee emp, employee manager
WHERE emp.manager = manager.eno(+);
--ǥ�� ANSI ���
SELECT emp.ename AS "�����", manager.ename AS "�����"
FROM employee emp LEFT OUTER JOIN employee manager
ON emp.manager = manager.eno;