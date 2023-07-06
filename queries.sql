/* Questions:
What are the average daily riders by month/season/day of week?  When is it the busiest?

What is the most busy meter location in Montreal?

What time of day are most bikes being used?  For commutes? Check weekend vs weekday.

How does the winter weather affect usage of bikes?

Did bike usage decrease during covid?  When did the usage begin to come back up if so?
What neighborhoods in Montreal have the most bike traffic?

Check bike usage rates at times/locations of sporting events?  Ex.  Olympic stadium
Do something with lat/long in tableau or python data visualization
*/

---------------------------------------------------------------------------------------------
/* This query shows the total number of passages per the first five months of 2023 */
SELECT EXTRACT(MONTH FROM date_time) AS Month, SUM(num_passages) AS total_passages
FROM twothreecounts	   
GROUP BY EXTRACT(MONTH FROM date_time)
ORDER BY total_passages DESC;

/* 2022 passages by month */
SELECT EXTRACT(MONTH FROM date_time) AS Month, SUM(num_passages) AS total_passages
FROM twotwocounts	   
GROUP BY EXTRACT(MONTH FROM date_time)
ORDER BY total_passages DESC;

/* Most busy meter location 2023 */
SELECT twothreecounts.meter_id, name, SUM(num_passages) AS total_passages
FROM twothreecounts
JOIN meter_loc ON twothreecounts.meter_id = meter_loc.meter_id
GROUP BY twothreecounts.meter_id, name
HAVING SUM(num_passages) IS NOT NULL
ORDER BY total_passages DESC;

/* Most busy meter location in 2022 */
SELECT twotwocounts.meter_id, name, SUM(num_passages) AS total_passages
FROM twotwocounts
JOIN meter_loc ON twotwocounts.meter_id = meter_loc.meter_id
GROUP BY twotwocounts.meter_id, name
HAVING SUM(num_passages) IS NOT NULL
ORDER BY total_passages DESC;

SELECT twotwocounts.meter_id, name, date_time, num_passages
FROM twotwocounts
JOIN meter_loc
ON twotwocounts.meter_id = meter_loc.meter_id
WHERE num_passages IS NOT NULL
ORDER BY num_passages DESC;