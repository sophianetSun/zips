create database zips;

grant all PRIVILEGES on zips.* to 'scott'@'localhost' IDENTIFIED by 'tiger';

CREATE TABLE best
(
	num int NOT NULL ,
	rec_user varchar(30) NOT NULL,
	rec_board_type varchar(100),
	PRIMARY KEY (num, rec_user)
);

CREATE TABLE zipscomment
(
	co_no int NOT NULL AUTO_INCREMENT,
	num int NOT NULL,
	co_userid varchar(16) NOT NULL,
	ref_board_no int,
	co_regdate datetime,
	co_modate datetime,
	co_content varchar(300),
	co_apply int,
	PRIMARY KEY (co_no, num)
);

CREATE TABLE zipsfile
(
	board_no int NOT NULL,
	filename varchar(255),
	num int,
	shop_no int
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
	num int NOT NULL AUTO_INCREMENT,
	regdate date NOT NULL,
	user_id varchar(16) NOT NULL,
	in_type int,
	name varchar(16),
	carbohydrate double,
	fat double,
	protein double,
	amount int,
	calorie double,
	nutri_memo varchar(512),
	work_memo varchar(512),
	PRIMARY KEY (num, regdate, user_id)
);

CREATE TABLE message
(
	num int NOT NULL AUTO_INCREMENT,
	sender varchar(16) NOT NULL,
	sender_status int NOT NULL,
	receiver varchar(16) NOT NULL,
	receiver_status int NOT NULL,
	content varchar(512) NOT NULL,
	regdate datetime NOT NULL,
	PRIMARY KEY (num)
);

CREATE TABLE search_info
(
	num int NOT NULL AUTO_INCREMENT,
	id varchar(16) NOT NULL,
	content varchar(128) NOT NULL,
	regdate datetime NOT NULL,
	PRIMARY KEY (num)
);

CREATE TABLE subscription
(
	num int NOT NULL,
	user_id varchar(16) NOT NULL,
	subscribe_id varchar(16) NOT NULL,
	PRIMARY KEY (num)
);

CREATE TABLE totalboard
(
	num int NOT NULL,
	subject varchar(100),
	content varchar(400),
	board_userid varchar(16) NOT NULL,
	regdate datetime,
	moddate datetime,
	board_count int,
	filename varchar(30),
	recommand int,
	admin_alert varchar(300),
	board_type varchar(50),
	PRIMARY KEY (num)
);

CREATE TABLE zipsuser
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
	num int NOT NULL,
	name varchar(16),
	calorie double,
	PRIMARY KEY (num)
);

CREATE TABLE zips_shop
(

	shop_no int NOT NULL AUTO_INCREMENT,
	
	shop_seller_id varchar(16) NOT NULL,

	shop_buyer_id varchar(16) NOT NULL,

	shop_subject varchar(255) NOT NULL,

	shop_content varchar(255),
	shop_selller_confirm varchar NOT NULL DEFAULT '0',

	shop_buyer_confirm varchar NOT NULL DEFAULT '0', 

	shop_status varchar(20) NOT NULL,

	shop_price int NOT NULL,

	shop_regdate datetime NOT NULL,
	
	PRIMARY KEY (shop_no)
);


CREATE TABLE uploadfile (
   file_no INT(11) PRIMARY KEY AUTO_INCREMENT,
   shop_no INT(11) NULL DEFAULT NULL,
   originalname VARCHAR(255) NULL DEFAULT NULL,
   filename VARCHAR(255) NULL DEFAULT NULL,
   filesize INT(255) NULL DEFAULT NULL
);
