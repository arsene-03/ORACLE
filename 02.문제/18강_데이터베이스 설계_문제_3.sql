CREATE TABLE customer (
	customer_id	varchar2(30),
	customer_name nvarchar2(10) NOT NULL,
	customer_pwd varchar2(30) NOT NULl,
	customer_phone	number(30),
	customer_age	number(3),
	customer_gender	nvarchar2(3),
	customer_poin	number DEFAULT 0,
    customer_condition nvarchar2(2)
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

delete FROM borrowbook
Where borrow_id = 'borrow1';
-----------------------------------------------------------------------------------------

select * from favoritbook;
CREATE TABLE favoritbook(
borrow_id2 varchar2(30)
);
ALTER TABLE favoritbook
ADD modType nchar(2);

CREATE OR REPLACE TRIGGER trigger_favoritbook
    AFTER INSERT
    ON borrowbook
    FOR Each row
DECLARE
    b_modType NCHAR(2);    
BEGIN
    IF inserting THEN
        DBMS_OUTPUT.PUT_LINE('생성 트리거가 발생했습니다.');
        b_modType := '대여';
    END IF;
    INSERT INTO favoritbook
    VALUES(:new.borrow_id, b_modType
);
END;
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

ALTER TABLE borrowbook ADD CONSTRAINT customerLog_TO_borrowbook_FK FOREIGN KEY (
	customer_id2

)
REFERENCES customerLog (
	customer_id
);


ALTER TABLE borrowbook ADD CONSTRAINT book_TO_borrowbook_FK FOREIGN KEY (
	book_id2
)
REFERENCES book (
	book_id
)
on delete cascade;



ALTER TABLE favoritbook ADD CONSTRAINT borrowbook_TO_favoritbook_FK FOREIGN KEY (
	borrow_id2
)
REFERENCES borrowbook (
	borrow_id
)
on delete cascade;

ALTER TABLE bookReport ADD CONSTRAINT borrowbook_TO_bookReport_FK FOREIGN KEY (
	borrow_id2
)
REFERENCES borrowbook (
	borrow_id
);


commit;

