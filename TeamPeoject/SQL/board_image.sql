DROP TABLE IF EXISTS `board_image`;

CREATE TABLE `board_image` (
    `no` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `board_no` INT NOT NULL,
    `img_path` VARCHAR(300) NOT NULL,
    `seq` INT NOT NULL,
    PRIMARY KEY (`no`)
);

ALTER TABLE `board_image`
ADD CONSTRAINT fk_board_image_board
FOREIGN KEY (`board_no`) REFERENCES `board`(`no`);