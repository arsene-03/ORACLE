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

DELETE FROM tb1 t WHERE t.col1.x = 10

UPDATE