CREATE TABLE member(
    name varchar2(10) primary key,
    userId varchar2(10),
    userPwd varchar2 (10),
    email varchar2(20),
    phone char(13),
    admin NUMBER(1) DEFAULT 0 --0: 사용자, 1: 관리자
);

INSERT INTO member 
VALUES ('고길동', 'ko', '1234', 'ko@naver.com', '010-1234-5678', 0);

INSERT INTO member 
VALUES ('박길동', 'park', '1234', 'park@naver.com', '010-1234-5678', 0);

INSERT INTO member 
VALUES ('이길동', 'lee', '1234', 'lee@naver.com', '010-1234-5678', 1);

INSERT INTO member 
VALUES ('장길동', 'jang', '1234', 'jang@naver.com', '010-1234-5678', 0);

INSERT INTO member 
VALUES ('홍길동', 'hong', '1234', 'hong@naver.com', '010-1234-5678', 0);

SELECT * FROM member;



-- 카페 주문 프로그램 가격표

CREATE TABLE coffeeMenu(
    coffeeCode Number PRIMARY KEY,
    coffeeName NVARCHAR2(100) NOT NULL,
    coffeeType NVARCHAR2(10) NOT NULL,
    coffeePrice NUMBER NOT NULL
);

create SEQUENCE coffee_seq
NOCACHE;

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'돌체 라떼','톨',5600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'돌체 라떼','그란데',6100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'돌체 라떼','벤티',6600);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'화이트 초콜릿 모카','톨',5600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'화이트 초콜릿 모카','그란데',6100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'화이트 초콜릿 모카','벤티',6600);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'카페 모카','톨',5100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'카페 모카','그란데',5600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'카페 모카','벤티',6100);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'카페 라떼','톨',4600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'카페 라떼','그란데',5100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'카페 라떼','벤티',5600);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'아메리카노','톨',4100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'아메리카노','그란데',4600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'아메리카노','벤티',5100);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'오늘의 커피','톨',3800);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'오늘의 커피','그란데',4300);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'오늘의 커피','벤티',4800);

INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'블론드 바닐라 더블샷 마키야또','톨',5600);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'블론드 바닐라 더블샷 마키야또','그란데',6100);
INSERT INTO coffeeMenu
VALUES (coffee_seq.nextval,'블론드 바닐라 더블샷 마키야또','벤티',6600);

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
VALUES (product_seq.nextval,'파이썬 데이터 사이언스 핸드북',34200,'01_python.jpg','파이썬을 활용한 데이터 과학 입문서');

INSERT INTO productTbl
VALUES (product_seq.nextval,'코틀린을 활용한 안드로이드 프로그래밍',34000,'02_android.jpg','코틀린 언어를 통한 안드로이드 개발서');

INSERT INTO productTbl
VALUES (product_seq.nextval,'Node.js 교과서',32400,'03_nodejs.jpg','기본기에 충실한 노드.js 학습서');

INSERT INTO productTbl
VALUES (product_seq.nextval,'자바 웹을 다루는 기술',40500,'04_javaWebBook.jpg','JSP,서블릿,스프링까지 실무에 알아야 할 기술서');

INSERT INTO productTbl
VALUES (product_seq.nextval,'토비의 스프링 3.1',67500,'05_spring.jpg','스프링의 원리와 이해를 충실히 가르쳐줄 교과서');

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
VALUES (board_seq.nextval,'홍길동','hong@naver.com','1234','첫 방문','왔다 갑니다.');

INSERT INTO board(num,name,email,pass,title,content)
VALUES (board_seq.nextval,'김길동','kimk@naver.com','1234','반가워요','대출은 000-0000-0000으로.');

INSERT INTO board(num,name,email,pass,title,content)
VALUES (board_seq.nextval,'고길동','ko@naver.com','1234','안녕하세요','건강하시죠.');

INSERT INTO board(num,name,email,pass,title,content)
VALUES (board_seq.nextval,'홍길동','hong@naver.com','1234','두번째 방문','이제 이것은 제겁니다.');

INSERT INTO board(num,name,email,pass,title,content)
VALUES (board_seq.nextval,'박길동','park@naver.com','1234','밥먹음?','치킨먹자.');

SELECT * FROM board;


COMMIT;