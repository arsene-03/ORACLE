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