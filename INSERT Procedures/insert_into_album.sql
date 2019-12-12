
DELIMITER $$
DROP PROCEDURE IF EXISTS insert_into_album;
CREATE PROCEDURE insert_into_album()
BEGIN
	INSERT INTO album
    VALUES ('12' , 'chains', '2019-01-21', 'spanish','72','1','15','2');
END$$

CALL insert_into_album;
