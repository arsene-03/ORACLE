--08��. ������ ���۰� Ʈ������
SELECT * FROM employee;

INSERT INTO employee(eno,ename,job,manager,hiredate,salary,commission,dno)
VALUES(8001,'ALICE','CLAEK',7788,sysdate,1200,null,10);

INSERT INTO employee
VALUES(8002,'KATHERINE','SALESMAN',7698,sysdate,1750,800,30);

COMMIT;

DESC employee;

--INSERT INTO employee (ename, job)=> employee ���̺� eno�� not null �ε� �������� �ʾ� null ó�� �Ǿ� ����
--VALUES('jobs','CEO')

INSERT INTO employee (eno,ename,job)
VALUES(8004,'CHARLES',null);

INSERT INTO  employee (eno,ename,job)
VALUES(8005,'GAbe','');

INSERT INTO  employee (eno,hiredate)
VALUES(8006,'2003/01/21');

INSERT INTO employee(eno,hiredate)
VALUES(8007,TO_DATE('2005-02-14','YYYY-MM-DD'));

COMMIT;
-----------------------------------------------------------------------
--09��. ���̺�����
SELECT * FROM employee;

CREATE TABLE emp2
AS SELECT * FROM employee;

SELECT *FROM emp2;

INSERT INTO emp2
SELECT * FROM employee;

SELECT * FROM emp2;

CREATE TABLE emp3
AS SELECT * FROM employee WHERE 4=7;

SELECT * FROM emp3; -- ������ ������ ���ǿ� false�� �༭ �ƹ��͵� �ʳְ���

CREATE TABLE emp4
AS SELECT * FROM employee;

SELECT * FROM Emp4;

UPDATE emp4
SET ename = 'RUNA',job='MANAGER' WHERE eno=8003;

DROP TABLE emp4;

UPDATE emp4
SET salary = (SELECT losal
              FROM salgrade
              WHERE grade = 1)
WHERE dno is null;

SELECT * FROM salgrade;

-- �̸��� ���� ����� �Ҽ��� OPERATION���� �ű�� ��� ������ president�� ���� ������������ ��ġ�� ���ô�
UPDATE emp4
SET dno = (SELECT dno 
            FROM department
            WHERE dname= 'OPERATIONS'),
manager = (SELECT eno
            FROM emp4
            WHERE job = 'PRESIDENT')
WHERE ename IS null;

SELECT * FROM emp4;

-----------------------------------------------

CREATE TABLE emp5
AS SELECT * FROM employee;

SELECT * FROM emp5;

DELETE FROM emp5;

DROP TABLE emp5;

DELETE FROM emp5 WHERE ename = 'ALICE';

DELETE FROM emp5 WHERE dno = (SELECT dno
                              FROM department
                              WHERE dname = 'RESEARCH');

---------------------------------------------------------------------
CREATE TABLE depart2
AS SELECT * FROM department;

SELECT * FROM depart2;

DELETE FROM depart2 WHERE dno = 10;

COMMIT;

ROLLBACK;

--------------------------------------------------------------------
CREATE TABLE dept2 (dno NUMBER(2),
                    dname VARCHAR2(14),
                    loc VARCHAR2(13)
);

DESC dep2;

CREATE TABLE dept3
AS SELECT * FROM department;

CREATE TABLE dept4
AS SELECT eno,ename,salary,salary*12 AS"ani_sal"
FROM employee
WHERE dno=20;

SELECT * FROM dept4;

ALTER TABLE dept4
ADD (birth date);

ALTER TABLE dept4
MODIFY ename VARCHAR2(30);

ALTER TABLE dept4
RENAME COLUMN ename TO studentNAME;

ALTER TABLE dept4
DROP COLUMN birth;

RENAME dept4 TO emp04;

DESC emp04;

DROP TABLE emp04;

TRUNCATE TABLE dept3;

SELECT * FROM dept3;

SELECT TABLE_NAME FROM USER_TABLES;

SELECT OWNER, TABLE_NAME FROM ALL_TABLES;
