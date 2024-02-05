DROP TABLE "MEMBER" CASCADE CONSTRAINTS;
DROP TABLE CAR CASCADE CONSTRAINTS;
DROP TABLE "INVENTORY" CASCADE CONSTRAINTS;
DROP TABLE "CARNAME" CASCADE CONSTRAINTS;
DROP TABLE "CLASSIFICATION" CASCADE CONSTRAINTS;
DROP TABLE "DOCUMENT" CASCADE CONSTRAINTS;
DROP TABLE "TYPE_DOCUMENT" CASCADE CONSTRAINTS;
DROP TABLE "ITEM" CASCADE CONSTRAINTS;
DROP TABLE "CAR_FILE" CASCADE CONSTRAINTS;
DROP TABLE "MANAGEMENT" CASCADE CONSTRAINTS;
DROP TABLE "MYCAR" CASCADE CONSTRAINTS;
DROP TABLE "MYPART" CASCADE CONSTRAINTS;
DROP TABLE "DELOVERY" CASCADE CONSTRAINTS;
DROP TABLE "STOCK" CASCADE CONSTRAINTS;
DROP TABLE "EX_CAR" CASCADE CONSTRAINTS;

-------------------------- 회원 --------------------------
---------------------------------------------------------
CREATE TABLE "MEMBER" (
	"MEM_PHONE"	VARCHAR2(11)		NOT NULL    PRIMARY KEY,
	"MEM_EMAIL"	VARCHAR2(50)		NULL,
	"MEM_NAME"	VARCHAR2(30)		NOT NULL,
	"MEM_PWD"	VARCHAR2(3000)		NULL,
	"MEM_ROLE"	VARCHAR2(1)	        DEFAULT 'U' CHECK(MEM_ROLE IN ('U', 'R', 'D'))	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEM_PHONE" IS '전화번호';
COMMENT ON COLUMN "MEMBER"."MEM_EMAIL" IS '이메일';
COMMENT ON COLUMN "MEMBER"."MEM_NAME" IS '이름';
COMMENT ON COLUMN "MEMBER"."MEM_PWD" IS '비밀번호';
COMMENT ON COLUMN "MEMBER"."MEM_ROLE" IS '등급';

INSERT INTO "MEMBER" values('01077777777', 'admin@admin.com', '웹관리자', '$2a$10$zr82U9KRbC/WbP30Q3txtuBAKswdA1Aw3OQxZU.iidrdBhB0JPa0K', 'R');
INSERT INTO "MEMBER" values('01011111111', 'dealer1@admin.com', '딜러1', '$2a$10$zr82U9KRbC/WbP30Q3txtuBAKswdA1Aw3OQxZU.iidrdBhB0JPa0K', 'D');
INSERT INTO "MEMBER" values('01022222222', 'dealer2@admin.com', '딜러2', '$2a$10$zr82U9KRbC/WbP30Q3txtuBAKswdA1Aw3OQxZU.iidrdBhB0JPa0K', 'D');
INSERT INTO "MEMBER" values('01033333333', 'dealer3@admin.com', '딜러3', '$2a$10$zr82U9KRbC/WbP30Q3txtuBAKswdA1Aw3OQxZU.iidrdBhB0JPa0K', 'D');
INSERT INTO "MEMBER" values('01088888888', 'user1@gmail.com', '김철수', '$2a$10$zr82U9KRbC/WbP30Q3txtuBAKswdA1Aw3OQxZU.iidrdBhB0JPa0K', 'U');
-------------------------- 차 --------------------------
--------------------------------------------------------
CREATE TABLE "CAR" (
	"CAR_NUM"	    VARCHAR2(30)	NOT NULL    PRIMARY KEY,
	"MYCAR_NUM"	    NUMBER		    NOT NULL,
	"CAR_STATUS"	VARCHAR2(1)	    DEFAULT 'R' CHECK(CAR_STATUS IN ('R', 'A', 'Y', 'S', 'N'))	NOT NULL,
	"CAR_DATE"	    DATE		    NULL
);

COMMENT ON COLUMN "CAR"."CAR_NUM" IS '차대번호';
COMMENT ON COLUMN "CAR"."MYCAR_NUM" IS '견적번호';
COMMENT ON COLUMN "CAR"."CAR_STATUS" IS '차상태';
COMMENT ON COLUMN "CAR"."CAR_DATE" IS '수령날짜';

-------------------------- 부품재고 --------------------------
-------------------------------------------------------------
CREATE TABLE "INVENTORY" (
	"INVEN_CODE"	VARCHAR2(3000)	NOT NULL    PRIMARY KEY,
	"INVEN_NAME"	VARCHAR2(50)	NOT NULL,
	"INVEN_PAY"	    NUMBER		    NOT NULL,
	"INVEN_NUM"	    NUMBER		    NOT NULL,
	"INVEN_DATE"	DATE		    NOT NULL,
	"ITEM_CODE"	    VARCHAR2(2)		NOT NULL,
    "INVEN_PLUS_PAY"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "INVENTORY"."INVEN_CODE" IS '부품코드';
COMMENT ON COLUMN "INVENTORY"."INVEN_NAME" IS '부품명';
COMMENT ON COLUMN "INVENTORY"."INVEN_PAY" IS '부품가격';
COMMENT ON COLUMN "INVENTORY"."INVEN_NUM" IS '부품수';
COMMENT ON COLUMN "INVENTORY"."INVEN_DATE" IS '부품수변경일';
COMMENT ON COLUMN "INVENTORY"."ITEM_CODE" IS '품목코드';
COMMENT ON COLUMN "INVENTORY"."INVEN_PLUS_PAY" IS '추가가격';

INSERT INTO "INVENTORY" values('EN-G25T', '가솔린2.5T', 3000000, 10, SYSDATE, 'EN', 0);
INSERT INTO "INVENTORY" values('EN-G35T', '가솔린3.5T', 6600000, 10, SYSDATE, 'EN', 400000);
INSERT INTO "INVENTORY" values('EN-G48V', '가솔린3.5T-48V', 10800000, 10, SYSDATE, 'EN', 5000000);
INSERT INTO "INVENTORY" values('EN-EV00', '전기모터', 7800000, 10, SYSDATE, 'EN', 0);

INSERT INTO "INVENTORY" values('DV-2WD', '2WD', 2800000, 10, SYSDATE, 'DV', 0);
INSERT INTO "INVENTORY" values('DV-AWD', 'AWD', 4800000, 10, SYSDATE, 'DV', 4000000);
INSERT INTO "INVENTORY" values('DV-LSD', 'AWD-LSD', 6800000, 10, SYSDATE, 'DV', 0);

INSERT INTO "INVENTORY" values('CR-UYH', '우유니화이트', 1000000, 10, SYSDATE, 'CR', 0);
INSERT INTO "INVENTORY" values('CR-BRB', '브루클린블랙', 1000000, 10, SYSDATE, 'CR', 0);
INSERT INTO "INVENTORY" values('CR-SSS', '세빌실버', 1000000, 10, SYSDATE, 'CR', 0);
INSERT INTO "INVENTORY" values('CR-NCM', '마칼루그레이', 1000000, 10, SYSDATE, 'CR', 0);
INSERT INTO "INVENTORY" values('CR-URA', '태즈먼블루', 1000000, 10, SYSDATE, 'CR', 0);
INSERT INTO "INVENTORY" values('CR-MDY', '한라산그린', 1000000, 10, SYSDATE, 'CR', 0);
INSERT INTO "INVENTORY" values('CR-RLA', '캐번디시레드', 1000000, 10, SYSDATE, 'CR', 0);
INSERT INTO "INVENTORY" values('CR-PH3', '비크블랙', 1700000, 10, SYSDATE, 'CR', 800000);
INSERT INTO "INVENTORY" values('CR-NA3', '베르비에화이트', 1700000, 10, SYSDATE, 'CR', 800000);

INSERT INTO "INVENTORY" values('WH-18D', '18인치다이아', 1000000, 10, SYSDATE, 'WH', 0);
INSERT INTO "INVENTORY" values('WH-19H', '19인치하이퍼', 1700000, 10, SYSDATE, 'WH', 600000);
INSERT INTO "INVENTORY" values('WH-19D', '19인치다이아', 2000000, 10, SYSDATE, 'WH', 700000);
INSERT INTO "INVENTORY" values('WH-20S', '20인치스퍼터링', 2700000, 10, SYSDATE, 'WH', 800000);
INSERT INTO "INVENTORY" values('WH-20D', '20인치다이아', 3000000, 10, SYSDATE, 'WH', 900000);
INSERT INTO "INVENTORY" values('WH-22D', '22인치다이아', 3800000, 10, SYSDATE, 'WH', 100000);

INSERT INTO "INVENTORY" values('ID-BN', '옵시디언블랙모노톤', 1000000, 10, SYSDATE, 'ID', 0);
INSERT INTO "INVENTORY" values('ID-CN', '에크루카멜모노톤', 1000000, 10, SYSDATE, 'ID', 0);
INSERT INTO "INVENTORY" values('ID-GB', '에쉬그레이/바닐라베이지투톤', 3000000, 10, SYSDATE, 'ID', 700000);
INSERT INTO "INVENTORY" values('ID-BB', '마룬브라운/포레스트블루투톤', 3000000, 10, SYSDATE, 'ID', 700000);

INSERT INTO "INVENTORY" values('OP-SUN', '파노라마선루프', 1400000, 10, SYSDATE, 'OP', 400000);
INSERT INTO "INVENTORY" values('OP-HAD', '헤드업디스플레이', 1300000, 10, SYSDATE, 'OP', 500000);
INSERT INTO "INVENTORY" values('OP-MOR', '뒷자석듀얼모니터', 1000000, 10, SYSDATE, 'OP',800000);
INSERT INTO "INVENTORY" values('OP-DRA', '드라이빙어시스턴스패키지', 1950000, 10, SYSDATE, 'OP',1500000);
INSERT INTO "INVENTORY" values('OP-BAN', '뱅앤올룹슨사운드패키지', 1900000, 10, SYSDATE, 'OP',80000);
INSERT INTO "INVENTORY" values('OP-BIL', '빌트인캠패키지', 850000, 10, SYSDATE, 'OP',900000);

-------------------------- 차량 구분 --------------------------
--------------------------------------------------------------
CREATE TABLE "CLASSIFICATION" (
	"CLASS_CODE"	VARCHAR2(2)		NOT NULL    PRIMARY KEY,
	"CLASS_NAME"	VARCHAR2(15)	NOT NULL
);

COMMENT ON COLUMN "CLASSIFICATION"."CLASS_CODE" IS '차량코드';
COMMENT ON COLUMN "CLASSIFICATION"."CLASS_NAME" IS '코드명';

INSERT INTO CLASSIFICATION values('SD', '세단');
INSERT INTO CLASSIFICATION values('SV', 'SUV');
INSERT INTO CLASSIFICATION values('EV', '전기차');

-------------------------- 차량 이름 --------------------------
--------------------------------------------------------------
CREATE TABLE "CARNAME" (
	"CAR_NAME"	    VARCHAR2(30)	NOT NULL    PRIMARY KEY,
	"CLASS_CODE"	VARCHAR2(2)		NOT NULL,
	"FILE_NUM"	    NUMBER		    NOT NULL,
    "CAR_PRICE"	    NUMBER		    NOT NULL
);

COMMENT ON COLUMN "CARNAME"."CAR_NAME" IS '차량이름';
COMMENT ON COLUMN "CARNAME"."CLASS_CODE" IS '차량코드';
COMMENT ON COLUMN "CARNAME"."FILE_NUM" IS '첨부파일번호';
COMMENT ON COLUMN "CARNAME"."CAR_PRICE" IS '기본가격';

--INSERT INTO CARNAME values('G90', 'SD', 94450000, 1);
--INSERT INTO CARNAME values('G80', 'SD', 58900000, 2);
--INSERT INTO CARNAME values('G70', 'SD', 43470000, 3);

--INSERT INTO CARNAME values('GV80', 'SV', 69300000, 4);
--INSERT INTO CARNAME values('GV80COUPE', 'SV', 82550000, 5);
--INSERT INTO CARNAME values('GV70', 'SV', 50400000, 6);

--INSERT INTO CARNAME values('G80EV', 'EV', 93300000, 8);
--INSERT INTO CARNAME values('G70EV', 'EV', 73320000, 9);
--INSERT INTO CARNAME values('G60EV', 'EV', 63790000, 10);

-------------------------- 첨부파일 --------------------------
-------------------------------------------------------------
CREATE TABLE "CAR_FILE" (
	"FILE_NUM"	    NUMBER		    NOT NULL    PRIMARY KEY,
	"ORIGINAL_NAME"	VARCHAR2(300)	NOT NULL,
	"UPLOAD_NAME"	VARCHAR2(1000)	NOT NULL,
	"UPLOAD_DATE"	DATE		    NOT NULL
);

COMMENT ON COLUMN "CAR_FILE"."FILE_NUM" IS '첨부파일번호';
COMMENT ON COLUMN "CAR_FILE"."ORIGINAL_NAME" IS '파일원본명';
COMMENT ON COLUMN "CAR_FILE"."UPLOAD_NAME" IS '파일저장명';
COMMENT ON COLUMN "CAR_FILE"."UPLOAD_DATE" IS '업로드일';

--INSERT INTO CAR_FILE values(1, 'g90', 'g90', 'resources/images', SYSDATE);
--INSERT INTO CAR_FILE values(2, 'g80', 'g80', 'resources/images', SYSDATE);
--INSERT INTO CAR_FILE values(3, 'g70', 'g70', 'resources/images', SYSDATE);

--INSERT INTO CAR_FILE values(4, 'gv80', 'gv80', 'resources/images', SYSDATE);
--INSERT INTO CAR_FILE values(5, 'gv80_coupe', 'gv80_coupe', 'resources/images', SYSDATE);
--INSERT INTO CAR_FILE values(6, 'gv70', 'gv70', 'resources/images', SYSDATE);

--INSERT INTO CAR_FILE values(7, 'g80_ev', 'g80_ev', 'resources/images', SYSDATE);
--INSERT INTO CAR_FILE values(8, 'gv70_ev', 'gv70_ev', 'resources/images', SYSDATE);
--INSERT INTO CAR_FILE values(9, 'gv60_ev', 'gv60_ev', 'resources/images', SYSDATE);

-------------------------- 증빙서류 --------------------------
-------------------------------------------------------------
CREATE TABLE "DOCUMENT" (
	"DOCU_NUM"	    NUMBER		    NOT NULL    PRIMARY KEY,
	"CAR_NUM"	    VARCHAR2(15)	NOT NULL,
	"DOCU_TYPE"	    VARCHAR2(1)	    DEFAULT 'C' CHECK(DOCU_TYPE IN ('C', 'I', 'T'))	NOT NULL,
	"ORIGINAL_NAME"	VARCHAR2(30)	NOT NULL,
	"UPLOAD_NAME"	VARCHAR2(1000)	NOT NULL,
	"UPLOAD_DATE"	DATE		    NOT NULL
);

COMMENT ON COLUMN "DOCUMENT"."DOCU_NUM" IS '첨부파일번호';
COMMENT ON COLUMN "DOCUMENT"."CAR_NUM" IS '차대번호';
COMMENT ON COLUMN "DOCUMENT"."DOCU_TYPE" IS '서류코드';
COMMENT ON COLUMN "DOCUMENT"."ORIGINAL_NAME" IS '파일원본명';
COMMENT ON COLUMN "DOCUMENT"."UPLOAD_NAME" IS '파일저장명';
COMMENT ON COLUMN "DOCUMENT"."UPLOAD_DATE" IS '증빙일자';

-------------------------- 내차만들기(견적서) --------------------------
----------------------------------------------------------------------
CREATE TABLE "MYCAR" (
	"MYCAR_NUM"	    NUMBER		    NOT NULL    PRIMARY KEY,
	"CAR_NAME"	    VARCHAR2(30)	NOT NULL,
	"MYCAR_PHONE"	VARCHAR2(11)	NOT NULL,
	"MYCAR_DEALER"	VARCHAR2(11)	NOT NULL,
	"MYCAR_PRICE"	NUMBER		    NOT NULL,
	"MYCAR_DATE"	DATE		    NOT NULL
);

COMMENT ON COLUMN "MYCAR"."MYCAR_NUM" IS '견적번호';
COMMENT ON COLUMN "MYCAR"."CAR_NAME" IS '차량코드';
COMMENT ON COLUMN "MYCAR"."MYCAR_PHONE" IS '전화번호';
COMMENT ON COLUMN "MYCAR"."MYCAR_DEALER" IS '담당자번호';
COMMENT ON COLUMN "MYCAR"."MYCAR_PRICE" IS '견적가격';
COMMENT ON COLUMN "MYCAR"."MYCAR_DATE" IS '견적일';

-------------------------- 내차만들기 부품 --------------------------
-------------------------------------------------------------------
CREATE TABLE "MYPART" (
	"MYCAR_NUM"	    NUMBER		    NOT NULL,
	"INVEN_CODE"	VARCHAR2(3000)	NOT NULL,
    CONSTRAINT PK_MYPART PRIMARY KEY(MYCAR_NUM, INVEN_CODE)
);

COMMENT ON COLUMN "MYPART"."MYCAR_NUM" IS '견적번호';
COMMENT ON COLUMN "MYPART"."INVEN_CODE" IS '부품코드';

-------------------------- 품목관리 --------------------------
-------------------------------------------------------------
CREATE TABLE "MANAGEMENT" (
	"CAR_NAME"	VARCHAR2(30)		NOT NULL,
	"INVEN_CODE"	VARCHAR2(3000)		NOT NULL,
    CONSTRAINT MANAGEMENT PRIMARY KEY(CAR_NAME, INVEN_CODE)
);

COMMENT ON COLUMN "MANAGEMENT"."CAR_NAME" IS '차량이름';
COMMENT ON COLUMN "MANAGEMENT"."INVEN_CODE" IS '부품코드';

-------------------------- 서류종류 --------------------------
-------------------------------------------------------------
CREATE TABLE "TYPE_DOCUMENT" (
	"DOCU_TYPE"	VARCHAR2(1)	    DEFAULT 'C' CHECK(DOCU_TYPE IN ('C', 'I', 'T'))	NOT NULL    PRIMARY KEY,
	"DOCU_NAME"	VARCHAR2(30)	NOT NULL
);

COMMENT ON COLUMN "TYPE_DOCUMENT"."DOCU_TYPE" IS '서류코드';
COMMENT ON COLUMN "TYPE_DOCUMENT"."DOCU_NAME" IS '서류명';

INSERT INTO TYPE_DOCUMENT VALUES('C', '계약서');
INSERT INTO TYPE_DOCUMENT VALUES('I', '검수확인서');
INSERT INTO TYPE_DOCUMENT VALUES('T', '세금계산서');

-------------------------- 품목 --------------------------
---------------------------------------------------------
CREATE TABLE "ITEM" (
	"ITEM_CODE"	VARCHAR2(2)		NOT NULL    PRIMARY KEY,
	"ITEM_NAME"	VARCHAR2(30)	NOT NULL
);

COMMENT ON COLUMN "ITEM"."ITEM_CODE" IS '품목코드';
COMMENT ON COLUMN "ITEM"."ITEM_NAME" IS '품목명';

INSERT INTO ITEM values('EN', '엔진타입');
INSERT INTO ITEM values('DV', '구동타입');
INSERT INTO ITEM values('CR', '외장컬러');
INSERT INTO ITEM values('WH', '휠타이어');
INSERT INTO ITEM values('ID', '내장디자인');
INSERT INTO ITEM values('OP', '옵션');

-------------------------- 납품 --------------------------
------------------------------------------------------------
CREATE TABLE "DELOVERY" (
    "DELOVERY_PKNO"	NUMBER		    NOT NULL PRIMARY KEY,
	"INVEN_CODE"	VARCHAR2(20)	NOT NULL,
	"DELOVERY_NUM"	NUMBER		    NOT NULL,
	"DELOVERY_DATE"	DATE		    NOT NULL
);

COMMENT ON COLUMN "DELOVERY"."DELOVERY_PKNO" IS '납퓸번호';
COMMENT ON COLUMN "DELOVERY"."INVEN_CODE" IS '부품코드';
COMMENT ON COLUMN "DELOVERY"."DELOVERY_NUM" IS '변경수';
COMMENT ON COLUMN "DELOVERY"."DELOVERY_DATE" IS '변경일';

-------------------------- 입고 --------------------------
----------------------------------------------------------
CREATE TABLE "STOCK" (
    "STOCK_PKNO"	NUMBER		    NOT NULL PRIMARY KEY,
	"INVEN_CODE"	VARCHAR2(20)	NOT NULL,
	"STOCK_NUM"	    NUMBER		    NOT NULL,
	"STOCK_DATE"	DATE		    NOT NULL
);

COMMENT ON COLUMN "STOCK"."STOCK_PKNO" IS '입고번호';
COMMENT ON COLUMN "STOCK"."INVEN_CODE" IS '부품코드';
COMMENT ON COLUMN "STOCK"."STOCK_NUM" IS '변경수';
COMMENT ON COLUMN "STOCK"."STOCK_DATE" IS '변경일';

-------------------------- 내차만들기 --------------------------
----------------------------------------------------------
CREATE TABLE "EX_CAR" (
	"EX_NUM"	    NUMBER	NOT NULL  PRIMARY KEY,
	"CAR_NAME"	    VARCHAR2(30)	NOT NULL,
	"EX_INVEN"	    VARCHAR2(3000)	NOT NULL,
	"EX_PRICE"	    NUMBER		    NOT NULL,
	"MEMBER_PHONE"	VARCHAR2(11)	NOT NULL,
	"DEALER_PHONE"	VARCHAR2(11)	NOT NULL,
    "EX_DATE"       DATE            NOT NULL
);

COMMENT ON COLUMN "EX_CAR"."EX_NUM" IS '내차번호';
COMMENT ON COLUMN "EX_CAR"."CAR_NAME" IS '차량이름';
COMMENT ON COLUMN "EX_CAR"."EX_INVEN" IS '부품종류';
COMMENT ON COLUMN "EX_CAR"."EX_PRICE" IS '견적가격';
COMMENT ON COLUMN "EX_CAR"."MEMBER_PHONE" IS '구매자전화번호';
COMMENT ON COLUMN "EX_CAR"."DEALER_PHONE" IS '딜러전화번호';
COMMENT ON COLUMN "EX_CAR"."EX_DATE" IS '견적날짜';

-------------------------- PK, FK --------------------------
------------------------------------------------------------
--ALTER TABLE [FK를 생성시킬 테이블명]
--ADD CONSTRAINT [FK명] foreign KEY(FK가 될 컬럼명) references [PK가 위치하는 테이블] ([PK컬럼명]);
ALTER TABLE EX_CAR
ADD CONSTRAINT FK_EX_CAR_NAME FOREIGN KEY(CAR_NAME) REFERENCES CARNAME (CAR_NAME);

ALTER TABLE EX_CAR
ADD CONSTRAINT FK_DEALER_PHONE FOREIGN KEY(DEALER_PHONE) REFERENCES MEMBER (MEM_PHONE);

ALTER TABLE DELOVERY
ADD CONSTRAINT FK_INVEN_CODE FOREIGN KEY(INVEN_CODE) REFERENCES INVENTORY (INVEN_CODE);

ALTER TABLE STOCK
ADD CONSTRAINT FK_INVEN_CODE_STOCK FOREIGN KEY(INVEN_CODE) REFERENCES INVENTORY (INVEN_CODE);

ALTER TABLE CAR
ADD CONSTRAINT FK_MYCAR_NUM FOREIGN KEY(MYCAR_NUM) REFERENCES MYCAR (MYCAR_NUM) ;

ALTER TABLE "MYCAR"
ADD CONSTRAINT FK_CAR_NAME FOREIGN KEY(CAR_NAME) REFERENCES CARNAME (CAR_NAME);

ALTER TABLE "MYCAR"
ADD CONSTRAINT FK_MYCAR_PHONE FOREIGN KEY(MYCAR_PHONE) REFERENCES "MEMBER" (MEM_PHONE);

ALTER TABLE "MYCAR"
ADD CONSTRAINT FK_MYCAR_DEALER FOREIGN KEY(MYCAR_DEALER) REFERENCES "MEMBER" (MEM_PHONE);

ALTER TABLE "DOCUMENT"
ADD CONSTRAINT FK_CAR_NUM FOREIGN KEY(CAR_NUM) REFERENCES CAR (CAR_NUM);

ALTER TABLE "DOCUMENT"
ADD CONSTRAINT FK_DOCU_TYPE FOREIGN KEY(DOCU_TYPE) REFERENCES TYPE_DOCUMENT (DOCU_TYPE);

ALTER TABLE CARNAME
ADD CONSTRAINT FK_CLASS_CODE FOREIGN KEY(CLASS_CODE) REFERENCES "CLASSIFICATION" (CLASS_CODE);

ALTER TABLE CARNAME
ADD CONSTRAINT FK_FILE_NUM FOREIGN KEY(FILE_NUM) REFERENCES CAR_FILE (FILE_NUM);

-------------------------- 시퀀스 --------------------------
-----------------------------------------------------------
DROP SEQUENCE SEQ_FILE_NUM;
DROP SEQUENCE SEQ_MYCAR_NUM; 
DROP SEQUENCE SEQ_DOCU_NUM;
DROP SEQUENCE SEQ_STOCK_PKNO;
DROP SEQUENCE SEQ_DELOVERY_PKNO;
DROP SEQUENCE SEQ_EX_NUM;
DROP SEQUENCE SEQ_CAR_NUM;
 
CREATE SEQUENCE SEQ_FILE_NUM; 
CREATE SEQUENCE SEQ_MYCAR_NUM;
CREATE SEQUENCE SEQ_DOCU_NUM;
CREATE SEQUENCE SEQ_STOCK_PKNO;
CREATE SEQUENCE SEQ_DELOVERY_PKNO;
CREATE SEQUENCE SEQ_EX_NUM;
CREATE SEQUENCE SEQ_CAR_NUM;

commit;

--------------------------------------------------------------
--------------------------------------------------------------
update INVENTORY
set INVEN_NUM = (INVEN_NUM+1)
where INVEN_CODE = 'EN-G25T';


SELECT
    INVENTORY.INVEN_CODE,
    INVEN_NAME,
    INVEN_PAY,
    INVEN_NUM,
    COALESCE(STOCK.TOTAL_STOCK_NUM, 0) AS TOTAL_STOCK_NUM,
    COALESCE(DELOVERY.TOTAL_DELOVERY_NUM, 0) AS TOTAL_DELOVERY_NUM,
    INVEN_DATE,
    ITEM_CODE,
    ITEM_NAME,
    (INVEN_NUM + COALESCE(STOCK.TOTAL_STOCK_NUM, 0) - COALESCE(DELOVERY.TOTAL_DELOVERY_NUM, 0)) AS final_Num
FROM INVENTORY
JOIN ITEM USING (ITEM_CODE)
LEFT JOIN (SELECT INVEN_CODE,
                  COALESCE(SUM(STOCK_NUM), 0) AS TOTAL_STOCK_NUM
             FROM STOCK
            GROUP BY INVEN_CODE) STOCK ON STOCK.INVEN_CODE = INVENTORY.INVEN_CODE
LEFT JOIN (SELECT INVEN_CODE,
                  COALESCE(SUM(DELOVERY_NUM), 0) AS TOTAL_DELOVERY_NUM
             FROM DELOVERY
            GROUP BY INVEN_CODE) DELOVERY ON DELOVERY.INVEN_CODE = INVENTORY.INVEN_CODE;