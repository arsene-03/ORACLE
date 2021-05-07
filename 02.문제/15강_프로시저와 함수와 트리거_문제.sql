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

---------------���Ʒ� ����
CREATE OR REPLACE PROCEDURE pro_commission
IS
    v_emp employee%rowtype;
    CURSOR emp
    IS
    SELECT * FROM employee
    WHERE commission IS NOT NULL
    ORDER BY salary ASC;
BEGIN
    DBMS_OUTPUT.PUT_LINE('�����ȣ / ����̸� / �޿�');
    DBMS_OUTPUT.PUT_LINE('--------------------------');
    OPEN emp;
    LOOP
        EXIT WHEN emp%NOTFOUND;
        FETCH emp INTO v_emp;
        DBMS_OUTPUT.PUT_LINE(v_emp.eno||'/'||v_emp.ename||'/'||v_emp.salary);
    END LOOP;
    CLOSE emp;
END;

EXECUTE pro_commission;

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

---------------------------
CREATE OR REPLACE PROCEDURE pro_commission
IS
    v_emp employee%rowtype;
    CURSOR emp
    IS
    SELECT * FROM employee
    WHERE commission IS NOT NULL
    ORDER BY ename DESC;
BEGIN
    DBMS_OUTPUT.PUT_LINE('�����ȣ / ����̸� / �޿� / Ŀ�̼�');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    
    FOR v_emp IN emp LOOP
        DBMS_OUTPUT.PUT_LINE(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.commission);
    END LOOP;
END;

EXECUTE pro_commission;


--3. ������ ���� ���ν����������ϼ���.
DROP PROCEDURE sample1;

SELECT * FROM user_source
WHERE NAME = 'SAMPLE1';