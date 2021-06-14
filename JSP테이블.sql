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

CREATE TABLE cafeMenu(
    coffeeName VARCHAR2(30) PRIMARY KEY,
    tall NUMBER(30),
    grande NUMBER(30),
    venti NUMBER(30)
);

INSERT INTO cafeMenu
VALUES ('dolceLatte',5600,6100,6600);
INSERT INTO cafeMenu
VALUES ('whiteChocoMocha',5600,6100,6600);
INSERT INTO cafeMenu
VALUES ('cafeMocha', 5100,5600,6100);
INSERT INTO cafeMenu
VALUES ('cafeLatte', 4600,5100,5600);
INSERT INTO cafeMenu
VALUES ('americano', 4100,4600,5100);
INSERT INTO cafeMenu
VALUES ('todaycoffee', 3800,4300,4800);
INSERT INTO cafeMenu
VALUES ('bvdm', 5600,6100,6600);

select * FROM cafeMenu;
    
COMMIT;