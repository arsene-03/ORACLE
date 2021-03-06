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
VALUES (board_seq2.nextval,'김회원','정보처리 산업기사 쉽다','jsp 쉽네요','2018-07-31 12:34:56');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'김회원','웹 디자인 기능사 어렵다','jquery 어렵네요','2018-07-31 12:43:43');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'이회원','정보처리 산업기사 어렵다','jsp 어렵네요','2018-08-01 13:34:56');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'이회원','정보처리 산업기사 쉽다','jquery 쉽네요','2018-08-01 13:43:34');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'박회원','ㅈㄱㄴ','제목 그대로 내용','2018-08-02 13:12:10');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'박회원','제목 그대로 내용','ㅈㄱㄴ','2018-08-03 14:34:20');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'강회원','하드코딩하는 사람들','가입하면 좋음','2018-08-04 14:56:30');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'나회원','github를 사용합시다','신세계','2018-08-05 15:43:35');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'문회원','노는 게 제일좋아','모두들 모여라','2018-08-06 16:21:40');

INSERT INTO board_tbl
VALUES (board_seq2.nextval,'지회원','여름아','부탁해','2018-08-07 17:01:45');

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
VALUES (comment_seq.nextval,'1','김회원','Lorem ipsum dolor sit amet','2018-08-01 12:34:56');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'3','김회원','Lorem ipsum dolor sit amet','2018-08-01 12:43:43');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'5','이회원','Lorem ipsum dolor sit amet','2018-08-02 13:34:56');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'7','이회원','consectetur adipisicing elit','2018-08-03 13:43:34');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'9','박회원','Fugit itaque magnam cupiditate','2018-08-04 13:12:10');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'2','박회원','blanditiis totam vel officiis','2018-08-04 14:34:20');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'3','강회원','eveniet velit ea veniam provident','2018-08-05 14:56:30');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'5','나회원','maxime sequi laborum adipisci','2018-08-06 15:43:35');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'7','문회원','atque necessitatibus qui','2018-08-07 16:21:40');

INSERT INTO comment_tbl
VALUES (comment_seq.nextval,'2','지회원','doloremque repellat','2018-08-07 17:01:45');

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
--수강신청 프로그램 DB--

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
VALUES (10001,'프로그래밍',2,'1',1,0900,1100);

INSERT INTO course_tbl 
VALUES (10002,'객체지향 프로그래밍',2,'2',2,0900,1200);

INSERT INTO course_tbl 
VALUES (10003,'자료구조',3,'4',3,0900,1200);

INSERT INTO course_tbl 
VALUES (10004,'알고리즘',3,'4',4,0900,1200);

INSERT INTO course_tbl 
VALUES (20001,'시스템 프로그래밍',2,'5',1,1300,1600);

INSERT INTO course_tbl 
VALUES (20002,'운영체제',3,'5',2,1500,1800);

INSERT INTO course_tbl 
VALUES (20003,'오토마타와 컴파일러',3,'5',3,1330,1630);

INSERT INTO course_tbl 
VALUES (30001,'소프트웨어 공학',2,'3',4,1330,1530);

INSERT INTO course_tbl 
VALUES (30002,'시스템 분석 및 설계',3,'3',5,0900,1200);

INSERT INTO course_tbl 
VALUES (40001,'데이터베이스',3,'2',5,1300,1600);


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
VALUES (lecturer_seq.nextval,'김교수','소프트웨어공학','알고리즘');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'이교수','소프트웨어공학','인공지능');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'박교수','소프트웨어공학','소프트웨어공학');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'우교수','소프트웨어공학','알고리즘');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'최교수','응용컴퓨터공학','임베디드 시스템');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'강교수','응용컴퓨터공학','멀티미디어');

INSERT INTO lecturer_tbl 
VALUES (lecturer_seq.nextval,'황교수','모바일시스템공학','네트워크');




SELECT * FROM course_tbl;
SELECT * FROM lecturer_tbl;

SELECT c.id,c.name,c.credit,l.name AS lname,c.week,c.start_hour,c.end_hour
FROM course_tbl c, lecturer_tbl l
Where c.lecturer = l.idx
ORDER BY c.id ASC;

SELECT idx FROM lecturer_tbl 
WHERE name= '김교수';

drop table course_tbl;
drop table lecturer_tbl;
drop SEQUENCE lecturer_seq;


COMMIT;

---------------------------------------------------------------------------------

CREATE TABLE MemberTest(
    userID VARCHAR2(10) PRIMARY KEY,
    userName VARCHAR2(10),
    usePwd VARCHAR2(10)
);

INSERT INTO MemberTest
VALUES('gkrwnsvb','최학준','1234');

SELECT * FROM MemberTest;

commit;