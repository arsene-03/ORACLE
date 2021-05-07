--1. IF문을 사용하여 KING사원의 부서번호를 얻어와서 부서 번호에 따른 부서명을출력하세요.(못품)
SELECT d.dname
FROM employee e, department d
WHERE d.dno = d.dno
AND e.dno = (SELECT dno
            FROM employee
            WHERE ename = 'KING');
   -------------------------------------------위아래 같음         
DECLARE 
    v_dno employee.eno%type;
    v_dname department.dname%type;
BEGIN
    SELECT dno INTO v_dno
    FROM employee
    WHERE ename = 'KING';
    
    IF v_dno = 10 THEN
     v_dname := '총무부';
    ELSIF v_dno = 20 THEN
     v_dname := '연구부';
    ELSIF v_dno = 30 THEN
     v_dname := '영업부';
     ELSIF v_dno = 40 THEN
     v_dname := '인사부';
    END IF;
    
    dbms_OUTPUT.PUT_LINE('부서명');
    DBMS_OUTPUT.PUT_LINE('----------');
    dbms_OUTPUT.PUT_LINE(v_dname);
END; 
    
--2. BASICLOOP문으로1부터10사이의 자연수의합을구하여 출력하세요.
DECLARE
    v_i NUMBER :=0;
    v_sum NUMBER :=0;
BEGIN
    LOOP
        v_i := v_i+1;
        v_sum := v_sum+v_i;
        EXIT WHEN v_i =10;
    END LOOP;
    dbms_output.put_line('1.BASIC LOOP: '||v_sum);
END;

--3. FORLOOP문으로1부터10사이의 자연수의합을구하여 출력하세요.
DECLARE
    v_i NUMBER := 0;
    v_sum NUMBER :=0;
BEGIN
    FOR v_i IN 1..10 LOOP
    v_sum := v_sum+v_i;
    END LOOP;
    dbms_output.put_line('2.FOR LOOP: '||v_sum);
END;

--4. WHILELOOP문으로1부터10사이의 자연수의합을구하여 출력하세요.
DECLARE
    v_i NUMBER :=0;
    v_sum NUMBER :=0;
BEGIN
    WHILE v_i <10 LOOP
    v_i := v_i+1;
    v_sum := v_sum+v_i;
    END LOOP;
    dbms_output.put_line('3.WHILE LOOP: '||v_sum);
END;

--5. 사원 테이블에서커미션이NULL아닌 사원의 사원번호, 이름, 급여를 이름 기준으로 오름차순으로정렬한 결과를 출력하세요
SELECT eno,ename,salary
FROM employee
WHERE commission is NOT NULL
ORDER BY ename;

------------위아래 같음

DECLARE
    v_emp employee%ROWTYPE;
    CURSOR c
    IS
    SELECT * 
    FROM employee
    WHERE commission IS NOT NULL;
BEGIN
    dbms_OUTPUT.PUT_LINE('사원번호 / 이름 / 급여');
    dbms_OUTPUT.PUT_LINE('-------------------');
    OPEN c;
    LOOP
        FETCH c INTO v_emp;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_emp.eno||'   '||v_emp.ename|| '  '||v_emp.salary);
    END LOOP;
    CLOSE c;
END;

--6. 다음과 같은 테이블(Student)을만들고 데이터를입력한다.
SET SERVEROUTPUT ON;
CREATE SEQUENCE seq_stu_id;

CREATE TABLE student2(
    sid number PRIMARY KEY,
    sname nvarchar2(5) NOT NULL,
    kscore number(3) CHECK(0<=kscore AND kscore <=100),
    escore number(3) CHECK(0<=escore AND escore <=100),
    mscore number(3) CHECK(0<=mscore AND mscore <=100)
);

INSERT INTO student2
VALUES(seq_stu_id.nextval,'고길동',78,64,82);
INSERT INTO student2
VALUES(seq_stu_id.nextval,'김길동',85,71,64);
INSERT INTO student2
VALUES(seq_stu_id.nextval,'이길동',74,69,57);
INSERT INTO student2
VALUES(seq_stu_id.nextval,'박길동',74,77,95);
INSERT INTO student2
VALUES(seq_stu_id.nextval,'홍길동',68,95,84);

COMMIT;

DECLARE
    v_stu student2%rowtype;
    v_tot number:=0;
    v_avg number(5,2):=0;
    CURSOR student
    IS
    SELECT * FROM student2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('학생이름/총점/평균');
    DBMS_OUTPUT.PUT_LINE('------------------');
    FOR v_stu IN student LOOP
        EXIT WHEN student%NOTFOUND;
        v_tot:= v_stu.kscore + v_stu.escore + v_stu.mscore;
        v_avg:= v_tot/3;
        
        DBMS_OUTPUT.PUT_LINE(v_stu.sname||'  '||v_tot||'    '||v_avg);
    END LOOP;
END;


DECLARE
    v_cnt number :=0;
    v_stu student2%rowtype;
    v_ktot number:=0;
    v_kavg number(5,2):=0;
    v_etot number:=0;
    v_eavg number(5,2):=0;
    v_mtot number:=0;
    v_mavg number(5,2):=0;
    CURSOR student
    IS
    SELECT * FROM student2;
BEGIN
        DBMS_OUTPUT.PUT_LINE('*** 과목별 총점과 평균  ***');
        DBMS_OUTPUT.PUT_LINE('국어총점/국어평균/영어총점/영어평균/수학총점/수학평균');
        DBMS_OUTPUT.PUT_LINE('------------------');
        FOR v_stu IN student LOOP
            EXIT WHEN student%NOTFOUND;
            v_ktot:= v_ktot+v_stu.kscore;
            v_etot:= v_etot+v_stu.escore;
            v_mtot:= v_mtot+v_stu.mscore;
            v_cnt := v_cnt+1;
        END LOOP;
        v_kavg:=v_ktot/v_cnt;
        v_eavg:=v_etot/v_cnt;
        v_mavg:=v_mtot/v_cnt;
        DBMS_OUTPUT.PUT_LINE(v_ktot||'/'||v_kavg||'/'||v_etot||'/'||v_eavg||'/'||v_mtot||'/'||v_mavg);

END;
