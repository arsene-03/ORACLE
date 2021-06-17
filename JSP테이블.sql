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


COMMIT;