--04��. �پ��� �Լ�
SELECT ASCII('I'), CHR(74), ASCIISTR('��'), UNISTR('\BDA9')
FROM dual;


SELECT LENGTH('banana'), LENGTH('��������'), LENGTHB('banana'), LENGTHB('��������')
FROM dual;

SELECT CONCAT ('������',' �ݰ�����')
FROM dual;

SELECT CONCAT (ename, job), ename || ':' || job
FROM employee;

SELECT INSTR('�̰��� ����ΰ� �����ΰ�','�ΰ�',8)
FROM dual;

SELECT LOWER ('hello world'), UPPER ('hello world'), INITCAP ('hello world')
FROM dual;

SELECT REPLACE('�̰��� ����ΰ� �����ΰ�','���','��� ġŲ')
FROM dual;

SELECT TRANSLATE('�̰��� ����ΰ� �����ΰ�','���','��� ġŲ')
FROM dual;

SELECT SUBSTR('�������б���ڹ�ȸ��',5,3)
FROM dual;

SELECT LPAD('�α�',10,'*'), RPAD('�α�',10,'*')
FROM dual;

SELECT LTRIM('      �̹�����')--�ƹ��͵� �Ⱦ��� ��������
, RTRIM('���߾�䤻������','��')
FROM dual;

SELECT TRIM('     �̹�����        '),TRIM(BOTH '��' FROM '���߾�䤻������'),
TRIM(LEADING '��' FROM '���������߾�D��������'),
TRIM(TRAILING '��' FROM '���������߾�D��������')
FROM dual;

SELECT REGEXP_COUNT('�̰��� ����Ŭ�̴�','��') --Ư�� ���ڰ� ��� �� �ִ°�
FROM dual;

SELECT ROUND(to_date('2021/05/20','YYYY/MM/DD'),'Q')
FROM dual;

SELECT ADD_MONTHS(sysdate,+3)--���÷κ��� 3���� ��
FROM dual;

SELECT sysdate+7 FROM dual; --���÷� ���� 7�� ��

SELECT sysdate, current_date, current_timestamp  --> ���� ��¥ ������ / ������/ �����Ͻú��ʹи�������
FROM dual;

SELECT LAST_DAY(sysdate) FROM dual; -- �̹����� ������ ��

SELECT NEXT_DAY(sysdate,'������') FROM dual; -- ���� ���ڱ������� ���� �������� ��¥ ���

SELECT MONTHS_BETWEEN('2021-08-27',sysdate) FROM dual; --���� ���ڱ������� �ش� ���� ���� ����

SELECT NUMTODSINTERVAL(360000,'SECOND') --360000�ʰ� ��������
FROM dual;

SELECT NUMTOYMINTERVAL(3.14,'YEAR')
FROM dual;

SELECT NULLIF('A','A'),NULLIF('A','B')
FROM dual;

SELECT ename, dno,
DECODE(dno, 10, '�渮��',
            20,'������',
            30,'������',
            40,'�ѹ���',
            '�����') AS "�μ��̸�"-- dno �� 10�̸� �渮�� 20�̸� ������,,,,, ���ٸ� �����
FROM employee;

SELECT ename, dno, -- dno�� 10�̸� �渮�� ~~ ���ٸ� �����
    CASE WHEN dno=10 THEN '�渮��'
         WHEN dno=20 THEN '������'
         WHEN dno=30 THEN '������'
         WHEN dno=40 THEN '�ѹ���'
         ELSE '�����'
    END
FROM employee;

SELECT * FROM userTBL;

SELECT ROW_NUMBER() OVER(ORDER BY height DESC),username,height FROM userTBL;

SELECT ROW_NUMBER() OVER(PARTITION BY addr ORDER BY height DESC),username,height,addr FROM userTBL;

SELECT ROW_NUMBER() OVER(PARTITION BY dno ORDER BY salary DESC), ename,salary,dno FROM employee;

SELECT DENSE_RANK() OVER(ORDER BY height DESC),username,height FROM userTBL;

SELECT NTILE(3) OVER (ORDER BY height DESC),username,height FROM userTBL;

SELECT username, height,height-LEAD(height,1,0)OVER(ORDER BY height DESC) FROM userTBL;

----------------------------------------------------------------------------------
--05��. �׷��Լ�
SELECT sum(salary), ROUND(avg(salary)),MAX(salary),MIN(salary)
FROM employee;

SELECT MAX(ename),MIN(ename),MAX(hiredate),MIN(hiredate)
FROM employee;

SELECT count(*) FROM employee;

SELECT count(commission) FROM employee; --commission �̶�� �÷��� Ʃ�ü�

SELECT count(DISTINCT dno) -- �ߺ��Ȱ��� ������ dno�� ����
FROM employee;

--SELECT ename, MAX(salary) -- �Ϲ��÷��� �׷��Լ� ���� ���� �� ����
--FROM employee;

SELECT dno,sum(salary) --�׷����� ���� �÷��� �Ϲ��÷��� �׷��Լ� ȥ�밡��
FROM employee
GROUP BY dno;

SELECT dno,job,sum(salary)
FROM employee
GROUP BY dno,job
ORDER BY dno;

--SELECT job,sum(salalry) -- �׷��Լ��� �������� WHERE�� ��� �Ұ���
--FROM employee
--WHERE avg(salary)>=2000
--GROUP BY job;

SELECT job,sum(salary)
FROM employee
GROUP BY job
HAVING avg(salary)>=2000;

SELECT * FROM employee;

--����: �μ��� �ְ� �޿��� 3000 �̻��� �μ��� ��ȣ�� �μ��� �ְ� �޿����ϱ�
SELECT dno,MAX(salary) AS "�ְ�޿�"
FROM employee
GROUP BY dno
HAVING MAX(salary)>=3000;

--����: �Ŵ����� �����ϰ� �޿� �Ѿ��� 5000�̻��� ��� ����(job)�� �޿� �Ѿװ� �ش� �ο����ϱ�
SELECT job,sum(salary) AS "�޿��Ѿ�",count(*)AS "�ο���"
FROM employee
WHERE job !='MANAGER'
GROUP BY job
HAVING sum(salary)>=5000
ORDER BY sum(salary) DESC;

--����: �μ��� ��� �޿��� �ְ� ��� �޿��� ��ȸ�ϱ�
SELECT MAX(avg(salary))
FROM employee
GROUP BY dno; --����� �׷�

SELECT job,dno,sum(salary)
FROM employee
GROUP BY ROLLUP (job,dno)  --dno���������� �߰��հ�
ORDER BY job;
