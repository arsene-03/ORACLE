--10��. ������ ���Ἲ�� ��������
DROP TABLE customer;
CREATE TABLE customer(
    --id VARCHAR2(20) CONSTRAINT customer_id_uk UNIQUE,
    id VARCHAR2(20),
    pwd VARCHAR2(20) CONSTRAINT cutomer_pw_nn NOT NULL,
    name VARCHAR2(20) CONSTRAINT customer_name_nn NOT NULL,
    jumsu NUMBER(3) CONSTRAINT customer_jumsu_range CHECK(0<=jumsu AND jumsu <=100),
    CONSTRAINT customer_id_uk UNIQUE(id) -- �������� ���� �� ���� ����
);
SELECT *FROM customer;

INSERT into customer VALUES ('','123','ȫ�浿',75);
INSERT into customer VALUES ('hong','123','ȫ����',123);
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
VALUES ('E03','S05','Constitutional Law'); -- �θ����� student ���̺� �ش� �й��� ���� ����

SELECT * FROM registration;

CREATE TABLE stu_copy
AS
SELECT * FROM student;

CREATE TABLE reg_copy
AS
SELECT * FROM registration;

SELECT table_name,constraint_name
FROM SYS.user_constraints
WHERE table_name IN (UPPER('reg_copy')); -- ���������� ���� x

--�⺻Ű �߰�
ALTER TABLE stu_copy
ADD CONSTRAINT stu_copy_stuNO_pk PRIMARY KEY(stuNO);
ALTER TABLE reg_copy
ADD CONSTRAINT stu_copy_enrollid_pk PRIMARY KEY(enrollid);
--�ܷ�Ű �߰�
ALTER TABLE reg_copy
ADD CONSTRAINT reg_copy_stuNO_fk FOREIGN KEY(stuNO) REFERENCES stu_copy(stuNO);
--not null ����(add �ƴ�)
ALTER TABLE stu_copy
MODIFY major CONSTRAINT stu_copy_major_nn NOT NULL;
--�⺻Ű ����
ALTER TABLE stu_copy
DROP PRIMARY KEY; -- �ܷ�Ű�� �����Ǿ��־ ���� �߻�

ALTER TABLE stu_copy
DROP PRIMARY KEY CASCADE; --����� �ܷ�Ű ���� ���� ������Ŵ 

ALTER TABLE stu_copy
DROP CONSTRAINT stu_copy_major_nn;

--10��. �������� �ε���-------------------------------------------------------------
CREATE SEQUENCE seq_sample -- 10���� �����ϰ� 5�� �����ϴ� ������
START WITH 10
INCREMENT BY 5;

SELECT seq_sample.nextval FROM dual;
SELECT seq_sample.currval FROM dual; -- �ѹ��� ������� ���

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
VALUES (seq_member.nextval,'qwe','1234','ȫ�浿');
INSERT INTO member2
VALUES (seq_member.nextval,'asd','1234','Ȳ�浿');
INSERT INTO member2
VALUES (seq_member.nextval,'23','1234','��浿');
INSERT INTO member2
VALUES (seq_member.nextval,'4','1234','�ڱ浿');
INSERT INTO member2
VALUES (seq_member.nextval,'bdf','1234','�̱浿');

SELECT * FROM member2;

ALTER SEQUENCE seq_member
NOCACHE;

SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN ('MEMBER2');

CREATE INDEX idx_member2_mName
ON member2(mName);

SELECT * FROM member2 WHERE mNUMBER = 5;