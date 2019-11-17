-- сохранить файл Excel в формате csv, все форматы дат сделать именно датами, удалить лишние(скрытые) листы из файла, отобразить все столбцы
-- импортировать с помощью функции copy данные из файла, указать откуда (FROM) копировать данные.
-- У меня не вышло (из папки tmp тоже), поэтому с помощью  IMPORT/EXPORT: 
-- Вверху строчка EXPORT, двигаешь ползунок на IMPORT
-- Далее выбрать файл, переходя в папку, где находится документ или сразу вставить путь
-- Он должен быть в формате csv
-- Далее сдвигаешь ползунок в HEADER 
-- После этого нужно выбирать делиметр: обычно это точка с запятой, у меня запятая
-- В строчке ENCONDING выбирать WIN1251 
-- И после всех этих действий нажать ОК 

CREATE TABLE public.listing_task
(
    "ISIN, RegCode, NRDCode"
    "FinToolType"
    "SecurityType"
    "SecurityKind"
    "CouponType"
    "RateTypeNameRus_NRD"
    "CouponTypeName_NRD"
    "HaveOffer"
    "AmortisedMty"
    "MaturityGroup"
    "IsConvertible"
    "ISINCode"
    "Status"
    "HaveDefault"
    "IsLombardCBR_NRD"
    "IsQualified_NRD"
    "ForMarketBonds_NRD"
    "MicexList_NRD"
    "Basis"
    "Basis_NRD"
    "Base_Month"
    "Base_Year"
    "Coupon_Period_Base_ID"
    "AccruedintCalcType"
    "IsGuaranteed"
    "GuaranteeType"
    "GuaranteeAmount"
    "GuarantVal"
    "Securitization"
    "CouponPerYear"
    "Cp_Type_ID"
    "NumCoupons"
    "NumCoupons_M"
    "NumCoupons_NRD"
    "Country"
    "FaceFTName"
    "FaceFTName_M"
    "FaceFTName_NRD"
    "FaceValue"
    "FaceValue_M"
    "FaceValue_NRD"
    "CurrentFaceValue_NRD"
    "BorrowerName"
    "BorrowerOKPO"
    "BorrowerSector"
    "BorrowerUID"
    "IssuerName"
    "IssuerName_NRD"
     "IssuerOKPO"
    "NumGuarantors"
    "EndMtyDate"
    CONSTRAINT listing_task_pkey PRIMARY KEY ("ISIN, RegCode, NRDCode")
)

TABLESPACE pg_default;

ALTER TABLE public.listing_task
    OWNER to postgres

-- copy public.listing_task  FROM '/Users/a1/Desktop/IT для финансистов/дз1/Data/Облигации/bond_description_task.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN 1251';
--\copy public.listing_task  FROM '/Users/a1/Desktop/IT для финансистов/дз1/Data/Облигации/bond_description_task.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN 1251';
