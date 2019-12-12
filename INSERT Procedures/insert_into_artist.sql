
DROP PROCEDURE IF EXISTS insert_into_artist
DELIMITER //
DROP PROCEDURE IF EXISTS insert_into_artist;
CREATE PROCEDURE insert_into_artist()
BEGIN
	INSERT INTO artist
    VALUES ('7' , 'Shawn', '26', 'germany');
END//

CALL insert_into_artist;
