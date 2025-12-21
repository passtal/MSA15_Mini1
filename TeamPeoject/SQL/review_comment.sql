DROP TABLE IF EXISTS `review_comment`;

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

ALTER TABLE `review_comment`
ADD CONSTRAINT fk_review_comment_user
FOREIGN KEY (`user_no`) REFERENCES `users`(`no`);

ALTER TABLE `review_comment`
ADD CONSTRAINT fk_review_comment_board
FOREIGN KEY (`board_no`) REFERENCES `board`(`no`);