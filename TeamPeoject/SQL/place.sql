SET FOREIGN_KEY_CHECKS = 0;

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
    `lat` DOUBLE DEFAULT 0.0 COMMENT '위도 (Lat)',
    `lng` DOUBLE DEFAULT 0.0 COMMENT '경도 (Lng)',
    PRIMARY KEY (`no`)
);

ALTER TABLE `place`
ADD CONSTRAINT fk_place_user
FOREIGN KEY (`user_no`) REFERENCES `users`(`no`);

SET FOREIGN_KEY_CHECKS = 1;

-- 테스트용 부평역 데이터
INSERT INTO place (user_no, placename, address, phone, thumbnail_img, content, amenities, region, lat, lng)
VALUES (1, '부평역', '인천광역시 부평구 광장로 14', '032-515-9103', '/static/img/bupyeong.png', '인천 부평구에 위치한 전철역입니다.', '1호선, 인천선', '인천', 37.489548, 126.7235346);