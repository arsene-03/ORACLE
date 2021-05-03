--1. 다음 표에 명시된 대로DEPT 테이블을생성하세요
CREATE TABLE DEPT(dno NUMBER(2),
                  dname VARCHAR2(14),
                  loc VARCHAR2(13)
);
DESC DEPT;
--2. 다음 표에 명시된 대로EMP 테이블을생성하세요.
CREATE TABLE EMP(eno NUMBER(4),
                  ename VARCHAR2(10),
                  dno VARCHAR2(2)
);
DESC EMP;
--3. 긴 이름을 저장할 수 있도록EMP테이블을수정하세요.(ENAME칼럼)
ALTER TABLE EMP 
MODIFY (ename VARCHAR2(25)
);

--4. EMPLOYEE테이블을복사해서EMPLOYEE2란 이름의 테이블을생성하되
-- 사원번호, 이름, 급여, 부서번호칼럼만 복사하고새로 생성된 칼럼명을 각각
--EMP_ID, NAME, SAL, DEPT_ID로지정하세요.
CREATE TABLE employee2
AS SELECT eno AS "EMP_ID",
          ename AS "NAME",
          salary AS "SAL",
          dno AS "DEPT_ID"
FROM employee;

--CREATE TABLE employee2
--    "EMP_ID",
--    "NAME",
--    "SAL",
--    "DEPT_ID"
--          AS SELECT eno,ename,salary,dno
--FROM employee;
DESC employee2;
--5. EMP 테이블을삭제하세요
DROP TABLE EMP CASCADE CONSTRAINTS;

--6. EMPLOYEE2테이블의이름을EMP로 변경하세요
RENAME employee2 to EMP;

--7. DEPT 테이블에서DNAME 칼럼을 제거하세요
ALTER TABLE DEPT DROP COLUMN dname;

--8. DEPT 테이블에서LOC칼럼을UNUSED로 표시하세요.
ALTER TABLE DEPT 
SET UNUSED (LOC);

--9. UNUSED 칼럼을 모두 제거하세요
ALTER TABLE DEPT
DROP UNUSED COLUMNS;

SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM employee2;