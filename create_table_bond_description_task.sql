-- сохранить файл Excel в формате csv, все форматы дат сделать именно датами,числа числами (0 и 1 в boolean), удалить лишние (скрытые) листы из файла, отобразить все столбцы
-- импортировать с помощью функции copy данные из файла, указать откуда (FROM) копировать данные.
-- У меня не вышло (из папки tmp тоже), поэтому с помощью  IMPORT/EXPORT: 
-- Вверху строчка EXPORT, двигаешь ползунок на IMPORT
-- Далее выбрать файл, переходя в папку, где находится документ или сразу вставить путь
-- Он должен быть в формате csv
-- Далее сдвигаешь ползунок в HEADER 
-- После этого нужно выбирать делиметр: обычно это точка с запятой, у меня запятая
-- В строчке ENCONDING выбирать WIN1251 
-- И после всех этих действий нажать ОК 

CREATE TABLE public.bond_description
(
    "ISIN, RegCode, NRDCode" text NOT NULL,
    "FinToolType" text,
    "SecurityType" text,
    "SecurityKind" text,
    "CouponType" text,
    "RateTypeNameRus_NRD" text,
    "CouponTypeName_NRD" text,
    "HaveOffer" boolean,
    "AmortisedMty" boolean,
    "MaturityGroup" text,
    "IsConvertible" boolean,
    "ISINCode" text,
    "Status" text,
    "HaveDefault" boolean,
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
    "GuaranteeType" text,
    "GuaranteeAmount" text,
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
    "BorrowerName" text,
    "BorrowerOKPO" bigint,
    "BorrowerSector" text,
    "BorrowerUID" integer,
    "IssuerName" text,
    "IssuerName_NRD" text,
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
