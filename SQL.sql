DROP TABLE "MEMBER";
DROP TABLE "CAR";
DROP TABLE "INVENTORY";
DROP TABLE "PART";
DROP TABLE "CARNAME";
DROP TABLE "CLASSIFICATION";
DROP TABLE "DOCUMENT";
DROP TABLE "TYPE_DOCUMENT";
DROP TABLE "ITEM";
DROP TABLE "CAR_FILE";

-------------------------- 회원 --------------------------
---------------------------------------------------------
CREATE TABLE "MEMBER" (
	"MEM_PHONE"	VARCHAR2(11)		NOT NULL,
	"MEM_EMAIL"	VARCHAR2(50)		NOT NULL,
	"MEM_NAME"	VARCHAR2(30)		NOT NULL,
	"MEM_PWD"	VARCHAR2(3000)		NOT NULL,
	"MEM_ROLE"	VARCHAR2(1)	DEFAULT 'U' CHECK(MEM_ROLE IN ( 'U', 'R', 'D'))	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEM_PHONE" IS '전화번호';
COMMENT ON COLUMN "MEMBER"."MEM_EMAIL" IS '이메일';
COMMENT ON COLUMN "MEMBER"."MEM_NAME" IS '이름';
COMMENT ON COLUMN "MEMBER"."MEM_PWD" IS '비밀번호';
COMMENT ON COLUMN "MEMBER"."MEM_ROLE" IS '등급';

-------------------------- 차 --------------------------
--------------------------------------------------------
CREATE TABLE "CAR" (
	"CAR_NUM"	    VARCHAR2(15)	NOT NULL,
	"MEM_PHONE"	    VARCHAR2(11)	NOT NULL,
	"CLASS_CODE"	VARCHAR2(1)		NOT NULL,
	"CAR_STATUS"	VARCHAR2(1)	    DEFAULT 'R' CHECK(CAR_STATUS IN ('R', 'A', 'Y', 'S', 'N'))	NOT NULL,
	"CAR_PAY"	    NUMBER		    NOT NULL,
    "CAR_DATE"	    DATE		    NULL
);

COMMENT ON COLUMN "CAR"."CAR_NUM" IS '차대번호';
COMMENT ON COLUMN "CAR"."MEM_PHONE" IS '회원전화번호';
COMMENT ON COLUMN "CAR"."CLASS_CODE" IS '차량코드';
COMMENT ON COLUMN "CAR"."CAR_STATUS" IS '차상태';
COMMENT ON COLUMN "CAR"."CAR_PAY" IS '차량가격';
COMMENT ON COLUMN "CAR"."CAR_DATE" IS '수령날짜';


-------------------------- 부품재고 --------------------------
-------------------------------------------------------------
CREATE TABLE "INVENTORY" (
	"INVEN_CODE"	VARCHAR2(20)	NOT NULL,
	"INVEN_NAME"	VARCHAR2(50)	NOT NULL,
	"INVEN_PAY"	    NUMBER		    NOT NULL,
	"INVEN_NUM"	    NUMBER		    NOT NULL,
	"INVEN_DATE"	DATE		    NOT NULL,
	"ITEM_CODE"	    VARCHAR2(2)		NOT NULL,
    "INVEN_CAR"	    VARCHAR2(20)	NOT NULL
);

COMMENT ON COLUMN "INVENTORY"."INVEN_CODE" IS '부품코드';
COMMENT ON COLUMN "INVENTORY"."INVEN_NAME" IS '부품명';
COMMENT ON COLUMN "INVENTORY"."INVEN_PAY" IS '부품가격';
COMMENT ON COLUMN "INVENTORY"."INVEN_NUM" IS '부품수';
COMMENT ON COLUMN "INVENTORY"."INVEN_DATE" IS '부품수변경일';
COMMENT ON COLUMN "INVENTORY"."ITEM_CODE" IS '품목코드';
COMMENT ON COLUMN "INVENTORY"."INVEN_CAR" IS '사용가능차량';

-------------------------- 사용부품 --------------------------
---------------------------------------------------------
CREATE TABLE "PART" (
	"INVEN_CODE"	VARCHAR2(10)	NOT NULL,
	"CAR_NUM"	    VARCHAR2(15)		NOT NULL
);

COMMENT ON COLUMN "PART"."INVEN_CODE" IS '부품코드';
COMMENT ON COLUMN "PART"."CAR_NUM" IS '차대번호';



-------------------------- 차량 구분 --------------------------
--------------------------------------------------------------
CREATE TABLE "CLASSIFICATION" (
	"CLASS_CODE"	VARCHAR2(2)		NOT NULL,
	"CLASS_NAME"	VARCHAR2(15)	NOT NULL
);

COMMENT ON COLUMN "CLASSIFICATION"."CLASS_CODE" IS '차량코드';
COMMENT ON COLUMN "CLASSIFICATION"."CLASS_NAME" IS '차량명';

INSERT INTO CLASSIFICATION values('SD', '세단');
INSERT INTO CLASSIFICATION values('SV', 'SUV');
INSERT INTO CLASSIFICATION values('EV', '전기차');

-------------------------- 차량 이름 --------------------------
--------------------------------------------------------------
CREATE TABLE "CARNAME" (
	"CAR_NAME"	    VARCHAR2(30)	NOT NULL,
	"CLASS_CODE"	VARCHAR2(2)	    NOT NULL,
    "CAR_PRICE"	    NUMBER	        NOT NULL,
    "FILE_NUM"      NUMBER          NOT NULL
);

COMMENT ON COLUMN "CARNAME"."CAR_NAME" IS '차량이름';
COMMENT ON COLUMN "CARNAME"."CLASS_CODE" IS '차량코드';
COMMENT ON COLUMN "CARNAME"."CAR_PRICE" IS '기본가격';
COMMENT ON COLUMN "CARNAME"."FILE_NUM" IS '첨부파일';

INSERT INTO CARNAME values('G90', 'SD', 94450000, 1);
INSERT INTO CARNAME values('G80', 'SD', 58900000, 2);
INSERT INTO CARNAME values('G70', 'SD', 43470000, 3);

INSERT INTO CARNAME values('GV80', 'SV', 69300000, 4);
INSERT INTO CARNAME values('GV80COUPE', 'SV', 82550000, 5);
INSERT INTO CARNAME values('GV70', 'SV', 50400000, 6);

INSERT INTO CARNAME values('G80EV', 'EV', 93300000, 8);
INSERT INTO CARNAME values('G70EV', 'EV', 73320000, 9);
INSERT INTO CARNAME values('G60EV', 'EV', 63790000, 10);

-------------------------- 첨부파일 --------------------------
-------------------------------------------------------------
CREATE TABLE "CAR_FILE" (
	"FILE_NUM"	NUMBER		NOT NULL,
	"ORIGINAL_NAME"	VARCHAR2(30)		NOT NULL,
	"UPLOAD_NAME"	VARCHAR2(30)		NOT NULL,
	"FILE_PATH"	VARCHAR2(1000)		NOT NULL,
	"UPLOAD_DATE"	DATE		NOT NULL
);

COMMENT ON COLUMN "CAR_FILE"."FILE_NUM" IS '첨부파일번호';
COMMENT ON COLUMN "CAR_FILE"."ORIGINAL_NAME" IS '파일원본명';
COMMENT ON COLUMN "CAR_FILE"."UPLOAD_NAME" IS '파일저장명';
COMMENT ON COLUMN "CAR_FILE"."FILE_PATH" IS '저장폴더경로';
COMMENT ON COLUMN "CAR_FILE"."UPLOAD_DATE" IS '업로드일';

INSERT INTO CAR_FILE values(1, 'g90', 'g90', 'resources/images', SYSDATE);
INSERT INTO CAR_FILE values(2, 'g80', 'g80', 'resources/images', SYSDATE);
INSERT INTO CAR_FILE values(3, 'g70', 'g70', 'resources/images', SYSDATE);

INSERT INTO CAR_FILE values(4, 'gv80', 'gv80', 'resources/images', SYSDATE);
INSERT INTO CAR_FILE values(5, 'gv80_coupe', 'gv80_coupe', 'resources/images', SYSDATE);
INSERT INTO CAR_FILE values(6, 'gv70', 'gv70', 'resources/images', SYSDATE);

INSERT INTO CAR_FILE values(7, 'g80_ev', 'g80_ev', 'resources/images', SYSDATE);
INSERT INTO CAR_FILE values(8, 'gv70_ev', 'gv70_ev', 'resources/images', SYSDATE);
INSERT INTO CAR_FILE values(9, 'gv60_ev', 'gv60_ev', 'resources/images', SYSDATE);

-------------------------- 증빙서류 --------------------------
-------------------------------------------------------------
CREATE TABLE "DOCUMENT" (
	"DOCU_NUM"	    NUMBER		    NOT NULL,
	"CAR_NUM"	    VARCHAR2(15)	NOT NULL,
	"DOCU_TYPE"	    VARCHAR2(1)	    DEFAULT 'C' CHECK(DOCU_TYPE IN ('C', 'I', 'T'))	NOT NULL,
	"ORIGINAL_NAME"	VARCHAR2(30)	NOT NULL,
	"UPLOAD_NAM"	VARCHAR2(30)	NOT NULL,
	"FIIL_PATH"	    VARCHAR2(1000)	NOT NULL,
	"UPLOAD_DATE"	DATE		    NOT NULL
);

COMMENT ON COLUMN "DOCUMENT"."DOCU_NUM" IS '첨부파일번호';
COMMENT ON COLUMN "DOCUMENT"."CAR_NUM" IS '차대번호';
COMMENT ON COLUMN "DOCUMENT"."DOCU_TYPE" IS '서류코드';
COMMENT ON COLUMN "DOCUMENT"."UPLOAD_DATE" IS '증빙일자';

-------------------------- 서류종류 --------------------------
-------------------------------------------------------------
CREATE TABLE "TYPE_DOCUMENT" (
	"DOCU_TYPE"	VARCHAR2(1)	    DEFAULT 'C' CHECK(DOCU_TYPE IN ('C', 'I', 'T'))	NOT NULL,
	"DOCU_NAME"	VARCHAR2(30)	NOT NULL
);

COMMENT ON COLUMN "TYPE_DOCUMENT"."DOCU_TYPE" IS '서류코드';
COMMENT ON COLUMN "TYPE_DOCUMENT"."DOCU_NAME" IS '서류명';

INSERT INTO TYPE_DOCUMENT values('C', '계약서');
INSERT INTO TYPE_DOCUMENT values('I', '검수확인서');
INSERT INTO TYPE_DOCUMENT values('T', '세금계산서');

-------------------------- 품목 --------------------------
---------------------------------------------------------
CREATE TABLE "ITEM" (
	"ITEM_CODE"	VARCHAR2(2)		NOT NULL,
	"ITEM_NAME"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "ITEM"."ITEM_CODE" IS '품목코드';
COMMENT ON COLUMN "ITEM"."ITEM_NAME" IS '품목명';

INSERT INTO ITEM values('EN', '엔진타입');
INSERT INTO ITEM values('DV', '구동타입');
INSERT INTO ITEM values('CR', '외장컬러');
INSERT INTO ITEM values('SP', '스포츠패키지');
INSERT INTO ITEM values('WH', '휠타이어');
INSERT INTO ITEM values('ID', '내장디자인');
INSERT INTO ITEM values('OP', '옵션');

-------------------------- 시퀀스 --------------------------
---------------------------------------------------------
CREATE SEQUENCE SEQ_FILE_NUM; 

commit;

--------------------------------------------------------------
--------------------------------------------------------------
SELECT CAR_NAME,
				CLASS_CODE,
				CAR_PRICE,
				FILE_NUM,
				ORIGINAL_NAME,
				UPLOAD_NAME,
				FILE_PATH,
				UPLOAD_DATE
		   FROM CARNAME
		   JOIN CAR_FILE USING(FILE_NUM);

