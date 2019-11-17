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
