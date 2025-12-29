DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `place_no` INT NOT NULL,
    `menuname` VARCHAR(100) NOT NULL,
    `price` INT NOT NULL,
    PRIMARY KEY (`no`),
);

ALTER TABLE `menu`
ADD CONSTRAINT fk_menu_place
FOREIGN KEY (`place_no`) REFERENCES `place`(`no`);