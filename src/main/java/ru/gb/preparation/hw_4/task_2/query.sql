-- перерывы 30 минут и более между фильмами —
-- выводить по уменьшению длительности перерыва. Колонки:
-- «фильм 1», «время начала», «длительность», «время начала второго фильма», «длительность перерыва»;

with t as (select *,
                  starttime + duration * '1 minute'::interval   as finish,
                  lead(starttime) over (order by starttime)     as next_start,
                  (starttime + duration * '1 minute'::interval) as movies_end
           from session
                    join movie m on session.movie_id = m.id)

select title as "фильм 1",
       starttime as "время начала",
       duration as "длительность",
       next_start as "время начала второго фильма",
       extract(epoch from next_start - movies_end) / 60 as "длительность перерыва"
from t
where next_start - movies_end >= '30 minutes'::interval

