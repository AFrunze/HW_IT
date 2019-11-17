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
