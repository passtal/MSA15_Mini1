-- DB 생성
CREATE DATABASE IF NOT EXISTS aloha;
USE aloha;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS
    main_banner,
    menu_image,
    menu,
    board_image,
    place_food,
    food_category,
    review_comment,
    board,
    board_group,
    place,
    user_auth,
    users,
    persistence_logins;

SET FOREIGN_KEY_CHECKS = 1;


-- =========================
-- USERS
-- =========================
CREATE TABLE `users` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `profile_img` VARCHAR(300) NULL DEFAULT '/static/img/default-profile.png' COMMENT '프로필 이미지',
    `user_id` VARCHAR(100) NOT NULL COMMENT '회원 아이디(이메일)',
    `password` VARCHAR(100) NOT NULL COMMENT '비밀번호',
    `username` VARCHAR(100) NOT NULL COMMENT '닉네임',
    `age` INT NOT NULL COMMENT '나이',
    `sex` VARCHAR(20) NOT NULL COMMENT '남,여,공개안함',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_user_id (`id`),
    UNIQUE KEY uk_user_login (`user_id`),
    UNIQUE KEY uk_user_username (`username`)
);

-- =========================
-- USER_AUTH
-- =========================
CREATE TABLE `user_auth` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `user_no` INT NOT NULL COMMENT 'FK',
    `auth` VARCHAR(50) NOT NULL COMMENT 'ROLE_USER, ROLE_ADMIN, ROLE_OWNER',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_user_auth_id (`id`)
);

-- =========================
-- BOARD_GROUP
-- =========================
CREATE TABLE `board_group` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `name` VARCHAR(100) NOT NULL COMMENT '게시판 명',
    `seq` INT NOT NULL COMMENT '순서',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_board_group_id (`id`)
);

-- =========================
-- PLACE
-- =========================
CREATE TABLE `place` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `user_no` INT NOT NULL COMMENT '사장 회원 번호',
    `placename` VARCHAR(100) NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(100) NOT NULL,
    `thumbnail_img` VARCHAR(300) NOT NULL,
    `content` VARCHAR(4000) NOT NULL,
    `amenities` VARCHAR(100) NOT NULL,
    `region` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_place_id (`id`)
);

-- =========================
-- BOARD
-- =========================
CREATE TABLE `board` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `user_no` INT NOT NULL COMMENT 'FK',
    `group_no` INT NOT NULL COMMENT 'FK',
    `place_no` INT NULL COMMENT 'FK',
    `rating` DECIMAL(2,1) NULL,
    `title` VARCHAR(100) NOT NULL,
    `content` VARCHAR(4000) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_board_id (`id`)
);

-- =========================
-- REVIEW_COMMENT
-- =========================
CREATE TABLE `review_comment` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `user_no` INT NOT NULL,
    `board_no` INT NOT NULL,
    `rating` DECIMAL(2,1) NULL,
    `content` VARCHAR(300) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_review_comment_id (`id`)
);

-- =========================
-- FOOD_CATEGORY
-- =========================
CREATE TABLE `food_category` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `foodname` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_food_category_id (`id`)
);

-- =========================
-- PLACE_FOOD
-- =========================
CREATE TABLE `place_food` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `food_no` INT NOT NULL,
    `place_no` INT NOT NULL,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_place_food_id (`id`)
);

-- =========================
-- MENU
-- =========================
CREATE TABLE `menu` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `place_no` INT NOT NULL,
    `menuname` VARCHAR(100) NOT NULL,
    `price` INT NOT NULL,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_menu_id (`id`)
);

-- =========================
-- MENU_IMAGE
-- =========================
CREATE TABLE `menu_image` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `menu_no` INT NOT NULL,
    `img_path` VARCHAR(300) NOT NULL,
    PRIMARY KEY (`no`)
);

-- =========================
-- BOARD_IMAGE
-- =========================
CREATE TABLE `board_image` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `board_no` INT NOT NULL,
    `img_path` VARCHAR(300) NOT NULL,
    `seq` INT NOT NULL,
    PRIMARY KEY (`no`)
);

-- =========================
-- MAIN_BANNER
-- =========================
CREATE TABLE `main_banner` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `food_no` INT NOT NULL,
    `img_path` VARCHAR(300) NOT NULL,
    `seq` INT NOT NULL,
    `is_active` CHAR(1) NOT NULL,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_main_banner_id (`id`)
);

-- =========================
-- PERSISTENCE_LOGINS
-- =========================
CREATE TABLE `persistence_logins` (
	`no`			INT	NOT NULL AUTO_INCREMENT  PRIMARY KEY	COMMENT '번호',
	`id`			VARCHAR(255)	NOT NULL	COMMENT 'ID (UUID)',
	`user_id`		VARCHAR(100)	NOT NULL	COMMENT '회원 아이디',
	`token`			VARCHAR(255)	NOT NULL	COMMENT '인증 토큰',
	`expiry_date`	TIMESTAMP		NOT NULL	COMMENT '만료시간',
	`created_at`		TIMESTAMP		NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`		TIMESTAMP		NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자'
);

-- =========================
-- FOREIGN KEYS
-- =========================
ALTER TABLE `user_auth`
ADD CONSTRAINT fk_user_auth_user
FOREIGN KEY (`user_no`) REFERENCES `users`(`no`);

ALTER TABLE `place`
ADD CONSTRAINT fk_place_user
FOREIGN KEY (`user_no`) REFERENCES `users`(`no`);

ALTER TABLE `board`
ADD CONSTRAINT fk_board_user
FOREIGN KEY (`user_no`) REFERENCES `users`(`no`);

ALTER TABLE `board`
ADD CONSTRAINT fk_board_group
FOREIGN KEY (`group_no`) REFERENCES `board_group`(`no`);

ALTER TABLE `board`
ADD CONSTRAINT fk_board_place
FOREIGN KEY (`place_no`) REFERENCES `place`(`no`);

ALTER TABLE `review_comment`
ADD CONSTRAINT fk_review_comment_user
FOREIGN KEY (`user_no`) REFERENCES `users`(`no`);

ALTER TABLE `review_comment` 
ADD CONSTRAINT fk_review_comment_board
FOREIGN KEY (`board_no`) REFERENCES `board`(`no`);

ALTER TABLE `place_food`
ADD CONSTRAINT fk_place_food_place
FOREIGN KEY (`place_no`) REFERENCES `place`(`no`);

ALTER TABLE `place_food`
ADD CONSTRAINT fk_place_food_food
FOREIGN KEY (`food_no`) REFERENCES `food_category`(`no`);

ALTER TABLE `menu`
ADD CONSTRAINT fk_menu_place
FOREIGN KEY (`place_no`) REFERENCES `place`(`no`);

ALTER TABLE `menu_image`
ADD CONSTRAINT fk_menu_image_menu
FOREIGN KEY (`menu_no`) REFERENCES `menu`(`no`);

ALTER TABLE `board_image`
ADD CONSTRAINT fk_board_image_board
FOREIGN KEY (`board_no`) REFERENCES `board`(`no`);

ALTER TABLE `main_banner`
ADD CONSTRAINT fk_main_banner_food
FOREIGN KEY (`food_no`) REFERENCES `food_category`(`no`);
