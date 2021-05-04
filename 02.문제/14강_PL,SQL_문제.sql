--1. IF���� ����Ͽ� KING����� �μ���ȣ�� ���ͼ� �μ� ��ȣ�� ���� �μ���������ϼ���.(��ǰ)
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
    
--2. BASICLOOP������1����10������ �ڿ������������Ͽ� ����ϼ���.
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

--3. FORLOOP������1����10������ �ڿ������������Ͽ� ����ϼ���.
DECLARE
    v_i NUMBER := 0;
    v_sum NUMBER :=0;
BEGIN
    FOR v_i IN 1..10 LOOP
    v_sum := v_sum+v_i;
    END LOOP;
    dbms_output.put_line('2.FOR LOOP: '||v_sum);
END;

--4. WHILELOOP������1����10������ �ڿ������������Ͽ� ����ϼ���.
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

--5. ��� ���̺���Ŀ�̼���NULL�ƴ� ������ �����ȣ, �̸�, �޿��� �̸� �������ο����������������� ����� ����ϼ���
SELECT eno,ename,salary
FROM employee
WHERE commission is NOT NULL
ORDER BY ename;

--6. ������ ���� ���̺�(Student)������� �����͸��Է��Ѵ�.
CREATE TABLE Student(
    sid NUMBER CONSTRAINT student_sid_pk PRIMARY KEY,
    sname NVARCHAR2(5) CONSTRAINT student_sname_nn NOT NULL,
    kscore NUMBER(3) CONSTRAINT student_kscore_ck CHECK(0<=kscore AND kscore<=100),
    escore NUMBER(3) CONSTRAINT student_escore_ck CHECK(0<=escore AND escore<=100),
    mscore NUMBER(3) CONSTRAINT student_mscore_ck CHECK(0<=mscore AND mscore<=100)
);
CREATE SEQUENCE seq_stu_id;
INSERT INTO Student
VALUES (seq_stu_id.nextval,'��浿',78,64,82);
INSERT INTO Student
VALUES (seq_stu_id.nextval,'��浿',85,71,64);
INSERT INTO Student
VALUES (seq_stu_id.nextval,'�̱浿',74,69,57);
INSERT INTO Student
VALUES (seq_stu_id.nextval,'�ڱ浿',74,77,95);
INSERT INTO Student
VALUES (seq_stu_id.nextval,'ȫ�浿',68,95,84);

SELECT * FROM Student;

