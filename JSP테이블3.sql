CREATE TABLE student_tbl(
    stuId  VARCHAR(20) Primary Key,
    stuName NVARCHAR2(20),
    stuPwd VARCHAR2(20),
    stuClass VARCHAR(2)
);

INSERT INTO student_tbl 
VALUES('Kim','��浿','1234','A');

INSERT INTO student_tbl 
VALUES('Na','�����','1234','A');

INSERT INTO student_tbl 
VALUES('Do','���浿','1234','A');

INSERT INTO student_tbl 
VALUES('Ryu','�����','1234','A');

INSERT INTO student_tbl 
VALUES('Moon','���浿','1234','A');

INSERT INTO student_tbl 
VALUES('Bea','����','1234','B');

INSERT INTO student_tbl 
VALUES('Sung','���浿','1234','B');

INSERT INTO student_tbl 
VALUES('Lee','�̱���','1234','B');

INSERT INTO student_tbl 
VALUES('Jang','��漮','1234','B');

INSERT INTO student_tbl 
VALUES('Chun','õ����','1234','B');

SELECT * FROM student_tbl;

---------------------------------------------------------------------------------
CREATE TABLE teacher_tbl (
    teaId  VARCHAR(20) Primary Key,
    teaName NVARCHAR2(20),
    teaPwd VARCHAR2(20),
    teaClass VARCHAR(2)
);

INSERT INTO teacher_tbl 
VALUES('Hong','ȫ�浿','1234','A');

INSERT INTO teacher_tbl 
VALUES('Pi','�Ǳ���','1234','B');

SELECT * FROM teacher_tbl;

---------------------------------------------------------------------------------
CREATE TABLE subject_tbl (
    subId  VARCHAR(20) Primary Key,
    subName NVARCHAR2(20)
);

INSERT INTO subject_tbl 
VALUES('Kor','����');

INSERT INTO subject_tbl 
VALUES('Eng','����');

INSERT INTO subject_tbl 
VALUES('Math','����');

INSERT INTO subject_tbl 
VALUES('Sci','����');

INSERT INTO subject_tbl 
VALUES('Soc','��ȸ');

SELECT * FROM subject_tbl;

---------------------------------------------------------------------------------
CREATE TABLE score_tbl (
    stuName NVARCHAR2(20),
    korScore number(3),
    engScore number(3),
    mathScore number(3),
    sciScore number(3),
    socScore number(3)
);

INSERT INTO score_tbl
VALUES ('��浿',75,80,64,77,70);

INSERT INTO score_tbl
VALUES ('�����',95,69,68,71,97);

INSERT INTO score_tbl
VALUES ('���浿',85,54,83,69,75);

INSERT INTO score_tbl
VALUES ('�����',96,94,58,90,98);

INSERT INTO score_tbl
VALUES ('���浿',98,78,87,92,96);

INSERT INTO score_tbl
VALUES ('����',85,65,56,53,68);

INSERT INTO score_tbl
VALUES ('���浿',91,91,82,79,74);

INSERT INTO score_tbl
VALUES ('�̱���',81,94,62,89,70);

INSERT INTO score_tbl
VALUES ('��漮',50,77,57,87,96);

INSERT INTO score_tbl
VALUES ('õ����',55,52,81,85,90);

SELECT * FROM score_tbl;

commit;
---------------------------------------------------------------------------------
    SELECT * FROM student_tbl;
SELECT * FROM teacher_tbl;
SELECT * FROM score_tbl;










