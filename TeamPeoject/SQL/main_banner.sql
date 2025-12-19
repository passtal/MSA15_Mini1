DROP TABLE IF EXISTS `main_banner`;

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

ALTER TABLE `main_banner`
ADD CONSTRAINT fk_main_banner_food
FOREIGN KEY (`food_no`) REFERENCES `food_category`(`no`);