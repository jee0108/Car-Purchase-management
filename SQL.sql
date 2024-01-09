DROP TABLE "MEMBER";
DROP TABLE "CAR";
DROP TABLE "MODEL";
DROP TABLE "DETAIL";
DROP TABLE "INVENTORY";
DROP TABLE "PART";
DROP TABLE "CLASSIFICATION";
DROP TABLE "DOCUMENT";
DROP TABLE "TYPE_DOCUMENT";
DROP TABLE "ITEM";

-------------------------- 회원 --------------------------
---------------------------------------------------------
CREATE TABLE "MEMBER" (
	"MEM_PHONE"	VARCHAR2(11)		NOT NULL,
	"MEM_EMAIL"	VARCHAR2(50)		NOT NULL,
	"MEM_NAME"	VARCHAR2(30)		NOT NULL,
	"MEM_PWD"	VARCHAR2(30)		NOT NULL,
	"MEM_ROLE"	VARCHAR2(1)	DEFAULT 'U' CHECK(MEM_ROLE IN ( 'U', 'R', ' D'))	NOT NULL
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
	"MODEL_CODE"	VARCHAR2(1)		NOT NULL,
	"ITEM_CODE"	    VARCHAR2(1)		NOT NULL,
	"DETAIL_CODE"	VARCHAR2(1)		NOT NULL,
	"CAR_STATUS"	VARCHAR2(1)	    DEFAULT 'R' CHECK(CAR_STATUS IN ('R', 'A', 'Y', 'S', 'N'))	NOT NULL,
	"CAR_DATE"	    DATE		    NULL
);

COMMENT ON COLUMN "CAR"."CAR_NUM" IS '차대번호';
COMMENT ON COLUMN "CAR"."MEM_PHONE" IS '회원전화번호';
COMMENT ON COLUMN "CAR"."MODEL_CODE" IS '차량코드';
COMMENT ON COLUMN "CAR"."ITEM_CODE" IS '차종코드';
COMMENT ON COLUMN "CAR"."DETAIL_CODE" IS '세부차종코드';
COMMENT ON COLUMN "CAR"."CAR_STATUS" IS '차상태';
COMMENT ON COLUMN "CAR"."CAR_DATE" IS '수령날짜';

-------------------------- 차종 --------------------------
---------------------------------------------------------
CREATE TABLE "MODEL" (
	"MODEL_CODE"	VARCHAR2(1)		NOT NULL,
	"MODEL_NAME"	VARCHAR2(30)	NOT NULL
);

COMMENT ON COLUMN "MODEL"."MODEL_CODE" IS '차종코드';
COMMENT ON COLUMN "MODEL"."MODEL_NAME" IS '차종명';

-------------------------- 세부차종 --------------------------
-------------------------------------------------------------
CREATE TABLE "DETAIL" (
	"DETAIL_CODE"	VARCHAR2(1)		NOT NULL,
	"DETAIL_NAME"	VARCHAR2(15)	NOT NULL
);

COMMENT ON COLUMN "DETAIL"."DETAIL_CODE" IS '세부차종코드';
COMMENT ON COLUMN "DETAIL"."DETAIL_NAME" IS '세목명';

-------------------------- 부품재고 --------------------------
-------------------------------------------------------------
CREATE TABLE "INVENTORY" (
	"INVEN_CODE"	VARCHAR2(10)	NOT NULL,
	"INVEN_NAME"	VARCHAR2(50)	NOT NULL,
	"INVEN_PAY"	    NUMBER		    NOT NULL,
	"INVEN_NUM"	    NUMBER		    NOT NULL,
	"INVEN_DATE"	DATE		    NOT NULL,
	"ITEM_CODE"	    VARCHAR2(2)		NOT NULL
);

COMMENT ON COLUMN "INVENTORY"."INVEN_CODE" IS '부품코드';
COMMENT ON COLUMN "INVENTORY"."INVEN_NAME" IS '부품명';
COMMENT ON COLUMN "INVENTORY"."INVEN_PAY" IS '부품가격';
COMMENT ON COLUMN "INVENTORY"."INVEN_NUM" IS '부품수';
COMMENT ON COLUMN "INVENTORY"."INVEN_DATE" IS '부품수변경일';
COMMENT ON COLUMN "INVENTORY"."ITEM_CODE" IS '품목코드';

-------------------------- 부품 --------------------------
---------------------------------------------------------
CREATE TABLE "PART" (
	"INVEN_CODE"	VARCHAR2(10)	NOT NULL,
	"MODEL_CODE"	VARCHAR2(2)		NOT NULL,
	"ITEM_CODE"	    VARCHAR2(1)		NOT NULL,
	"DETAIL_CODE"	VARCHAR2(1)		NOT NULL,
	"PART_DATE"	    DATE		    NULL
);

COMMENT ON COLUMN "PART"."INVEN_CODE" IS '부품코드';
COMMENT ON COLUMN "PART"."MODEL_CODE" IS '차량코드';
COMMENT ON COLUMN "PART"."ITEM_CODE" IS '차종코드';
COMMENT ON COLUMN "PART"."DETAIL_CODE" IS '세부차종코드';
COMMENT ON COLUMN "PART"."PART_DATE" IS '부품사용일';

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

-------------------------- 증빙서류 --------------------------
--------------------------------------------------------
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
--------------------------------------------------------
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

commit;