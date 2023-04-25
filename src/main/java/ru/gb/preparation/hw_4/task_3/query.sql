-- список фильмов, для каждого — с указанием общего числа посетителей за все время,
-- среднего числа зрителей за сеанс и
-- общей суммы сборов по каждому фильму
-- (отсортировать по убыванию прибыли).
-- Внизу таблицы должна быть строчка «итого», содержащая данные по всем фильмам сразу;
with a as (select title,
                  sum(visitors) as visitors,
                  avg(visitors) as avg_visitors,
                  sum(proceed)  as proceed
           from movie m
                    join (select s.session_id,
                                 movie_id,
                                 count(t.session_id) * s.price as proceed,
                                 count(t.session_id)           as visitors,
                                 price
                          from session s
                                   left outer join ticket t on s.session_id = t.session_id
                          group by s.session_id) t
                         on m.id = t.movie_id
           group by title
           order by proceed desc)
select *
from a

union all

select 'TOTAL:',
       sum(visitors),
       sum(avg_visitors),
       sum(proceed)
from a;


