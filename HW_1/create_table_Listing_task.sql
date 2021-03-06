-- сохранить файл Excel в формате csv
-- импортировать с помощью функции copy данные из файла, указать откуда (FROM) копировать данные.
-- У меня не вышло (из папки tmp тоже), поэтому с помощью  IMPORT/EXPORT: 
-- Вверху строчка EXPORT, ползунок на IMPORT
-- Далее выбрать файл, переходя в папку, где находится документ или сразу вставить путь
-- Он должен быть в формате csv
-- Далее ползунок в HEADER 
-- После этого нужно выбирать делиметр: обычно это точка с запятой
-- В строчке ENCONDING выбирать WIN1251 / UTF8
-- И после всех этих действий нажать ОК 

CREATE TABLE public.listing_task
(
    "ID" integer NOT NULL,
    "ISIN" text COLLATE pg_catalog."default" NOT NULL,
    "Platform" text COLLATE pg_catalog."default" NOT NULL,
    "Section" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT listing_task_pkey PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE public.listing_task
    OWNER to postgres;

-- copy public.listing_task  FROM '/Users/a1/Desktop/IT для финансистов/дз1/Data/Облигации/listing_task.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN 1251';
--\copy public.listing_task  FROM '/Users/a1/Desktop/IT для финансистов/дз1/Data/Облигации/listing_task.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN 1251';
