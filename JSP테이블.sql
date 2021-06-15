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