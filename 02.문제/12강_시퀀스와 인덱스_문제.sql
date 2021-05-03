--1.사원 테이블의사원번호가자동으로생성되도록시퀀스를생성하시오.(시작값: 1, 증가값:1 최대값:100000)
CREATE TABLE emp_seq
AS SELECT * FROM employee
WHERE 1=0;

CREATE SEQUENCE seq_emp_seq
maxvalue 100000;

--2. 사원번호를시퀀스로부터발급받아서오른쪽 테이블에 데이터를입력하세요.1)사원 이름: Julia, 입사일: sysdate)2)사원 이름: Alice입사입: 2020/12/31
INSERT INTO emp_seq
VALUES (seq_emp_seq.nextval,'Julia','','',TO_DATE(sysdate),'','','');
INSERT INTO emp_seq
VALUES (seq_emp_seq.nextval,'Alice','','',TO_DATE(20201231),'','','');
--3. EMP01테이블의이름 칼럼을 인덱스로설정하되인덱스 이름을IDX_EMP01_EName로 지정하세요
CREATE INDEX IDX_emp_seq_Ename 
ON emp_seq(ename);


SELECT * FROM emp_seq;

SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN('emp_seq');

