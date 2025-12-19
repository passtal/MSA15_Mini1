DROP TABLE IF EXISTS `place_food`;

CREATE TABLE `place_food` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `id` VARCHAR(64) NOT NULL COMMENT 'UK',
    `food_no` INT NOT NULL,
    `place_no` INT NOT NULL,
    PRIMARY KEY (`no`),
    UNIQUE KEY uk_place_food_id (`id`)
);

ALTER TABLE `place_food`
ADD CONSTRAINT fk_place_food_place
FOREIGN KEY (`place_no`) REFERENCES `place`(`no`);

ALTER TABLE `place_food`
ADD CONSTRAINT fk_place_food_food
FOREIGN KEY (`food_no`) REFERENCES `food_category`(`no`);