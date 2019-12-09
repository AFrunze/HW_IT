-- сохранить файл Excel в формате csv, все форматы дат сделать именно датами в формате ММ.ДД.ГГГГ, поле Time также преобразовать в формат ММ.ДД.ГГГГ,
-- удалить лишние листы из файла,отобразить скрытые столбцы
-- импортировать с помощью функции copy данные из файла, указать откуда (FROM) копировать данные.
-- У меня не вышло (из папки tmp тоже), поэтому с помощью  IMPORT/EXPORT: 
-- Вверху строчка EXPORT, ползунок на IMPORT
-- Далее выбрать файл, переходя в папку, где находится документ или сразу вставить путь
-- Он должен быть в формате csv
-- Далее ползунок в HEADER 
-- После этого нужно выбрать делиметр: обычно это точка с запятой
-- В строчке ENCONDING выбирать WIN1251 / UTF8
-- И после всех этих действий нажать ОК 
-- Для формата real нужно, чтобы использовалась ".", а не ",", как разделитель разрядов.

CREATE TABLE public.quotes_task
(
    "ID" integer NOT NULL,
    "TIME" date NOT NULL,
    "ACCRUEDINT" real NOT NULL,
    "ASK" real NOT NULL,
    "ASK_SIZE" integer,
    "ASK_SIZE_TOTAL" integer,
    "AVGE_PRCE" real,
    "BID" real,
    "BID_SIZE" integer,
    "BID_SIZE_TOTAL" integer,
    "BOARDID" text COLLATE pg_catalog."default",
    "BOARDNAME" text COLLATE pg_catalog."default",
    "BUYBACKDATE" date,
    "BUYBACKPRICE" real,
    "CBR_LOMBARD" real,
    "CBR_PLEDGE" real,
    "CLOSE" real,
    "CPN" real,
    "CPN_DATE" date,
    "CPN_PERIOD" integer,
    "DEAL_ACC" integer,
    "FACEVALUE" real,
    "ISIN" text COLLATE pg_catalog."default",
    "ISSUER" text COLLATE pg_catalog."default",
    "ISSUESIZE" bigint,
    "MAT_DATE" date,
    "MPRICE" real,
    "MPRICE2" real,
    "SPREAD" real,
    "VOL_ACC" integer,
    "Y2O_ASK" real,
    "Y2O_BID" real,
    "YIELD_ASK" real,
    "YIELD_BID" real
)

TABLESPACE pg_default;

ALTER TABLE public.quotes_task
    OWNER to postgres;

-- copy public.listing_task  FROM '/Users/a1/Desktop/IT для финансистов/дз1/Data/Облигации/quotes_task.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN 1251';
--\copy public.listing_task  FROM '/Users/a1/Desktop/IT для финансистов/дз1/Data/Облигации/quotes_task.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN 1251';
