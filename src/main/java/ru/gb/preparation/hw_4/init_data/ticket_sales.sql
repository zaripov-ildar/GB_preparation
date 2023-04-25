select title, starttime,  count(price) as tickets, sum(price)
from movie
         join  session s on movie.id = s.movie_id
         left outer join  ticket t on s.session_id = t.session_id
group by title, starttime
order by starttime;