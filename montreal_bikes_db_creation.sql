/* This table contains data about the bike meters. */
CREATE TABLE meter_loc(
	meter_id INT PRIMARY KEY,
	former_id INT,
	name VARCHAR(100),
	status VARCHAR(100),
	latitude numeric,
	longitude numeric,
	year_installed INT
);

SELECT * FROM meter_loc;

/*Taking the PK off of meter_id because there was a duplicate.*/
ALTER TABLE meter_loc DROP COLUMN meter_id;
ALTER TABLE meter_loc ADD COLUMN meter_id INT;

/* Moving former_id col to the end of the dataset*/
ALTER TABLE meter_loc DROP COLUMN former_id;
ALTER TABLE meter_loc ADD COLUMN former_id INT;

COPY meter_loc(meter_id, former_id, name, status, latitude, longitude, year_installed)
FROM 'C:\Users\Ben\Data Analytics\datasets\montreal_bikes\localisation_des_compteurs_velo.csv'
DELIMITER ','
CSV HEADER;

/* This table has all the counts for the year 2023 so far.*/
CREATE TABLE twothreecounts(
	date_time TIMESTAMP,
	meter_id INT,
	num_passages INT
)

SELECT * FROM twothreecounts;

COPY twothreecounts(date_time, meter_id, num_passages)
FROM 'C:\Users\Ben\Data Analytics\datasets\montreal_bikes\comptage_velo_2023.csv'
DELIMITER ','
CSV HEADER;

/* Loading in the data for 2022 to compare with 2023.*/
CREATE TABLE twotwocounts(
	date_time TIMESTAMP,
	meter_id INT,
	num_passages INT
);

SELECT * FROM twotwocounts;

COPY twotwocounts(date_time, meter_id, num_passages)
FROM 'C:\Users\Ben\Data Analytics\datasets\montreal_bikes\comptage_velo_2022.csv'
DELIMITER ','
CSV HEADER;
/* There is an error "ERROR:  extra data after last expected column"
And the format of the 2022 csv file is diff
Need to transpose in excel to same format*/

