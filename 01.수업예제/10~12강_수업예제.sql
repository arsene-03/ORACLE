--10강. 데이터 무결성과 제약조건
DROP TABLE customer;
CREATE TABLE customer(
    --id VARCHAR2(20) CONSTRAINT customer_id_uk UNIQUE,
    id VARCHAR2(20),
    pwd VARCHAR2(20) CONSTRAINT cutomer_pw_nn NOT NULL,
    name VARCHAR2(20) CONSTRAINT customer_name_nn NOT NULL,
    jumsu NUMBER(3) CONSTRAINT customer_jumsu_range CHECK(0<=jumsu AND jumsu <=100),
    CONSTRAINT customer_id_uk UNIQUE(id) -- 마지막에 적어 줄 수도 있음
);
SELECT *FROM customer;

INSERT into customer VALUES ('','123','홍길동',75);
INSERT into customer VALUES ('hong','123','홍인형',123);
INSERT into customer VALUES ('zxcv','145','honmh',-65);

SELECT table_name,constraint_name
FROM SYS.user_constraints
WHERE table_name IN ('CUSTOMER');

CREATE TABLE customer(   
    id VARCHAR2(20),
    pwd VARCHAR2(20) CONSTRAINT cutomer_pw_nn NOT NULL,
    name VARCHAR2(20) CONSTRAINT customer_name_nn NOT NULL,
    CONSTRAINT customer_id_pk PRIMARY KEY(id)
);

INSERT into customer VALUES('asdf','1234','park');
INSERT into customer VALUES('asdf','5678','kim'); --x
INSERT into customer VALUES('','1598','hong'); --x

CREATE TABLE student(
    stuNO VARCHAR2(20),
    name VARCHAR2(20) CONSTRAINT student_name_nn NOT NULL,
    major VARCHAR2(20),
    CONSTRAINT student_name_pk PRIMARY KEY(stuNO)
);
CREATE TABLE registration(
    enrollid VARCHAR2(20)CONSTRAINT reg_enrollid_pk PRIMARY KEY,
    stuNO VARCHAR2(20),
    subject VARCHAR2(20)CONSTRAINT reg_subject_nn NOT NULL,
    CONSTRAINT reg_stuNO_fk FOREIGN KEY(stuNO) REFERENCES student(stuNO)
);

INSERT INTO student
VALUES('S01','ko','Math');
INSERT INTO student
VALUES('S02','hong','Physics');
INSERT INTO student
VALUES('S03','Lisa su','Computer Science');

SELECT * FROM student; 

INSERT INTO registration
VALUES ('E01','S01','Algorithm');
INSERT INTO registration
VALUES ('E02','S03','Linear Algebra');
INSERT INTO registration
VALUES ('E03','S05','Constitutional Law'); -- 부모역할인 student 테이블에 해당 학번이 없기 때문

SELECT * FROM registration;

CREATE TABLE stu_copy
AS
SELECT * FROM student;

CREATE TABLE reg_copy
AS
SELECT * FROM registration;

SELECT table_name,constraint_name
FROM SYS.user_constraints
WHERE table_name IN (UPPER('reg_copy')); -- 제약조건은 복사 x

--기본키 추가
ALTER TABLE stu_copy
ADD CONSTRAINT stu_copy_stuNO_pk PRIMARY KEY(stuNO);
ALTER TABLE reg_copy
ADD CONSTRAINT stu_copy_enrollid_pk PRIMARY KEY(enrollid);
--외래키 추가
ALTER TABLE reg_copy
ADD CONSTRAINT reg_copy_stuNO_fk FOREIGN KEY(stuNO) REFERENCES stu_copy(stuNO);
--not null 변경(add 아님)
ALTER TABLE stu_copy
MODIFY major CONSTRAINT stu_copy_major_nn NOT NULL;
--기본키 제거
ALTER TABLE stu_copy
DROP PRIMARY KEY; -- 외래키로 참조되어있어서 오류 발생

ALTER TABLE stu_copy
DROP PRIMARY KEY CASCADE; --연결된 외래키 까지 같이 삭제시킴 

ALTER TABLE stu_copy
DROP CONSTRAINT stu_copy_major_nn;

--10강. 시퀀스와 인덱스-------------------------------------------------------------
CREATE SEQUENCE seq_sample -- 10부터 시작하고 5씩 증가하는 시퀀스
START WITH 10
INCREMENT BY 5;

SELECT seq_sample.nextval FROM dual;
SELECT seq_sample.currval FROM dual; -- 한번도 사용한적 없어서

ALTER SEQUENCE seq_sample
INCREMENT BY 2;

CREATE TABLE member2(
    mNUMBER NUMBER,
    mId VARCHAR2(20) NOT NULL,
    mPwd VARCHAR2(20)NOT NULL,
    mNAME VARCHAR2(20)NOT NULL,
    CONSTRAINT member_mid_uk UNIQUE(mId),
    CONSTRAINT member_mNUMBER_pk PRIMARY KEY(mNUMBER)
);
CREATE SEQUENCE seq_member;

INSERT INTO member2
VALUES (seq_member.nextval,'qwe','1234','홍길동');
INSERT INTO member2
VALUES (seq_member.nextval,'asd','1234','황길동');
INSERT INTO member2
VALUES (seq_member.nextval,'23','1234','고길동');
INSERT INTO member2
VALUES (seq_member.nextval,'4','1234','박길동');
INSERT INTO member2
VALUES (seq_member.nextval,'bdf','1234','이길동');

SELECT * FROM member2;

ALTER SEQUENCE seq_member
NOCACHE;

SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN ('MEMBER2');

CREATE INDEX idx_member2_mName
ON member2(mName);

SELECT * FROM member2 WHERE mNUMBER = 5;