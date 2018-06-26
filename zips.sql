SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS best;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS file;
DROP TABLE IF EXISTS food_db;
DROP TABLE IF EXISTS info_calendar;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS search_info;
DROP TABLE IF EXISTS subscription;
DROP TABLE IF EXISTS totalboard;
DROP TABLE IF EXISTS zips_shop;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS workout_db;




/* Create Tables */

CREATE TABLE best
(
	-- 게시판 번호
	num int NOT NULL COMMENT '게시판 번호',
	rec_user varchar(30) NOT NULL,
	rec_board_type varchar(100),
	PRIMARY KEY (num, rec_user)
);


CREATE TABLE comment
(
	-- 댓글글번호
	co_no int NOT NULL AUTO_INCREMENT COMMENT '댓글글번호',
	-- 게시판 번호
	num int NOT NULL COMMENT '게시판 번호',
	co_userid varchar(16) NOT NULL,
	ref_board_no int,
	co_regdate datetime,
	co_modate datetime,
	co_content varchar(300),
	co_apply int,
	PRIMARY KEY (co_no, num)
);


CREATE TABLE file
(
	board_no int NOT NULL,
	filename varchar(255),
	-- 게시판 번호
	num int COMMENT '게시판 번호',
	-- 거래글번호
	shop_no int COMMENT '거래글번호'
);


CREATE TABLE food_db
(
	no int NOT NULL,
	group_type varchar(16) NOT NULL,
	food_name varchar(64) NOT NULL,
	amount int,
	calorie double,
	carbohydrate double,
	protein double,
	fat double,
	sugar double,
	na double,
	chol double,
	sat_fat double,
	trans_fat double,
	PRIMARY KEY (no)
);


CREATE TABLE info_calendar
(
	regdate date NOT NULL,
	user_id varchar(16) NOT NULL,
	no int NOT NULL AUTO_INCREMENT,
	type int,
	name varchar(16),
	carbohydrate double,
	fat double,
	protein double,
	amount int,
	calorie double,
	nutri_memo varchar(512),
	work_memo varchar(512),
	PRIMARY KEY (regdate, user_id, no)
);


CREATE TABLE message
(
	no int NOT NULL AUTO_INCREMENT,
	sender varchar(16) NOT NULL,
	sender_status int NOT NULL,
	receiver varchar(16) NOT NULL,
	receiver_status int NOT NULL,
	content varchar(512) NOT NULL,
	regdate datetime NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE search_info
(
	no int NOT NULL,
	id varchar(16) NOT NULL,
	content varchar(128) NOT NULL,
	regdate datetime NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE subscription
(
	no int NOT NULL,
	user_id varchar(16) NOT NULL,
	subscribe_id varchar(16) NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE totalboard
(
	-- 게시판 번호
	num int NOT NULL COMMENT '게시판 번호',
	subject varchar(100),
	content varchar(400),
	board_userid varchar(16) NOT NULL,
	regdate datetime,
	moddate datetime,
	board_count int,
	file varchar(30),
	recommand int,
	admin_alert varchar(300),
	board_type varchar(50),
	PRIMARY KEY (num)
);


CREATE TABLE user
(
	id varchar(16) NOT NULL,
	pw varchar(16) NOT NULL,
	picture varchar(255),
	name varchar(16) NOT NULL,
	email varchar(32) NOT NULL,
	nickname varchar(16) NOT NULL,
	tel varchar(16) NOT NULL,
	address varchar(128) NOT NULL,
	gender varchar(1) NOT NULL,
	height double,
	weight double,
	bodyfat double,
	muscle double,
	blacklist int DEFAULT 0,
	point int DEFAULT 500,
	coin int DEFAULT 500,
	regdate datetime,
	logdate datetime,
	PRIMARY KEY (id)
);


CREATE TABLE workout_db
(
	no int NOT NULL,
	name varchar(16),
	calorie double,
	PRIMARY KEY (no)
);


CREATE TABLE zips_shop
(
	-- 거래글번호
	shop_no int NOT NULL AUTO_INCREMENT COMMENT '거래글번호',
	-- 판매자 아이디
	shop_seller_id varchar(16) NOT NULL COMMENT '판매자 아이디',
	-- 구매자 아이디
	shop_buyer_id varchar(16) NOT NULL COMMENT '구매자 아이디',
	-- 제목
	shop_subject varchar(255) NOT NULL COMMENT '제목',
	-- 내용
	shop_content varchar(255) COMMENT '내용',
	shop_selller_confirm int NOT NULL,
	-- 인수확인
	shop_buyer_confirm int NOT NULL COMMENT '인수확인',
	-- 거래상태
	shop_status varchar(20) NOT NULL COMMENT '거래상태',
	-- 거래가격
	shop_price int NOT NULL COMMENT '거래가격',
	-- 등록일
	shop_regdate datetime NOT NULL COMMENT '등록일',
	PRIMARY KEY (shop_no)
);



/* Create Foreign Keys */

ALTER TABLE best
	ADD FOREIGN KEY (num)
	REFERENCES totalboard (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (num)
	REFERENCES totalboard (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE file
	ADD FOREIGN KEY (num)
	REFERENCES totalboard (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (co_userid)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE info_calendar
	ADD FOREIGN KEY (user_id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE message
	ADD FOREIGN KEY (receiver)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE message
	ADD FOREIGN KEY (sender)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE search_info
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE subscription
	ADD FOREIGN KEY (user_id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE subscription
	ADD FOREIGN KEY (subscribe_id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE totalboard
	ADD FOREIGN KEY (board_userid)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE zips_shop
	ADD FOREIGN KEY (shop_seller_id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE zips_shop
	ADD FOREIGN KEY (shop_buyer_id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE file
	ADD FOREIGN KEY (shop_no)
	REFERENCES zips_shop (shop_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



