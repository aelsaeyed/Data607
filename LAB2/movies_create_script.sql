CREATE TABLE IF NOT EXISTS public.friends
(
	person_id int generated always as identity ,
    first_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
	age int NOT NULL,
	PRIMARY KEY(person_id)
)
TABLESPACE pg_default;
ALTER TABLE IF EXISTS public.friends
    OWNER to postgres;
	
Insert into friends (first_name, last_name, age)
Values
('Ahmed', 'Elsaeyed', 26),
('Noon', 'Elsaeyed', 22),
('Sami', 'Elsaeyed', 21),
('Umm', 'Hafsah', 23),
('Ridwan', 'Jojo', 26),
('Yousseff', 'Abusharif', 29)
Returning *




CREATE TABLE IF NOT EXISTS public.movies
(
	movie_id serial PRIMARY KEY,
    movie_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    year_out int
)
TABLESPACE pg_default;
ALTER TABLE IF EXISTS public.movies
    OWNER to postgres;
	
Insert into movies (movie_name, year_out)
Values
('Interstellar', 2012),
('Spiderman: No Way Home', 2021),
('Dune', 2021),
('The Matrix: Resurrection', 2021),
('Arrival', 2016),
('Akira', 1990)
Returning *



CREATE TABLE IF NOT EXISTS public.ratings
(
	rating_id serial PRIMARY KEY,
	rater int,
	movie int,
	score int,
    constraint fk_rater
		foreign key(rater)
		references friends(person_id),
    constraint fk_movie
		foreign key(movie)
		references movies(movie_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ratings
    OWNER to postgres;
	

Insert into ratings (rater, movie, score)
Values
(1, 1, 5),
(1, 2, 4),
(1, 3, 3),
(1, 4, 2),
(1, 5, 3),
(1, 6, 5),
(2, 1, 5),
(2, 2, 4),
(2, 3, 3),
(2, 4, NULL),
(2, 5, NULL),
(2, 6,  NULL),
(3, 1, 4),
(3, 2, 3),
(3, 3, 5),
(3, 4, NULL),
(3, 5, 3),
(3, 6, NULL),
(4, 1, 5),
(4, 2, 4),
(4, 3, 5),
(4, 4, 2),
(4, 5, NULL),
(4, 6, NULL),
(5, 1, 5),
(5, 2, 4),
(5, 3, 3),
(5, 4, 2),
(5, 5, 4),
(5, 6, NULL),
(6, 1, 5),
(6, 2, 4),
(6, 3, 4),
(6, 4, 3),
(6, 5, NULL),
(6, 6, 3)
Returning *

