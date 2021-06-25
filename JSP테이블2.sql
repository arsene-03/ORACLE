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

DELETE FROM tb1 t WHERE t.col1.x = 10

UPDATE