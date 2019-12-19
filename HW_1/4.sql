--В сформированной базе данных составьте запрос, возвращающий имена эмитентов, чьи
--облигации торгуются на МБ в режиме основных торгов, и по каждой из которых доля дней,
--когда котировка [BID или ASK выберете самостоятельно] не существовала,
--составляла бы не более 10% наблюдений за бумагой. Таблица должна содержать поля issuer, ISIN и nun_ratio
--(долю наблюдений без пропуска котировки). (2 балла)

-- котировка ASK = 0 считаем, что она не существовала, значений NULL в ASK - нет.
select "ISSUER","ISIN","nun_ratio"
from (select "ISSUER","ISIN",
          ((select Count("ASK")* 100 
          from public.public.quotes_task 
          where public.quotes_task."ASK" = 0  Group By "ISIN")
          / (select Count("ASK") 
             from public.public.quotes_task 
             Group By "ISIN")) as "nun_ratio" 
      where "nun_ratio" < 10
     )
where "ISIN" in ( select "ISIN" from public.listing_task
                 where public.listing_task."Platform" like "Московская Биржа " 
                 and public.listing_task."Section" like "Основной");
