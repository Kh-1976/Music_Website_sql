CREATE TABLE IF NOT EXISTS Genre (
	id serial PRIMARY KEY,
	name varchar(40) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Performer (
	id serial PRIMARY KEY,
	name varchar(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Album (
	id serial PRIMARY KEY,
	name varchar(60) NOT NULL,
	year integer NOT NULL
);

CREATE TABLE IF NOT EXISTS Track (
	id serial PRIMARY KEY,
	name varchar(60) NOT NULL,
	duration time NOT NULL,
	album_id integer REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collection (
	id serial PRIMARY KEY,
	name varchar(60) NOT NULL,
	year integer NOT NULL
);

CREATE TABLE IF NOT EXISTS GenrePerformer (
	id serial PRIMARY KEY,
	genre_id integer NOT NULL REFERENCES Genre(id),
	performer_id integer NOT NULL REFERENCES Performer(id)

);

CREATE TABLE IF NOT EXISTS PerformerAlbum (
	id serial PRIMARY KEY,
	performer_id integer NOT NULL REFERENCES Performer(id),
	album_id integer NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS CollectionTrack (
	id serial PRIMARY KEY,
	collection_id integer NOT NULL REFERENCES Collection(id),
	track_id integer NOT NULL REFERENCES Track(id)
);

