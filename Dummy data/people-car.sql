create table car (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(50) NOT NULL,
	model VARCHAR(50) NOT NULL,
	price NUMERIC(19,2) NOT NULL
);


create table people (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(50) NOT NULL,
	email VARCHAR(50),
	date_of_birth DATE,
	country_of_birth VARCHAR(50),
    car_id BIGINT REFERENCES car (id),
    UNIQUE(car_id)
);


insert into people (first_name, last_name, gender, email, date_of_birth, country_of_birth) values ('Carolina', 'Draycott', 'Female', 'cdraycott0@privacy.gov.au', '1991-09-16', 'China');
insert into people (first_name, last_name, gender, email, date_of_birth, country_of_birth) values ('Mendie', 'Lethebridge', 'Male', 'mlethebridge1@flickr.com', '1995-09-23', 'United States');
insert into people (first_name, last_name, gender, email, date_of_birth, country_of_birth) values ('Minda', 'Philipsen', 'Male', 'mphilipsen2@reverbnation.com', '2005-06-02', 'China');
insert into people (first_name, last_name, gender, email, date_of_birth, country_of_birth) values ('Tresa', 'Drewe', 'Male', null, null, null);
insert into people (first_name, last_name, gender, email, date_of_birth, country_of_birth) values ('Jill', 'Lyosik', 'Male', 'jlyosik4@livejournal.com', '1999-04-05', 'China');

insert into CAR (id, make, model, price) values (1, 'Mitsubishi', 'Truck', '689344.61');
insert into CAR (id, make, model, price) values (2, 'Audi', '200', '565047.35');
insert into CAR (id, make, model, price) values (3, 'Toyota', 'FJ Cruiser', '755980.45');
insert into CAR (id, make, model, price) values (4, 'Chrysler', 'Pacifica', '132158.92');
insert into CAR (id, make, model, price) values (5, 'Lexus', 'IS', '439259.35');