-- ошибки в расписании (фильмы накладываются друг на друга),
-- отсортированные по возрастанию времени.
-- Выводить надо колонки
-- «фильм 1», «время начала», «длительность», «фильм 2», «время начала», «длительность»;
with t as (select *, starttime + duration * '1 minute'::interval as finish
           from session
                    join movie m on session.movie_id = m.id)

select m1.title     as "фильм 1",
       m1.startTime as "время начала",
       m1.duration  as "длительность",
       m2.title     as "фильм 2",
       m2.startTime as "время начала",
       m2.duration  as "длительность"

from t m1
         join t m2 on m1.session_id <> m2.session_id
    and m1.starttime <= m2.starttime
    and (m1.starttime between m2.starttime and m2.finish
        or m1.finish between m2.starttime and m2.finish)
order by m1.starttime, m2.starttime;