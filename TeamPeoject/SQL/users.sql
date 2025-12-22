DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `profile_img` VARCHAR(300) NULL DEFAULT '' COMMENT '프로필 이미지',
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