DROP TABLE IF EXISTS `menu_image`;

CREATE TABLE `menu_image` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `menu_no` INT NOT NULL,
    `img_path` VARCHAR(300) NOT NULL,
    PRIMARY KEY (`no`)
);

ALTER TABLE `menu_image`
ADD CONSTRAINT fk_menu_image_menu
FOREIGN KEY (`menu_no`) REFERENCES `menu`(`no`);