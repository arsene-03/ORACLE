--01��. �����ͺ��̽� ����� ����ü ~ 02��. ��������ȸ�ϱ� ~ 03��. ������ �ڷ���
DESC employee

SELECT sysdate FROM dual;

SELECT * FROM employee;

SELECT * FROM department;

SELECT eno,ename,salary*12+NVL(commission,0)  "��   ��" FROM employee;

SELECT DISTINCT eno, dno FROM employee;

SELECT eno,ename FROM employee WHERE salary>=1500;

SELECT eno,ename,salary FROM employee WHERE ename='SCOTT';

SELECT eno,ename,salary,hiredate FROM employee WHERE hiredate<'19810501';

SELECT * FROM employee WHERE dno=10 AND job = 'MANAGER';

SELECT * FROM employee WHERE dno=10 OR job = 'MANAGER';

SELECT * FROM employee WHERE NOT dno=10;

SELECT * FROM employee WHERE dno<>10;

SELECT * FROM employee WHERE salary>=1000 AND  salary<=1500;

SELECT * FROM employee WHERE salary<1000 OR salary>1500;
--Ŀ�̼��� 300 500 1400�� ����� ������ ��ȸ�ϴ� ��
SELECT * FROM employee WHERE commission= 300 OR commission= 500 OR commission= 1400;

SELECT * FROM employee WHERE salary NOT BETWEEN 1000 AND 1500;

SELECT * FROM employee WHERE hiredate BETWEEN '19820101' AND '19821231';

SELECT * FROM employee WHERE commission IN (300,500,1400);

SELECT * FROM employee WHERE ename LIKE 'F%'; -- �̸� ù���ڰ� F�� ���

SELECT * FROM employee WHERE ename LIKE '%M%'; -- �̸��� M�� ���� ���

SELECT * FROM employee WHERE ename LIKE '%N'; --�̸��� ���� N�� ���

SELECT * FROM employee WHERE ename LIKE '__A%'; -- �̸��� ����° ���ڰ� A�� ���

SELECT * FROM employee WHERE commission = null; -- ��� x

SELECT * FROM employee WHERE commission IS NULL; --��� O

SELECT * FROM employee WHERE commission IS NOT null ORDER BY ename DESC; -- �̸��� ��������

SELECT * FROM employee WHERE commission IS NOT null ORDER BY ename ASC; -- �̸��� ����

SELECT * FROM employee
ORDER BY salary DESC, ename ASC; -- �޿� �������� �����޿��� ������ �̸��� ������������ ����

SELECT to_char(sysdate,'YYYY/ MM/ DD/ DAY HH24: MI:SS') FROM dual;

SELECT ename, hiredate, TO_CHAR(hiredate,'YY-MM'), to_char(hiredate, 'YYYY/MM/DD DAY')
FROM employee;

SELECT ename, to_char(salary, 'L999,999') FROM employee;

SELECT ename, hiredate FROM employee
WHERE hiredate = to_date(19810220);

SELECT to_number('100,000','999,999') - to_number('50,000','999,999') FROM dual;
 