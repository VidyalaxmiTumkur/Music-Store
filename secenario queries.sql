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

/** 12 **/
SELECT album_name, rating_outof5 
FROM album  
WHERE rating_outof5 
IN (SELECT MIN(rating_outof5) FROM album);
