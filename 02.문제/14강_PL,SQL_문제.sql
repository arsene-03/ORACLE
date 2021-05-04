--1. IF문을 사용하여 KING사원의 부서번호를 얻어와서 부서 번호에 따른 부서명을출력하세요.(못품)
SELECT e.ename, d.dno, d.dname
FROM employee e, department d
WHERE e.dno = d.dno
AND e.dno = (SELECT dno
            FROM employee
            WHERE ename = 'KING');
            
DECLARE 
    v_ename employee.eno%type;
    v_dno employee.eno%type;
    v_dname department.dname%type;
BEGIN
    SELECT e.ename, d.dno, d.dname INTO v_ename, v_dno, v_dname
    FROM empolyee e, department d
    WHERE e.dno = d.dno;
    
    IF v.ename = 'KING' THEN
     v_dno := e.dno;
    END IF;
    SELECT v_dno,v_dname FROM department;
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

--5. 사원 테이블에서커미션이NULL아닌 상태의 사원번호, 이름, 급여를 이름 기준으로오름차순으로정렬한 결과를 출력하세요
SELECT eno,ename,salary
FROM employee
WHERE commission is NOT NULL
ORDER BY ename;

--6. 다음과 같은 테이블(Student)을만들고 데이터를입력한다.
CREATE TABLE Student(
    sid NUMBER CONSTRAINT student_sid_pk PRIMARY KEY,
    sname NVARCHAR2(5) CONSTRAINT student_sname_nn NOT NULL,
    kscore NUMBER(3) CONSTRAINT student_kscore_ck CHECK(0<=kscore AND kscore<=100),
    escore NUMBER(3) CONSTRAINT student_escore_ck CHECK(0<=escore AND escore<=100),
    mscore NUMBER(3) CONSTRAINT student_mscore_ck CHECK(0<=mscore AND mscore<=100)
);
CREATE SEQUENCE seq_stu_id;
INSERT INTO Student
VALUES (seq_stu_id.nextval,'고길동',78,64,82);
INSERT INTO Student
VALUES (seq_stu_id.nextval,'김길동',85,71,64);
INSERT INTO Student
VALUES (seq_stu_id.nextval,'이길동',74,69,57);
INSERT INTO Student
VALUES (seq_stu_id.nextval,'박길동',74,77,95);
INSERT INTO Student
VALUES (seq_stu_id.nextval,'홍길동',68,95,84);

SELECT * FROM Student;

