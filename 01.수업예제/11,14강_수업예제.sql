--11��. ��
SET SERVEROUTPUT ON;
SELECT * FROM employee;

CREATE VIEW emp_second
AS SELECT * FROM employee;

SELECT * FROM emp_second;

CREATE VIEW emp_gad(�����ȣ, ����̸�, �μ���ȣ, ������)
AS SELECT eno,ename,salary,commission FROM employee;

SELECT * FROM emp_gad;

CREATE OR REPLACE VIEW emp_gad(�����ȣ, ����̸�, �μ���ȣ, ������)
AS SELECT eno,ename,salary,commission FROM employee; -- �ܼ���

CREATE OR REPLACE VIEW v_emp_complex
AS
SELECT *
FROM employee NATURAL JOIN department;

SELECT * FROM v_emp_complex;

-----���� ���峻��
SELECT view_name, text
FROM user_views;

-----------------------------------------
CREATE TABLE member2(
    mNum NUMBER(2) PRIMARY KEY,
    mId VARCHAR2(10) NOT NULL,
    mPwd VARCHAR2(10) NOT NULL
    
);
INSERT INTO member2
VALUES (1,'asdf','123');
INSERT INTO member2
VALUES (2,'adfa','123');
INSERT INTO member2
VALUES (3,'aerr','123');
INSERT INTO member2
VALUES (4,'as341','123');
INSERT INTO member2
VALUES (5,'asas','123');
commit;
CREATE OR REPLACE VIEW v_member2
AS
SELECT mId FROM member2;

SELECT * FROM v_member2;

INSERT INTO v_member2 -- view�� �������� id�÷���, �׷��� �������̺� not null�� �Ǿ��־ ���� �Ұ���
VALUES('viewID');

-----------------------------
CREATE OR REPLACE FORCE VIEW emp_notable
AS SELECT eno,ename,dno,job
FROM emp_notable
WHERE job = 'MANAGER';

SELECT * FROM emp_notable; --���� ���̺��� ���⶧���� ��ȸ�� �� �� ����.

----------------------------
CREATE OR REPLACE VIEW emp_job_chk
AS SELECT eno,ename,dno,job
FROM employee
WHERE job = 'MANAGER' WITH CHECK OPTION;

SELECT * FROM emp_job_chk; 

INSERT INTO emp_job_chk
VALUES(
    8001,'ALICE',30,'SALESMAN' -- �Է���(���� ���̺�) ���������� ��ȸ(��)�� �Ұ� / �ش� view�� manager�� �������� ������
);  
-----------with check option ���� ����
INSERT INTO emp_job_chk
VALUES(
    8002,'BILL',10,'PRESIDENT' -- ���� ���ǿ� ������ ������ ���� ����
);  

--------------------------------
CREATE OR REPLACE VIEW emp_job_readonly
AS SELECT eno,ename,dno,job
FROM employee
WHERE job = 'MANAGER' WITH READ ONLY;

INSERT INTO emp_job_readonly
VALUES(
    8003,'LISA SU',10,'MANAGER' -- READ ONLY �ɼǿ� ���� ���ǿ� �����ص� ���� �Ұ���
);  

--------------------------------------------------------------------------------------------------------------------------
--14��. PL/SQL
SET SERVEROUTPUT ON;
BEGIN
    dbms_output.put_line('Hello World!');  ----> System.out.println() �� ����
    
END;

DECLARE
    score NUMBER(3) := 50;
BEGIN
    dbms_output.put_line('ö���� ���� : '||score);
END;
-------------------------------------------------------

DECLARE
    v_eno number(4);
    v_ename employee.ename%type;
BEGIN
    v_eno := 7788;
    v_ename := 'SCOTT';
    dbms_output.put_line('��� ��ȣ    ��� �̸�');
    dbms_output.put_line('-----------------------');
    dbms_output.put_line(v_eno||'         '||v_ename);
END;

----------------------------------------------------------
DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
BEGIN
    dbms_output.put_line('��� ��ȣ    ��� �̸�');
    dbms_output.put_line('-----------------------');
    
    SELECT eno,ename INTO v_eno, v_ename
    FROM employee 
    WHERE ename = 'SCOTT';
    
    dbms_output.put_line(v_eno||'         '||v_ename);
END;
----------------------------------------------------------

DECLARE
    annsal NUMBER :=0; -- ����
    v_salary employee.salary%type;
    v_commission employee.commission%type;
BEGIN
    SELECT salary,commission INTO v_salary, v_commission
    FROM employee
    WHERE ename = 'SCOTT';
    
    IF v_commission is NUll THEN
        annsal := v_salary*12;
    ELSE 
        annsal := v_salary*12+v_commission;
    END IF;
    DBMS_OUTPUT.PUT_LINE('���� : '||annsal);
END;    

-- scott ����� ��� ��ȣ�� ����� �̸��� �Ҽӵ� �μ����� ����ϼ���.
-- �μ����� ���ǹ����� ����ϵ� �μ���ȣ�� 10���̸� '�湫��'. 20���̸� '������', 30���̸� '������'

DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_dno employee.dno%type;
    v_dname VARCHAR2(10);
 
BEGIN
    SELECT ename, eno, dno INTO v_ename, v_eno, v_dno
    FROM employee
    WHERE ename = 'SCOTT';
    
    IF v_dno = 10 THEN
        v_dname := '�ѹ���';
    ELSIF v_dno = 20 THEN
        v_dname := '������';
    ELSIF v_dno =30 THEN 
        v_dname := '������';
    END IF;
    DBMS_OUTPUT.PUT_LINE('�����ȣ    ����̸�    �μ���');
    DBMS_OUTPUT.PUT_LINE('-------------------------------');
    DBMS_OUTPUT.PUT_LINE(v_eno||'        '||v_ename||'        '||v_dname);
END;

-------------------------------------
--Basic loop
--1���� 10������ �հ�
DECLARE
    i NUMBER := 0;
    plu NUMBER := 0;
BEGIN
    LOOP
        i := i+1;
        plu := plu+i;
        EXIT WHEN i=10;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('�հ�: '||plu);
END;

--1���� 10������ �հ� (FOR)
DECLARE
    v_i NUMBER :=0;
    v_sum NUMBER := 0;
BEGIN
    FOR v_i in 1..10 LOOP
        v_sum:= v_sum+v_i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('�հ�: '||v_sum);
END;

--1���� 10���� �հ� (While)
DECLARE
    v_i NUMBER :=0;
    v_sum NUMBER := 0;
BEGIN
    WHILE v_i <10 LOOP
        v_i := v_i+1;
        v_sum:= v_sum+v_i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('�հ�: '||v_sum);
END;  

--������ 5�� ���
--1.LOOP��--
DECLARE
    i NUMBER :=0;
    dan NUMBER :=5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----'||dan||'��---');
    LOOP
        i := i+1;
        DBMS_OUTPUT.PUT_LINE(dan||'X'||i||'='||dan*i);
        EXIT WHEN i=9;
    END LOOP;
END;

--2.FOR��--
DECLARE
    i NUMBER :=0;
    dan NUMBER := 5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----'||dan||'��---');
    FOR i IN 1..9 LOOP
        DBMS_OUTPUT.PUT_LINE(dan||'X'||i||'='||dan*i);
    END LOOP;
END;

--3.while��--
DECLARE
    i NUMBER :=0;
    dan NUMBER :=5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----'||dan||'��---');
    WHILE i < 9 LOOP
        i := i+1;
        DBMS_OUTPUT.PUT_LINE(dan||'X'||i||'='||dan*i);
    END LOOP;
END;

-----Ŀ�� (�ݺ���)-----
DECLARE
    v_dept department%rowtype;-- �ϳ��� Ʃ���� ������� ����
    CURSOR c_dept
    IS 
    SELECT * FROM department; -- Ŀ�� ���� (1�ܰ�)
BEGIN
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ     �μ���     ������');
    DBMS_OUTPUT.PUT_LINE('---------------------------');
    
    OPEN c_dept; --Ŀ�� ���� (2�ܰ�)
        LOOP
            FETCH c_dept INTO v_dept; --Ŀ���� ������ �ϳ��� ��ġ�ؼ� �����´� (3�ܰ�)
            EXIT WHEN c_dept%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE(v_dept.dno||'    '||v_dept.dname||'        '||v_dept.loc);
        END LOOP;
    CLOSE c_dept; --Ŀ�� �ݱ� (4�ܰ�)
END;

-----Ŀ��(���� for ��ó�� ó������)---
--     =>2,3,4�ܰ� �ʿ� ����
DECLARE
    v_dept department%rowtype;-- �ϳ��� Ʃ���� ������� ����
    CURSOR c_dept
    IS 
    SELECT * FROM department; -- Ŀ�� ���� (1�ܰ�)
BEGIN
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ     �μ���     ������');
    DBMS_OUTPUT.PUT_LINE('---------------------------');
    
    FOR v_dept IN c_dept LOOP
        EXIT WHEN c_dept%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_dept.dno||'    '||v_dept.dname||'        '||v_dept.loc);
    END LOOP;
END;