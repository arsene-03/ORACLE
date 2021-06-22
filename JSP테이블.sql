CREATE TABLE member(
    name varchar2(10) primary key,
    userId varchar2(10),
    userPwd varchar2 (10),
    email varchar2(20),
    phone char(13),
    admin NUMBER(1) DEFAULT 0 --0: �����, 1: ������
);

INSERT INTO member 
VALUES ('��浿', 'ko', '1234', 'ko@naver.com', '010-1234-5678', 0);

INSERT INTO member 
VALUES ('�ڱ浿', 'park', '1234', 'park@naver.com', '010-1234-5678', 0);

INSERT INTO member 
VALUES ('�̱浿', 'lee', '1234', 'lee@naver.com', '010-1234-5678', 1);

INSERT INTO member 
VALUES ('��浿', 'jang', '1234', 'jang@naver.com', '010-1234-5678', 0);

INSERT INTO member 
VALUES ('ȫ�浿', 'hong', '1234', 'hong@naver.com', '010-1234-5678', 0);

SELECT * FROM member;



-- ī�� �ֹ� ���α׷� ����ǥ

CREATE TABLE coffeeMenu(
    coffeeCode Number PRIMARY KEY,
    coffeeName NVARCHAR2(100) NOT NULL,
    coffeeType NVARCHAR2(10) NOT NULL,
    coffeePrice NUMBER NOT NULL
);

create SEQUENCE coffee_seq
NOCACHE;

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'��ü ��','��',5600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'��ü ��','�׶���',6100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'��ü ��','��Ƽ',6600);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'ȭ��Ʈ ���ݸ� ��ī','��',5600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'ȭ��Ʈ ���ݸ� ��ī','�׶���',6100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'ȭ��Ʈ ���ݸ� ��ī','��Ƽ',6600);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'ī�� ��ī','��',5100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'ī�� ��ī','�׶���',5600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'ī�� ��ī','��Ƽ',6100);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'ī�� ��','��',4600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'ī�� ��','�׶���',5100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'ī�� ��','��Ƽ',5600);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'�Ƹ޸�ī��','��',4100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'�Ƹ޸�ī��','�׶���',4600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'�Ƹ޸�ī��','��Ƽ',5100);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'������ Ŀ��','��',3800);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'������ Ŀ��','�׶���',4300);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'������ Ŀ��','��Ƽ',4800);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'��е� �ٴҶ� ���� ��Ű�߶�','��',5600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'��е� �ٴҶ� ���� ��Ű�߶�','�׶���',6100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'��е� �ٴҶ� ���� ��Ű�߶�','��Ƽ',6600);

select * FROM coffeeMenu;

SELECT DISTINCT(coffeeName) FROM coffeeMenu;
COMMIT;

CREATE TABLE productTbl(
    code NUMBER PRIMARY KEY,
    name NVARCHAR2 (100),
    price NUMBER,
    pictureurl VARCHAR2 (100),
    description NVARCHAR2(1000)
);

CREATE SEQUENCE product_seq
NOCACHE;

INSERT INTO productTbl
VALUES (product_seq.nextval,'���̽� ������ ���̾� �ڵ��',34200,'01_python.jpg','���̽��� Ȱ���� ������ ���� �Թ���');

INSERT INTO productTbl
VALUES (product_seq.nextval,'��Ʋ���� Ȱ���� �ȵ���̵� ���α׷���',34000,'02_android.jpg','��Ʋ�� �� ���� �ȵ���̵� ���߼�');

INSERT INTO productTbl
VALUES (product_seq.nextval,'Node.js ������',32400,'03_nodejs.jpg','�⺻�⿡ ����� ���.js �н���');

INSERT INTO productTbl
VALUES (product_seq.nextval,'�ڹ� ���� �ٷ�� ���',40500,'04_javaWebBook.jpg','JSP,����,���������� �ǹ��� �˾ƾ� �� �����');

INSERT INTO productTbl
VALUES (product_seq.nextval,'����� ������ 3.1',67500,'05_spring.jpg','�������� ������ ���ظ� ����� �������� ������');

commit;

select * FROM productTbl;

CREATE TABLE board(
    num NUMBER(5) PRIMARY KEY,
    pass VARCHAR2(30),
    name VARCHAR2(30),
    email VARCHAR2(30),
    title VARCHAR2(50),
    content VARCHAR2(1000),
    readcount NUMBER(4) DEFAULT 0,
    writedate DATE DEFAULT sysdate
);

CREATE SEQUENCE board_seq
NOCACHE;

INSERT INTO board(num,name,email,pass,title,content)
VALUES (board_seq.nextval,'ȫ�浿','hong@naver.com','1234','ù �湮','�Դ� ���ϴ�.');

INSERT INTO board(num,name,email,pass,title,content)
VALUES (board_seq.nextval,'��浿','kimk@naver.com','1234','�ݰ�����','������ 000-0000-0000����.');

INSERT INTO board(num,name,email,pass,title,content)
VALUES (board_seq.nextval,'��浿','ko@naver.com','1234','�ȳ��ϼ���','�ǰ��Ͻ���.');

INSERT INTO board(num,name,email,pass,title,content)
VALUES (board_seq.nextval,'ȫ�浿','hong@naver.com','1234','�ι�° �湮','���� �̰��� ���̴ϴ�.');

INSERT INTO board(num,name,email,pass,title,content)
VALUES (board_seq.nextval,'�ڱ浿','park@naver.com','1234','�����?','ġŲ����.');

SELECT * FROM board;

INSERT INTO board(num,name,email,pass,title,content)
VALUES (board_seq.nextval,'�ڱ浿','park@naver.com','1234','�����?','ġŲ����.');

DECLARE
BEGIN
    for i in 1..483 LOOP
    INSERT INTO board(num,name,email,pass,title,content)
    VALUES (board_seq.nextval,'�׽�Ʈ'||i,'test'||i||'@naver.com','1234','�׽�Ʈ'||i,'�׽�Ʈ'||i||' : TEST'||i);    
    END LOOP;
END;
COMMIT;

---------------------------------------------------------
-- ROWNUM (���ȣ)
SELECT * 
FROM (SELECT ROWNUM as nic, num, name 
        FROM (SELECT * FROM board ORDER BY num DESC))
WHERE nic BETWEEN (section-1)*100+(pageNum-1)*10+1 AND (section-1)*100+pageNum*10;

SELECT COUNT(*) FROM board;

DELETE FROM board;
drop SEQUENCE board_seq;

CREATE SEQUENCE board_seq
NOCACHE;


------------------------------------------------------------------------
CREATE TABLE favoriteMovie (
    code VARCHAR2(30) PRIMARY KEY,
    title VARCHAR2(30) NOT NULL,
    director VARCHAR2(30),
    actor VARCHAR2(30),
    price NUMBER,
    content VARCHAR2(1000),
    score Number(4,2),
    readcount NUMBER(2) DEFAULT 0,
    userid varchar2(10) NOT NULL,
    userpwd varchar2 (10) NOT NULL,
    steelcut varchar2(30)
);

CREATE SEQUENCE movie_seq
NOCACHE;

INSERT INTO favoriteMovie (code, title, director, actor, price, content, score, userid, userpwd, steelcut)
VALUES ('movie_'||movie_seq.nextVal,'���̾�Ʈ �÷��̽�2','�� ũ���Ž�Ű','���и� ��Ʈ',12000,'��ü�� �� �� ���� ������ü�� �������� �ϻ��� ��� ���� ����� ����, ���̵� ��� ������ ������ �ƺ��� ��� ���� ��Ƴ��� �������� ���迡 ����ȴ�.',8.82,'gkrwnsvb','123','movie01_image.jpg');

commit;
--------------------------------------
select * FROM favoriteMovie;

drop TABLE favoriteMovie;
drop SEQUENCE movie_seq;
DELETE FROM favoriteMoive;

SELECT * FROM (SELECT ROWNUM AS countRow, code, title, director, actor, price, content, score, readcount, userid, userpwd, steelcut
						FROM (SELECT * FROM favoriteMoive ORDER BY code DESC))
							WHERE countRow BETWEEN (section-1)*100+(page-1)*10+1 AND (section-1)*100+page*10;
                            
                            
                            SELECT * 
FROM (SELECT ROWNUM as nic, num, name 
        FROM (SELECT * FROM board ORDER BY num DESC))
WHERE nic BETWEEN (section-1)*100+(pageNum-1)*10+1 AND (section-1)*1;

-------------------------------------------------------------------------------------
CREATE TABLE member_tbl_02 (
    custno number(6) primary key,
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindata date DEFAULT sysdate,
    grade char(1),
    city char(2)
);

CREATE SEQUENCE member_seq
START WITH 100001
NOCACHE;


INSERT INTO member_tbl_02
VALUES (member_seq.nextval,'���ູ','010-1111-2222','���� ���빮�� �ְ�1��','20151202','A','01');

INSERT INTO member_tbl_02
VALUES (member_seq.nextval,'���ູ','010-1111-3333','���� ���빮�� �ְ�2��','20151206','B','01');

INSERT INTO member_tbl_02
VALUES (member_seq.nextval,'�����','010-1111-4444','�︪�� �︪�� ����1��','20151001','B','30');

INSERT INTO member_tbl_02
VALUES (member_seq.nextval,'�ֻ��','010-1111-5555','�︪�� �︪�� ����2��','20151113','A','30');

INSERT INTO member_tbl_02
VALUES (member_seq.nextval,'����ȭ','010-1111-6666','���ֵ� ���ֽ� �ܳ�����','20151225','B','60');

INSERT INTO member_tbl_02
VALUES (member_seq.nextval,'���ູ','010-1111-7777','���ֵ� ���ֽ� ��������','20151211','C','60');

select * FROM member_tbl_02;

CREATE TABLE money_tbl_02 (
    custno number(6),
    salenol number(8),
    pcost number(8),
    amount number(4),
    price number(8),
    pcode varchar2(4),
    sdate date,
    CONSTRAINT money_tbl_02_PK PRIMARY KEY (custno,salenol)
);

INSERT INTO money_tbl_02
VALUES(10001,20160001,500,5,2500,'A001','20160101');

INSERT INTO money_tbl_02
VALUES(10001,20160002,1000,4,4000,'A002','20160101');

INSERT INTO money_tbl_02
VALUES(10001,20160003,500,3,1500,'A008','20160101');

INSERT INTO money_tbl_02
VALUES(10002,20160004,2000,1,2000,'A004','20160102');

INSERT INTO money_tbl_02
VALUES(10002,20160005,500,1,500,'A001','20160103');

INSERT INTO money_tbl_02
VALUES(10003,20160006,1500,2,3000,'A003','20160103');

INSERT INTO money_tbl_02
VALUES(10004,20160007,500,2,1000,'A001','20160104');

INSERT INTO money_tbl_02
VALUES(10004,20160008,300,1,300,'A005','20160104');

INSERT INTO money_tbl_02
VALUES(10004,20160009,600,1,600,'A006','20160104');

INSERT INTO money_tbl_02
VALUES(10004,20160010,3000,1,3000,'A007','20160106');

SELECT * FROM money_tbl_02;

DROP TABLE member_tbl_02;
DROP SEQUENCE member_seq;

commit;

 SELECT last_number 
     FROM USER_SEQUENCES 
   WHERE SEQUENCE_NAME = UPPER('member_seq');
   
select * FROM member_tbl_02;

SELECT n.custno, custname, grade, sum(price)
FROM member_tbl_02 m join money_tbl_02 n
on m.custno = n.custno
GROUP BY (n.custno,custname,grade)
ORDER BY sum(price) DESC;


------------------------------------------------------------------------------------
--��ǥ ���α׷�--
CREATE TABLE TBL_VOTE_202005(
    V_JUMIN CHAR(13) PRIMARY KEY,
    V_NAME VARCHAR2(20),
    M_NO CHAR(1),
    V_TIME CHAR(4),
    V_AREA CHAR(20),
    V_CONFIRM CHAR(1)
);

INSERT INTO TBL_VOTE_202005
VALUES('99010110001','������','1','0930','��1��ǥ��','N');

INSERT INTO TBL_VOTE_202005
VALUES('89010120002','������','2','0930','��1��ǥ��','N');

INSERT INTO TBL_VOTE_202005
VALUES('69010110003','������','3','0930','��1��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('59010120004','ȫ����','4','0930','��1��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010110005','������','5','0930','��1��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('89010120006','������','1','0930','��1��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('59010110007','������','1','0930','��1��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('49010120008','������','3','0930','��1��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010110009','������','3','0930','��1��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('89010120010','������','4','0930','��1��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('99010110011','������','5','0930','��1��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010120012','������','1','1330','��1��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('69010110013','������','4','1330','��2��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('89010110014','������','2','1330','��2��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('99010110015','������','3','1330','��2��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010110016','������','2','1330','��2��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('89010110017','������','4','1330','��2��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('99010110018','������','2','1330','��2��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('99010110019','������','4','1330','��2��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010110020','Ȳ����','5','1330','��2��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('69010110021','������','3','1330','��2��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010110022','������','3','1330','��2��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('99010110023','������','1','1330','��2��ǥ��','Y');

INSERT INTO TBL_VOTE_202005
VALUES('59010120024','������','3','1330','��2��ǥ��','Y');


--------------------------------------------------
CREATE TABLE TBL_MEMBER_202005(
    M_NO CHAR(1) PRIMARY KEY,
    M_NAME VARCHAR2(20),
    P_CODE CHAR(2),
    P_SCHOOL CHAR(1),
    M_JUMIN CHAR(13),
    M_CITY VARCHAR2(20)
);

INSERT INTO TBL_MEMBER_202005
VALUES ('1','���ĺ�','P1','1','6603011999991','����ȭ��');

INSERT INTO TBL_MEMBER_202005
VALUES ('2','���ĺ�','P2','3','5503011999992','�ε鷡��');

INSERT INTO TBL_MEMBER_202005
VALUES ('3','���ĺ�','P3','2','7703011999993','���Ȳɵ�');

INSERT INTO TBL_MEMBER_202005
VALUES ('4','���ĺ�','P4','2','8803011999994','���޷���');

INSERT INTO TBL_MEMBER_202005
VALUES ('5','���ĺ�','P5','3','9903011999995','��������');


--------------------------------------------------
CREATE TABLE TBL_PARTY_202005(
    P_CODE CHAR(2) PRIMARY KEY,
    P_NAME VARCHAR(20),
    P_INDATE DATE,
    P_READER VARCHAR2(20),
    P_TEL1 CHAR(3),
    P_TEL2 CHAR(4),
    P_TEL3 CHAR(4)
);

INSERT INTO TBL_PARTY_202005
VALUES ('P1','A����','2010-01-01','����ǥ','02','1111','0001');

INSERT INTO TBL_PARTY_202005
VALUES ('P2','B����','2010-02-01','���ǥ','02','1111','0002');

INSERT INTO TBL_PARTY_202005
VALUES ('P3','C����','2010-03-01','���ǥ','02','1111','0003');

INSERT INTO TBL_PARTY_202005
VALUES ('P4','D����','2010-04-01','����ǥ','02','1111','0004');

INSERT INTO TBL_PARTY_202005
VALUES ('P5','E����','2010-05-01','�Ӵ�ǥ','02','1111','0005');


SELECT * FROM TBL_VOTE_202005;
SELECT * FROM TBL_MEMBER_202005;
SELECT * FROM TBL_PARTY_202005;

SELECT M_NO,M_NAME,P_CODE,P_SCHOOL,M_JUMIN,M_CITY,P_TEL1,P_TEL2,P_TEL3
FROM TBL_MEMBER_202005 NATURAL JOIN TBL_PARTY_202005
WHERE  P_CODE = P_CODE;
commit;