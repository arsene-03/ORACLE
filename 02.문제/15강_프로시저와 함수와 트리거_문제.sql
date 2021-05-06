SET SERVEROUTPUT ON;
--1. ��� ���̺���Ŀ�̼���NULL�� �ƴ� ������ ��� ��ȣ�� �̸�, �޿��� �������ο������������� ����� ��Ÿ�������� ���ν����������ϼ���.
CREATE OR REPLACE PROCEDURE sample1
IS  v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_salary employee.salary%type;
BEGIN
    SELECT eno, ename, salary INTO v_eno, v_ename, v_salary
    FROM employee
    WHERE commission IS NOT NUll
    ORDER BY salary;
END;


--2. ���� ���ν����������Ͽ�Ŀ�̼� �÷��� �ϳ� ������ϰ��̸��� ���ط� �����������������ϼ���.
CREATE OR REPLACE PROCEDURE sample1
IS  v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_salary employee.salary%type;
    v_commission employee.commission%type;
BEGIN
    SELECT eno, ename, salary, commission INTO v_eno, v_ename, v_salary, v_commission
    FROM employee
    WHERE commission IS NOT NUll
    ORDER BY ename DESC;
END;

--3. ������ ���� ���ν����������ϼ���.
DROP PROCEDURE sample1;

SELECT * FROM user_source
WHERE NAME = 'SAMPLE1';