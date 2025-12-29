DROP TABLE IF EXISTS `food_category`;

CREATE TABLE `food_category` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `foodname` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`no`),
);