-- сохранить файл Excel в формате csv, все форматы дат сделать именно датами,числа числами (0 и 1 в boolean), 
удалить лишние (скрытые) листы из файла, отобразить все столбцы
-- импортировать с помощью функции copy данные из файла, указать откуда (FROM) копировать данные.
-- У меня не вышло (из папки tmp тоже), поэтому с помощью  IMPORT/EXPORT: 
-- Вверху строчка EXPORT,ползунок на IMPORT
-- Далее выбрать файл, переходя в папку, где находится документ или сразу вставить путь
-- Он должен быть в формате csv
-- Далее ползунок в HEADER 
-- После этого нужно выбирать делиметр: обычно это точка с запятой
-- В строчке ENCONDING выбирать WIN1251 / utf8
-- И после всех этих действий нажать ОК 

CREATE TABLE public.bond_description
(
    "ISIN, RegCode, NRDCode" text COLLATE pg_catalog."default" NOT NULL,,
    "FinToolType" text COLLATE pg_catalog."default" NOT NULL,,
    "SecurityType" text COLLATE pg_catalog."default",
    "SecurityKind" text COLLATE pg_catalog."default",
    "CouponType" text COLLATE pg_catalog."default",
    "RateTypeNameRus_NRD" text COLLATE pg_catalog."default",
    "CouponTypeName_NRD" text COLLATE pg_catalog."default",
    "HaveOffer" boolean NOT NULL,
    "AmortisedMty" boolean NOT NULL,
    "MaturityGroup" text COLLATE pg_catalog."default",
    "IsConvertible" boolean NOT NULL,
    "ISINCode" text COLLATE pg_catalog."default" NOT NULL,
    "Status" text COLLATE pg_catalog."default",
    "HaveDefault" boolean NOT NULL,
    "IsLombardCBR_NRD" boolean,
    "IsQualified_NRD" boolean,
    "ForMarketBonds_NRD" boolean,
    "MicexList_NRD" text,
    "Basis" text,
    "Basis_NRD" text,
    "Base_Month" text,
    "Base_Year" text,
    "Coupon_Period_Base_ID" integer,
    "AccruedintCalcType" boolean,
    "IsGuaranteed" boolean,
    "GuaranteeType" text COLLATE pg_catalog."default",
    "GuaranteeAmount" text COLLATE pg_catalog."default",
    "GuarantVal" bigint,
    "Securitization" text,
    "CouponPerYear" integer, 
    "Cp_Type_ID" integer, 
    "NumCoupons" integer,
    "NumCoupons_M" integer, 
    "NumCoupons_NRD" integer,
    "Country" text, --char[2]
    "FaceFTName" text, --char[3]
    "FaceFTName_M" integer,
    "FaceFTName_NRD" text, --char[3]
    "FaceValue" real,
    "FaceValue_M" integer,
    "FaceValue_NRD" real,
    "CurrentFaceValue_NRD" real,
    "BorrowerName" text COLLATE pg_catalog."default",
    "BorrowerOKPO" bigint,
    "BorrowerSector" text COLLATE pg_catalog."default",
    "BorrowerUID" integer,
    "IssuerName" text COLLATE pg_catalog."default",
    "IssuerName_NRD" text COLLATE pg_catalog."default",
    "IssuerOKPO" bigint,
    "NumGuarantors" smallint,
    "EndMtyDate" date,
    CONSTRAINT bond_description_pkey PRIMARY KEY ("ISIN, RegCode, NRDCode")
)

TABLESPACE pg_default;

ALTER TABLE public.bond_description
    OWNER to postgres

-- copy public.listing_task  FROM '/Users/a1/Desktop/IT для финансистов/дз1/Data/Облигации/bond_description_task.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN 1251';
--\copy public.listing_task  FROM '/Users/a1/Desktop/IT для финансистов/дз1/Data/Облигации/bond_description_task.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN 1251';
