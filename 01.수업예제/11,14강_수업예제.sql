--11강. 뷰
SET SERVEROUTPUT ON;
SELECT * FROM employee;

CREATE VIEW emp_second
AS SELECT * FROM employee;

SELECT * FROM emp_second;

CREATE VIEW emp_gad(사원번호, 사원이름, 부서번호, 담당업무)
AS SELECT eno,ename,salary,commission FROM employee;

SELECT * FROM emp_gad;

CREATE OR REPLACE VIEW emp_gad(사원번호, 사원이름, 부서번호, 담당업무)
AS SELECT eno,ename,salary,commission FROM employee; -- 단순뷰

CREATE OR REPLACE VIEW v_emp_complex
AS
SELECT *
FROM employee NATURAL JOIN department;

SELECT * FROM v_emp_complex;

-----뷰의 저장내용
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

INSERT INTO v_member2 -- view가 가진것은 id컬럼뿐, 그런데 실제테이블엔 not null로 되어있어서 생성 불가능
VALUES('viewID');

-----------------------------
CREATE OR REPLACE FORCE VIEW emp_notable
AS SELECT eno,ename,dno,job
FROM emp_notable
WHERE job = 'MANAGER';

SELECT * FROM emp_notable; --실제 테이블이 없기때문에 조회는 할 수 없다.

----------------------------
CREATE OR REPLACE VIEW emp_job_chk
AS SELECT eno,ename,dno,job
FROM employee
WHERE job = 'MANAGER' WITH CHECK OPTION;

SELECT * FROM emp_job_chk; 

INSERT INTO emp_job_chk
VALUES(
    8001,'ALICE',30,'SALESMAN' -- 입력은(실제 테이블) 가능하지만 조회(뷰)는 불가 / 해당 view는 manager만 보여지기 때문에
);  
-----------with check option 갱신 이후
INSERT INTO emp_job_chk
VALUES(
    8002,'BILL',10,'PRESIDENT' -- 뷰의 조건에 부합한 정보만 삽입 가능
);  

--------------------------------
CREATE OR REPLACE VIEW emp_job_readonly
AS SELECT eno,ename,dno,job
FROM employee
WHERE job = 'MANAGER' WITH READ ONLY;

INSERT INTO emp_job_readonly
VALUES(
    8003,'LISA SU',10,'MANAGER' -- READ ONLY 옵션에 의해 조건에 부합해도 삽입 불가능
);  

--------------------------------------------------------------------------------------------------------------------------
--14강. PL/SQL
SET SERVEROUTPUT ON;
BEGIN
    dbms_output.put_line('Hello World!');  ----> System.out.println() 과 같음
    
END;

DECLARE
    score NUMBER(3) := 50;
BEGIN
    dbms_output.put_line('철수의 점수 : '||score);
END;
-------------------------------------------------------

DECLARE
    v_eno number(4);
    v_ename employee.ename%type;
BEGIN
    v_eno := 7788;
    v_ename := 'SCOTT';
    dbms_output.put_line('사원 번호    사원 이름');
    dbms_output.put_line('-----------------------');
    dbms_output.put_line(v_eno||'         '||v_ename);
END;

----------------------------------------------------------
DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
BEGIN
    dbms_output.put_line('사원 번호    사원 이름');
    dbms_output.put_line('-----------------------');
    
    SELECT eno,ename INTO v_eno, v_ename
    FROM employee 
    WHERE ename = 'SCOTT';
    
    dbms_output.put_line(v_eno||'         '||v_ename);
END;
----------------------------------------------------------

DECLARE
    annsal NUMBER :=0; -- 연봉
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
    DBMS_OUTPUT.PUT_LINE('연봉 : '||annsal);
END;    

-- scott 사원의 사원 번호와 사원의 이름과 소속된 부서명을 출력하세요.
-- 부서명은 조건문으로 사용하되 부서번호가 10번이면 '충무부'. 20번이면 '연구부', 30번이면 '관리부'

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
        v_dname := '총무부';
    ELSIF v_dno = 20 THEN
        v_dname := '연구부';
    ELSIF v_dno =30 THEN 
        v_dname := '관리부';
    END IF;
    DBMS_OUTPUT.PUT_LINE('사원번호    사원이름    부서명');
    DBMS_OUTPUT.PUT_LINE('-------------------------------');
    DBMS_OUTPUT.PUT_LINE(v_eno||'        '||v_ename||'        '||v_dname);
END;

-------------------------------------
--Basic loop
--1부터 10까지의 합계
DECLARE
    i NUMBER := 0;
    plu NUMBER := 0;
BEGIN
    LOOP
        i := i+1;
        plu := plu+i;
        EXIT WHEN i=10;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('합계: '||plu);
END;

--1부터 10까지의 합계 (FOR)
DECLARE
    v_i NUMBER :=0;
    v_sum NUMBER := 0;
BEGIN
    FOR v_i in 1..10 LOOP
        v_sum:= v_sum+v_i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('합계: '||v_sum);
END;

--1부터 10까지 합계 (While)
DECLARE
    v_i NUMBER :=0;
    v_sum NUMBER := 0;
BEGIN
    WHILE v_i <10 LOOP
        v_i := v_i+1;
        v_sum:= v_sum+v_i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('합계: '||v_sum);
END;  

--구구단 5단 출력
--1.LOOP문--
DECLARE
    i NUMBER :=0;
    dan NUMBER :=5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----'||dan||'단---');
    LOOP
        i := i+1;
        DBMS_OUTPUT.PUT_LINE(dan||'X'||i||'='||dan*i);
        EXIT WHEN i=9;
    END LOOP;
END;

--2.FOR문--
DECLARE
    i NUMBER :=0;
    dan NUMBER := 5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----'||dan||'단---');
    FOR i IN 1..9 LOOP
        DBMS_OUTPUT.PUT_LINE(dan||'X'||i||'='||dan*i);
    END LOOP;
END;

--3.while문--
DECLARE
    i NUMBER :=0;
    dan NUMBER :=5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----'||dan||'단---');
    WHILE i < 9 LOOP
        i := i+1;
        DBMS_OUTPUT.PUT_LINE(dan||'X'||i||'='||dan*i);
    END LOOP;
END;

-----커서 (반복자)-----
DECLARE
    v_dept department%rowtype;-- 하나의 튜플을 담기위한 변수
    CURSOR c_dept
    IS 
    SELECT * FROM department; -- 커서 선언 (1단계)
BEGIN
    DBMS_OUTPUT.PUT_LINE('부서번호     부서명     지역명');
    DBMS_OUTPUT.PUT_LINE('---------------------------');
    
    OPEN c_dept; --커서 오픈 (2단계)
        LOOP
            FETCH c_dept INTO v_dept; --커서의 내용을 하나씩 패치해서 가져온다 (3단계)
            EXIT WHEN c_dept%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE(v_dept.dno||'    '||v_dept.dname||'        '||v_dept.loc);
        END LOOP;
    CLOSE c_dept; --커서 닫기 (4단계)
END;

-----커서(향상된 for 문처럼 처리가능)---
--     =>2,3,4단계 필요 없음
DECLARE
    v_dept department%rowtype;-- 하나의 튜플을 담기위한 변수
    CURSOR c_dept
    IS 
    SELECT * FROM department; -- 커서 선언 (1단계)
BEGIN
    DBMS_OUTPUT.PUT_LINE('부서번호     부서명     지역명');
    DBMS_OUTPUT.PUT_LINE('---------------------------');
    
    FOR v_dept IN c_dept LOOP
        EXIT WHEN c_dept%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_dept.dno||'    '||v_dept.dname||'        '||v_dept.loc);
    END LOOP;
END;