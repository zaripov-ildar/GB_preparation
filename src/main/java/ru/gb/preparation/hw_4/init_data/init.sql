create table movie
(
    id       serial primary key,
    title    varchar(100),
    duration int
);

create table session
(
    session_id serial primary key,
    movie_id   int references movie (id),
    startTime  time,
    price      numeric(6, 2)
);

create table ticket
(
    id         bigserial primary key,
    session_id int references session (session_id)
);

insert into movie(title, duration)
values ('Moulin rouge', 120),
       ('Dead pool', 90),
       ('The Hitchhiker''s Guide to the Galaxy', 120),
       ('The wall', 90),
       ('Alien', 120);

insert into session(movie_id, startTime, price)
values (1, '09:00:00', '100.00'),
       (1, '20:00:00', '200.00'),
       (2, '10:00:00', '100.00'),
       (2, '21:00:00', '200.00'),
       (3, '16:00:00', '150.00'),
       (4, '15:00:00', '150.00'),
       (4, '23:00:00', '200.00'),
       (5, '19:00:00', '250.00');

insert into ticket(session_id)
values (1),
       (1),
       (1),
       (1),
       (3),
       (3),
       (3),
       (5),
       (5),
       (5),
       (5),
       (8);