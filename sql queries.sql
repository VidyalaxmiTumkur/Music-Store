/** QUERY 1 **/

SELECT COUNT(customer_id) 
AS "Store_customer" 
FROM customers;  

/** QUERY 2 **/

/** Top Sold **/

SELECT * FROM 
	(SELECT album.album_id, album.album_name, album.album_language, orders.order_date, 
    SUM(order_item.item_quantity) 
    AS 'total_q'  
	FROM album 
    INNER JOIN order_item ON album.album_id = order_item.album_album_id
	INNER JOIN orders ON order_item.order_order_id = orders.order_id 
    WHERE orders.order_date BETWEEN '2019-01-01' AND '2019-04-13' 
    GROUP BY album.album_id) 
AS table1 ORDER BY total_q DESC 
LIMIT 1;

/** Least Sold **/

Select * FROM 
	(SELECT album.album_id, album.album_name, album.album_language, orders.order_date, 
    SUM(order_item.item_quantity) 
	AS 'total_q'  
	FROM album 
	INNER JOIN order_item ON album.album_id = order_item.album_album_id
	INNER JOIN orders ON order_item.order_order_id = orders.order_id 
	WHERE orders.order_date BETWEEN '2019-01-01' AND '2019-04-13' 
	GROUP BY album.album_id) 
AS table1 
ORDER BY total_q 
LIMIT 1;


/** Query 3 **/

SELECT genre_id, genre_type, 
AVG(album_price) AS "avg_price" 
FROM genre 
INNER JOIN album ON genre.genre_id = album.genre_genre_id 
GROUP BY  genre_id;

/** Query 4 **/

SELECT customer_lastname, customer_DOB 
FROM customers 
ORDER BY customer_lastname;

/** Query 5 **/
 
Select customer_fullname, total_items 
FROM
	( SELECT CONCAT(customer_firstname," ",customer_lastname) 
	AS customer_fullname, 
	SUM(order_item.item_quantity) AS 'total_items' 
	FROM customers 
	INNER JOIN orders ON customers.customer_id = orders.customers_customer_id 
	INNER JOIN order_item ON orders.order_id = order_item.order_order_id 
	WHERE order_date BETWEEN '2019-03-12' AND '2019-04-13' GROUP BY customer_fullname) 
AS Table1 
WHERE Table1.total_items > 4; 


/** 6 **/

SELECT artist_id, album_name, album_id,artist_name 
FROM artist INNER JOIN album 
ON artist.artist_id = album.artist_artist_id 
ORDER BY artist_id;

/** 7 **/

SELECT album_name, album_album_id, 
SUM(inventory.album_quantity) AS 'total_available_quantity' 
FROM album INNER JOIN inventory 
ON album.album_id = inventory.album_album_id
WHERE inventory.album_quantity > 0
GROUP BY album_album_id;

/** 8 **/

SELECT album_name, album_language, 
SUM(inventory.album_quantity) AS 'total_quantity' 
FROM album INNER JOIN inventory
ON album.album_id = inventory.album_album_id 
WHERE album_language IN ('spanish', 'mandarin') 
GROUP BY album_name;

/** 8.1 **/

SELECT album_name, album_language, 
SUM(inventory.album_quantity) AS 'total_quantity' 
FROM album INNER JOIN inventory
ON album.album_id = inventory.album_album_id 
WHERE album_language = 'mandarin' 
GROUP BY album_name;

/** 9 **/

SELECT CONCAT(artist_name,' - ',album_name) 
AS 'Artist_album_info' , album_language 
FROM artist
INNER JOIN album 
ON artist.artist_id = album.artist_artist_id 
ORDER BY artist_name;


/** 10 **/

SELECT artist_name, album_name, 
COUNT(album_language) AS Numofalbums_by_language 
FROM album INNER JOIN artist
ON album.artist_artist_id = artist.artist_id 
GROUP BY artist_name 
HAVING Numofalbums_by_language < 2 ORDER BY artist_name;

/** 11 **/

SELECT album_name, rating_outof5 
FROM album  
WHERE rating_outof5 
IN (SELECT MAX(rating_outof5) FROM album);
