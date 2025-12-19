DROP TABLE IF EXISTS `food_category`;

CREATE TABLE `food_category` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `foodname` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_food_category_id (`id`)
);