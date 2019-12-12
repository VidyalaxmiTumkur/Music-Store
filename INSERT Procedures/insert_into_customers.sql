

DELIMITER $$
DROP PROCEDURE IF EXISTS insert_into_customers;
CREATE PROCEDURE insert_into_customers()
BEGIN
	INSERT INTO customers
    VALUES ('9' , 'deep', 'vaghela', 'dv@gmail.com', 'main cross road', '812-868-5679', '1994-10-19');
END$$

CALL insert_into_customers;
