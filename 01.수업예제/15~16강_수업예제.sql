--15강. 프로시저와 함수와 트리거
SET SERVEROUTPUT ON;
--KING 이라는 사람의 job을 출력해 봅시다.
DECLARE
    v_job employee.job%type;
BEGIN
    SELECT job INTO v_job
    FROM employee
    WHERE ename = 'KING';
    DBMS_OUTPUT.PUT_LINE('KING의 업무는 : '||v_job);
END;

-- 위 프로시저에 이름을 붙여봅시다
CREATE OR REPLACE PROCEDURE kingsjob
IS  v_job employee.job%type;
BEGIN
    SELECT job INTO v_job
    FROM employee
    WHERE ename = 'KING';
    DBMS_OUTPUT.PUT_LINE('KING의 업무는 : '||v_job);
END;

-- 저장된 프로시저를 실행해 봅시다.
EXECUTE kingsjob;

--저장된 프로시저 확인
SELECT * FROM user_source
WHERE name = 'KINGSJOB';

-- IN 매개변수
-- 이름을 입력 받아서 급여를 출력하는 프로시저
CREATE OR REPLACE PROCEDURE name_to_salary(v_ename IN employee.ename%type)
IS 
    v_salary employee.salary%Type;
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE ename = v_ename;
    
    DBMS_OUTPUT.PUT_LINE(v_ename||'의 급여는 : '||v_salary);
END;

EXECUTE name_to_salary('KING');

-- OUT 매개변수
-- 이름을 입력받아서 급여를 피로시저 바끙로 꺼내는 프로시저를 만들어봅시다
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

-- INOUT 매개변수
-- 사원 이름을 입력받아서 상사의 이름을 출력하는 프로시저를 만들어봅시다
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
    DBMS_OUTPUT.PUT_LINE('상사이름: '||v_ename);
END;

EXECUTE TEST2;

----------------------------------------------------
--함수
-- 특정 사람의 이름을 입력받아서 급여를 반환하는 함수를 만들어 봅시다.
CREATE OR REPLACE FUNCTION f_ename_to_salary(
    v_ename IN employee.ename%type
)
    RETURN NUMBER --반환타입 적어주기
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

--만든 함수를 select문에 넣을 수도 있음
SELECT ename, f_ename_to_salary('ADAMS') AS "급여"
FROM employee
WHERE ename ='ADAMS';

----------------------------------------------------
--트리거
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
        DBMS_OUTPUT.PUT_LINE('트리거가 발생했습니다.');
        INSERT INTO dept_copy
        values(:new.dno,:new.dname,:new.loc);
    

    END IF;
END;

INSERT INTO dept_origin
VALUES(10,'총무부','서울시');

SELECT * FROM dept_origin;

SELECT * FROM dept_copy;

--------------------------------------------------------
--UPDATE 변경, 삭제 트리거 만들어봅시다
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
        DBMS_OUTPUT.PUT_LINE('업데이트 트리거가 발생했습니다.');
        v_modType := '수정';
    ELSIF deleting THEN
        DBMS_OUTPUT.PUT_LINE('삭제 트리거가 발생했습니다.');
        v_modType := '삭제';
    END IF;
    INSERT INTO dept_copy
    VALUES(:old.dno, :old.dname, :old.loc,v_modType);
END;

UPDATE dept_origin
SET dno=20, dname='인사부', loc='수원시'
WHERE dno = 10;

SELECT * FROM dept_origin;
SELECT * FROM dept_copy;

DELETE FROM dept_origin
WHERE dno = 20;