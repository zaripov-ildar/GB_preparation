with t as (select *, starttime + duration * '1 minute'::interval as finish
           from session
                    join movie m on session.movie_id = m.id)

select m1.title,
       m1.startTime,
       m1.duration,
       m2.title,
       m2.startTime,
       m2.duration

from t m1
         join t m2 on m1.session_id <> m2.session_id
    and m1.starttime <= m2.starttime
    and (m1.starttime between m2.starttime and m2.finish
        or m1.finish between m2.starttime and m2.finish)
order by m1.starttime, m2.starttime;