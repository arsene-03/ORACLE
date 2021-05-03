--1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ����ϼ���
SELECT SUBSTR(hiredate,0,4)AS "�Ի�⵵",SUBSTR(hiredate,6,2)AS "�Ի��� ��"
FROM employee;

--2. SUBSTR �Լ��� ����Ͽ�4���� �Ի��� ���������ϼ���
SELECT *
FROM employee
WHERE SUBSTR(hiredate,6,2)='04';

--3. MOD �Լ��� ����Ͽ���`����ȣ��¦���� ����� ����ϼ���
SELECT *
FROM employee
WHERE MOD(eno,2) = 0;


--4. �Ի����� ������2�ڸ�(YY), ���� ����(MON)��ǥ���ϰ������ ���(DY)�� �����Ͽ�����ϼ���.
SELECT TO_CHAR(hiredate, 'YY/MM/MON/DD/DY')
FROM employee;

--5. ���� ��ĥ�� ������������ϼ���. ���� ��¥���� ����1��1���� �� ����� ����ϰ�TO_DATE �Լ��� ����Ͽ������� ���� ��ġ��Ű�ÿ�
SELECT ROUND(SYSDATE - TO_DATE('2021/01/01','YY/MM/DD'),1)
FROM dual;

--6. ������ǻ�� ����� ����ϵǻ���� ���� ����� ���ؼ���NULL ��ſ�0�� ����ϼ���
SELECT ename, NVL2(manager,manager,0)AS"����ȣ"
FROM employee;

--7. DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �ϼ���. ������'ANAIYST'�� �����200, 'SALESMAN'�� �����180, 'MANAGER'�� �����150,'CLERK'�� �����100�� �λ��ϼ���
SELECT ename,job,salary AS "��������",
DECODE(job, 'ANALYST', salary+200,
            'SALESMAN', salary+180,
            'MANAGER', salary+150,
            'CLERK', salary+100,
            salary) AS "�λ�� ����"
FROM employee;

