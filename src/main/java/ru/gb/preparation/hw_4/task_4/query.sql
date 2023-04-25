-- число посетителей и кассовые сборы,
-- сгруппированные по времени начала фильма:
-- с 9 до 15, с 15 до 18, с 18 до 21, с 21 до 00:00
-- (сколько посетителей пришло с 9 до 15 часов и т.д.).
select case
           when starttime between '09:00:00' and '15:00:00' then 'с 9 до 15'
           when starttime between '15:00:00' and '18:00:00' then 'с 15 до 18'
           when starttime between '18:00:00' and '21:00:00' then 'с 18 до 21'
           else 'с 21 до 00:00'
           end as "период",
       count(t.session_id) as "посетителей",
       sum(price) as "выручка"
from session s
         left join ticket t on s.session_id = t.session_id
group by "период";


