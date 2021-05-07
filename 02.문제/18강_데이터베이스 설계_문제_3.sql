CREATE TABLE customer (
	customer_id	varchar2(30),
	customer_name nvarchar2(10) NOT NULL,
	customer_pwd varchar2(30) NOT NULl,
	customer_phone	number(30),
	customer_age	number(3),
	customer_gender	nvarchar2(3),
	customer_poin	number DEFAULT 0
);

ALTER TABLE customer 
ADD CONSTRAINT customer_pk PRIMARY KEY (customer_id);

INSERT INTO customer 
VALUES ('gkrwnsvb','최학준','dbswns03','','','','');

select * from customer;
----------------------------------------------------------------

CREATE TABLE book (
	book_id	varchar2(30),
	book_name nvarchar2(30)NOT NULL,
	book_pubdate date,
	book_publiser nvarchar2(30),
	book_author nvarchar2(10)NOT NULL
);
ALTER TABLE book 
ADD CONSTRAINT book_pk PRIMARY KEY (book_id);

CREATE SEQUENCE seq_book_id;

INSERT INTO book
VALUES('book'||seq_book_id.nextval,'연금술사',to_date('2001-12-01'),'문학동네','파울로 코엘료');

select * from book;

----------------------------------------------------------------------------------------


CREATE TABLE borrowbook (
	customer_id	varchar2(30),
	book_id	varchar2(30),
	borrow_date	date,
	borrow_dateslip	date
);
ALTER TABLE borrowbook
ADD CONSTRAINT borrowbook_customer_id_fk FOREIGN KEY (customer_id)
REFERENCES customer(customer_id);

ALTER TABLE borrowbook
ADD CONSTRAINT borrowbook_book_id_fk FOREIGN KEY (book_id)
REFERENCES book(book_id);

INSERT INTO borrowbook 
VALUES ('gkrwnsvb','book2',to_date(sysdate),to_date(sysdate)+7);

select * from borrowbook;

delete 

CREATE TABLE "favorite" (
	"book_id"	varchar(100)		NOT NULL
);

CREATE TABLE "report" (
	"book_id"	varchar(100)		NOT NULL,
	"customer_id2"	varchar(100)		NOT NULL,
	"report_text"	nclob		NULL
);

CREATE TABLE "del_customer" (
	"customer_id"	varchar(100)		NULL,
	"delcustomer_name"	nvarchar(10)		NOT NULL,
	"customer_pwd"	varchar(100)		NOT NULL,
	"customer_phone"	number		NULL,
	"customer_age"	number(3)		NULL,
	"customer_gender"	varchar(3)		NULL,
	"customer_point"	number(100)		NULL
);



CREATE TABLE "del_book" (
	"book_id"	varchar(100)		NOT NULL,
	"book_name"	varchar(100)		NULL,
	"book_pubdate"	date		NULL,
	"book_publiser"	varchar(100)		NULL,
	"book_author"	varchar(10)		NULL
);



ALTER TABLE "borrowbook" ADD CONSTRAINT "PK_BORROWBOOK" PRIMARY KEY (
	"customer_id",
	"book_id"
);

ALTER TABLE "favorite" ADD CONSTRAINT "PK_FAVORITE" PRIMARY KEY (
	"book_id"
);

ALTER TABLE "report" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"book_id"
);

ALTER TABLE "book" ADD CONSTRAINT "PK_BOOK" PRIMARY KEY (
	"book_id"
);



ALTER TABLE "favorite" ADD CONSTRAINT "FK_borrowbook_TO_favorite_1" FOREIGN KEY (
	"book_id"
)
REFERENCES "borrowbook" (
	"book_id"
);

ALTER TABLE "report" ADD CONSTRAINT "FK_borrowbook_TO_report_1" FOREIGN KEY (
	"book_id"
)
REFERENCES "borrowbook" (
	"book_id"
);
