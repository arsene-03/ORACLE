CREATE TABLE board_tbl(
	idx NUMBER(6) PRIMARY KEY,
	writer VARCHAR2(20),
	subject VARCHAR2(255),
	content CLOB,
	time TIMESTAMP
);
CREATE SEQUENCE board_seq2
NOCACHE;

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'��ȸ��','����ó�� ������ ����','jsp ���׿�','2018-07-31 12:34:56');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'��ȸ��','�� ������ ��ɻ� ��ƴ�','jquery ��Ƴ׿�','2018-07-31 12:43:43');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'��ȸ��','����ó�� ������ ��ƴ�','jsp ��Ƴ׿�','2018-08-01 13:34:56');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'��ȸ��','����ó�� ������ ����','jquery ���׿�','2018-08-01 13:43:34');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'��ȸ��','������','���� �״�� ����','2018-08-02 13:12:10');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'��ȸ��','���� �״�� ����','������','2018-08-03 14:34:20');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'��ȸ��','�ϵ��ڵ��ϴ� �����','�����ϸ� ����','2018-08-04 14:56:30');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'��ȸ��','github�� ����սô�','�ż���','2018-08-05 15:43:35');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'��ȸ��','��� �� ��������','��ε� �𿩶�','2018-08-06 16:21:40');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'��ȸ��','������','��Ź��','2018-08-07 17:01:45');

---------------------------------------------------------------------------------------------------------------

CREATE TABLE comment_tbl(
	idx NUMBER(6) PRIMARY KEY,
	bidx NUMBER(6),
	writer VARCHAR2(20),
	content CLOB,
	time TIMESTAMP
);

CREATE SEQUENCE comment_seq
NOCACHE;

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'1','��ȸ��','Lorem ipsum dolor sit amet','2018-08-01 12:34:56');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'3','��ȸ��','Lorem ipsum dolor sit amet','2018-08-01 12:43:43');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'5','��ȸ��','Lorem ipsum dolor sit amet','2018-08-02 13:34:56');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'7','��ȸ��','consectetur adipisicing elit','2018-08-03 13:43:34');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'9','��ȸ��','Fugit itaque magnam cupiditate','2018-08-04 13:12:10');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'2','��ȸ��','blanditiis totam vel officiis','2018-08-04 14:34:20');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'3','��ȸ��','eveniet velit ea veniam provident','2018-08-05 14:56:30');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'5','��ȸ��','maxime sequi laborum adipisci','2018-08-06 15:43:35');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'7','��ȸ��','atque necessitatibus qui','2018-08-07 16:21:40');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'2','��ȸ��','doloremque repellat','2018-08-07 17:01:45');

COMMIT;

SELECT * FROM board_tbl ORDER BY time;
SELECT * FROM comment_tbl;


SELECT *
FROM comment_tbl
where bidx=2;


SELECT * FROM board_tbl
WHERE idx=8;

DELETE FROM tb1 t WHERE t.col1.x = 10;

------------------------------------------------------------------------------------
--������û ���α׷� DB--

CREATE TABLE course_tbl(
    id VARCHAR2(5) PRIMARY KEY,
    name VARCHAR2(40),
    credit NUMBER(6),
    lecturer VARCHAR2(10),
    week NUMBER(2),
    start_hour NUMBER(4),
    end_hour NUMBER(4)
);

INSERT INTO course_tbl 
VALUES (10001,'���α׷���',2,'1',1,0900,1100);

INSERT INTO course_tbl 
VALUES (10002,'��ü���� ���α׷���',2,'2',2,0900,1200);

INSERT INTO course_tbl 
VALUES (10003,'�ڷᱸ��',3,'4',3,0900,1200);

INSERT INTO course_tbl 
VALUES (10004,'�˰���',3,'4',4,0900,1200);

INSERT INTO course_tbl 
VALUES (20001,'�ý��� ���α׷���',2,'5',1,1300,1600);

INSERT INTO course_tbl 
VALUES (20002,'�ü��',3,'5',2,1500,1800);

INSERT INTO course_tbl 
VALUES (20003,'���丶Ÿ�� �����Ϸ�',3,'5',3,1330,1630);

INSERT INTO course_tbl 
VALUES (30001,'����Ʈ���� ����',2,'3',4,1330,1530);

INSERT INTO course_tbl 
VALUES (30002,'�ý��� �м� �� ����',3,'3',5,0900,1200);

INSERT INTO course_tbl 
VALUES (40001,'�����ͺ��̽�',3,'2',5,1300,1600);


------------------------------------------------------------
CREATE TABLE lecturer_tbl(
    idx NUMBER(6) PRIMARY KEY,
    name VARCHAR2(10),
    major VARCHAR2(25),
    field VARCHAR2(25)
);

CREATE SEQUENCE lecturer_seq
NOCACHE;



INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'�豳��','����Ʈ�������','�˰���');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'�̱���','����Ʈ�������','�ΰ�����');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'�ڱ���','����Ʈ�������','����Ʈ�������');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'�챳��','����Ʈ�������','�˰���');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'�ֱ���','������ǻ�Ͱ���','�Ӻ���� �ý���');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'������','������ǻ�Ͱ���','��Ƽ�̵��');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'Ȳ����','����Ͻý��۰���','��Ʈ��ũ');




SELECT * FROM course_tbl;
SELECT * FROM lecturer_tbl;

SELECT c.id,c.name,c.credit,l.name AS lname,c.week,c.start_hour,c.end_hour
FROM course_tbl c, lecturer_tbl l
Where c.lecturer = l.idx
ORDER BY c.id ASC;

SELECT idx FROM lecturer_tbl 
WHERE name= '�豳��';

drop table course_tbl;
drop table lecturer_tbl;
drop SEQUENCE lecturer_seq;


COMMIT;