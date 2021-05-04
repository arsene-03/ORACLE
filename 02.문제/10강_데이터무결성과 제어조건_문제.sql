--1. Employee테이블의구조를 복사하여EMP_SAMPLE란 이름의 테이블을만드세요 
--  사원테이블의사원 번호칼럼에 테이블 레벨로 primarykey제약조건을지정하되 제약조건이름은 my_emp_pk로 지정하세요.
CREATE TABLE EMP_SAMPLE
AS SELECT *FROM employee
WHERE 1=0;

ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_emp_pk PRIMARY KEY (eno);

--2. department테이블의구조를 복사하여dept_sample이란 테이블을만드세요.
--   dept_sample의 부서번호칼럼에 테이블 레벨로primarykey제약조건을지정하되 제약조건이름은my_dept_pk로지정하세요.
CREATE TABLE dept_sample
AS SELECT * FROM department
WHERE 1=0;

ALTER TABLE dept_sample
ADD CONSTRAINT my_dept_pk PRIMARY KEY (dno);

--3. 사원테이블의부서번호칼럼에 존재하지않는 부서의 사원이 배정되지않도록 외래키 제약조건을지정하되 제약조건이름은my_emp_dept_fk로지정하세요.
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_emp_dept_fk FOREIGN KEY (dno) REFERENCES dept_sample(dno);

--4. 사원테이블의커미션 컬럼에0보다 큰 값만을 입력할 수 있도록 제약조건을지정하세요
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_emp_ck CHECK (0<commission);




SELECT * FROM EMP_SAMPLE;
SELECT * FROM dept_SAMPLE;

SELECT table_name,constraint_name
FROM SYS.user_constraints
WHERE table_name IN (UPPER('EMP_SAMPLE')); -- 제약조건은 복사 x