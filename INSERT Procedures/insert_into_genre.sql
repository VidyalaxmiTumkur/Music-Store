
DELIMITER $$
DROP PROCEDURE IF EXISTS insert_into_genre;
CREATE PROCEDURE insert_into_genre()
BEGIN
	INSERT INTO genre
    VALUES ('8' , 'religious');
END$$

CALL insert_into_genre;
