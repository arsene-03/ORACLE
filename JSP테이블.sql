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

INSERT INTO board(num,name,email,pass,title,content)
VALUES (board_seq.nextval,'박길동','park@naver.com','1234','밥먹음?','치킨먹자.');

DECLARE
BEGIN
    for i in 1..483 LOOP
    INSERT INTO board(num,name,email,pass,title,content)
    VALUES (board_seq.nextval,'테스트'||i,'test'||i||'@naver.com','1234','테스트'||i,'테스트'||i||' : TEST'||i);    
    END LOOP;
END;
COMMIT;

---------------------------------------------------------
-- ROWNUM (행번호)
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
VALUES ('movie_'||movie_seq.nextVal,'콰이어트 플레이스2','존 크래신스키','에밀리 블런트',12000,'실체를 알 수 없는 괴생명체의 공격으로 일상의 모든 것이 사라진 세상, 아이들 대신 죽음을 선택한 아빠의 희생 이후 살아남은 가족들은 위험에 노출된다.',8.82,'gkrwnsvb','123','movie01_image.jpg');

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
VALUES (member_seq.nextval,'김행복','010-1111-2222','서울 동대문구 휘경1동','20151202','A','01');

INSERT INTO member_tbl_02
VALUES (member_seq.nextval,'이축복','010-1111-3333','서울 동대문구 휘경2동','20151206','B','01');

INSERT INTO member_tbl_02
VALUES (member_seq.nextval,'장믿음','010-1111-4444','울릉군 울릉읍 독도1리','20151001','B','30');

INSERT INTO member_tbl_02
VALUES (member_seq.nextval,'최사랑','010-1111-5555','울릉군 울릉읍 독도2리','20151113','A','30');

INSERT INTO member_tbl_02
VALUES (member_seq.nextval,'진평화','010-1111-6666','제주도 제주시 외나무골','20151225','B','60');

INSERT INTO member_tbl_02
VALUES (member_seq.nextval,'김행복','010-1111-7777','제주도 제주시 감나무골','20151211','C','60');

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
--투표 프로그램--
CREATE TABLE TBL_VOTE_202005(
    V_JUMIN CHAR(13) PRIMARY KEY,
    V_NAME VARCHAR2(20),
    M_NO CHAR(1),
    V_TIME CHAR(4),
    V_AREA CHAR(20),
    V_CONFIRM CHAR(1)
);

INSERT INTO TBL_VOTE_202005
VALUES('99010110001','김유권','1','0930','제1투표장','N');

INSERT INTO TBL_VOTE_202005
VALUES('89010120002','이유권','2','0930','제1투표장','N');

INSERT INTO TBL_VOTE_202005
VALUES('69010110003','박유권','3','0930','제1투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('59010120004','홍유권','4','0930','제1투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010110005','조유권','5','0930','제1투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('89010120006','최유권','1','0930','제1투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('59010110007','지유권','1','0930','제1투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('49010120008','장유권','3','0930','제1투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010110009','정유권','3','0930','제1투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('89010120010','강유권','4','0930','제1투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('99010110011','신유권','5','0930','제1투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010120012','오유권','1','1330','제1투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('69010110013','현유권','4','1330','제2투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('89010110014','왕유권','2','1330','제2투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('99010110015','유유권','3','1330','제2투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010110016','한유권','2','1330','제2투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('89010110017','문유권','4','1330','제2투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('99010110018','양유권','2','1330','제2투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('99010110019','구유권','4','1330','제2투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010110020','황유권','5','1330','제2투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('69010110021','배유권','3','1330','제2투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('79010110022','전유권','3','1330','제2투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('99010110023','고유권','1','1330','제2투표장','Y');

INSERT INTO TBL_VOTE_202005
VALUES('59010120024','권유권','3','1330','제2투표장','Y');


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
VALUES ('1','김후보','P1','1','6603011999991','수선화동');

INSERT INTO TBL_MEMBER_202005
VALUES ('2','이후보','P2','3','5503011999992','민들래동');

INSERT INTO TBL_MEMBER_202005
VALUES ('3','박후보','P3','2','7703011999993','나팔꽃동');

INSERT INTO TBL_MEMBER_202005
VALUES ('4','조후보','P4','2','8803011999994','진달래동');

INSERT INTO TBL_MEMBER_202005
VALUES ('5','최후보','P5','3','9903011999995','개나리동');


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
VALUES ('P1','A정당','2010-01-01','위대표','02','1111','0001');

INSERT INTO TBL_PARTY_202005
VALUES ('P2','B정당','2010-02-01','명대표','02','1111','0002');

INSERT INTO TBL_PARTY_202005
VALUES ('P3','C정당','2010-03-01','기대표','02','1111','0003');

INSERT INTO TBL_PARTY_202005
VALUES ('P4','D정당','2010-04-01','옥대표','02','1111','0004');

INSERT INTO TBL_PARTY_202005
VALUES ('P5','E정당','2010-05-01','임대표','02','1111','0005');


SELECT * FROM TBL_VOTE_202005;
SELECT * FROM TBL_MEMBER_202005;
SELECT * FROM TBL_PARTY_202005;

SELECT M_NO,M_NAME,P_CODE,P_SCHOOL,M_JUMIN,M_CITY,P_TEL1,P_TEL2,P_TEL3
FROM TBL_MEMBER_202005 NATURAL JOIN TBL_PARTY_202005
WHERE  P_CODE = P_CODE;
commit;