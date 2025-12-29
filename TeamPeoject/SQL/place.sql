DROP TABLE IF EXISTS `place`;

CREATE TABLE `place` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `user_no` INT NOT NULL COMMENT '사장 회원 번호',
    `placename` VARCHAR(100) NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(100) NOT NULL,
    `thumbnail_img` VARCHAR(300) NOT NULL,
    `content` VARCHAR(4000) NOT NULL,
    `amenities` VARCHAR(100) NOT NULL,
    `region` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`no`),
);

ALTER TABLE `place`
ADD CONSTRAINT fk_place_user
FOREIGN KEY (`user_no`) REFERENCES `users`(`no`);