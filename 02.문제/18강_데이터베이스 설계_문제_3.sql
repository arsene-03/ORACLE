CREATE TABLE customer (
	customer_id	varchar2(30),
	customer_name nvarchar2(10) NOT NULL,
	customer_pwd varchar2(30) NOT NULl,
	customer_phone	number(30),
	customer_age	number(3),
	customer_gender	nvarchar2(3),
	customer_poin	number DEFAULT 0
);

INSERT INTO customer 
VALUES ('gkrwnsvb','최학준','dbswns03','','','','');

select * from customer;
DROP TABLE customer;
----------------------------------------------------------------

CREATE TABLE book (
	book_id	varchar2(30),
	book_name nvarchar2(30)NOT NULL,
	book_pubdate date,
	book_publiser nvarchar2(30),
	book_author nvarchar2(10)NOT NULL
);

CREATE SEQUENCE seq_book_id;

INSERT INTO book
VALUES('book'||seq_book_id.nextval,'연금술사',to_date('2001-12-01'),'문학동네','파울로 코엘료');

select * from book;

----------------------------------------------------------------------------------------


CREATE TABLE borrowbook (
	borrow_id varchar2(30),
    customer_id2	varchar2(30),
	book_id2	varchar2(30),
	borrow_date	date,
	borrow_dateslip	date
);
CREATE SEQUENCE seq_borrowbook_id;

INSERT INTO borrowbook 
VALUES ('borrow'||seq_borrowbook_id.nextval,'gkrwnsvb','book2',to_date(sysdate),to_date(sysdate)+7);

select * from borrowbook;

-----------------------------------------------------------------------------------------


CREATE TABLE favoritBook(
    borrow_id3 varchar2(30) not null
);

INSERT INTO favoritBook
VALUES ('borrow1');

select * FROM favoritBook;

-------------------------------------------------------------------------------------------
CREATE TABLE bookReport (
	borrow_id2 varchar2(30),
	report_text	NCLOB
);

INSERT INTO bookReport
VALUES ('borrow1','이책은 재미있다.');

select * FROM bookReport;

----------------제약조건설정--------------------------------
ALTER TABLE customer ADD CONSTRAINT CUSTOMER_PK PRIMARY KEY (
	customer_id
);

ALTER TABLE book ADD CONSTRAINT BOOK_PK PRIMARY KEY (
	book_id
);

ALTER TABLE borrowbook ADD CONSTRAINT BORROWBOOK_PK PRIMARY KEY (
	borrow_id
);

ALTER TABLE borrowbook ADD CONSTRAINT customer_TO_borrowbook_FK FOREIGN KEY (
	customer_id2
)
REFERENCES customer (
	customer_id
);

ALTER TABLE borrowbook ADD CONSTRAINT book_TO_borrowbook_FK FOREIGN KEY (
	book_id2
)
REFERENCES book (
	book_id
);

ALTER TABLE favoritBook ADD CONSTRAINT borrowbook_TO_favoritBook_FK FOREIGN KEY (
	borrow_id3
)
REFERENCES borrowbook (
	borrow_id
);

ALTER TABLE bookReport ADD CONSTRAINT borrowbook_TO_bookReport_FK FOREIGN KEY (
	borrow_id2
)
REFERENCES borrowbook (
	borrow_id
);

commit;


