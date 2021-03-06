SET SERVEROUTPUT ON;
--1. 사원 테이블에서커미션이NULL이 아닌 상태의 사원 번호와 이름, 급여를 기준으로오름차순정렬한 결과를 나타내는저장 프로시저를생성하세요.
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

---------------위아래 같음
CREATE OR REPLACE PROCEDURE pro_commission
IS
    v_emp employee%rowtype;
    CURSOR emp
    IS
    SELECT * FROM employee
    WHERE commission IS NOT NULL
    ORDER BY salary ASC;
BEGIN
    DBMS_OUTPUT.PUT_LINE('사원번호 / 사원이름 / 급여');
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

--2. 저장 프로시저를수정하여커미션 컬럼을 하나 더출력하고이름을 기준로 내리차순으로정렬하세요.
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
    DBMS_OUTPUT.PUT_LINE('사원번호 / 사원이름 / 급여 / 커미션');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    
    FOR v_emp IN emp LOOP
        DBMS_OUTPUT.PUT_LINE(v_emp.eno||' / '||v_emp.ename||' / '||v_emp.salary||' / '||v_emp.commission);
    END LOOP;
END;

EXECUTE pro_commission;


--3. 생성된 저장 프로시저를제거하세요.
DROP PROCEDURE sample1;

SELECT * FROM user_source
WHERE NAME = 'SAMPLE1';