BEGIN TRANSACTION;

DROP TABLE IF EXISTS length_five_words, used_words CASCADE;
-- Disabling the user table for now. May implement a user table for a scoring system at a later time

-- CREATE TABLE users (
-- 	user_id SERIAL,
-- 	username varchar(50) NOT NULL UNIQUE,
-- 	password_hash varchar(200) NOT NULL,
-- 	role varchar(50) NOT NULL,
-- 	CONSTRAINT PK_user PRIMARY KEY (user_id)
-- );

-- table to hold all 5 letter words allowable in scrabble 
CREATE TABLE length_five_words(
	word_id SERIAL, 
	word char(5) NOT NULL UNIQUE,
	word_definition varchar(1000),
	CONSTRAINT PK_lfw PRIMARY KEY (word_id)
);

-- table to hold all words that have been used 
CREATE TABLE used_words(
	word_id integer NOT NULL UNIQUE,
	date_used DATE NOT NULL,
	CONSTRAINT PK_used_words PRIMARY KEY (word_id, date_used),
	CONSTRAINT FK_lfw_used FOREIGN KEY (word_id) REFERENCES length_five_words (word_id)
);

COMMIT TRANSACTION;
