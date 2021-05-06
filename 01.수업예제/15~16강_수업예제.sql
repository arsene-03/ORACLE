--15��. ���ν����� �Լ��� Ʈ����
SET SERVEROUTPUT ON;
--KING �̶�� ����� job�� ����� ���ô�.
DECLARE
    v_job employee.job%type;
BEGIN
    SELECT job INTO v_job
    FROM employee
    WHERE ename = 'KING';
    DBMS_OUTPUT.PUT_LINE('KING�� ������ : '||v_job);
END;

-- �� ���ν����� �̸��� �ٿ����ô�
CREATE OR REPLACE PROCEDURE kingsjob
IS  v_job employee.job%type;
BEGIN
    SELECT job INTO v_job
    FROM employee
    WHERE ename = 'KING';
    DBMS_OUTPUT.PUT_LINE('KING�� ������ : '||v_job);
END;

-- ����� ���ν����� ������ ���ô�.
EXECUTE kingsjob;

--����� ���ν��� Ȯ��
SELECT * FROM user_source
WHERE name = 'KINGSJOB';

-- IN �Ű�����
-- �̸��� �Է� �޾Ƽ� �޿��� ����ϴ� ���ν���
CREATE OR REPLACE PROCEDURE name_to_salary(v_ename IN employee.ename%type)
IS 
    v_salary employee.salary%Type;
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE ename = v_ename;
    
    DBMS_OUTPUT.PUT_LINE(v_ename||'�� �޿��� : '||v_salary);
END;

EXECUTE name_to_salary('KING');

-- OUT �Ű�����
-- �̸��� �Է¹޾Ƽ� �޿��� �Ƿν��� �ٲ��� ������ ���ν����� �����ô�
CREATE OR REPLACE PROCEDURE name_to_salary2(
 v_ename IN employee.ename%type,
 v_salary OUT employee.salary%Type
)
IS 
   
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE ename = v_ename;
    
END;

VAR v_salary number;
EXECUTE name_to_salary2('SCOTT',:v_salary);
PRINT v_salary;

-- INOUT �Ű�����
-- ��� �̸��� �Է¹޾Ƽ� ����� �̸��� ����ϴ� ���ν����� �����ô�
CREATE OR REPLACE PROCEDURE ename_to_manager(
    v_ename IN OUT employee.ename%TYPE
)
IS
    
BEGIN
    SELECT ename INTO v_ename
    FROM employee
    WHERE eno = (SELECT manager
                FROM employee
                WHERE ename = v_ename);
END;

CREATE OR REPLACE PROCEDURE TEST2
IS
    v_ename employee.ename%type;
BEGIN
    v_ename := 'ADAMS';
    ename_to_manager(v_ename);
    DBMS_OUTPUT.PUT_LINE('����̸�: '||v_ename);
END;

EXECUTE TEST2;

----------------------------------------------------
--�Լ�
-- Ư�� ����� �̸��� �Է¹޾Ƽ� �޿��� ��ȯ�ϴ� �Լ��� ����� ���ô�.
CREATE OR REPLACE FUNCTION f_ename_to_salary(
    v_ename IN employee.ename%type
)
    RETURN NUMBER --��ȯŸ�� �����ֱ�
IS
    v_salary NUMBER;
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE ename = v_ename;
    
    RETURN v_salary;
END;

VARIABLE v_salary2 NUMBER;
EXECUTE :v_salary2 := f_ename_to_salary('ADAMS');
PRINT v_salary2;

--���� �Լ��� select���� ���� ���� ����
SELECT ename, f_ename_to_salary('ADAMS') AS "�޿�"
FROM employee
WHERE ename ='ADAMS';

----------------------------------------------------
--Ʈ����
CREATE TABLE dept_origin
AS
SELECT * FROM department
WHERE 1=0;

CREATE TABLE dept_copy
AS
SELECT * FROM department
WHERE 1=0;

SELECT * FROM dept_origin;
SELECT * FROM dept_copy;

CREATE OR REPLACE TRIGGER trigger_insert_sample1
    AFTER INSERT
    ON dept_origin
    For each row
BEGIN
    IF inserting THEN
        DBMS_OUTPUT.PUT_LINE('Ʈ���Ű� �߻��߽��ϴ�.');
        INSERT INTO dept_copy
        values(:new.dno,:new.dname,:new.loc);
    

    END IF;
END;

INSERT INTO dept_origin
VALUES(10,'�ѹ���','�����');

SELECT * FROM dept_origin;

SELECT * FROM dept_copy;

--------------------------------------------------------
--UPDATE ����, ���� Ʈ���� �����ô�
ALTER TABLE dept_copy
ADD modType nchar(2);

CREATE OR REPLACE TRIGGER trigger_UD_sample
    AFTER UPDATE OR DELETE
    ON dept_origin
    FOR Each row
DECLARE
    v_modType NCHAR(2);    
BEGIN
    IF updating THEN
        DBMS_OUTPUT.PUT_LINE('������Ʈ Ʈ���Ű� �߻��߽��ϴ�.');
        v_modType := '����';
    ELSIF deleting THEN
        DBMS_OUTPUT.PUT_LINE('���� Ʈ���Ű� �߻��߽��ϴ�.');
        v_modType := '����';
    END IF;
    INSERT INTO dept_copy
    VALUES(:old.dno, :old.dname, :old.loc,v_modType);
END;

UPDATE dept_origin
SET dno=20, dname='�λ��', loc='������'
WHERE dno = 10;

SELECT * FROM dept_origin;
SELECT * FROM dept_copy;

DELETE FROM dept_origin
WHERE dno = 20;