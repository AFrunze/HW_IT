-- сохранить файл Excel в формате csv
-- импортировать с помощью функции copy данные из файла. 
-- У меня не вышло поэтому с помощью  IMPORT/EXPORT: 
-- Вверху строчка EXPORT, двигаешь ползунок и написано уже IMPORT
-- Далее выбираешь файл, переходя в папку, где находится твой документ 
-- Он должен быть в формате csv (удобнее, если файл находится на рабочем столе)
-- Далее сдвигаешь ползунок в HEADER 
-- После этого выбираешь делиметр: обычно это точка с запятой
-- И еще там где-то есть строчка ENCONDING, там выбираешь WIN1251 
-- И после всех этих действий нажимаешь ОК ну или другая кнопка для подтверждения(не помню точно, как называетсч кнопка)

CREATE TABLE public.listing_task
(
    "ID" bigint NOT NULL,
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
