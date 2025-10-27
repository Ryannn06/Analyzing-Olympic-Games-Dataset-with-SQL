DROP TABLE IF EXISTS athlete_event;
DROP TABLE IF EXISTS region;

CREATE TABLE IF NOT EXISTS region (
	noc VARCHAR PRIMARY KEY,
	region VARCHAR,
	note TEXT
);

CREATE TABLE IF NOT EXISTS athlete_event (
	id INT,
	name VARCHAR,
	sex VARCHAR,
	age INT, 
	height FLOAT,
	weight FLOAT,
	team VARCHAR,
	noc VARCHAR,
	FOREIGN KEY (noc) REFERENCES region(noc),
	games VARCHAR,
	year INT,
	season VARCHAR,
	city VARCHAR,
	sport VARCHAR,
	event VARCHAR,
	medal VARCHAR
);