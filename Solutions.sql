-- Netflix Movies

CREATE TABLE Netflix
(
	show_id	varchar(6),
	type	varchar(10),
	title	varchar(150),
	director	varchar(210),
	casts	varchar(1000),
	country	varchar(150),
	date_added	varchar(50),
	release_year	INT,
	rating	varchar(10),
	duration	varchar(15),
	listed_in	varchar(100),
	description varchar(250)
);

select count(*) from public.netflix

-- 15 Business Problems

--1. Count the number of Movies vs Tv Shows 

SELECT type,COUNT(*) AS Total_Number
FROM netflix
GROUP BY type

--2. Find the most common rating for movies and tv shows

SELECT
	type,
	rating
FROM
(
	SELECT
		type,
		rating,
		COUNT(*),
		RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
	FROM netflix
	GROUP BY 1,2
) AS T1
WHERE ranking = 1

--3. List all the movies released in specific year.

SELECT 
	*
FROM netflix
WHERE 
	type = 'Movie'
	AND
	release_year =2020

--4. Find the top 5 countries with the most content on netflix.

SELECT 
	NEW_COUNTRY,
	COUNT(*)
FROM 
(
SELECT
	SHOW_ID,
	UNNEST(STRING_TO_ARRAY(country, ',')) AS NEW_COUNTRY
FROM Netflix
)
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

--5. Identify the longest Movie.

SELECT *
FROM Netflix
WHERE
	type= 'Movie'
	AND
	duration = (SELECT MAX(duration) FROM Netflix)

--6. Finf content added in the last 5 years.

SELECT * 
FROM Netflix
WHERE 
	TO_DATE(date_added,'month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 Years'

--7. Find all the movies/Tv shows by director 'Rajiv Chilaka'.

SELECT *
FROM Netflix
WHERE director LIKE '%Rajiv Chilaka%'

--8. List all tv shiows with more than 5 seasons.

SELECT *
FROM Netflix
where 
	type = 'TV Show'
	AND
	SPLIT_PART(duration,' ',1)::numeric > 5

--9. Count the number of content items in each genre.

SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
	COUNT(show_id)
FROM netflix
GROUP BY 1

--10. Find each year and the average numbers of the content release in India on Netflix
--    return top 5 with highest avg content release.

SELECT 
	EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year,
	COUNT(*) AS yearly_content,
	ROUND(
	COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix WHERE country = 'India')::numeric * 100
	,2) AS average_content
FROM netflix
WHERE country = 'India'
GROUP BY 1

--11. List all the movies that are documentaries.

SELECT * FROM Netflix
WHERE 
	listed_in ILIKE '%documentaries%'

--12. Find all content without Director

SELECT title,director
FROM Netflix
WHERE director is NULL

--13. Find how many movies actor 'Salman Khan' appeared in last 10 years.

SELECT * FROM Netflix
WHERE
	casts ILIKE '%Salman Khan%'
	AND
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10

--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

SELECT
	UNNEST(STRING_TO_ARRAY(casts, ',')) AS actors,
	COUNT(show_id) AS total_content
FROM Netflix
WHERE country ILIKE '%india%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10


--15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the 
--    description field. Label content containing these keywords as 'Bad' and all other content as 
--    'Good'. Count how many item fall into each category.

WITH new_table
AS 
(
SELECT
	*,
	CASE
	WHEN
		description ILIKE '%kill%' OR
		description ILIKE '%violence%' THEN 'Bad_Content'
		ELSE 'Good_Content'
	END Category
FROM Netflix
)
SELECT 
	category,
	COUNT(*) AS total_content
FROM new_table
GROUP BY 1
		
)




















































































































































































































