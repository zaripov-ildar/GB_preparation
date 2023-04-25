with t as (select *,
                  starttime + duration * '1 minute'::interval   as finish,
                  lead(starttime) over (order by starttime)     as next_start,
                  (starttime + duration * '1 minute'::interval) as movies_end
           from session
                    join movie m on session.movie_id = m.id)

select title,
       starttime,
       duration,
       next_start,
       extract(epoch from next_start - movies_end) / 60 as break
from t
where next_start - movies_end >= '30 minutes'::interval

