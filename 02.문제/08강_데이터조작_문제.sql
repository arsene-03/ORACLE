--1. Employee테이블의구조만 복사하여EMP_INSERT란 빈 테이블을만드세요.
CREATE TABLE EMP_INSERT
AS
SELECT * FROM employee
WHERE 1=0;

--2. 본인을EMP_INSERT테이블에추가하되SYSDATE를 이용해서입사일을오늘로 입력하세요
INSERT INTO EMP_INSERT 
VALUES(8001,'CHOIHAKJUN','STUDENT','',sysdate,300,'','');

--3. EMP_INSERT 테이블에옆사람을추가하되TO_DATE함수를 사용해서입사일을어제로 입력하세요
INSERT INTO EMP_INSERT 
VALUES(8002,'YOUNSUN','STUDENT','',TO_DATE(SYSDATE)-1,300,'','');

--4. Employee테이블의구조와 내용을 복사하여EMP_COPY란 이름의 테이블을만드세요.
CREATE TABLE EMP_COPY
AS
SELECT * FROM employee;

--5. 사원번호가7788인 사원의 부서번호를10으로수정하세요.
UPDATE EMP_COPY
SET dno = 10
WHERE eno = 7788;
            
--6. 사원번호가7788의 담당업무및 급여를 사원번호7499의 담당 업무및 급여와 일치하도록갱신하세요.
UPDATE EMP_COPY
SET job = (SELECT job
            FROM EMP_COPY
            WHERE eno=7499),
salary = (SELECT salary
            FROM EMP_COPY
            WHERE eno=7499)
WHERE eno = 7788;

--7. 사원번호7369와 업무가 동일한 모든 사원의 부서번호를사원7369의 현재 부서번호로갱신하세요.
UPDATE EMP_COPY
SET dno = (SELECT dno
            FROM EMP_COPY
            WHERE eno = 7369)
WHERE job = (SELECT job
            FROM EMP_COPY
            WHERE eno = 7369);
            
--8. Department테이블의구조와 내용을 복사하여DEPT_COPY란 이름의 테이블을만드세요
CREATE TABLE DEPT_COPY
AS
SELECT * FROM Department;

--9. DEPT_COPY테이블에서부서명이RESEARCH인부서를 제거하세요.
DELETE FROM DEPT_COPY 
WHERE dname = 'RESEARCH';
 
--10. DEPT_COPY테이블에서부서번호가10이거나40인 부서를 제거하세요
DELETE FROM DEPT_COPY 
WHERE dno= 10
OR dno = 40;


SELECT *FROM EMP_INSERT;
DROP TABLE EMP_COPY;
SELECT * FROM EMP_COPY;
SELECT * FROM DEPT_COPY;