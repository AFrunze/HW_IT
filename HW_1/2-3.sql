--2
-- вставка данных об эмитентах
INSERT INTO public.listing_task ("IssuerName", "IssuerName_NRD", "IssuerOKPO")
   SELECT "IssuerName","IssuerName_NRD","IssuerOKPO"
   FROM public.bond_description_task
   WHERE public.listing_task."ISIN" = public.bond_description_task."ISINCode";
 
-- вставка данных о площадках, пусть это будет BOARDID и BOARDNAME
INSERT INTO public.listing_task ("BOARDID", "BOARDNAME")
   SELECT "BOARDID", "BOARDNAME"
   FROM public.quotes_task
   WHERE public.listing_task."ISIN" = public.bquotes_task."ISIN";

-- 3
-- Далее свяжем таблицы listing_task и bond_description с помощью ID
-- В таблице bond_description создадим поле ID
-- Импортируем в это поле значения ID из таблицы listing_task при условии, что ISIN-коды значений совпадают
-- Присваиваем полю ID в таблице bond_descrption внешний ключ из таблицы listing_task

ALTER TABLE public.bond_description
    ADD COLUMN "ID" integer;

UPDATE bond_description
SET "ID"=listing_task."ID"
FROM listing_task
WHERE bond_description."ISIN, RegCode, NRDCode"=listing."ISIN"

ALTER TABLE public.bond_description
ADD CONSTRAINT fr_key_1 FOREIGN KEY ("ID") REFERENCES public.listing_task ("ID");
