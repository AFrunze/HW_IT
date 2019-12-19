```python
import psycopg2
import getpass

conn=psycopg2.connect(user='postgres',
              database='postgres',
              host='localhost',
              port='5432',
              password=getpass.getpass('Insert password: '))
```

    Insert password: ········



```python
print(conn.get_dsn_parameters())
```

    {'user': 'postgres', 'dbname': 'postgres', 'host': 'localhost', 'port': '5432', 'tty': '', 'options': '', 'sslmode': 'prefer', 'sslcompression': '0', 'krbsrvname': 'postgres', 'target_session_attrs': 'any'}



```python
import pandas as pd
cursor = conn.cursor()
cursor.execute('SELECT * FROM public.listing_task LIMIT 10')
for row in cursor:
    print(row)    
```

    (1067752, 'RU000A0JUCX1', 'Московская Биржа ', ' РПС')
    (853537, 'RU000A0JRTS1', 'Московская Биржа ', ' Основной')
    (1068784, 'RU000A0JUCX1', 'Московская Биржа ', ' РЕПО')
    (1071049, 'RU000A0JUCX1', 'ЦБ России ', ' Рынок РЕПО с ЦБ РФ')
    (1077325, 'RU000A0JUCX1', 'ЦБ России ', ' Ломбардный список')
    (1099396, 'RU000A0JUCX1', 'НФА ', ' Ценовой центр')
    (139182, 'RU000A0JQ6N0', 'Московская Биржа ', ' РПС')
    (1064404, 'RU000A0JRTT9', 'Московская Биржа ', ' Основной')
    (139236, 'RU000A0JQ6N0', 'Московская Биржа ', ' РЕПО')
    (149079, 'RU000A0JQ6N0', 'Московская Биржа - РТС ', ' РТС Classica')



```python
df = pd.read_sql("SELECT * FROM public.listing_task", conn)
df.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>ISIN</th>
      <th>Platform</th>
      <th>Section</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>1067752</td>
      <td>RU000A0JUCX1</td>
      <td>Московская Биржа</td>
      <td>РПС</td>
    </tr>
    <tr>
      <td>1</td>
      <td>853537</td>
      <td>RU000A0JRTS1</td>
      <td>Московская Биржа</td>
      <td>Основной</td>
    </tr>
    <tr>
      <td>2</td>
      <td>1068784</td>
      <td>RU000A0JUCX1</td>
      <td>Московская Биржа</td>
      <td>РЕПО</td>
    </tr>
    <tr>
      <td>3</td>
      <td>1071049</td>
      <td>RU000A0JUCX1</td>
      <td>ЦБ России</td>
      <td>Рынок РЕПО с ЦБ РФ</td>
    </tr>
    <tr>
      <td>4</td>
      <td>1077325</td>
      <td>RU000A0JUCX1</td>
      <td>ЦБ России</td>
      <td>Ломбардный список</td>
    </tr>
    <tr>
      <td>5</td>
      <td>1099396</td>
      <td>RU000A0JUCX1</td>
      <td>НФА</td>
      <td>Ценовой центр</td>
    </tr>
    <tr>
      <td>6</td>
      <td>139182</td>
      <td>RU000A0JQ6N0</td>
      <td>Московская Биржа</td>
      <td>РПС</td>
    </tr>
    <tr>
      <td>7</td>
      <td>1064404</td>
      <td>RU000A0JRTT9</td>
      <td>Московская Биржа</td>
      <td>Основной</td>
    </tr>
    <tr>
      <td>8</td>
      <td>139236</td>
      <td>RU000A0JQ6N0</td>
      <td>Московская Биржа</td>
      <td>РЕПО</td>
    </tr>
    <tr>
      <td>9</td>
      <td>149079</td>
      <td>RU000A0JQ6N0</td>
      <td>Московская Биржа - РТС</td>
      <td>РТС Classica</td>
    </tr>
  </tbody>
</table>
</div>




```python
df = pd.read_sql("SELECT * FROM public.bond_description", conn)
df.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ISIN, RegCode, NRDCode</th>
      <th>FinToolType</th>
      <th>SecurityType</th>
      <th>SecurityKind</th>
      <th>CouponType</th>
      <th>RateTypeNameRus_NRD</th>
      <th>CouponTypeName_NRD</th>
      <th>HaveOffer</th>
      <th>AmortisedMty</th>
      <th>MaturityGroup</th>
      <th>...</th>
      <th>CurrentFaceValue_NRD</th>
      <th>BorrowerName</th>
      <th>BorrowerOKPO</th>
      <th>BorrowerSector</th>
      <th>BorrowerUID</th>
      <th>IssuerName</th>
      <th>IssuerName_NRD</th>
      <th>IssuerOKPO</th>
      <th>NumGuarantors</th>
      <th>EndMtyDate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>XS1092320099</td>
      <td>Облигация</td>
      <td>ЕвроКорп</td>
      <td>Классические</td>
      <td>Постоянный</td>
      <td>с фиксированной ставкой</td>
      <td>Полугодовой</td>
      <td>True</td>
      <td>False</td>
      <td>Среднесрочные</td>
      <td>...</td>
      <td>1000.0</td>
      <td>4finance AS</td>
      <td>NaN</td>
      <td>None</td>
      <td>95365</td>
      <td>4finance S.A</td>
      <td>4finance S.A.</td>
      <td>NaN</td>
      <td>9</td>
      <td>2019-08-14</td>
    </tr>
    <tr>
      <th>1</th>
      <td>RU000A0JQ6N0</td>
      <td>Облигация</td>
      <td>Корп</td>
      <td>Биржевые</td>
      <td>Постоянный</td>
      <td>None</td>
      <td>None</td>
      <td>True</td>
      <td>True</td>
      <td>Краткосрочные</td>
      <td>...</td>
      <td>NaN</td>
      <td>Седьмой Континент</td>
      <td>33649230.0</td>
      <td>Ритейл</td>
      <td>86896</td>
      <td>Седьмой Континент</td>
      <td>None</td>
      <td>33649230.0</td>
      <td>0</td>
      <td>2010-12-17</td>
    </tr>
    <tr>
      <th>2</th>
      <td>RU000A0JPB17</td>
      <td>Облигация</td>
      <td>Корп</td>
      <td>Классические</td>
      <td>Переменный</td>
      <td>None</td>
      <td>None</td>
      <td>True</td>
      <td>False</td>
      <td>Среднесрочные</td>
      <td>...</td>
      <td>NaN</td>
      <td>Седьмой Континент</td>
      <td>33649230.0</td>
      <td>Ритейл</td>
      <td>86896</td>
      <td>Седьмой Континент</td>
      <td>None</td>
      <td>33649230.0</td>
      <td>1</td>
      <td>2012-06-14</td>
    </tr>
    <tr>
      <th>3</th>
      <td>RU000A0JNFW1</td>
      <td>Облигация</td>
      <td>Корп</td>
      <td>Классические</td>
      <td>Переменный</td>
      <td>None</td>
      <td>None</td>
      <td>True</td>
      <td>False</td>
      <td>Среднесрочные</td>
      <td>...</td>
      <td>NaN</td>
      <td>Золото Селигдара</td>
      <td>76723557.0</td>
      <td>Горнодобыча</td>
      <td>88747</td>
      <td>Золото Селигдара</td>
      <td>None</td>
      <td>76723557.0</td>
      <td>1</td>
      <td>2011-06-28</td>
    </tr>
    <tr>
      <th>4</th>
      <td>RU000A0JQVP5</td>
      <td>Облигация</td>
      <td>Корп</td>
      <td>Классические</td>
      <td>Переменный</td>
      <td>None</td>
      <td>None</td>
      <td>True</td>
      <td>False</td>
      <td>Краткосрочные</td>
      <td>...</td>
      <td>NaN</td>
      <td>Домо</td>
      <td>98357828.0</td>
      <td>Ритейл</td>
      <td>92174</td>
      <td>Домо</td>
      <td>None</td>
      <td>98357828.0</td>
      <td>0</td>
      <td>2013-05-16</td>
    </tr>
    <tr>
      <th>5</th>
      <td>XS1076087375</td>
      <td>Облигация</td>
      <td>ЕвроКорп</td>
      <td>Ноты участия в кредите</td>
      <td>Постоянный</td>
      <td>с фиксированной ставкой</td>
      <td>Ежегодный</td>
      <td>False</td>
      <td>False</td>
      <td>Краткосрочные</td>
      <td>...</td>
      <td>1000.0</td>
      <td>ABH Financial</td>
      <td>NaN</td>
      <td>None</td>
      <td>87458</td>
      <td>Alfa Holding Issuance</td>
      <td>Alfa Holding Issuance plc</td>
      <td>NaN</td>
      <td>0</td>
      <td>2017-06-10</td>
    </tr>
    <tr>
      <th>6</th>
      <td>XS0974469206</td>
      <td>Облигация</td>
      <td>ЕвроКорп</td>
      <td>Ноты участия в кредите</td>
      <td>Постоянный</td>
      <td>с фиксированной ставкой</td>
      <td>Полугодовой</td>
      <td>False</td>
      <td>False</td>
      <td>Среднесрочные</td>
      <td>...</td>
      <td>1000.0</td>
      <td>Borets International</td>
      <td>NaN</td>
      <td>None</td>
      <td>94896</td>
      <td>Borets Finance</td>
      <td>Borets Finance Limited</td>
      <td>NaN</td>
      <td>5</td>
      <td>2018-09-26</td>
    </tr>
    <tr>
      <th>7</th>
      <td>RU000A0GQZV0</td>
      <td>Облигация</td>
      <td>Корп</td>
      <td>Классические</td>
      <td>Переменный</td>
      <td>с переменной ставкой</td>
      <td>Квартальный</td>
      <td>True</td>
      <td>False</td>
      <td>Краткосрочные</td>
      <td>...</td>
      <td>1000.0</td>
      <td>Дикая Орхидея (мск)</td>
      <td>33673624.0</td>
      <td>Лёгкая промышленность</td>
      <td>79559</td>
      <td>Дикая Орхидея (мск)</td>
      <td>ЗАО Дикая Орхидея</td>
      <td>33673624.0</td>
      <td>1</td>
      <td>2009-04-09</td>
    </tr>
    <tr>
      <th>8</th>
      <td>RU000A0JP096</td>
      <td>Облигация</td>
      <td>Корп</td>
      <td>Классические</td>
      <td>Переменный</td>
      <td>None</td>
      <td>None</td>
      <td>True</td>
      <td>False</td>
      <td>Среднесрочные</td>
      <td>...</td>
      <td>NaN</td>
      <td>Золото Селигдара</td>
      <td>76723557.0</td>
      <td>Горнодобыча</td>
      <td>88747</td>
      <td>Золото Селигдара</td>
      <td>None</td>
      <td>76723557.0</td>
      <td>1</td>
      <td>2011-12-21</td>
    </tr>
    <tr>
      <th>9</th>
      <td>RU000A0JQ607</td>
      <td>Облигация</td>
      <td>Корп</td>
      <td>Классические</td>
      <td>Постоянный</td>
      <td>с переменной ставкой</td>
      <td>Полугодовой</td>
      <td>True</td>
      <td>False</td>
      <td>Среднесрочные</td>
      <td>...</td>
      <td>NaN</td>
      <td>Золото Селигдара</td>
      <td>76723557.0</td>
      <td>Горнодобыча</td>
      <td>88747</td>
      <td>Золото Селигдара</td>
      <td>ОАО Золото Селигдара</td>
      <td>76723557.0</td>
      <td>1</td>
      <td>2014-05-29</td>
    </tr>
  </tbody>
</table>
<p>10 rows × 51 columns</p>
</div>




```python

```


```python

```
