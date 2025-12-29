DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK (UUID)', 
    `profile_img` VARCHAR(300) NULL DEFAULT '/static/img/default-profile.png',
    `user_id` VARCHAR(100) NOT NULL COMMENT '아이디(이메일)',
    `password` VARCHAR(100) NOT NULL COMMENT '비밀번호',
    `username` VARCHAR(100) NOT NULL COMMENT '닉네임',
    `age` INT DEFAULT 0 COMMENT '나이',
    `sex` VARCHAR(20) DEFAULT '공개안함',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_user_id (`id`),
    UNIQUE KEY uk_user_login (`user_id`),
    UNIQUE KEY uk_user_username (`username`)
);