Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Worksheet


Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
	i. 	Attribute table =		10000
	ii. 	Business table =		10000
	iii. 	Category table =		10000
	iv. 	Checkin table =			10000
	v. 	elite_years table =		10000
	vi. 	friend table = 			10000
	vii. 	hours table =			10000
	viii. 	photo table = 			10000
	ix. 	review table = 			10000
	x. 	tip table = 			10000
	xi. 	user table =			10000
	


2. Find the total number of distinct records for each of the keys listed below:

	i. 	Business =			10000 	(id)
	ii. 	Hours =				1562 	(business_id)
	iii. 	Category =			2643    (business_id)
	iv. 	Attribute =			1115	(business_id)
	v. 	Review =			10000	(id),		8090 (business_id), 	9581 (user_id)
	vi. 	Checkin = 			493 	(business_id)
	vii. 	Photo =				10000	(id),		6493 (business_id)
	viii. 	Tip = 				537	(user_id),      3979 (business_id)
	ix. 	User = 				10000	(id)
	x. 	Friend = 			11	(user_id)
	xi. 	Elite_years =	                2780	(user_id)
	


3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	
	SQL code used to arrive at answer:
		select id, name, review_count, yelping_since, useful, funny, cool, fans, average_stars, 
			   compliment_hot, compliment_more, compliment_profile, compliment_cute, compliment_list, 
			   compliment_note, compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos
		from  user
		where 	id is null
				or name is null
				or review_count is null
				or yelping_since is null
				or useful is null
				or funny is null
				or cool is null
				or fans is null
				or average_stars is null
				or compliment_hot is null
				or compliment_more is null
				or compliment_profile is null
				or compliment_cute is null
				or compliment_list is null
				or compliment_note is null
				or compliment_plain is null
				or compliment_cool is null
				or compliment_funny is null
				or compliment_writer is null
				or compliment_photos is null
	

	
4. Find the minimum, maximum, and average value for the following fields:

	i. Table: Review, Column: Stars
		min: 1		max: 5		avg: 3.7082
		
	ii. Table: Business, Column: Stars
		min: 1.0	max: 5.0	avg: 3.6549
	
	iii. Table: Tip, Column: Likes
		min: 0		max: 2		avg: 0.0144
	
	iv. Table: Checkin, Column: Count
		min: 1		max: 53		avg: 1.9414
	
	v. Table: User, Column: Review_count
		min: 0		max: 2000	avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
		select city, sum(review_count)
		from business
		group by city
		order by sum(review_count) desc
	
	Copy and Paste the Result Below:
		+-----------------+-------------------+
		| city            | sum(review_count) |
		+-----------------+-------------------+
		| Las Vegas       |             82854 |
		| Phoenix         |             34503 |
		| Toronto         |             24113 |
		| Scottsdale      |             20614 |
		| Charlotte       |             12523 |
		| Henderson       |             10871 |
		| Tempe           |             10504 |
		| Pittsburgh      |              9798 |
		| MontrÃ©al       |              9448 |
		| Chandler        |              8112 |
		| Mesa            |              6875 |
		| Gilbert         |              6380 |
		| Cleveland       |              5593 |
		| Madison         |              5265 |
		| Glendale        |              4406 |
		| Mississauga     |              3814 |
		| Edinburgh       |              2792 |
		| Peoria          |              2624 |
		| North Las Vegas |              2438 |
		| Markham         |              2352 |
		| Champaign       |              2029 |
		| Stuttgart       |              1849 |
		| Surprise        |              1520 |
		| Lakewood        |              1465 |
		| Goodyear        |              1155 |
		+-----------------+-------------------+

	
6. Find the distribution of star ratings to the business in the following cities:

	i. Avon
	
		SQL code used to arrive at answer:
			select stars as [Star Rating], count(stars) as [Count]
			from business b
			where city = 'Avon'
			group by stars
		
		Copy and Paste the Resulting Table Below (2 columns - star rating and count):
			+-------------+-------+
			| Star Rating | Count |
			+-------------+-------+
			|         1.5 |     1 |
			|         2.5 |     2 |
			|         3.5 |     3 |
			|         4.0 |     2 |
			|         4.5 |     1 |
			|         5.0 |     1 |
			+-------------+-------+
	
	
	ii. Beachwood

		SQL code used to arrive at answer:
			select stars as [Star Rating], count(stars) as [Count]
			from business b
			where city = 'Beachwood'
			group by stars
		
		Copy and Paste the Resulting Table Below (2 columns - star rating and count):
			+-------------+-------+
			| Star Rating | Count |
			+-------------+-------+
			|         2.0 |     1 |
			|         2.5 |     1 |
			|         3.0 |     2 |
			|         3.5 |     2 |
			|         4.0 |     1 |
			|         4.5 |     2 |
			|         5.0 |     5 |
			+-------------+-------+


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
		select name, review_count
		from user
		order by review_count desc
		limit 3
		
	Copy and Paste the Result Below:
		+--------+--------------+
		| name   | review_count |
		+--------+--------------+
		| Gerald |         2000 |
		| Sara   |         1629 |
		| Yuri   |         1339 |
		+--------+--------------+


8. Does posing more reviews correlate with more fans?
		- No
		
	Please explain your findings and interpretation of the results:
		- N/A
		
		SQL code:
			select name, review_count, fans
			from user
			order by fans desc
			limit 10
		
		Results:
			+-----------+--------------+------+
			| name      | review_count | fans |
			+-----------+--------------+------+
			| Amy       |          609 |  503 |
			| Mimi      |          968 |  497 |
			| Harald    |         1153 |  311 |
			| Gerald    |         2000 |  253 |
			| Christine |          930 |  173 |
			| Lisa      |          813 |  159 |
			| Cat       |          377 |  133 |
			| William   |         1215 |  126 |
			| Fran      |          862 |  124 |
			| Lissa     |          834 |  120 |
			+-----------+--------------+------+
	
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: more reviews with the word "love"

	
	SQL code used to arrive at answer:
		select (select count(text)
				from review
				where text like "%love%") as  love_text, 

			   (select count(text) 
				from review
				where text like "%hate%") as hate_text
		
		
		Results:
		+-----------+-----------+
		| love_text | hate_text |
		+-----------+-----------+
		|      1780 |       232 |
		+-----------+-----------+
	
	
		OR:
		
		SELECT 'love' Word, COUNT(text) [Total Count]
		FROM review
		WHERE text LIKE '%love%'
		UNION
		SELECT 'hate' Word, COUNT(text) [Total Count]
		FROM review
		WHERE text LIKE '%hate%'
		
		+------+-------------+
		| Word | Total Count |
		+------+-------------+
		| hate |         232 |
		| love |        1780 |
		+------+-------------+
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
		select name, fans
		from user
		order by fans desc
		limit 10
	
	Copy and Paste the Result Below:
		+-----------+------+
		| name      | fans |
		+-----------+------+
		| Amy       |  503 |
		| Mimi      |  497 |
		| Harald    |  311 |
		| Gerald    |  253 |
		| Christine |  173 |
		| Lisa      |  159 |
		| Cat       |  133 |
		| William   |  126 |
		| Fran      |  124 |
		| Lissa     |  120 |
		+-----------+------+
	
	
11. Is there a strong correlation between having a high number of fans and being listed 
	as "useful" or "funny?"
	
	SQL code used to arrive at answer:
		select name, fans, useful, funny
		from user
		order by fans desc, useful desc, funny desc
		limit 20
	
	Copy and Paste the Result Below:
		+-----------+------+--------+--------+
		| name      | fans | useful |  funny |
		+-----------+------+--------+--------+
		| Amy       |  503 |   3226 |   2554 |
		| Mimi      |  497 |    257 |    138 |
		| Harald    |  311 | 122921 | 122419 |
		| Gerald    |  253 |  17524 |   2324 |
		| Christine |  173 |   4834 |   6646 |
		| Lisa      |  159 |     48 |     13 |
		| Cat       |  133 |   1062 |    672 |
		| William   |  126 |   9363 |   9361 |
		| Fran      |  124 |   9851 |   7606 |
		| Lissa     |  120 |    455 |    150 |
		| Mark      |  115 |   4008 |    570 |
		| Tiffany   |  111 |   1366 |    984 |
		| bernice   |  105 |    120 |    112 |
		| Roanna    |  104 |   2995 |   1188 |
		| .Hon      |  101 |   7850 |   5851 |
		| Angela    |  101 |    158 |    164 |
		| Ben       |   96 |   1180 |   1155 |
		| Linda     |   89 |   3177 |   2736 |
		| Christina |   85 |    158 |     34 |
		| Jessica   |   84 |   2161 |   2091 |
		+-----------+------+--------+--------+
	
	Please explain your findings and interpretation of the results:
		- N/A


Part 2: Inferences and Analysis
	- N/A


	
