DROP TABLE IF EXISTS `board`;

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

ALTER TABLE `board`
ADD CONSTRAINT fk_board_user
FOREIGN KEY (`user_no`) REFERENCES `user`(`no`);

ALTER TABLE `board`
ADD CONSTRAINT fk_board_group
FOREIGN KEY (`group_no`) REFERENCES `board_group`(`no`);

ALTER TABLE `board`
ADD CONSTRAINT fk_board_place
FOREIGN KEY (`place_no`) REFERENCES `place`(`no`);