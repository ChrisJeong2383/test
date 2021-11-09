--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS PlayerBuildings;
DROP TABLE IF EXISTS PlayerOwns;	


-- Create the schema.
CREATE TABLE Game (
	ID SERIAL PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID SERIAL PRIMARY KEY,
	email varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	playerMoney integer,
	playerLocation varchar(50)
	);

CREATE TABLE PlayerOwns (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	playerOwnsName varchar(50)
	);

CREATE TABLE PlayerBuildings(
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	buildingName varchar(15),	
	amount integer,
	playerOwnsName varchar(50)	

	);
-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerBuildings TO PUBLIC;
GRANT SELECT ON PlayerOwns TO PUBLIC;

INSERT INTO Game VALUES (1,'2006-06-27 08:00:00');
INSERT INTO Game VALUES (2,'2006-06-28 13:20:00');
INSERT INTO Game VALUES (3,'2006-06-29 18:41:00');
INSERT INTO Game VALUES (4,'2021-10-30 18:38:00');

INSERT INTO Player(ID, email) VALUES (1, 'me@calvin.edu');
INSERT INTO Player(ID, email, name) VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player(ID, email, name) VALUES (3, 'dog@gmail.edu', 'Dogbreath');
INSERT INTO Player VALUES (4, 'chris@calvin.edu', 'Chris da Master');

INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);
INSERT INTO PlayerGame VALUES (4, 1, 1800.00, 1500.00, 'Trapped');
INSERT INTO PlayerGame VALUES (4, 2, 1067.00, 567.00, 'Jail');


INSERT INTO PlayerOwns VALUES (4, 1, 'Tokyo-Tower');
INSERT INTO PlayerOwns VALUES (4, 1, 'Seoul-Hotel');
INSERT INTO PlayerOwns VALUES (4, 2, 'Grand Canyon Mansion');
INSERT INTO PlayerOwns VALUES (4, 3, 'North Korea Palace');
INSERT INTO PlayerOwns VALUES (4, 3, 'Trump-Tower');
INSERT INTO PlayerOwns VALUES (4, 2, 'Niagara Fall');
INSERT INTO PlayerOwns VALUES (4, 4, 'Knollcrest Dininghall');


INSERT INTO PlayerBuildings VALUES (4, 1, 'tower', 2, 'Tokyo-Tower');
INSERT INTO PlayerBuildings VALUES (4, 1, 'hotel', 2, 'Seoul-Hotel');
INSERT INTO PlayerBuildings VALUES (4, 2, 'hotel', 3, 'Grand Canyon Mansion');
INSERT INTO PlayerBuildings VALUES (4, 2, 'house', 1, 'Niagara Fall');
INSERT INTO PlayerBuildings VALUES (4, 3, 'palace', 1, 'North Korea Palace');
INSERT INTO PlayerBuildings VALUES (4, 3, 'hotel', 1, 'Trump-Tower');
INSERT INTO PlayerBuildings VALUES (4, 4, 'house', 1, 'Knollcrest Dininghall');