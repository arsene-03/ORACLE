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

delete FROM customer WHERE customer_id='gkrwnsvb';

INSERT INTO customer 
VALUES ('gkrwnsvk','최학준2','dbswns03','','','','');
select * from customer;
DROP TABLE customer;

delete FROM customer WHERE customer_id='gkrwnsvb';
----------------------------------------------------------
CREATE TABLE customerLog
AS SELECT * FROM customer;

ALTER TABLE customerLog
ADD modType nchar(2);

CREATE OR REPLACE TRIGGER trigger_customer
    AFTER DELETE
    ON customer
    FOR Each row
DECLARE
    v_modType NCHAR(2);    
BEGIN
    IF updating THEN
        DBMS_OUTPUT.PUT_LINE('업데이트 트리거가 발생했습니다.');
        v_modType := '수정';
    ELSIF deleting THEN
        DBMS_OUTPUT.PUT_LINE('삭제 트리거가 발생했습니다.');
        v_modType := '삭제';
    ELSIF inserting THEN
        DBMS_OUTPUT.PUT_LINE('생성 트리거가 발생했습니다.');
        v_modType := '생성';
    END IF;
    INSERT INTO customerLog
    VALUES(:old.customer_id, :old.customer_name, :old.customer_pwd,
           :old.customer_phone, :old.customer_age, :old.customer_gender,
           :old.customer_poin, v_modType
);
END;
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

CREATE TABLE bookLog
AS SELECT * FROM book;

ALTER TABLE bookLog
ADD modType nchar(2);

CREATE OR REPLACE TRIGGER trigger_book
    AFTER DELETE
    ON book
    FOR Each row
DECLARE
    b_modType NCHAR(2);    
BEGIN
    IF updating THEN
        DBMS_OUTPUT.PUT_LINE('업데이트 트리거가 발생했습니다.');
        b_modType := '수정';
    ELSIF deleting THEN
        DBMS_OUTPUT.PUT_LINE('삭제 트리거가 발생했습니다.');
        b_modType := '삭제';
    ELSIF inserting THEN
        DBMS_OUTPUT.PUT_LINE('생성 트리거가 발생했습니다.');
        b_modType := '생성';
    END IF;
    INSERT INTO customerLog
    VALUES(:old.book_id, :old.book_name, :old.book_pubdate,
           :old.book_publiser, :old.book_author, b_modType
);
END;

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

delete FROM borrowbook WHERE customer_id2='gkrwnsvb';
-----------------------------------------------------------------------------------------


CREATE TABLE favoritBook(
    borrow_id3 varchar2(30) not null
);

INSERT INTO favoritBook
VALUES ('borrow1');

select * FROM favoritBook;

delete FROM favoritBook WHERE borrow_id3= 'borrow1';
-------------------------------------------------------------------------------------------
CREATE TABLE bookReport (
	borrow_id2 varchar2(30),
	report_text	NCLOB
);

INSERT INTO bookReport
VALUES ('borrow1','이책은 재미있다.');

select * FROM bookReport;

delete FROM bookReport WHERE borrow_id2= 'borrow1';


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
)
on delete cascade;

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

